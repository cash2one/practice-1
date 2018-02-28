<?php
import('jadmin.Action.func');
class IndexAction extends Action {
    var $config;
	function _initialize()
	{
		$config=getconfig();
		$this->sysfig=$config;
		$this->menu_flm=3;
		checkadmin();
	}
    public function index()
	{
		$this->yy=(int)$_SESSION['yy'];	
		$this->display();
    }
	
	public function neworder()
	{
		echo newNum();
		return '';	
	}
	
	//退出系统
    public function doexit()
	{
		session('name',null); 
		session('admin_id',null);
		session('admin_pwd',null);
		session('admin_cookie',null);
		redirect('?m=login');
    }
	
}