<?php
import('jadmin.Action.func');
class SignAction extends Action {
    var $config;
	function _initialize() {
		$config=getconfig();
		$this->sysfig=$config;
		$this->menu_flm=12;
		checkadmin();qmadmin();
	}
	public function index()
	{
		$arc=M('msg2');
		$page=(int)$this->_get('p');
		$order=cookie("sign_Order");
		if ($order==''){$order='id';}
		$desc=cookie("sign_desc");
		if ($desc==''){$desc='desc';}
		$keys=$this->_get('key');
		$this->order=$order;
		$this->desc=$desc;
		$this->keys=$keys;
		if ($keys!='')
		{
			$msql2.=" concat(trim(`z1`),trim(`z2`),trim(`z3`),trim(`z4`),trim(`z5`),trim(`z6`),trim(`z7`),trim(`z8`),trim(`z9`)) like '%$str%'";
		}		
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
		$vo=M('msg2')->where(" id='$id'")->find();
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
			case 'sort':
				$idarr=explode(",",$idstr);				
				$sortstr=$_REQUEST["sortstr"];
				$idarr=explode(",",$idstr);
				$sortarr=explode(",",$sortstr);
				$sortarr2=explode(",",$sd);
				$nums=count($sortarr);
				$info=M('msg2');
				for ($i=0;$i<$nums;$i++)
				{
					$data['sort']=$sortarr[$i];
					$info->where(" id='".$idarr[$i]."'")->save($data);	
				}
				exit("更新成功");	
				break;
			case 's1':
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
				$info=M('msg2');
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
				$info=M('msg2');
				$data['state']=0;
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" id='".$idarr[$i]."'")->save($data);
				}
				exit("操作成功");				
				break;
				
			case 's3':
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
				$info=M('msg2');
				$data['vouch']=1;
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" id='".$idarr[$i]."'")->save($data);
				}
				exit("操作成功");				
				break;
				
				
			case 's4':
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
				$info=M('msg2');
				$data['vouch']=0;
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" id='".$idarr[$i]."'")->save($data);
				}
				exit("操作成功");				
				break;
			case 'delall':
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
				$info=M('msg2');
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

/*		$kv=array_keys($_POST);
		$ks=0;
		foreach ($_POST as $ky)
		{
			$data[$kv[$ks]]=$ky;//键名键值
			$ks++;
		}*/
		
		//print_r($data);
		//exit();
		$data=$_POST;
		$id=(int)$this->_post('id');
		if ($id>0)
		{
			$data['stime']=strtotime($data['stime']);
			$data['etime']=strtotime($data['etime']);
			M("msg2")->where("id='$id'")->save($data);
		}
		$json = array("status"=>'1',"message"=>"操作成功","url"=>U('/?m=sign'));
		echo json_encode($json);
		exit();
	}
	

}