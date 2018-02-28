<?php
import('jadmin.Action.func');
class WebsmsAction extends Action {
    var $config;
	function _initialize() {
		$config=getconfig();
		$this->sysfig=$config;
		$this->menu_flm=21;
		checkadmin();
	}
	public function index()
	{
		$arc=M('websms');
		$page=(int)$this->_get('p');
		$order=cookie("websms_Order");
		if ($order==''){$order='id';}
		$desc=cookie("websms_desc");
		$websms_type=cookie('websms_type');
		if ($desc==''){$desc='desc';}
		$keys=$this->_get('key');
		$this->order=$order;
		$this->desc=$desc;
		$this->keys=$keys;
		$msql2="del='0'";
		if ($keys!=''){$msql2.=" and (`content` like '%".$keys."%' or `uid` like '%".$keys."%')";}	
		switch ($websms_type)
		{
			case '0':
			case '1':
			case '2':
			case '3':
				$msql2.=" and type='$websms_type'";
				break;
			default:
				$websms_type=99;
				break;	
		}	
		$this->type=$websms_type;
		import("@.ORG.Page");				
		$count = $arc->where($sql.$msql2)->count();
		$pgsize=(int)cookie('T_pgsize');
		if ($pgsize==0){$pgsize=10;}
		$selectpg=selectpg($pgsize);
		$this->selectpg=$selectpg;
		$parameter='&key='.$keys;
		$page = new Page($count,$pgsize,$parameter);
		$plist = $page->show('?key='.$keys);				
		$list = $arc->where($sql.$msql2)->order("`$order` $desc,id desc")->limit($page->firstRow.','.$page->listRows)->select();
		//echo $arc->GetLastSql();
		$this->lists=$list;
		$this->page=$plist;
		$htm=$this->display();
	}
	
	public function view()
	{
		$id=(int)$_GET['id'];		
		$this->act=$act;
		$actionType='查看';
		$vo=M('websms')->where(" id='$id'")->find();
		if ((int)$vo['id']>0)
		{
			$this->vo=$vo;
			$this->id=$vo['id'];
		}
		else
		{
			exit('error');
		}
		$this->actionType=$actionType;
		$this->id=$id;
		$this->display();
	}
	
	public function doact()
	{
		$action=$this->_post('action');
		$idstr=$this->_post('idstr');
		$idstr=$_REQUEST["idstr"];
		$info=M('websms');
		switch ($action)
		{
			case 's1':
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
				$data['audit']=1;
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" id='".$idarr[$i]."'")->save($data);
				}
				exit("审核成功");				
				break;
			case 's2':
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
				$data['audit']=0;
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" id='".$idarr[$i]."'")->save($data);
				}
				exit("操作成功");				
				break;
			case 'delall':
				$idarr=explode(",",$idstr);
				$nums=count($idarr);				
				$data['del']=1;
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" id='".$idarr[$i]."'")->save($data);
				}
				exit("删除成功");	
				break;
		}
	}	

}