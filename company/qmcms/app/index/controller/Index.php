<?php
namespace app\index\controller;
use think\Controller;

class Index extends Controller
{
    var $config;
    var $mbtpl;
    var $mob_state;
    var $dohtml;
    public $weburl;
    public $nowpage;
    function _initialize(){
        $config=getconfig();
        $this->assign('sysfig',$config);
        $this->assign('webhost',$_SERVER['HTTP_HOST']);  
        $mobtpl="default/";
        if (isMOB()){$mobtpl="m/";}
        $this->mbtpl=$mobtpl;
        $this->seo();
        $this->mob_state=0;
        $this->nowpage=1;
        $this->dohtml=0;
        $this->weburl='home.html';
        $this->assign('blm',0);
        $this->assign('fid',0);
        $this->assign('id',0);
        $this->assign('index','');
        $this->assign('mobtpl',$mobtpl);
    }

    public function seo($lm=0,$id=0)
    {   
        $seo=siteseo($lm,$id);
        $this->assign('title',$seo[0]);
        $this->assign('keywords',$seo[1]);
        $this->assign('description',$seo[2]);
    }

    public function index(){        
        $this->seo();
        $request=\think\Request::instance();
        $url=$_SERVER['REQUEST_URI'];
        $url3=$url;
        $url=str_replace('%','',$url);
        $url=str_replace('"','',$url);
        $url=str_replace(' ','',$url);
        $url=str_replace("'","",$url);
        $url=str_replace("/index.php/index/index/url/","/",$url);
        $url=str_replace(".htm5",".html",$url);
        $url4=strtolower($url); 
        $lm=0;$id=0;
        if ($url!='')
        {       
            if ($url!=str_replace('?','',$url))
            {
                $uarr=explode('?',$url);
                $key=$uarr[1];
                $key=$request->get('k/s');
                $url=$uarr[0];
                $uarr=explode('?',$url);
                if (count($uarr)>1){$pagex=(int)$uarr[1];}
                $page=(int)$request->get('p/d');;
                $url=$uarr[0];
            }
            $url=strtolower($url);      
            $url2=$url.'/';
            $url2=str_replace('//','/',$url2);
            /*分页参数*/
            $arr_u1=explode('page-',$url2);
            if (count($arr_u1)>1)
            {
                $url2=$arr_u1[0];
                $nowpage=str_replace('page-','',$arr_u1[1]);
                $nowpage=(int)$nowpage;
                $this->nowpage=$nowpage;
            }
            $isid=M("lm")->where("weburl='$url2'")->field('id')->find();
            if ($isid){$lm=$isid['id'];}
            else
            {   
                $url=str_replace('.html','',$url);
                $url.=".html";
                $isid=M("lm")->where("weburl='$url'")->field('id')->find();
                if ($isid){$lm=$isid['id'];}
                else
                {
                    $isid=M("info")->where("weburl='$url'")->field('id')->find();
                    if ($isid){$id=$isid['id'];}
                }
            }
        }
        $this->weburl=$url; 
        $act=$request->get('act/s');
        $lms=(int)$request->get('lm/d');
        $ids=(int)$request->get('id/d');
        if ($lms>0){$lm=$lms;}
        if ($ids>0){$id=$ids;}
        if ($lm>0 && $id==0){$this->lm($lm);exit();}
        if ($id>0){$this->show($id);exit();}
        $this->assign('index','yes');
        $this->assign('blm',0);
        $this->assign('lm',0);
        $this->assign('id',0);
        $this->assign('fid',0);
        $htm=$this->fetch($this->mbtpl.'index');
        $htm=str_replace('/pub/qm/p/image/','/image/',$htm);
        $url=str_replace('/index.php/index/index/url/','',$url);
        $url=str_replace('/index.php/','',$url);
        /*页面404*/
        if ($url!='index.html' && $url!='/index.php/' && $url!='/.html' && $url!='')
        {
            header("http//1.1 404 not found");
            header("status: 404 not found");
            $htm='<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
                    <html><head>
                    <title>404 Not Found</title>
                    </head><body>
                    <h1>404 Not Found</h1>
                    <p>The requested URL '.$url3.' was not found on this server.</p>
                    <p><a href="/">back home</a></p>
                    </body></html>';
            exit($htm);
            echo $htm;
            echo "<!--404".$url."-->";
        }
        else
        {
            if ($this->dohtml!=1)
            {
                echo $htm;
            }
        }
        if ($this->mbtpl=='default/')
        {
            $HTMLURL=APP_HTML."home.html";
            $fp = fopen($HTMLURL,"w+");
            fwrite($fp,$htm); 
            fclose($fp);
            /*生成手机*/
            if ($this->mob_state!=0)
            {
                $HTMLURL=str_replace('.html','.htm',$HTMLURL);
                $this->mbtpl="m/";
                $htm=$this->fetch($this->mbtpl.'index');
                $htm=str_replace('/pub/qm/p/image/','/image/',$htm);
                $fp = fopen($HTMLURL,"w+");
                fwrite($fp,$htm);
                fclose($fp);
            }
        }
        
    }
    
