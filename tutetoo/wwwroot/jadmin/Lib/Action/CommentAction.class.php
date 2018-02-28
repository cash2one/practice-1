<?php
import('jadmin.Action.func');
class CommentAction extends Action {
    var $config;
	function _initialize() {
		$config=getconfig();
		$this->sysfig=$config;
		$this->menu_flm=9;
		checkadmin();
	}
	public function index()
	{
		$arc=M('comment');
		$page=(int)$this->_get('p');
		$order=cookie("comment_Order");
		if ($order==''){$order='id';}
		$desc=cookie("comment_desc");
		if ($desc==''){$desc='desc';}
		$keys=$this->_get('key');
		$this->order=$order;
		$this->desc=$desc;
		$this->keys=$keys;
		$msql2="del='0'";
		if ($keys!=''){$msql2.=" and (`content` like '%".$keys."%' or `uid` like '%".$keys."%' or `pid` like '%".$keys."%')";}	
		$t1=cookie("u_time1");
		$t2=cookie("u_time2");
		if ($t1!=''){$ts1=$t1." 00:00:01";$msql2.=" and addtime>=".strtotime($ts1)."";}
		if ($t2!=''){$ts2=$t2." 23:59:59";$msql2.=" and addtime<=".strtotime($ts2)."";}
		$this->time1=$t1;
		$this->time2=$t2;
		
			
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
		$this->lists=$list;
		$this->page=$plist;
		$htm=$this->display();
	}
	
	public function view()
	{
		$id=(int)$_GET['id'];		
		$this->act=$act;
		$actionType='查看';
		$vo=M('comment')->where(" id='$id'")->find();
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
				$info=M('comment');
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
				$info=M('comment');
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
				$info=M('comment');
				$data['del']=1;
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" id='".$idarr[$i]."'")->save($data);
				}
				exit("删除成功");	
				break;
		}
	}
	
	public function save()
	{
		$id=(int)$this->_post('id');
		$nc=$_POST['nc'];
		$data['nc']=$nc;
		M("comment")->where("id='$id'")->save($data);
		$json = array("status"=>'1',"message"=>"操作成功","url"=>U('/?m=comment'));
		echo json_encode($json);
		exit();
	}
	

}