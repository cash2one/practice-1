<?php
namespace app\admin\controller;
use app\admin\controller\Comm;
use \think\Db;

class Lists extends Comm
{
    function _initialize() {
        parent::_initialize();
        error_reporting(E_ERROR | E_WARNING | E_PARSE);//屏蔽变量未定义的问题         
        $tbq=config('database.prefix');
        $this->assign('menu_flm',3);
        $this->assign('tbq',$tbq);
        qmcheck('lists');
    }
    
    public function index()
    {
        $arc=M('info');
        $request=\think\Request::instance();
        $lm=(int)$request->get('lm');
        $page=(int)$request->get('p');
        $order=cookie("list_order");
        $lmoption =Soption($lm); 
        $assign=$this->assign; 
        $admin=$assign['admin'];   
        $mtb1=M('lm');   
        $fidpath=$mtb1->where('id='.$lm.'')->find();
        $patharr=explode(',',$fidpath['fidpath'].','.$lm);                 
        if ($order=='' || $order=='undefined'){$order='sort';}
        $desc=cookie("list_desc");
        if ($desc==''){$desc='asc';}
        $flag=$request->get('flag');;
        $settop=(int)$request->get('settop');
        $audit=(int)$request->get('audit');
        $keys=$request->get('key');
        $this->assign('blm',$patharr[2]);
        $this->assign('order',$order);
        $this->assign('desc',$desc);
        $this->assign('flag',$flag);
        $this->assign('audit',$audit);
        $this->assign('settop',$settop);
        if ($keys!=''){$msql2.=" and `cntitle` like '%".$keys."%'";}
        if ($flag!=''){
            $flaga=explode(',',$flag);
            foreach ($flaga as $ky)
            {
                $ky=str_replace("0","",$ky);
                $msql2.=" and `flag` like '%".$ky."%'"; 
            }
        }
        if ($settop>0){$msql2.=" and `settop`='1'";}
        if ($audit>0){$msql2.=" and `audit`='1'";}
        $zhuangtai=(int)$request->get('zhuangtai');
        $this->zhuangtai=$zhuangtai;
        switch ($zhuangtai) {
            case 1:
                $msql2.=" and `audit`='1'";
                break;
            case 2:
                $msql2.=" and `audit`='0'";
                break;          
        }
        $getflagoption=getflagoption($flag);      
        $sonid=getsonid($lm);
        $sql="fid in (".$sonid.") and del='0'";     
        $count = $arc->where($sql.$msql2)->count();
        $pgsize=(int)cookie('T_pgsize');
        if ($pgsize==0){$pgsize=10;}
        $selectpg=selectpg($pgsize);
        $parameter='&lm='.$lm.'&zhuangtai='.$zhuangtai.'&settop='.$settop.'&audit='.$audit.'&keys='.$keys;
        $order="`$order` $desc,sort asc,id desc";
        $prar=['query' => $request->param()];
        $list = $arc->where($sql.$msql2)->order($order)->paginate($pgsize,false,$prar);
        $pagestr=$list->render();
        $pagestr=str_replace('</ul>','',$pagestr);
        $plist=$pagestr."<li>".$selectpg."</li></ul>";

        $this->assign('lmoption',$lmoption);
        $this->assign('lm',$lm);
        $this->assign('getflagoption',$getflagoption);
        $this->assign('list',$list);
        $this->assign('page',$plist);
        $html=$this->fetch();
        return $html;
    }

