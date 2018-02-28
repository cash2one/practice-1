<?php
import('jadmin.Action.func');
class UclassAction extends Action {
    var $config;
	function _initialize() {
		$config=getconfig();
		$this->sysfig=$config;
		$this->menu_flm=12;
		$this->menu_lm=0;
		checkadmin();
		qmadmin();
	}
	public function index()
	{
		$this->menu_lm=0;
		$lm=M('class');
		$id=(int)$_GET['id'];
		$lmlist=$this->lmlist($id,' ');
		$this->lmlist=$lmlist;
		$this->display();
	}
	
	public function add()
	{
		$this->menu_lm=1;
		$tbq=C('DB_PREFIX');
		$tb1=$tbq."class";		
		$id=(int)$_GET['id'];
		$fid=(int)$_GET['fid'];
		$this->fid=$fid;
		if ($id==0){$act='add';}
		$this->act=$act;
		$lmoption =Goption($fid,0,'attr');
		$action='添加';
		$vo=M('class')->where(" id='$id'")->find();
		if ((int)$vo['id']>0)
		{
			$action='修改';
			$this->vo=$vo;
			$this->id=$vo['id'];
		}
		else
		{
			$this->vo=$vo;
			$this->id=0;			
		}
		$this->action=$action;
		$this->id=$id;
		$this->lmoption=$lmoption;
		$this->display();
	}
	
	public function save()
	{
		$id=(int)$_POST['id'];
		$fid=(int)$_POST['fid'];
		$lm=M('class');	
		$vo=M('class')->where(" id='$id'")->find();
		$cntitle=$_POST['cntitle'];
		$s1=(int)$_POST['s1'];		
	
		if ($cntitle=="")
		{
			$json = array("status"=>'-1',"message"=>"没有填写名称","url"=>U('/?m=uclass&lm='.$fid.''));
			echo json_encode($json);
			exit();
		}	
		
		$data["classname"] = $cntitle;
		$data["s1"] = (int)$s1;
		if ($vo)
		{
			$data["id"] = $id;
			$lm->where('id='.$id.'')->save($data);
			$json = array("status"=>'1',"message"=>"编辑成功","url"=>U('/?m=uclass&lm='.$fid.''));
			echo json_encode($json);
			exit();
		}
		else
		{
			$lastInsId = $lm->add($data);
			$json = array("status"=>'1',"message"=>"添加成功","url"=>U('/?m=uclass&lm='.$fid.''));
			echo json_encode($json);
			exit();
			
		}
	}
	
	public function doact()
	{
		$lmoption =Goption(0,0,'attr');
		$this->lmoption=$lmoption;
		$action=$this->_post('action');
		$id=(int)$this->_post('id');
		$idstr=$this->_post('idstr');
		$idstr=$_REQUEST["idstr"];
		switch ($action)
		{
			case 'sort':			
				$sortstr=$_REQUEST["sortstr"];
				$idarr=explode(",",$idstr);
				$sortarr=explode(",",$sortstr);
				$nums=count($sortarr);
				$info=M('class');
				for ($i=0;$i<$nums;$i++)
				{
					$data['s1']=$sortarr[$i];
					$info->where(" id='".$idarr[$i]."'")->save($data);	
				}				
				$json = array("status"=>'1',"message"=>$sqlx."更新成功","url"=>U('/?m=uclass&rs=ok'));
				echo json_encode($json);
				exit();
		}
	}
	public function lmlist($id,$str)
	{
		$tbq=C('DB_PREFIX');
		$tb1=$tbq."class";
		$sqlc="SELECT id,classname,`s1` FROM $tb1 order by id asc";
		$r=mysql_query($sqlc);
		$num=mysql_num_rows($r);
		while ($rsc=mysql_fetch_array($r))
		{
			$id=$rsc[0];
			$cntitle=$rsc[1];
			$s1=$rsc[2];			
			$fhtm.='<tr'.$bg1.'><td'.$bg2.'><input type="hidden" name="sid" value="'.$id.'" />
						<span class="fright">
							'.$do1.'<a href="?m=uclass&a=add&id='.$id.'">修改</a>
							'.$do2.'|</span>'.$str.'├
						<a href="?m=uclass&a=add&id='.$id.'">'.$cntitle.' [ID:'.$id.']</a>
						</td>
						<td align="center"'.$bg2.'>
						<input name="sort" value="'.$s1.'" class="w30 center form-control" />
						</td>
					</tr>';
		}
		return $fhtm;
	}
	
}