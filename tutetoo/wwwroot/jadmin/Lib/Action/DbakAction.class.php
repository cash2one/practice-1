<?php
import('jadmin.Action.func');
class DbakAction extends Action {
    var $config;
	function _initialize() {
		$config=getconfig();
		$this->sysfig=$config;
		$this->menu_flm=7;
		checkadmin();
	}
	public function index()
	{
		$htm=$this->display();
		
	}
		

}