    public function add()
    {
        $tbq=config('database.prefix');
        $request=\think\Request::instance();
        $assign=$this->assign;
        $sysfig=$assign['sysfig'];
        $_GET=$request->post();
        $idx=(int)$request->get('fid');
        if ($idx==0)
        {
            $idx=$vo['fid'];
        }
        $this->assign('idx',$idx);
        $tb1=$tbq."lm";
        $tb2=$tbq."info";   
        $id=(int)$request->get('id');
        $fid=(int)$request->get('fid');
        if ($id==0){$act='add';}
        $lmoption =Soption($fid);
        $action='添加';
        $mtb1=M('info');
        $vo=$mtb1->where(" id='$id'")->find();
        if ($vo)
        {
            qmcheck('edit',1);
            $action='修改';
            $act='edit';
            $fid=$vo['fid'];
            $this->assign('vo',$vo);           
            $lmoption =Soption($vo['fid']);
        }
        else
        {
            qmcheck('add',1);
            $vo['bz9']=$sysfig['cfg_name'];
            $vo['bz9']='百芳岁环保';
            $vo['bz10']='admin';
            $vo['fid']=$fid;
            $vo['audit']=1;
            $vo['hit']=1;
            $vo['addtime']=date('Y-m-d H:i:s');
            $vo['sort']=1;
            $this->assign('vo',$vo); 
        }
        $nfid=$fid;
        $this->assign('id',$id);
        $this->assign('fid',$fid);
        $this->assign('act',$act);
        $fidpath_=M('lm')->where("id='$nfid'")->value('fidpath').','.$fid.',0';
        $fidarr=explode(',',$fidpath_);
        $this->assign('blm',$fidarr[2]);       
        $this->assign('action',$action);
        $this->assign('lmoption',$lmoption);
        $html=$this->fetch();
        return $html;
    }

