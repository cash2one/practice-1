<?php
import('jadmin.Action.func');
class CountAction extends Action {
    var $config;
	function _initialize() {
		$config=getconfig();
		$this->sysfig=$config;
		$lm = M("lm");
		$lm = $lm->where('fid=0')->order('id')->limit(12)->select();
		$this->lmlist=$lm;
		checkadmin();
	}
	public function index()
	{
		$arc=M('count');
		$page=(int)$this->_get('p');
		$order=cookie("c_Order");
		if ($order==''){$order='id';}
		$desc=cookie("c_desc");
		if ($desc==''){$desc='desc';}
		$keys=$this->_get('key');
		$this->order=$order;
		$this->desc=$desc;
		$this->keys=$keys;
		$msql2='1=1';
		if ($keys!=''){$msql2.=" and (`ip` like '%".$keys."%' or `url` like '%".$keys."%' or `fromurl` like '%".$keys."%')";}		
		$t1=cookie("c_time1");
		$t2=cookie("c_time2");
		if ($t1!=''){$ts1=$t1." 00:00:01";$msql2.=" and time>=".strtotime($ts1)."";}
		if ($t2!=''){$ts2=$t2." 23:59:59";$msql2.=" and time<=".strtotime($ts2)."";}
		import("@.ORG.Page");				
		$this->time1=$t1;
		$this->time2=$t2;	
		$count = $arc->where($sql.$msql2)->count();
		$pgsize=(int)cookie('T_pgsize');
		if ($pgsize==0){$pgsize=10;}
		$selectpg=selectpg($pgsize);
		$this->selectpg=$selectpg;
		$parameter='m=count&key='.$keys;
		$page = new Page($count,$pgsize,$parameter);
		$plist = $page->show();				
		$list = $arc->where($sql.$msql2)->order("`$order` $desc,id desc")->limit($page->firstRow.','.$page->listRows)->select();
		//echo $arc->GetLastSql();
		//array_walk($list, 'getdate1', "addtime");//对数组中的每个元素应用回调函数
		$this->lists=$list;
		$this->page=$plist;
		$htm=$this->display();
	}
	

	
	public function doact()
	{
		$action=$this->_post('action');
		$idstr=$this->_post('idstr');
		$idstr=$_REQUEST["idstr"];
		switch ($action)
		{
			case 'delall':
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
				$info=M('count');
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" id='".$idarr[$i]."'")->delete();
				}
				exit("删除成功");	
				break;

		}
	}
	

}