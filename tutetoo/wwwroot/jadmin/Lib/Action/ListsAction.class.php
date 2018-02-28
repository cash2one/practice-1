<?php
import('jadmin.Action.func');
class ListsAction extends Action {
    var $config;
	function _initialize() {
		$config=getconfig();
		$this->sysfig=$config;
		
		$lm = M("lm");
		$lm = $lm->where('fid=0')->order('id')->limit(12)->select();
		$this->lmlist=$lm;
		$this->menu_flm=3;
		$this->t_do="?m=lists&a=doact";
		$this->t_attr="?m=lists&a=attr";
		
		$adminid =session('admin_id');
		$m=M('admin');
		$admin=$m->where("username='$adminid'")->find();
		$this->admin=$admin;		
		checkadmin();
	}
	public function index()
	{
		$arc=M('info');
		$lm=(int)$this->_get('lm');
		$this->lm=$lm;
		$page=(int)$this->_get('p');
		$order=cookie("TINFO_Order");
		$lmoption =getlmoption($lm);
		$this->lmoption=$lmoption;
		//城市id
		$cid=(int)$this->_get('cid');
		$this->cid=$cid;
		$admin=$this->admin;

		if ($order==''){$order='sort';}
		$desc=cookie("TINFO_desc");
		if ($desc==''){$desc='asc';}
		$flag=$this->_get('flag');
		$settop=(int)$this->_get('settop');
		$audit=(int)$this->_get('audit');
		$share=(int)$this->_get('share');
		$keys=$this->_get('key');
		$this->share=$share;
		$this->order=$order;
		$this->desc=$desc;
		$this->keys=$keys;
		$this->flag=$flag;
		$this->settop=$settop;
		$this->audit=$audit;
		
	
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
		$getflagoption=getflagoption($flag,1);
		$this->getflagoption=$getflagoption;

		import("@.ORG.Page");				
		$sonid=getsonid($lm);//获取子栏目
		$sql="fid in (".$sonid.")";	
					
		$count = $arc->where($sql.$msql2)->count();
		$pgsize=(int)cookie('T_pgsize');
		if ($pgsize==0){$pgsize=10;}
		$selectpg=selectpg($pgsize);
		$this->selectpg=$selectpg;
		$parameter='&lm='.$lm.'&cid='.$cid.'&settop='.$settop.'&audit='.$audit.'&share='.$share.'&keys='.$keys;
		$page = new Page($count,$pgsize,$parameter);
		$plist = $page->show();				
		$list = $arc->where($sql.$msql2)->order("`$order` $desc,sort asc,id desc")->limit($page->firstRow.','.$page->listRows)->select();

		//echo $arc->GetLastSql();
		$this->lists=$list;
		$this->page=$plist;
		
		
		$htm=$this->display();
	}
	
	public function add()
	{
		$id=(int)$_GET['id'];
		$fid=(int)$_GET['fid'];
		$sysfig=$this->sysfig;
		$this->fid=$fid;
		if ($id==0){$act='add';}
		$this->act=$act;
		$lmoption =getlmoption($fid);
		$actionType='添加';
		$admin=$this->admin;
		$vo=M('info')->where(" id='$id'")->find();
		if ((int)$vo['id']>0)
		{
			$actionType='修改';
			$this->vo=$vo;
			$getcoloroption =getcoloroption($vo['color']);
			$this->getcoloroption=$getcoloroption;
			$getflagoption =getflagoption2($vo['flag']);
			$this->getflagoption=$getflagoption;
			$this->audit=$vo['audit'];
			$this->settop=$vo['settop'];			
			$this->flag=$vo['flag'];
			$this->settop=$vo['settop'];
			$this->id=$vo['id'];
			$this->fid=$vo['fid'];
			$lmoption =getlmoption($vo['fid']);
			$this->hit=$vo['hit'];
			$this->audit=$vo['audit'];
			$this->sorts=$vo['sort'];
			$patharr=explode(',',$vo['fidpath']);
			$this->blm=$patharr[2];
		}
		else
		{
			$fidpath=M('lm')->where('id='.$fid.'')->find();
			$patharr=explode(',',$fidpath['fidpath'].','.$fid);
			$this->blm=$patharr[2];			
			$vo['hit']=1;
			$vo['addtime']=date("Y-m-d H:i:s");
			$vo['audit']=1;
			$vo['sort']=1;
			$vo['s3']=$sysfig['cfg_yunfei'];
			$vo['bz9']='admin';
			$vo['bz10']='本站';
			$hit=0;
			$audit=1;
			$sort=1;
			$this->hit=$hit;
			$this->audit=$audit;
			$this->sorts=$sort;
			$this->vo=$vo;
			$getcoloroption =getcoloroption('');
			$this->getcoloroption=$getcoloroption;
			$getflagoption =getflagoption2('');
			$this->getflagoption=$getflagoption;
			$this->settop=0;
			$this->id=0;
		}
		$this->actionType=$actionType;
		$this->id=$id;
		$this->lmoption=$lmoption;
		$this->display();
	}
	