    public function save()
    {
        $id=(int)$_POST['id'];
        $fid=(int)$_POST['fid'];
        $m=M('lm');
        $arc=M('info');
        $lm=M('lm');  
        $assign=$this->assign;
        $admin=$assign['admin'];
        $vo=$arc->where(" id='$id'")->find();  
        $cntitle=$_POST['cntitle'];
        $sort=(int)$_POST['sort'];
        if ($cntitle==""){msg(-1,'没有填写标题');}       
        if ($fid==0){msg(-1,'没选择所属栏目');}
        $lminfo=$lm->where(" id='".$fid."'")->find();
        $fidpath=$lminfo['fidpath'].",".$fid."";
        $patharr=explode(',',$fidpath);
        $blm=$patharr[2];   
        $this->blm=$blm;
        $addtime=$_POST['Time'];
        $ktime=$_POST['ktime'];
        if (!is_null($ktime)){$data["ktime"] = $ktime;}
        if (!isset($addtime) || $addtime==""){$addtime=date("Y-m-d H:i:s");}
        $color=$_POST['color'];
        $sort=(int)$_POST['sort'];
        if (isset($_POST['flag']))
        {
            $flag= implode(',',$_POST['flag']);
        }              
        $tag=$_POST['tag']; 
        $z1=$_POST['z1'];
        $z2=$_POST['z2'];
        $url=$_POST['url'];
        $title=$_POST['title'];
        $keywords=$_POST['keywords'];
        $description=$_POST['description'];             
        $audit=(int)$_POST['audit'];
        $settop=(int)$_POST['settop'];
        $hit=(int)$_POST['hit'];
        $img=$_POST['img'];
        $username=$_POST['username'];
        $bz1=$_POST['bz1'];
        $bz2=$_POST['bz2'];
        $bz3=$_POST['bz3'];
        $bz4=$_POST['bz4'];
        $bz5=$_POST['bz5'];
        $bz6=$_POST['bz6'];
        $bz7=$_POST['bz7'];
        $bz8=$_POST['bz8'];
        $bz9=$_POST['bz9'];
        $bz10=$_POST['bz10'];
        if ($bz8)
        {
            $bz81=implode('{#,#}',$bz8);
            if ($bz81!=''){$bz8=$bz81;}
        }
         
        if(is_null($tag)){$tag='';}
        if(is_null($flag)){$flag='';}
        if(is_null($z1)){$z1='';}
        if(is_null($z2)){$z2='';}
        if(is_null($url)){$url='';}     
        if(is_null($img)){$img='';}
        if(is_null($username)){$username='';}       
        if(is_null($bz1)){$bz1='';}
        if(is_null($bz2)){$bz2='';}
        if(is_null($bz3)){$bz3='';}
        if(is_null($bz4)){$bz4='';}
        if(is_null($bz5)){$bz5='';}
        if(is_null($bz6)){$bz6='';}
        if(is_null($bz7)){$bz7='';}
        if(is_null($bz8)){$bz8='';}
        if(is_null($bz9)){$bz9='';}
        if(is_null($bz10)){$bz10='';}
        
        $data["cntitle"] = $cntitle;
        $data["sort"] = $sort;
        $data["fid"] = $fid;
        $data["fidpath"] = $fidpath;
        $data["addtime"] = $addtime;
        $data["tag"] = $tag;
        $data["flag"] = $flag;
        $data["color"] = $color;
        $data["z3"] = $z3;
        $data["z4"] = $z4;
        $data["url"] = $url;
        $data["title"] = $title;
        $data["keywords"] = $keywords;
        $data["description"] = $description;    
        $data["audit"] = $audit;
        $data["settop"] = $settop;  
        $data["hit"] = $hit;        
        $data["img"] = $img;
        $data["username"] = $username;
        $data["bz1"] = $bz1;
        $data["bz2"] = $bz2;
        $data["bz3"] = $bz3;
        $data["bz4"] = $bz4;
        $data["bz5"] = $bz5;
        $data["bz6"] = $bz6; 
        $data["bz7"] = $bz7;
        $data["bz8"] = $bz8;       
        $data["bz9"] = $bz9;
        $data["bz10"] = $bz10;  
        $data["z1"] = $z1;    
        $data["z2"] = $z2;
        $s1=$_REQUEST['s1'];
        $s2=(int)$_REQUEST['s2'];
        $s3=(int)$_REQUEST['s3'];
        $s4=(int)$_REQUEST['s4'];
        $s5=(int)$_REQUEST['s5'];
        $s6=(int)$_REQUEST['s6'];
        $content=$_POST['content'];
        $data["s1"] = $s1;
        $data["s2"] = $s2;
        $data["s3"] = $s3;
        //$data["s4"] = $s4;
        $data["s5"] = $s5;
        $data["s6"] = $s6;
        $data["content"] = addslashes($content);
        /**********图片压缩处理开始 ********/
        $toW=1200;$toH=2800;$toW2=300;$toH2=200;  /*默认图片压缩处理 限制宽度1200 高度4800 单位px*/
        //处理banner图片压缩尺寸限制
        if ($blm==6){$toW=1980;$toH=2800;}
        if ($img!='' && str_replace('http','',$img)==$img)
        {
            $img2=substr($img,1,strlen($img)-1);
            if (is_file($img2))
            {
            thumbs($img2,$img2,$toW,$toH);$simg2=thumbname($img2);
            $rs=thumbs($img2,$simg2,$toW2,$toH2,2);
            if ($rs){$data["simg"] ='/'.$simg2;}
            }
        }
        if ($content!='')
        {
        $content=StripSlashes($content);
        $pattern="/<img.*?src=[\'|\"](.*?(?:[\.gif|\.jpg]))[\'|\"].*?[\/]?>/";
        $order='ALL';
        preg_match_all($pattern,$content, $matches);
        if(isset($matches[1])&&!empty($matches[1]))
        {
            $new_arr=array_unique($matches[1]);
            foreach($new_arr as $key)
            { 
                if ($key!='' && str_replace('http','',$key)==$key)
                {
                    $img2=substr($key,1,strlen($key)-1);
                    $toW=1200;$toH=3800;//内如缩略图处理
                    if (is_file($img2))
                    {
                        $images = \think\Image::open($img2);            
                        $width = $images->width();      $height = $images->height();
                        if ($width<$toW){$toW=$width;}if ($height<$toH){$toH=$height;}
                        if ($width>$toW || $height>$toH){$images->thumb($toW,$toH,1)->save($img2);}                    
                    }
                }
            } 
        }
        }
        /**********图片压缩处理结束********/
        $addtime2=date("Y-m-d H:i:s");
        if ($sort!=$vo['sort'])
        {
            $tbq=config('database.prefix');
            $tb1=$tbq."lm";
            $tb2=$tbq."info";
            $sql="update $tb2 set sort=sort+1 where CONCAT(',', fidpath, ',') like '%,".$blm.",%' and sort>='$sort'";
            Db::query($sql);
        }
        if ($vo)
        {
            qmcheck('edit',3);
            $weburl=$m->where("id='$fid'")->value("urlpath");
            $data['weburl']=$weburl.$id.".html";
            $arc->where('id='.$id.'')->update($data); 
            $from=$_POST['from'];  
            msg(1,"编辑成功",$from);
        }
        else
        {
            qmcheck('add',3);
            $admin=$this->admin;
            $cid=$admin['id'];
            $data['cid']=$cid;
            $lastInsId = $arc->insertGetId($data);          
            $weburl=$lm->where("id='$fid'")->value("urlpath");
            $datax['weburl']=$weburl.$lastInsId.".html";
            $arc->where('id='.$lastInsId.'')->update($datax);
            $assign=$this->assign;
            $from=$assign['mname'].'.qm?lm='.$fid;
            msg(1,"添加成功",$from);
        }
    }
    
