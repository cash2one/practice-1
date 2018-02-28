<?php
import('jadmin.Action.func');
class AdminAction extends Action {
    var $config;
	function _initialize() {
		$config=getconfig();
		$this->sysfig=$config;
		$this->menu_flm=4;

		$adminid =session('admin_id');
		$m=M('admin');
		$admin=$m->where("username='$adminid'")->find();
		$this->admin=$admin;	
		
		checkadmin();
	}
	public function index()
	{
		$adminid =session('admin_id');
		$pwd =session('admin_pwd');
		$mpwd =session('admin_cookie');
		$action="管理员管理";
		$this->action=$action;
		$m=M('admin');
		$order=cookie("admin_Order");
		if ($order==''){$order='id';}
		$desc=cookie("admin_desc");
		if ($desc==''){$desc='asc';}
		$keys=$this->_get('key');
		$this->order=$order;
		$this->desc=$desc;
		$this->keys=$keys;
		
		$admins=$this->admin;		
		if ($admins['Grade']==9)
		{
			if ($keys!='')
			{
				$msql2="  and concat(trim(`username`),trim(`cityname`),trim(`truename`),trim(`address`),trim(`tel`)) like '%$str%'";
			}	
			$list=$m->where("Grade='1'$msql2")->select();
			$this->lists=$list;
			$htm=$this->display();
		}
		else
		{
			$vo=$m->where("username='$adminid'")->find();
			$this->vo=$vo;
			$htm=$this->display('edit');
		}
	}
	
	
	
	public function add()
	{
		$admins=$this->admin;
		if ($admins['Grade']!=9)
		{
			$this->edit();exit();
		}
		$id=(int)$_GET['id'];
		$fid=(int)$_GET['fid'];
		$this->fid=$fid;
		if ($id==0){$act='add';}
		$this->act=$act;
		$actionType='添加';
		$vo=M('admin')->where(" id='$id' and Grade='1'")->find();
		if ((int)$vo['id']>0)
		{
			$pwd=md5("wifi".'chengdu'.$vo['username']);
			//echo $pwd;			
			$actionType='修改';
		}
		else
		{
			$vo['Lock']=0;
		}
		$this->vo=$vo;
		$this->actionType=$actionType;
		$this->id=$id;
		$this->display();
	}
	
	public function save()
	{
		$admins=$this->admin;
		if ($admins['Grade']!=9)
		{
			$this->edit();exit();
		}
		$info=M('admin');
		$id=(int)$_POST['id'];
		$Lock=(int)$_POST['Lock'];
		$user=$this->_post('username');
		$pwd=$this->_post('password');
		
		$user=ereg_replace("[^0-9a-zA-Z_@!\.-]",'',$user);
		$pwd=ereg_replace("[^0-9a-zA-Z_@!\.-]",'',$pwd);
		

		$cityname=$_POST['cityname'];
		$truename=$_POST['truename'];
		$tel=$_POST['tel'];
		$address=$_POST['address'];
		
		if ($user=="" || $cityname=="")
		{
			$json = array("status"=>'0',"message"=>"用户名和城市必填");
			echo json_encode($json);
			exit();
		}
		$vo=$info->where(" id='$id' and Grade='1'")->find();	
		if (!$vo && $pwd=="")
		{
			$json = array("status"=>'0',"message"=>"请输入密码");
			echo json_encode($json);
			exit();
		}
		$isid=$info->where(" id!='$id' and username='$user'")->find();
		if ($isid)
		{
			$json = array("status"=>'0',"message"=>"账号重复");
			echo json_encode($json);
			exit();
		}
		
		
		$data["username"] = $user;
		if ($pwd!='')
		{
			$pwds=md5("wifi".$pwd.$user);
			$data["password"] = $pwds;
		}
		$data["cityname"] = $cityname;
		$data["truename"] = $truename;
		$data["tel"] = $tel;
		$data["address"] = $address;
		$data["Lock"] = $Lock;
		$data["Grade"] =1;
		
		if ($vo)
		{
			$info->where('id='.$id.' and Grade=1')->save($data);
			$json = array("status"=>'1',"message"=>"编辑成功","url"=>U('/?m=admin'));
			echo json_encode($json);
			exit();
		}
		else
		{
			$lastInsId = $info->add($data);
			$json = array("status"=>'1',"message"=>"添加成功","url"=>U('/?m=admin'));
			echo json_encode($json);
			exit();
		}
	}
	
	
	public function edit()
	{
		$action="管理员修改";
		$this->action=$action;
		$adminid =session('admin_id');
		$pwd =session('admin_pwd');
		$mpwd =session('admin_cookie');
		$m=M('admin');
		$vo=$m->where("username='$adminid'")->find();
		$this->vo=$vo;
		$htm=$this->display('edit');
	}
	public function doact()
	{
		$lmoption =getlmoption(0);
		$this->lmoption=$lmoption;
		$action=$this->_post('action');
		$idstr=$this->_post('idstr');
		$idstr=$_REQUEST["idstr"];
		if ($action=='')
		{
			$action=$_GET['action'];
		}
		$admins=$this->admin;
		$info=M('admin');
		switch ($action)
		{
			case 's1':
				
				if ($admins['Grade']!=9)
				{
					$this->edit();exit();
				}
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
				$data['Lock']=0;
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" id='".$idarr[$i]."'")->save($data);
				}
				exit("审核成功");				
				break;
			case 's2':
				if ($admins['Grade']!=9)
				{
					$this->edit();exit();
				}
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
				$data['Lock']=1;
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" id='".$idarr[$i]."'")->save($data);
				}
				exit("操作成功");				
				break;
			case 'delall':
				if ($admins['Grade']!=9)
				{
					$this->edit();exit();
				}
				$idarr=explode(",",$idstr);
				$nums=count($idarr);				
				$data['del']=1;
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" id='".$idarr[$i]."'")->save($data);
				}
				exit("删除成功");	
				break;
			case 'edit':
				$m=M('admin');
				$adminid =session('admin_id');
				$user=$this->_post('username');
				$pwd=$this->_post('password');
				$oldpwd=$this->_post('oldpwd');
				$pwd2=$this->_post('pwd2');
				$user=ereg_replace("[^0-9a-zA-Z_@!\.-]",'',$user);
				$pwd=ereg_replace("[^0-9a-zA-Z_@!\.-]",'',$pwd);
				$oldpwd=ereg_replace("[^0-9a-zA-Z_@!\.-]",'',$oldpwd);
				$oldpwd=md5("wifi".$oldpwd.$adminid);
				$pwd=md5("wifi".$pwd.$user);
				$where="username='$adminid'";
				$minfo=$m->where($where)->find();
				if ($minfo['password']!=$oldpwd)
				{
					$json = array("status"=>'0',"message"=>"原始密码错误","url"=>U('/?m=admin'));
					echo json_encode($json);
					exit();					
				}						
				$data['username']=$user;
				$data['password']=$pwd;
				$m->where($where)->save($data);
				session('admin_id',$user);
				session('admin_pwd',$pwd);
				$json = array("status"=>'1',"message"=>"操作成功","url"=>U('/?m=admin&a=edit'));
				echo json_encode($json);
				exit();
				break;	
		}
	}
	
}