<?php
import('jadmin.Action.func');
class LoginAction extends Action {
    var $config;
	/*初始化*/
	function _initialize() {
		$config=getconfig();
		$this->sysfig=$config;
	}
	public function index()
	{
		$act=$this->_get('act');
		if ($act=='login')
		{
			$user=$this->_post('username');
			$pwd=$this->_post('upassword');			
			//$user=$this->_get('username');
			//$pwd=$this->_get('upassword');
			$user=ereg_replace("[^0-9a-zA-Z_@!\.-]",'',$user);
			$pwd=ereg_replace("[^0-9a-zA-Z_@!\.-]",'',$pwd);
			$this->login($user,$pwd);
		}
		$this->display();	
	}
	public function login($user='',$pwd='')
	{
		if ($user=='' || $pwd=='')
		{
			$json = array("status"=>'0',"message"=>"请输入用户名和密码!","url"=>"?m=login");
			echo json_encode($json);exit();
		}
		$sql=" username='".$user."' and del='0' and `Lock`='0'";
		$uinfo=M('admin')->where($sql)->find();
		
		$uid=(int)$uinfo['id'];
		$pwds=$uinfo['password'];
		$pwd=md5("wifi".$pwd.$user);
		$mpwd=md5($pwd."cook".$user);		
		if (!$uinfo || $pwd!=$pwds)
		{
			$json = array("status"=>'0',"message"=>"用户名或密码错误","url"=>"?m=login");
			echo json_encode($json);
			exit();
		}
		
		$admin=M('admin');
		$data['cookie']=$mpwd;
		$data['LastTime']=date('Y-m-d H:i:s');
		$data['LastIP']=GetIp();
		$data['logins']=$uinfo['logins']+1;
		
		$admin->where(" username='".$user."'")->save($data);
		
		session('adminid',md5($uid));
		session('admin_id',$user);
		session('admin_pwd',$pwd);
		session('admin_cookie',$mpwd);
		
		$json = array("status"=>'1',"message"=>"恭喜您登录成功","url"=>"?iframe");
		echo json_encode($json);
		exit();		
	}
}