	public function save()
	{
		$id=(int)$_POST['id'];
		$fid=(int)$_POST['fid'];
		$m=M('info');
		$arc=M('info');
		$lm=M('lm');	
		
		$admin=$this->admin;
		$vo=M('info')->where(" id='$id'")->find();
		$cntitle=$_POST['cntitle'];
		$entitle=$_POST['entitle'];
		$sort=(int)$_POST['sort'];
		if ($cntitle=="")
		{
			$json = array("status"=>'-1',"message"=>"没有填写标题");
			echo json_encode($json);
			exit();
		}		
		if ($fid==0)
		{
			$json = array("status"=>'-1',"message"=>"没选择所属栏目");
			echo json_encode($json);
			exit();
		}
		$lminfo=$lm->where(" id='".$fid."'")->find();
		$fidpath=$lminfo['fidpath'].",".$fid."";
		$patharr=explode(',',$fidpath);
		$blm=$patharr[2];
		$addtime=$_POST['Time'];
		if (!isset($addtime) || $addtime==""){$addtime=date("Y-m-d H:i:s");}
		$color=$_POST['color'];
		$sort=(int)$_POST['sort'];
		$flag= implode(',',$_POST['flag']);;		
		$tag=$_POST['tag'];	
		$z1=$_POST['z1'];
		$z2=$_POST['z2'];
		$z3=$_POST['z3'];
		$z4=$_POST['z4'];
		$z5=$_POST['z5'];
		$url=$_POST['url'];
		$title=$_POST['title'];
		$keywords=$_POST['keywords'];
		$description=$_POST['description'];				
		$audit=(int)$_POST['audit'];
		$settop=(int)$_POST['settop'];
		$hit=(int)$_POST['hit'];

		$img=$_POST['img'];
		$en_img=$_POST['en_img'];
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
		
		if(is_null($tag)){$tag='';}
		if(is_null($flag)){$flag='';}
		if(is_null($z1)){$z1='';}
		if(is_null($z2)){$z2='';}
		if(is_null($z3)){$z3='';}
		if(is_null($z4)){$z4='';}
		if(is_null($z5)){$z5='';}
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
		
		$addr1=$this->srequest('s_province');
		$addr2=$this->srequest('s_city');
		$addr3=$this->srequest('s_county');		
		$z3=implode(',',$addr1).'#'.implode(',',$addr2);

		$data["cntitle"] = $cntitle;
		$data["entitle"] = $entitle;
		$data["sort"] = $sort;
		$data["fid"] = $fid;
		$data["fidpath"] = $fidpath;
		$data["addtime"] = $addtime;		
		$data["tag"] = $tag;
		$data["flag"] = $flag;
		$data["color"] = $color;
		$data["z1"] = $z1;
		$data["z2"] = $z2;
		$data["z3"] = $z3;
		$data["z4"] = $z4;
		$data["z5"] = $z5;
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
		

		$s1=$_REQUEST['s1'];
		$s2=$_REQUEST['s2'];
		$s3=$_REQUEST['s3'];
		$s4=$_REQUEST['s4'];
		$s5=(int)$_REQUEST['s5'];
		$sd=(int)$_REQUEST['sd'];
		$kucun=(int)$_REQUEST['kucun'];
		$content=$_POST['content'];
		$data["s1"] = $s1;
		$data["s2"] = $s2;
		$data["s3"] = $s3;
		$data["s4"] = $s4;
		$data["s5"] = $s5;
		$data["kucun"] = $kucun;
		$data["sd"] = $sd;
		$data["content"] = stripslashes($content);
		$addtime2=date("Y-m-d H:i:s");
		if ($sort!=$vo['sort'] && $blm!=1)
		{
			$tbq=C('DB_PREFIX');
			$tb1=$tbq."lm";
			$tb2=$tbq."info";
			$sql="update $tb2 set sort=sort+1 where fid='$fid' and sort>='$sort'";			
			M($tb2)->query($sql);
		}
		if ((int)$vo['id']>0)
		{
			//$data["addtime2"] = $addtime2;
			$weburl=M("lm")->where("id='$fid'")->getField("urlpath");
			$data['weburl']=$weburl.$id.".html";
			$arc->where('id='.$id.'')->save($data);			
			$json = array("status"=>'1',"message"=>"编辑成功","url"=>U('/?m=lists&lm='.$fid.''));
			echo json_encode($json);
			exit();
		}
		else
		{
			$data["addtime2"] = $addtime2;
			$admin=$this->admin;
			$cid=$admin['id'];
			$data['cid']=$cid;
			$lastInsId = $arc->add($data);			
			$weburl=M("lm")->where("id='$fid'")->getField("urlpath");
			$datax['weburl']=$weburl.$lastInsId.".html";
			$arc->where('id='.$lastInsId.'')->save($datax);
			$json = array("status"=>'1',"message"=>"添加成功","url"=>U('/?m=lists&a=add&fid='.$fid.''));
			echo json_encode($json);
			exit();
		}
	}
	
