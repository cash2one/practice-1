<?php
import('jadmin.Action.func');
class MsgAction extends Action {
    var $config;
	function _initialize() {
		$config=getconfig();
		$this->sysfig=$config;
		$this->menu_flm=5;
		$lm = M("lm");
		$lm = $lm->where('fid=0')->order('id')->limit(12)->select();
		$this->lmlist=$lm;
		checkadmin();
	}
	public function index()
	{
		$arc=M('msg');
		$page=(int)$this->_get('p');
		$order=cookie("msg_Order");
		if ($order==''){$order='id';}
		$desc=cookie("msg_desc");
		if ($desc==''){$desc='desc';}
		$keys=$this->_get('key');
		$this->order=$order;
		$this->desc=$desc;
		$this->keys=$keys;
		if ($keys!=''){$msql2.=" (`z1` like '%".$keys."%' or `z2` like '%".$keys."%' or `z3` like '%".$keys."%')";}		
		import("@.ORG.Page");				
					
		$count = $arc->where($sql.$msql2)->count();
		$pgsize=(int)cookie('T_pgsize');
		if ($pgsize==0){$pgsize=10;}
		$selectpg=selectpg($pgsize);
		$this->selectpg=$selectpg;
		$parameter='&key='.$keys;
		$page = new Page($count,$pgsize,$parameter);
		$plist = $page->show();				
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
		$vo=M('msg')->where(" id='$id'")->find();
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
		switch ($action)
		{
			case 's1':
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
				$info=M('msg');
				$data['state']=1;
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" id='".$idarr[$i]."'")->save($data);
				}
				exit("审核成功");				
				break;
			case 's2':
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
				$info=M('msg');
				$data['state']=0;
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" id='".$idarr[$i]."'")->save($data);
				}
				exit("操作成功");				
				break;
			case 'delall':
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
				$info=M('msg');
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" id='".$idarr[$i]."'")->delete();
				}
				exit("删除成功");	
				break;

		}
	}
	
	public function save()
	{
		$id=(int)$this->_post('id');
		$Qcontent=$_POST['Qcontent'];
		$data['Qcontent']=$Qcontent;
		M("msg")->where("id='$id'")->save($data);
		$json = array("status"=>'1',"message"=>"操作成功","url"=>U('/?m=msg'));
		echo json_encode($json);
		exit();
	}
	

}