<?php
namespace app\index\controller;
use think\Controller;
error_reporting(E_ERROR | E_WARNING | E_PARSE);
class Index extends Controller
{
    var $config;
    var $mbtpl;
    var $mob_state;
    var $dohtml;
    public $weburl;
    public $nowpage;
    public $appid;
    public $appsecret;
    public $apiurl;
    public $home;
    public $user_id;
    public $uid;
    function _initialize(){
        $config=getconfig();
        $this->assign('sysfig',$config);
        $this->assign('webhost',$_SERVER['HTTP_HOST']);  
        $mobtpl=APP_YY.'/';
        $this->mbtpl=$mobtpl;
        $this->seo();
        $this->mob_state=0;
        $this->nowpage=1;
        $this->dohtml=0;
        $this->weburl='home.html';
        $this->assign('blm',0);
        $this->assign('mbtpl',$mobtpl);
        $user_id=(int)session('user_id');
        $ckname=config('ckname');
        $cookv=cookie($ckname);
        if ($cookv=='')
        {
            $ip=GetIP();
            $cookv=sha1(time().$ip);
            cookie($ckname,$cookv,array('expire'=>30*24*3600));
            /*写入用户记录表*/
            $data['wrnd']=$ckname;
            $data['cook']=$cookv;
            $data['ip']=$ip;
            $data['url']=APP_SURL;
            $data['date']=date('Y-m-d');
            $data['time']=time();
            $data['wrnd']=$ckname;
            $data['uid']=$user_id;
            $uid=M('user')->add($data);            
        }
        else
        {
            $uid=M('user')->where("cook='$cookv'")->value('id');
        }
        /*日志提交加密参数*/
        $key1=config('key1');
        $key=$key1.'1';
        $log_wrnd='0_0_'.$cookv;
        $log_jm_wrnd=authcode($log_wrnd,'',$key,7200);
        $this->assign('log_jm_wrnd',$log_jm_wrnd);
        $this->uid=$uid;
        $this->assign('uid',$uid);

        if (isMOB())
        {
            $request=\think\Request::instance();
            $wrnds=$request->get('wrnd');
            if ($wrnds=='qm')
            {
                session('user_id',1);
            }
            $appid=config('APPID');
            $appsecret=config('APPSECRET');
            $apiurl=config('APIURL');
            $home=config('HOME');
            $this->appid=$appid;
            $this->appsecret=$appsecret;
            $this->apiurl=$apiurl;
            $this->home=$home;
            //session('user_id',null);
            $user_id=(int)session('user_id');
            $this->user_id=$user_id;
            if($user_id==0)
            {
                $url=$_SERVER['REQUEST_URI'];
                if ($url==str_replace('/user/wlogin','',$url) && $url==str_replace('/user/get_winfo','',$url))
                {
                    cookie('gourl',$url);
                    $this->wlogin();
                    exit;
                }
            }
            else
            {
                $user=M('member')->where("user_id='$user_id'")->find();
                $this->assign('user',$user);                
            }
        }
        $this->assign('user_id',$user_id);
        if ($user_id>0)
        {
            /*用户未填写手机号的进入认证界面*/
            $user=M('member')->where("user_id='$user_id'")->find();
            if ($user['user_name']=='' || $user['isbind']==0)
            {
                Gourl('/user/auth');
            }            
        }

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
        $url=APP_SURL;
        $url3=$url;
        $url=str_replace('%','',$url);
        $url=str_replace('"','',$url);
        $url=str_replace(' ','',$url);
        $url=str_replace("'","",$url);
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
        //$lms=(int)$request->get('lm/d');
        //$ids=(int)$request->get('id/d');
        if ($lms>0){$lm=$lms;}
        if ($ids>0){$id=$ids;}
        $this->assign('nid',(int)$id);
        $ckname=config('ckname');
        $cookv=cookie($ckname);
        if ($lm>0 && $id==0)
        {
            $key1=config('key1');
            $key=$key1.'1';
            $log_wrnd=$lm.'_0_'.$cookv;
            $log_jm_wrnd=authcode($log_wrnd,'',$key);
            $this->assign('log_jm_wrnd',$log_jm_wrnd);
            $this->lm($lm);exit();
        }
        if ($id>0)
        {
            $key1=config('key1');
            $key=$key1.'1';
            $log_wrnd='0_'.$id.'_'.$cookv;
            $log_jm_wrnd=authcode($log_wrnd,'',$key);
            $this->assign('log_jm_wrnd',$log_jm_wrnd);
            $this->show($id);exit();
        }
        
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
                    <h1>Not Found</h1>
                    <p>The requested URL '.$url3.' was not found on this server.</p>
                    </body></html>';
            exit($htm);
            echo $htm;
			
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
        if ($this->mbtpl=='cn/')
        {
            $HTMLURL=APP_HTML."home.html";
            $fp = fopen($HTMLURL,"w+");
            fwrite($fp,$htm); 
            fclose($fp);
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
            case 6:
            case 7:
                if ($id==6 || $id==7)
                {
                    $id=lmfirst($id);
                }            
                break;
        }

        switch ($lmty)
        {
            case 3:
            case 4:
                $id=lmfirst($id);
                $id=lmfirst($id);
                $id=lmfirst($id);
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
                $path.=" | <a href='".htmlname($ky)."'>".cntitle($ky)."</a>";   
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
        $this->assign('keys',$k);
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
        $arc=M('info g');
        $lmty=(int)$lm['ty'];
        switch ($topid)
        {
            case 9:
                $lmty=4;
                break; 
            case 2: 
            case 6:
            case 13:
                $lmty=2;
                break; 
            case 9993:
                $lmty=1;
                break;      
        }
        $keys='';$msql='';
        switch($lmty)
        {
            case 1://新闻
            case 2://产品       
                $pgsize=12;
                $mb='news';
                $sql=" CONCAT(',', fidpath, ',') like '%,".$fid.",%' and g.audit='1' and g.audit2='1' and g.del='0'";
                switch ($lmty)
                {
                    case 1:

                        break;
                    case 2:
                        $pgsize=12;
                        $mb='pro';  
                        switch ($topid)
                        {
                            case 2:
                                $pgsize=212;
                                $mb='pro_'.$topid;
                                break; 
                            case 4:
                                switch ($fid)
                                {
                                    case 6:
                                        $mb='pro_6';
                                        break;
                                }
                                break;
                            case 13:
                                $mb='server_list';
                                $pgsize=219;
                                switch ($fid)
                                {
                                    case 13:
                                        $mb='server_class';
                                        if ($k!='')
                                        {
                                            $mb='server_list';
                                        }
                                        break;
                                }
                                break;
                        }              
                    break;
                }               
                if ($k!=''){$sql.=" and g.cntitle like '%$k%'";$keys=$k;}
                $sql.=$msql;
                $count = $arc->where($sql)->count();
                $paras='';
                $order="settop_time desc,sort asc,id desc";            
                $prar=['query' => $request->param(),'path'=>htmlname($ffid),'page'=>$this->nowpage];
                $prar=['path'=>htmlname($ffid),'page'=>$this->nowpage];
                $list=$arc->where($sql)->order($order)->paginate($pgsize,$count,$prar);           
                $pagestr=$list->render();
                $pgcount=ceil($count/$pgsize);
                for($k=1;$k<=$pgcount;$k++)
                {
                    $pagestr=str_replace('?page='.$k.'"','page-'.$k.'.html"',$pagestr);  
                }
                $pagestr=str_replace('page-','/page-',$pagestr);
                $pagestr=str_replace('page-'.$this->nowpage.'.html','',$pagestr);     
                $pagestr=str_replace('<ul class="pagination">','',$pagestr);
                $pagestr=str_replace('</ul>','',$pagestr);             
                $this->assign('lists',$list);
                $this->assign('page',$pagestr);  
                $this->assign('nowpage',$this->nowpage);      
                break;
            case 3://单页
            case 4://外链
                $info=$arc;
                $where="fid='$fid' and audit='1' and audit2='1'";
                $arc=$arc->where($where)->order('settop_time desc,sort asc,id desc')->find();
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
                    switch ($topid)
                    {
                        case 1:
                            $mb='about';
                            break;
                        case 8:
                            $mb='contact';
                            break; 
                    }
                    break;
                case 4:
                    switch ($topid)
                    {
                        case 9:
                            switch ($fid)
                            {
                                case 23:
                                case 24:
                                    $user_id=$this->user_id;
                                    $user=M('member')->where("user_id='$user_id'")->find();
                                    if ($user['isbind']==0)
                                    {
                                        Gourl('/user/auth');
                                        exit;
                                    }                                    
                                    $mb='page_'.$fid;
                                    break;
                                case 25:
                                    $mb='page_25';
                                    break; 
                            }
                            break;
                        default:
                        $url=info_ty(0,$fid,'url');
                        if ($url!='')
                        {
                            Gourl($url);
                        }
                        break;
                    }
                    break;
                }
            break;
        }
        $this->assign('fid',$fid);
        $this->assign('id',0);
        //echo $mb;
        //exit;
        $htm=$this->fetch($this->mbtpl.$mb);
        $htm=str_replace('/pub/qm/p/image/','/image/',$htm);
        if ($this->dohtml!=1){echo $htm;}
        echo "<!--".$mb."-->";
        if (($this->mbtpl=='cn/') && $keys=='')
        {
            $fp = fopen($HTMLURL,"w+");
            fwrite($fp,$htm); fclose($fp);
            if ($this->nowpage==1)
            {
                $HTMLURL2=str_replace('index.html','page-'.$this->nowpage.'.html',$HTMLURL);
                $fp = fopen($HTMLURL2,"w+");
                fwrite($fp,$htm); 
                fclose($fp);
            }
        }
    }
        
