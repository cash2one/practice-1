<?php
import('jadmin.Action.func');
class YouhuiAction extends Action {
    var $config;
	function _initialize() {
		$config=getconfig();
		$this->sysfig=$config;
		$this->menu_flm=13;
		$this->t_do="?m=youhui&a=doact";
		$this->t_attr="?m=youhui&a=attr";
		
		$adminid =session('admin_id');
		$m=M('admin');
		$admin=$m->where("username='$adminid'")->find();
		$this->admin=$admin;		
		checkadmin();
	}
	public function index()
	{
		$arc=M('youhui');
		$page=(int)$this->_get('p');
		$order=cookie("youhui_Order");
		$admin=$this->admin;
		if ($order==''){$order='id';}
		$desc=cookie("youhui_desc");
		if ($desc==''){$desc='desc';}
		$flag=$this->_get('flag');
		$audit=(int)$this->_get('audit');
		$keys=$this->_get('key');
		$this->order=$order;
		$this->desc=$desc;
		$this->keys=$keys;
		$this->flag=$flag;
		$this->audit=$audit;		
	
		if ($keys!=''){$msql2.=" and `attr` like '%".$keys."%'";}
		if ($audit>0){$msql2.=" and `audit`='1'";}
		import("@.ORG.Page");				
		$sql="del='0'";	
					
		$count = $arc->where($sql.$msql2)->count();
		$pgsize=(int)cookie('T_pgsize');
		if ($pgsize==0){$pgsize=10;}
		$selectpg=selectpg($pgsize);
		$this->selectpg=$selectpg;
		$parameter='&audit='.$audit.'&keys='.$keys;
		$page = new Page($count,$pgsize,$parameter);
		$plist = $page->show();				
		$list = $arc->where($sql.$msql2)->order("`$order` $desc,id desc")->limit($page->firstRow.','.$page->listRows)->select();
		//echo $arc->GetLastSql();
		$this->lists=$list;
		$this->page=$plist;
		$htm=$this->display();
	}
	
	//添加修改优惠价
	public function add()
	{
		$id=(int)$_GET['id'];
		$sysfig=$this->sysfig;
		if ($id==0){$act='add';}
		$this->act=$act;
		$actionType='添加';
		$admin=$this->admin;
		$vo=M('youhui')->where(" id='$id'")->find();
		if ((int)$vo['id']>0)
		{
			$actionType='修改';
			$this->vo=$vo;
			$this->audit=$vo['audit'];		
			$this->id=$vo['id'];
		}
		else
		{
			$vo['audit']=1;
			$audit=1;
			$this->audit=$audit;
			$this->vo=$vo;			
			$this->id=0;
		}
		$this->actionType=$actionType;
		$this->id=$id;
		$this->display();
	}
	//处理添加或修改优惠劵
	public function save()
	{
		$id=(int)$_POST['id'];
		$m=M('youhui');
		$arc=M('youhui_info');
		$lm=M('youhui');		
		$admin=$this->admin;
		$vo=M('youhui')->where(" id='$id'")->find();
		$attr=$_POST['attr'];
		$pid=(int)$_POST['fid'];
		$num=(int)$_POST['num'];
		$s2=strtotime($_POST['Time']);//有效截止日期
		if ($attr=="" || $pid==0)
		{
			$json = array("status"=>'-1',"message"=>"请输入优惠劵名称同时选择对应的优惠产品");
			echo json_encode($json);
			exit();
		}	
		if ($num<1)
		{
			$json = array("status"=>'-1',"message"=>"优惠劵数量必须大于1");
			echo json_encode($json);
			exit();
		}	
		if ($num>9999)
		{
			$json = array("status"=>'-1',"message"=>"优惠劵数量不能大于10000");
			echo json_encode($json);
			exit();
		}	
		//截止日期不能小于3天内
		if ($s2<time()+3*24*3600)
		{
			$json = array("status"=>'-1',"message"=>"截止时间不能小于3天内");
			echo json_encode($json);
			exit();
		}		
		$addtime=time();
		$audit=(int)$_POST['audit'];		
		$bz=$_POST['bz'];//优惠劵备注	
		$img=$_POST['img'];	
		$data["pid"] = $pid;
		$data["num"] = $num;
		$data["img"] = $img;
		$data["addtime"] = $addtime;
		$data["audit"] = $audit;
		$data["bz"] = $bz;
		$data["s1"] = $addtime;		
		$data["s2"] = $s2;
		$data["attr"] = $attr;
		$addid=$lm->add($data);
		if ($addid>0)
		{
			mysql_query('BEGIN');
			for ($i=0;$i<$num;$i++)
			{
				$k++;
				$hmiao=uniqid();//当前毫秒
				$rnd=Jrand(7);
				$numer=md5($rnd.$hmiao.$addid.$k);
				$numer=substr($numer,6,8);
				$numer=Jrand(4).'-'.$numer;
				$numer=strtoupper($numer);
				//批量生产优惠劵
				$datax['yid']=$addid;
				$datax['pid']=$pid;
				$datax['attr']=$numer;
				$datax['addtime']=$addtime;
				$arc->add($datax);
				if($k%300==0)
				{
					mysql_query('COMMIT');
					mysql_query('BEGIN');
				}
			}
			mysql_query('COMMIT');
		}	
			$json = array("status"=>'1',"message"=>"添加成功","url"=>U('/?m=youhui'));
			echo json_encode($json);
			exit();	
	}
	
	public function doact()
	{
		$action=$this->_post('action');
		$idstr=$this->_post('idstr');
		$idstr=$_REQUEST["idstr"];
		$admin=$this->admin;
		$info=M('youhui');
		switch ($action)
		{
			case 's1':
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
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
				$data['audit']=0;
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" id='".$idarr[$i]."'$xql")->save($data);
				}
				exit("操作成功");				
				break;
			case 'delall':
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
				$data['del']=1;
				$data['audit']=0;
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" id='".$idarr[$i]."'")->save($data);
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
				$data['attr']=$cnTitle;
				$data['bz']=$addtime;
				$data['s2']=$color;
				$data['audit']=$audit;
				
				//$info->where(" id='".$id."'$xql")->save($data);
				echo "修改成功";
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


	public function indexs()
	{
		$arc=M('youhui_info');
		$page=(int)$this->_get('p');
		$order=cookie("youhui_Order");
		$admin=$this->admin;
		if ($order==''){$order='id';}
		$desc=cookie("youhui_desc");
		if ($desc==''){$desc='desc';}
		$flag=$this->_get('flag');
		$audit=(int)$this->_get('audit');
		$yid=(int)$this->_get('id');
		$keys=$this->_get('key');
		$this->order=$order;
		$this->desc=$desc;
		$this->keys=$keys;
		$this->flag=$flag;
		$this->audit=$audit;		
	
		if ($keys!=''){$msql2.=" and `attr` like '%".$keys."%'";}
		if ($audit>0){$msql2.=" and `audit`='1'";}
		import("@.ORG.Page");				
		$sql="del='0' and yid='$yid'";	
					
		$count = $arc->where($sql.$msql2)->count();
		$pgsize=(int)cookie('T_pgsize');
		if ($pgsize==0){$pgsize=10;}
		$selectpg=selectpg($pgsize);
		$this->selectpg=$selectpg;
		$parameter='&a=indexs';
		$page = new Page($count,$pgsize,$parameter);
		$plist = $page->show();				
		$list = $arc->where($sql.$msql2)->order("usetime desc,id desc")->limit($page->firstRow.','.$page->listRows)->select();
		//echo $arc->GetLastSql();
		$this->lists=$list;
		$this->page=$plist;
		$htm=$this->display();
	}
}