    /*栏目列表*/
    public function lm($id)
    {
        $ffid=$id;
        $request=\think\Request::instance();
        $HTMLURL=htmlname2($id);
        $HTMLURL=substr($HTMLURL,1,strlen($HTMLURL)-1);
        $HTMLURL=str_replace('/','_fg_',$HTMLURL);
        $HTMLURL=APP_HTML.$HTMLURL."index.html";
        if ($this->nowpage>1)
        {
            $HTMLURL=str_replace('index.html','page-'.$this->nowpage.'.html',$HTMLURL);
        }
        $topid=gettopid($id);
        $lmty=info_ty(0,$id,'ty');
        switch ($topid)
        {
            case 993:
            case 995:
                $lmty=2;
                break;
            case 990:
                $id=lmfirst($id);
                $id=lmfirst($id);
                $id=lmfirst($id);   
                break;
        }
        switch ($lmty)
        {
            case 3:
            case 4:
                if ($topid!=993)
                {
                    $id=lmfirst($id);
                    $id=lmfirst($id);
                    $id=lmfirst($id);   
                }
                break;
            default:
                break;
        }
        $fpath=M("lm")->where("id='$id'")->value("fidpath");
        $farray=explode(',',$fpath.','.$id);
        $k=0;$path='';
        foreach ($farray as $ky)
        {
            $k++;
            if ($ky>0)
            {
                $path.=" > <a href='".htmlname($ky)."'>".cntitle($ky)."</a>";   
            }   
        }       
        $this->path=$path;
        $this->seo($id);
        $fid=(int)$id;
        if($fid==0){$this->index();}        
        $m=M('lm');
        $turl='http://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'].'?'.$_SERVER['QUERY_STRING'];
        $lm=getlm($fid);    
        $k=$request->get('k/s');
        $k=trim(str_replace('"','',$k));    
        $k=str_replace(' ','',$k);
        $k=str_replace('%','',$k);
        $k=str_replace("'","",$k);
        if(!is_array($lm)){$this->index();}    
        $as=count($farray); 
        $topid=0;
        $toplm=0;
        $blm=0;
        $blm2=0;
        if ($as>2)
        {
            $toplm=$farray[2];
            $topid=$farray[2];
        }
        if ($as>3)
        {
            $blm2=$farray[3];
        }
        $assign['lm']=$lm;
        $assign['fid']=$fid;
        $assign['toplm']=$toplm;
        $assign['blm']=$toplm;
        $assign['blm2']=$blm2;
        $assign['turl']=$turl;
        $assign['nowblm']=$blm;
        $assign['path']=$path;
        $nowblm=$topid;
        $this->assign($assign);
        $pgsize=25;