    //详细页面
    public function show($id)
    {
        $request=\think\Request::instance();
        if($id==0){$this->index();}
        $this->seo(0,$id);
        $info=M('info');$m=M('lm'); 
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
        $path=0;$k=0;$as=count($farray); 
        $topid=0;$toplm=0;$blm=0;$blm2=0;
        if ($as>2){$toplm=$farray[2];$topid=$farray[2];}
        if ($as>3){$blm2=$farray[3];}
        $path='';
        foreach ($farray as $ky)
        {
            $k++;$ky=(int)$ky;
            if ($ky>0)
            {
                $path.=" | <a href='".htmlname($ky)."'>".cntitle($ky)."</a>";
            }   
        }
        $nowblm=$topid;
        //$info->where("id='$id'")->setInc('hit',1);
        $arc['content']=stripslashes($arc['content']);
        $arc['content']=str_replace('alt=""','alt="'.$arc['cntitle'].'"',$arc['content']);
        $con=$arc['content'];
        $prvevo=sxpage($info,$arc,1);
        $nextvo=sxpage($info,$arc,2);
        $pgbreak1='';$pgbreak2='';
        if ($prvevo)
        {
            $pgbreak1='<a href="'.idlname($prvevo['id']).'">上一篇：'.$prvevo['cntitle'].'</a>';
        }
        if ($nextvo)
        {
        $pgbreak2='<a href="'.idlname($nextvo['id']).'">下一篇：'.$nextvo['cntitle'].'</a>';
        }
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
        $mb='show_news';
        switch ($topid)
        {
            case 9994:
                $lmty=3;
                break; 
            case 2: 
            case 6:
            case 13:
                $lmty=2;
                break; 
            case 9993:
                $lmty=1;
                break;      
        }     
        switch($lmty)
        {
            case 2:
                $mb='show_pro'; 
                switch($topid)
                {
                    case 13:
                        $mb='show_pro_'.$topid; 
                        break;
                }
                break;
        }
        $htm=$this->fetch($this->mbtpl.$mb);
        $htm=str_replace('/pub/qm/p/image/','/image/',$htm);
        if ($this->dohtml!=1){echo $htm;}              
        if ($this->mbtpl=='cn/' && $topid!=8)
        {
            $fp = fopen($HTMLURL,"w+");fwrite($fp,$htm);fclose($fp);
        }  
        echo "<!-- $mb -->";  
    }

   
    //点击次数+1  
    public function hit()
    {
        if (checkrefer2()==1){exit('0');};
        $request = \think\Request::instance();
        $id=$request->get('id/w');
        $info=M('info');
        echo (int)$info->where("id='$id'")->value('hit');
        $info->where("id='$id'")->setInc('hit');
    }  