	public function doact()
	{
		$lmoption =getlmoption(0);
		$this->lmoption=$lmoption;
		$action=$this->_post('action');
		$idstr=$this->_post('idstr');
		$idstr=$_REQUEST["idstr"];
		$admin=$this->admin;
		if ($admin['Grade']!=9)
		{
			$xql=" and cid='".$admin['id']."'";
		}
		switch ($action)
		{
			case 's1':
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
				$info=M('info');
				$data['audit']=1;
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" id='".$idarr[$i]."'$xql")->save($data);
				}
				exit("审核成功");				
				break;
			case 's2':
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
				$info=M('info');
				$data['audit']=0;
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" id='".$idarr[$i]."'$xql")->save($data);
				}
				exit("操作成功");				
				break;
			case 's5':
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
				$info=M('info');
				$addtime2=date("Y-m-d H:i:s");
				$data['addtime2']=$addtime2;
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" id='".$idarr[$i]."'$xql")->save($data);
				}
				exit("操作成功");				
				break;	
			case 'delall':
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
				$info=M('info');
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" id='".$idarr[$i]."'$xql")->delete();
				}
				exit("删除成功");	
				break;
			case 'Xsave':
				$cnTitle=$_REQUEST['cntitle'];	
				$cnTitle=unescape($cnTitle);		
				$addtime=$_REQUEST['Time'];
				if (!isset($addtime) || $addtime==""){$addtime=date("Y-m-d");}
				$color=$_REQUEST['color'];
				$flag=$_REQUEST['flag'];
				$settop=(int)$_REQUEST['settop'];
				$audit=(int)$_REQUEST['audit'];
				$id=$_REQUEST['id'];
				$info=M('info');
				$data['cntitle']=$cnTitle;
				$data['addtime']=$addtime;
				$data['color']=$color;
				$data['audit']=$audit;
				$data['flag']=$flag;
				$data['settop']=$settop;
				//$info->where(" id='".$id."'$xql")->save($data);
				echo "修改成功";
				break;		
			case 'movedoc':
				$m=M('lm');
				$fid=(int)$_REQUEST['fid'];
				$mcon=$m->where("id='".$fid."'")->find();
				
				$fidpath=$mcon['fidpath'].",".$fid;
				$data['fid']=$fid;
				$data['fidpath']=$fidpath;
				$info=M('info');
				$info->where("id in(".$idstr.")$xql")->save($data);
				exit("移动完成");	
				break;	
			case 'sort':
				$idarr=explode(",",$idstr);				
				$sortstr=$_REQUEST["sortstr"];
				$idarr=explode(",",$idstr);
				$sortarr=explode(",",$sortstr);
				$sortarr2=explode(",",$sd);
				$nums=count($sortarr);
				$info=M('info');
				for ($i=0;$i<$nums;$i++)
				{
					$data['sort']=$sortarr[$i];
					$info->where(" id='".$idarr[$i]."'$xql")->save($data);	
				}
				exit("更新成功");	
				break;	
			case 'sort2':
				$idarr=explode(",",$idstr);				
				$sortstr=$_REQUEST["sortstr"];
				$idarr=explode(",",$idstr);
				$sortarr=explode(",",$sortstr);
				$sortarr2=explode(",",$sd);
				$nums=count($sortarr);
				$info=M('info');
				for ($i=0;$i<$nums;$i++)
				{
					$data['hit']=$sortarr[$i];
					$info->where(" id='".$idarr[$i]."'$xql")->save($data);	
				}
				exit("更新成功");	
				break;	
		}
	}
	public function attr()
	{
		$lmoption =getlmoption(0);
		$this->lmoption=$lmoption;
		$idstr=$_REQUEST["idstr"];
		$id=(int)$_REQUEST["id"];
		$this->idstr=$idstr;
		$ty=(int)$_GET['ty'];
		switch ($ty)
		{
			case 1:
				$vo=M('info')->where(" id='$id'$xql")->find();
				if (!vo)
				{
					exit();	
				}
				$this->vo=$vo;
				$getcoloroption =getcoloroption($vo['color']);
				$this->getcoloroption=$getcoloroption;
				$getflagoption =getflagoption($vo['flag']);
				$this->getflagoption=$getflagoption;
				$this->audit=$vo['audit'];
				$this->settop=$vo['settop'];
				$this->id=$vo['id'];
				$this->display('attr_1');
				break;
			case 2:
				$this->display('attr_2');
				break;	
		}
	}

}