        $arc=M('info');
        $lmty=3;
        $lmty=(int)$lm['ty'];
        switch ($topid)
        {
            case 991:
            case 992:
                $lmty=3;
                break;            
            case 994:
                $lmty=2;
                break; 
        }
        $keys='';
        switch($lmty)
        {
            case 1:
            case 2:       
                $pgsize=6;
                $mb='news';
                $sql=" CONCAT(',', fidpath, ',') like '%,".$fid.",%' and audit='1' and audit2='1' and del='0'";
                switch ($lmty) {
                    case 2:
                    $pgsize=12;
                    $mb='pro';                          
                    break;
                }               
                if ($k!=''){$sql.=" and cntitle like '%$k%'";$keys=$k;}
                $count = $arc->where($sql)->count();
                $paras='';
                $order="settop desc,sort asc,id desc";
                $prar=['query' => $request->param(),'path'=>htmlname($ffid),'page'=>$this->nowpage];
                $prar=['path'=>htmlname($ffid),'page'=>$this->nowpage];
                $list = $arc->where($sql)->order($order)->paginate($pgsize,$count,$prar);
                $pagestr=$list->render();
                $pgcount=ceil($count/$pgsize);
                for($k=1;$k<=$pgcount;$k++)
                {
                    $pagestr=str_replace('?page='.$k.'"','page-'.$k.'.html"',$pagestr);  
                }
                $pagestr=str_replace('page-','/page-',$pagestr);
                $pagestr=str_replace('page-'.$this->nowpage.'.html','',$pagestr);  
                $pagestr=str_replace(' class="pagination"','',$pagestr);              
                $this->assign('lists',$list);
                $this->assign('page',$pagestr);      
                break;
            case 3:
            case 4:
                $info=$arc;
                $arc=$arc->where("fid='$fid' and audit='1' and audit2='1'")->order('settop desc,sort asc,id desc')->find();
                if ($arc)
                {
                    $arc['content']=stripslashes($arc['content']);
                    $arc['content']=str_replace('alt=""','alt="'.$arc['cntitle'].'"',$arc['content']);
                    $aid=$arc['id'];
                    $info-> where("id='$aid'")->setInc('hit');
                }
                $this->assign('arc',$arc);                
                $mb='page';
                switch ($lmty)
                {
                case 3:
                    break;
                case 4:
                    switch ($topid)
                    {
                        default:
                        $url=info_ty(0,$fid,'url');
                        if ($url!='')
                        {
                        exit('<script>location.href="'.$url.'";</script>');
                        }
                        break;
                    }
                    break;
                }
            break;
        }
        $this->assign('fid',$fid);
        //echo $mb;
        //exit;