    //点赞+1  如果是有会员的 则
    public function zan()
    {
        if (checkrefer2()==1){exit(0);};
        $user_id=$this->user_id;
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
        //$blm=2;
        //$fid=2;
        $pgsize=12;        
        //$sonid=getsonid($fid);
        //$sql="fid in (".$sonid.") and del='0'"; 
        $sql="  (CONCAT(',',fidpath,',') not like '%,21,%') and audit='1' and audit2='1' and del='0'";    
        if ($k!=''){$sql.=" and cntitle like '%$k%'";}     
        $count = $arc->where($sql)->count();
        $paras='?k='.$k;
        $order="settop_time desc,sort asc,id desc";
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

   
   
    /*写入日志功能*/
    public function logs()
    {
        header("Cache-Control:no-cache,must-revalidate,no-store");
        header("Pragma:no-cache");
        header("Expires:-1");
        checkrefer();
        /*验证提交的参数 根据参数获取产品的ID*/
        $request = \think\Request::instance();
        $wrnd=$request->post('str');
        $wrnd=str_replace(' ','+',$wrnd);
        $from_url=$request->post('f');
        $url=$request->post('f2');
        $key=config('key1').'1';
        $jm_str=authcode($wrnd,'DECODE',$key);
        if ($jm_str==''){return $wrnd;msg(-1,'false');}
        $arr=explode('_',$jm_str);
        if (count($arr)<3){msg(-1,'false !');}
        $lm=(int)$arr[0];
        $id=(int)$arr[1];
        $cook2=$arr[2];
        /*cookie是否一致*/
        $ckname=config('ckname');
        $cook=cookie($ckname);
        if ($cook!=$cook2){msg(-1,'false !');}
        $log['uid']=$this->uid;
        $log['cook']=$cook;
        $log['ip']=GetIP();
        $log['from_url']=$from_url;
        $log['url']=$url;
        $log['date']=date('Y-m-d');
        $log['time']=time();
        $log['wrnd']=$wrnd;
        $log['lm']=$lm;
        $log['pid']=$id;
        M('log')->add($log);
        echo time();
        exit;
        msg(1,'success');
    }

    /*根据ID获得加密后参数*/
    public function getmm()
    {
        header("Cache-Control:no-cache,must-revalidate,no-store");
        header("Pragma:no-cache");
        header("Expires:-1");
        $ff=checkrefer2();
        if ($ff==1){return 0;}
        $request = \think\Request::instance();
        $id=$request->post('id');
        $ckname=config('ckname');
        $cook=cookie($ckname);
        if ($cook==''){return 1;}
        $ystr='0_'.$id.'_'.$cook;
        $key=config('key1');
        $jm_str=authcode($ystr,'',$key);
        echo $jm_str;
        exit;
    }

   

   /*发表评论*/
   public function comment()
   {
        checkrefer();
        $ts2='评论失败';
        $ts3='请稍后评论';
        $ts4='请不要重复请求此操作';
        $ts5='评论成功';
        $request = \think\Request::instance();
        $ip=$request->ip();
        $id=(int)$request->post('id/s');
        $pid=$id;
        $hid=(int)$request->post('hid/s');
        $ty=(int)$request->post('ty/s');
        if ($pid==0)
        {
            msg(-1,'请认真填写信息');
        }
        $user_id=$this->user_id;
        if ($user_id==0)
        {
            msg(-1,'请在微信端评论');
        }
        $user=M('member')->where("user_id='$user_id'")->find();
        if ($user['state']==0)
        {
            msg(-1,'评论失败，您的信息未审核');
        }
        $content=$request->post('content');
        $content=msubstr($content,0,300);
        $ty=1;
        $m=M('info'); 
        $vo=$m->where("id='$id' and audit='1'")->find();
        $vox=$vo;
        if (!$vo)
        {
            msg(-1,$ts2);
        }
        $mtb=M('comment');
        $time=time()-60;
        //限制同一个评论id不能大于200 
        $num=$mtb->where("uid='$user_id' and ty='$ty' and pid='$pid' and addtime>'$time'")->count();
        if ($num>0)
        {
            msg(-1,$ts3);
        }
        //写入评论
        $ishid=$mtb->where("pid='$pid' and id='$hid' and ty='$ty'")->find();
        $fidpath='0';
        $s1=0;
        if ($hid>0)
        {
          $fidpath='[0],['.$hid.']';
          $s1=1;  
        }
        if ($ishid)
        {
          $s1=$ishid['s1']+1;
          $fidpath=$ishid['fidpath'].',['.$hid.']';
        }        
        $ip=GetIp();
        $time=time();
        $data['ip']=$ip;
        $data['uid']=$user_id;
        $data['pid']=$id;
        $data['ty']=$ty;
        $data['hid']=$hid;
        $data['addtime']=$time;
        $data['content']=$content;
        $data['fidpath']=$fidpath;
        $data['s1']=$s1;
        $cid=$mtb->add($data);
        $mtb=M('info');
        $mtb->where("id='$id'")->setInc('s6',1);
        msg(1,$ts5,'reload');
   }


    /*表单提交*/
    function msg8()
    {
        checkrefer();
        $request = \think\Request::instance();
        $ip=$request->ip();
        $pid=(int)$request->post('id/s');
        if ($pid==0)
        {
            msg(-1,'请认真填写信息');
        }
        $user_id=$this->user_id;
        if ($user_id==0)
        {
            msg(-1,'请在微信端报名');
        }

        $user=M('member')->where("user_id='$user_id'")->find();
        if ($user['state']==0)
        {
            msg(-1,'报名失败，您的信息未审核');
        }
        /*获取活动的信息 以及报名时间段的信息*/
        $tbq=config('database');
        $tbq=$tbq['prefix'];
        $tb1=$tbq.'info'; 
        $ftime=strtotime(date('Y-m-d'));
        $ftime1=$ftime+24*3600;
        $sql=" g.id='$pid' and  CONCAT(',', g.fidpath, ',') like '%,1,%' and g.audit='1' and g.audit2='1' and g.del='0'";
        $sql.=" and B.time1<'$ftime1' and B.time2>'$ftime'";
        $info=M('info g');
        $vo=$info->join($tbq.'active_time B','g.id=B.pid')->find();
        if (!$vo)
        {
            msg(-1,'报名失败，报名未开始或已结束');
        }
        $data["uid"]= $user_id;
        $data["z1"] = $user['user_name'];
        $data["z2"] = $user['truename'];
        $data["z3"] = $pid;
        $data["z4"] = info_ty($pid,0,'cntitle');
        $data["z6"] = $ip;
        $data["addtime"] = date("Y-m-d H:i:s");
        $msg = M('msg');
        $where="uid='$user_id' and z3='$pid' and del='0'";
        $vo=$msg->where($where)->find();
        if ($vo)
        {
            msg(-1,'您已报名了该活动');
        }      
        if($msg->add($data))
        {
            /*培训报名的次数+1*/
            M('info')->where("id='$pid'")->setInc('s2',1);
            msg(1,'报名成功','reload');
        }
        else
        {         
            msg(-1,'报名失败');
        }
    }   

    /*表单提交 2 */
    function msg11()
    {
        checkrefer();
        $request = \think\Request::instance();
        $ip=$request->ip();
        $message=$request->post('message');
        $uid=$this->user_id;
        if ($message=='')
        {
            msg(-1,'请认真填写信息！');
        }
        $user_id=$this->user_id;
        if ($user_id==0)
        {
            msg(-1,'请在微信端报名');
        }
        $user=M('member')->where("user_id='$user_id'")->find();
        $data["z1"] = $user['user_name'];
        $data["z2"] = $user['truename'];
		$data["z3"] = $user['nc'];
        $data["uid"]= $user_id;
        $data["content"]= $message;
        $data["z6"] = $ip;
        $data["addtime"] = date("Y-m-d H:i:s");
        $msg = M('msg4');
        if($msg->add($data))
        {
            msg(1,'提交成功','reload');
        }
        else
        {         
            msg(-1,'提交失败');
        }
    }  


    /*验证码*/
    public function gcode()
    {
        session_start();
        header("Content-type: image/PNG");
        srand((double)microtime()*1000000);
        $im    = imagecreate(62,20);
        $black = imagecolorallocate($im, 255,255,255);
        $white = imagecolorallocate($im, 83,53,140);
        $gray  = imagecolorallocate($im, 0,0,0);
        imagefill($im,68,30,$white);
        while(($authnum=rand()%100000)<10000);
        imagestring($im, 5, 10, 3, $authnum, $gray);
        imagepng($im);imagedestroy($im);
        $_SESSION['verify'] = md5($authnum);
    }

    /*二维码*/
    public function ecode()
    {
        $request = \think\Request::instance();
        $id=(int)$request->get('eid');
        $url=$request->get('url');
        if ($url=='')
        {
            $from=@$_SERVER["HTTP_REFERER"];
            $url=$from;
        }
        if ($id>0)
        {
            $url=idlname($id);
        }
        $the_host = $_SERVER['HTTP_HOST'];
        $url="http://$the_host".$url;
        qrcode($url);
    }

    public function ecodes()
    {
        $request = \think\Request::instance();
        $id=(int)$request->get('id');
        $oid=$request->get('oid');
        $url='user/saomiao?id='.$id.'&oid='.$oid;
        $the_host = $_SERVER['HTTP_HOST'];
        $url="http://$the_host/".$url;
        qrcode($url);
    }

    /*微信自动登录功能*/
    public function wlogin()
    {
        $weburl=$this->home."whome/user/get_winfo";
        $url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid='.$this->appid.'&redirect_uri='.$weburl.'&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect';
        Gourl($url);
    }
    /*获取微信用户资料*/
    public function get_winfo()
    {
        $code=$_GET['code'];
        $token_url = $this->apiurl.'sns/oauth2/access_token?appid='.$this->appid.'&secret='.$this->appsecret.'&code='.$code.'&grant_type=authorization_code';
        $tokens = file_get_contents($token_url);
        $token = json_decode($tokens);
        $opendid= $token->openid;
        $token0=$token->refresh_token;        
        //f2这里的token用户获取用户的详细资料
        $token_url2='https://api.weixin.qq.com/sns/oauth2/refresh_token?appid='.$this->appid.'&grant_type=refresh_token&refresh_token='.$token0;
        $token = json_decode(file_get_contents($token_url2));
        $access_token2 = $token->access_token;
        $info_url='https://api.weixin.qq.com/sns/userinfo?access_token='.$access_token2.'&openid='.$opendid.'&lang=zh_CN';
        $info = json_decode(file_get_contents($info_url));
        $nickname = $info->nickname;
        $photo= $info->headimgurl;
        $subscribe=(int)$info->subscribe;
        $third_num=3;
        $third_name=$nickname;
        $area=$info->province.' '.$info->city;
        $sex=$info->sex;
        switch ($sex) {
            case '1':
                $sex='男';
                break;
            case '2':
                $sex='女';
                break;
            default:
                $sex='未知';
                break;
        }
        $mtb=M("member");
        $user=$mtb;        
        $isid=$mtb->where("openid='$opendid' and openid!=''")->find();  
        if (!$isid && $opendid!='')
        {
            //首先判断第三方登录
            //如果不存在则创建账号 同时生成openid的coookie用户注册绑定微信账户
            $vo=$user->where("third_num='3' and openid='$openid'")->find();
            if (!$vo)
            {
                $data['third_num']=$third_num;//第三方编号
                $data['third_name']=$third_name;//第三方昵称
                $data['openid']=$opendid;//第三方openid
                $data['wx_photo']=$photo;//第三方头像
                $data['photo']=$photo;
                $data['sex']=$sex;
                $data['wx_sex']=$sex;
                $data['area']=$area;
                $data['nc']=$third_name;    
                $data['subscribe']=$subscribe;  
                //写入其它默认信息
                $addtimex=time();   
                $user_name='';
                $drg5=substr($addtimex,-6);
                $drg55=$drg5;
                $class=1;
                $data["user_name"] = $user_name;
                $data["password"] = md5($drg5.$user_name);
                $data["ip"] = GetIP();
                $data["time"] = $addtimex;
                $data["class"] = $class;
                $data["state"] = 1;
                $data["del"]=0;/*默认为删除状态*/
                $data["wrnd"] = cookie('wxlogin');
                $data['logintime']=time();
                cookie('regwxid',$opendid);
                cookie('wx_photo',$photo);
                cookie('nc',$third_name);
                $user_id=$user->add($data);
                $user_name=$isid['user_name'];
                session('user_id',$user_id);
                session('user_name',$user_name);
            }
        }
        if ($isid)
        {
            if ($isid['del']==0)
            {
                $user_id=$isid['user_id'];
                $user_name=$isid['user_name'];
                $data['wx_photo']=$photo;//第三方头像
                if ($isid['photo']==''){$data['photo']=$photo;}
                if ($isid['nc']==''){$data['nc']=$third_name;}  
                $data['subscribe']=$subscribe;
                $data["wrnd"] = cookie('wxlogin');
                $data['logintime']=time();
                $data['wx_sex']=$sex;
                $data['area']=$area;
                $user_id2=$user->where("user_id='$user_id'")->save($data);
                session('user_id',$user_id);
                session('user_name',$user_name);
            }   
        }
        $weburl=cookie('gourl');
        if ($weburl=="")
        {
            $weburl=$this->home;    
        }
        //获取用户数据后返回来源的页面
        Gourl($weburl);
        //return $opendid;            
    }
}