    public function doact()
    {
        $request=\think\Request::instance();
        $_POST=$request->post();
        $lm=M('lm');
        $action=$request->post('action');
        $info=M('info');
        $idstr=$request->post('idstr');
        $idarr=explode(",",$idstr);
        $nums=count($idarr);
        switch ($action)
        {
            case 's1':
                qmcheck('edit',1);                
                $data['audit']=1;
                for ($i=0;$i<$nums;$i++)
                {
                    $gid=$info->where(" id='".$idarr[$i]."'")->update($data);
                }
                exit("审核成功");               
                break;
            case 's2':
                qmcheck('edit',1);
                $data['audit']=0;
                for ($i=0;$i<$nums;$i++)
                {
                    $info->where(" id='".$idarr[$i]."'")->update($data);
                }
                exit("操作成功");               
                break;        
            case 'delall':
                qmcheck('del',1);
                $data['del']=1;
                for ($i=0;$i<$nums;$i++)
                {
                    $info->where(" id='".$idarr[$i]."'")->update($data);
                }
                exit("删除成功");   
                break;
            case 'Xsave':
                qmcheck('edit',1);
                $cnTitle=$_POST['cntitle'];  
                $cnTitle=unescape($cnTitle);    
                $addtime=$_POST['Time'];
                if (!isset($addtime) || $addtime==""){$addtime=date("Y-m-d");}
                $color=$_POST['color'];
                $flag=$_POST['flag'];
                $settop=(int)$_POST['settop'];
                $audit=(int)$_POST['audit'];
                $id=$_POST['id'];
                $data['cntitle']=$cnTitle;
                $data['addtime']=$addtime;
                $data['color']=$color;
                $data['audit']=$audit;
                $data['flag']=$flag;
                $data['settop']=$settop;
                $info->where(" id='".$id."'")->update($data);
                echo "修改成功";
                break;      
            case 'movedoc':
                qmcheck('edit',1);
                $fid=(int)$_REQUEST['fid'];
                $mcon=$lm->where("id='".$fid."'")->find();                
                $fidpath=$mcon['fidpath'].",".$fid;
                $data['fid']=$fid;
                $data['fidpath']=$fidpath;
                $info->where("id in(".$idstr.")")->update($data);
                exit("移动完成");   
                break;  
            case 'sort':
                qmcheck('edit',1);
                $sortstr=$_REQUEST["sortstr"];
                $sortarr=explode(",",$sortstr);
                $nums=count($sortarr);
                for ($i=0;$i<$nums;$i++)
                {
                    $data['sort']=$sortarr[$i];
                    $info->where(" id='".$idarr[$i]."'")->update($data);  
                }
                exit("更新成功");   
                break;  
            case 'sort2':
                qmcheck('edit',1);             
                $sortstr=$_REQUEST["sortstr"];
                $idarr=explode(",",$idstr);
                $sortarr=explode(",",$sortstr);
                $nums=count($sortarr);
                for ($i=0;$i<$nums;$i++)
                {
                    $data['hit']=$sortarr[$i];
                    $info->where(" id='".$idarr[$i]."'")->update($data);  
                }
                exit("更新成功");   
                break;  
        }
    }
    public function attr()
    {
        qmcheck('edit',1);
        $lmoption =Soption(0);
        $this->assign('lmoption',$lmoption);
        $request=\think\Request::instance();
        $_POST=$request->post();
        $_GET =$request->get();
        $idstr=$_REQUEST["idstr"];
        $id=(int)$_REQUEST["id"];
        $this->assign('idstr',$idstr);
        $ty=(int)$_GET['ty'];
        $info=M('info');
        switch ($ty)
        {
            case 1:
                $vo=$info->where(" id='$id'")->find();
                if (!vo)
                {
                    exit(); 
                }
                $getcoloroption =getcoloroption($vo['color']);
                $getflagoption =getflagoption($vo['flag']);
                $this->assign('getcoloroption',$getcoloroption);
                $this->assign('getflagoption',$getflagoption);
                $this->assign('vo',$vo);
                return $this->fetch('attr_1');
                break;
            case 2:
                return $this->fetch('attr_2');
                break;  
        }
    }

}