        $htm=$this->fetch($this->mbtpl.$mb);
        $htm=str_replace('/pub/qm/p/image/','/image/',$htm);
        if ($this->dohtml!=1)
        {
            echo $htm;
        }
        echo "<!--".$mb."-->";
        if ($this->mbtpl=='default/' && $keys=='')
        {
            $fp = fopen($HTMLURL,"w+");
            fwrite($fp,$htm); 
            fclose($fp);
            if ($this->nowpage==1)
            {
                $HTMLURL2=str_replace('index.html','page-'.$this->nowpage.'.html',$HTMLURL);
                $fp = fopen($HTMLURL2,"w+");
                fwrite($fp,$htm); 
                fclose($fp);
            }
            /*生成手机*/
            if ($this->mob_state!=0)
            {
                $HTMLURL2=str_replace('index.html','page-'.$this->nowpage.'.htm',$HTMLURL);
                $HTMLURL=str_replace('.html','.htm',$HTMLURL);
                $this->mbtpl="m/";
                $htm=$this->fetch($this->mbtpl.$mb);
                $htm=str_replace('/pub/qm/p/image/','/image/',$htm);
                $fp = fopen($HTMLURL,"w+");
                fwrite($fp,$htm);
                fclose($fp);
                if ($this->nowpage==1)
                {                   
                    $fp = fopen($HTMLURL2,"w+");
                    fwrite($fp,$htm); 
                    fclose($fp);
                }
            }
        }
    }
        
    //详细页面
    public function show($id)
    {
        $request=\think\Request::instance();
        if($id==0){$this->index();}
        $this->seo(0,$id);
        $info=M('info');
        $m=M('lm'); 
        $arc=$info->where("id='$id'")->find();
        if (!$arc){$this->index();}
        $HTMLURL=idlname2($id);
        $HTMLURL=substr($HTMLURL,1,strlen($HTMLURL)-1);
        $HTMLURL=str_replace('/','_fg_',$HTMLURL);
        $HTMLURL=APP_HTML.$HTMLURL;
        $fid=$arc['fid'];
        $lmty=$m->where("id='$fid'")->value("ty");
        $fpath=$m->where("id='$fid'")->value("fidpath");
        $farray=explode(',',$fpath.','.$fid);
        $path=0;$k=0;
        $as=count($farray); 
        $topid=0;
        $toplm=0;
        $blm=0;
        $blm2=0;
        if ($as>2)
        {
            $toplm=$farray[2];
            $topid=$farray[2];
        }
        if ($as>3)
        {
            $blm2=$farray[3];
        }
        $path='';
        foreach ($farray as $ky)
        {
            $k++;
            $ky=(int)$ky;
            if ($ky>0)
            {
                $path.=" > <a href='".htmlname($ky)."'>".cntitle($ky)."</a>";
            }   
        }
        $nowblm=$topid;
        //$info->where("id='$id'")->setInc('hit',1);
        $arc['content']=stripslashes($arc['content']);
        $arc['content']=str_replace('alt=""','alt="'.$arc['cntitle'].'"',$arc['content']);
        $con=$arc['content'];
        $prvevo=sxpage($info,$arc,1);
        $nextvo=sxpage($info,$arc,2);
        $pgbreak1='';
        $pgbreak2='';
        if ($prvevo){$pgbreak1='<a href="'.idlname($prvevo['id']).'">上一篇：'.$prvevo['cntitle'].'</a>';}
        if ($nextvo){$pgbreak2='<a href="'.idlname($nextvo['id']).'">下一篇：'.$nextvo['cntitle'].'</a>';}

        $assign['id']=$id;
        $assign['lm']=$fid;
        $assign['fid']=$fid;
        $assign['toplm']=$toplm;
        $assign['blm']=$toplm;
        $assign['blm2']=$blm2;
        $assign['nowblm']=$blm;
        $assign['path']=$path;
        $assign['arc']=$arc;
        $assign['pgbreak']=$pgbreak1.$pgbreak2;
        $assign['pgbreak1']=$pgbreak1;
        $assign['pgbreak2']=$pgbreak2;
        $assign['path']=$path;
        $this->assign($assign);
        $lm=getlm($fid);
        $mb='show_news';//新闻详细
        switch($lmty){
            case 2:
                $mb='show_pro';//默认图片类型详细      
                break;
        }
        $htm=$this->fetch($this->mbtpl.$mb);
        $htm=str_replace('/pub/qm/p/image/','/image/',$htm);
        if ($this->dohtml!=1)
        {
            echo $htm;
        }       
        if ($this->mbtpl=='default/')
        {
            $fp = fopen($HTMLURL,"w+");
            fwrite($fp,$htm); 
            fclose($fp);
            /*生成手机*/
            if ($this->mob_state!=0)
            {
                $HTMLURL=str_replace('.html','.htm',$HTMLURL);
                $this->mbtpl="m/";
                $htm=$this->fetch($this->mbtpl.$mb);
                $htm=str_replace('/pub/qm/p/image/','/image/',$htm);
                $fp = fopen($HTMLURL,"w+");
                fwrite($fp,$htm);
                fclose($fp);
            }
        }
    }

       
    //点击次数+1  
    public function hit()
    {
        $request = \think\Request::instance();
        $id=$request->get('id/w');
        $info=M('info');
        echo (int)$info->where("id='$id'")->value('hit');
        $info->where("id='$id'")->setInc('hit');
    }   
    //点赞+1
    public function zan()
    {
        $d_cookie=cookie('dwrnd');
        $request = \think\Request::instance();
        $id=$request->post('id/w');
        $id2=$request->get('id/w');
        $info=M('info');
        if ($id>0)
        {
            $idarr=explode(',',$d_cookie);
            if (!in_array($id,$idarr))
            {
                cookie('dwrnd',$d_cookie.','.$id);
                $info->where("id='$id'")->setInc('s4');
            }
        }
        else
        {
            $id=$id2;
        }
        echo (int)$info->where("id='$id'")->value('s4');        
    }  

    /*baidu*/
    public function baidu()
    {
        $request = \think\Request::instance();
        $path=" > <a>搜索中心</a>";    
        $k=$request->get('k/s');
        $k=trim(str_replace('"','',$k));    
        $k=str_replace(' ','',$k);
        $k=str_replace('%','',$k);
        $k=str_replace("'","",$k);      
        $cpage='';
        $arc=M('info');
        $blm=2;
        $fid=2;
        $pgsize=12;        
        $sonid=getsonid($fid);
        $sql="fid in (".$sonid.") and del='0'"; 
        $sql.="  and CONCAT(',', fidpath, ',') not like '%,8,%' and audit='1' and audit2='1' and del='0'";    
        if ($k!=''){$sql.=" and cntitle like '%$k%'";}     
        $count = $arc->where($sql)->count();
        $paras='?k='.$k;
        $order="settop desc,sort asc,id desc";
        $prar=['query' => $request->param()];
        $list = $arc->where($sql)->order($order)->paginate($pgsize,false,$prar);
        $pagestr=$list->render();
        $this->assign('path',$path);
        $this->assign('blm',$blm);
        $this->assign('soulm',$blm);
        $this->assign('fid',$fid);
        $this->assign('lists',$list);
        $this->assign('page',$pagestr);
        $mb='news';
        $htm=$this->fetch($this->mbtpl.$mb);
        return $htm;
    }
    

    /*表单提交*/
    function msg8()
    {
        checkrefer();
        $request = \think\Request::instance();
        $ip=$request->ip();
/*        $captcha=$request ->post('ucode');
        if(!captcha_check($captcha)){
            msg(-1,'验证码错误');
        };*/
        $x1=$request->post('x1/s');
        $x2=$request->post('x2/s');
        $x3=$request->post('x3/s');
        $x4=$request->post('x4/s');
        $x5=$request->post('x5/s');
        $Content=$request->post('message/s');
        if ($x2=='' || $x1=='' || $x3=='' || $x4=='')
        {
            msg(-1,'请认真填写信息');
        }
       // $data["uid"] = $user_id;
        $data["z1"] = msubstr($x1,0,40);
        $data["z2"] = msubstr($x2,0,20);
        $data["z3"] = msubstr($x3,0,35);
        $data["z4"] = msubstr($x4,0,85);
        $data["z5"] = msubstr($x5,0,35);
        $data["z6"] = $ip;
        $data["content"] = msubstr($Content,0,500);
        $data["addtime"] = date("Y-m-d H:i:s");
        $msg = M('msg');
        if($msg->insertGetId($data))
        {
            msg(1,'提交成功','reload');
        }
        else
        {         
            msg(-1,'提交失败');
        }
    }   

    /*表单提交 2*/
    function msg9()
    {
        checkrefer();
        $request = \think\Request::instance();
        $ip=$request->ip();
        $user_id=$request->post('uid/w');
        $x1=$request->post('x1/s');
        $x2=$request->post('x2/s');
        $x3=$request->post('x3/s');
        $x4=$request->post('x4/s');
        $x5=$request->post('x5/s');
        $Content=$request->post('message/s');
        if ($x2=='' || $x1=='' || $x3=='' || $x4=='' || $user_id==0)
        {
            msg(-1,'请认真填写信息');
        }
        $data["uid"] = $user_id;
        $data["z1"] = msubstr($x1,0,40);
        $data["z2"] = msubstr($x2,0,20);
        $data["z3"] = msubstr($x3,0,35);
        $data["z4"] = msubstr($x4,0,85);
        $data["z5"] = msubstr($x5,0,85);
        $data["z6"] = $ip;
        $data["content"] = msubstr($Content,0,500);
        $data["addtime"] = date("Y-m-d H:i:s");
        $msg2 = M('msg2');
        if($msg2->insertGetId($data))
        {
            msg(1,'提交成功','reload');
        }
        else
        {         
            msg(-1,'提交失败');
        }
    }   





}
