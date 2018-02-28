<?php
import('jadmin.Action.func');
class AttrAction extends Action {
    var $config;
	function _initialize() {
		$config=getconfig();
		$this->sysfig=$config;
		$this->menu_flm=11;
		$this->menu_lm=0;
		checkadmin();
		qmadmin();
	}
	public function index()
	{
		$this->menu_lm=0;
		$lm=M('attr');
		$id=(int)$_GET['id'];
		$lmlist=$this->lmlist($id,' ');
		$lmoption =Goption($id,0,'attr');
		$this->lmoption=$lmoption;
		$this->lmlist=$lmlist;
		$this->display();
	}
	
	public function add()
	{
		$this->menu_lm=1;
		$tbq=C('DB_PREFIX');
		$tb1=$tbq."attr";
		
		$id=(int)$_GET['id'];
		$fid=(int)$_GET['fid'];
		$this->fid=$fid;
		if ($id==0){$act='add';}
		$this->act=$act;
		$lmoption =Goption($fid,0,'attr');
		$action='添加';
		$vo=M('attr')->where(" id='$id'")->find();
		if ((int)$vo['id']>0)
		{
			$action='修改';
			$this->vo=$vo;
			$this->kdel=$vo['audit'];
			$this->ty=$vo['ty'];			
			$this->kdel=$vo['kdel'];
			$this->isshow=$vo['isshow'];
			$this->id=$vo['id'];
			$this->fid=$vo['fid'];
			$lmoption =Goption($vo['fid'],0,'attr');
		}
		else
		{
			$vo['ty']=1;
			$vo['kdel']=0;			
			$vo['isshow']=1;
			$vo['fid']=$fid;
			if ($fid>0)
			{
				$path=M("lm")->where("id='$fid'")->getField("urlpath");
				$max=M("lm")->where()->order("id desc")->getField("id");
				$max=(int)$max+1;
				$vo['urlpath']=$path."list-".$max;	
			}
			$kdel=0;
			$ty=1;
			$mty=0;
			$isshow=1;
			$this->kdel=$kdel;
			$this->ty=$ty;
			$this->mty=$mty;
			$this->isshow=$isshow;	
					
			$sorts=shows("select count(sort)+1 from $tb1 where fid=".$fid."");
			if ($sorts>1)
			{
				$sorts=shows("select max(sort)+1 from $tb1 where fid=".$fid."");
			}
			$vo['sort']=$sorts;
			$this->sort=$sorts;	
			$this->fid=$fid;
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
		$lm=M('attr');	
		$vo=M('attr')->where(" id='$id'")->find();
		$cntitle=$_POST['cntitle'];
		$kdel=(int)$_POST['kdel'];
		$sort=(int)$_POST['sort'];
		$isshow=(int)$_POST['isshow'];
		$ty=(int)$_POST['tys'];
		$img=$_POST['img'];
		$entitle=$_POST['entitle'];
	
		if ($cntitle=="")
		{
			$json = array("status"=>'-1',"message"=>"没有填写名称","url"=>U('/?m=lm&lm='.$fid.''));
			echo json_encode($json);
			exit();
		}	
		
		$lminfo=$lm->where(" id='".$fid."'")->find();
		$fidpath=$lminfo['fidpath'].",".$fid."";
		$data["fid"] = $fid;
		$data["sort"] = $sort;
		$data["kdel"] = $kdel;
		$data["fidpath"] = $fidpath;
		$data["isshow"] = $isshow;
		$data["ty"] = $ty;			
		$data["img"] = $img;
		$data["cntitle"] = $cntitle;
		$data["entitle"] = $entitle;
		if ($vo)
		{
			$data["id"] = $id;
			$lm->where('id='.$id.'')->save($data);
			$json = array("status"=>'1',"message"=>"编辑成功","url"=>U('/?m=attr&lm='.$fid.''));
			echo json_encode($json);
			exit();
		}
		else
		{
			$lastInsId = $lm->add($data);
			$json = array("status"=>'1',"message"=>"添加成功","url"=>U('/?m=attr&lm='.$fid.''));
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
			case 'del':
				$lm=M('attr');
				$lminfo=$lm->where(" fid='".$id."'")->find();
				if ((int)$lminfo['id']>0)
				{
					$json = array("status"=>'0',"message"=>"删除失败");
					echo json_encode($json);
					exit();
				}
				$lm->where(" id='".$id."' and kdel='0'")->delete();
				$json = array("status"=>'1',"message"=>"删除成功","url"=>U('/?m=attr&rs=ok'));
				echo json_encode($json);
				exit();
				break;
			case 'sort':			
				$sortstr=$_REQUEST["sortstr"];
				$idarr=explode(",",$idstr);
				$sortarr=explode(",",$sortstr);
				$nums=count($sortarr);
				$info=M('attr');
				for ($i=0;$i<$nums;$i++)
				{
					$data['sort']=$sortarr[$i];
					$info->where(" id='".$idarr[$i]."'")->save($data);	
				}
				
				$json = array("status"=>'1',"message"=>"更新成功","url"=>U('/?m=attr&rs=ok'));
				echo json_encode($json);
				exit();
		}
	}
	public function lmlist($id,$str)
	{
		$tbq=C('DB_PREFIX');
		$tb1=$tbq."attr";
		$sqlc="SELECT a.id,a.cntitle,a.fid,a.`sort`,a.isshow,a.ty,a.kdel,a.id,(select count(b.id) from $tb1 as b where b.fid=a.id) as";
		$sqlc=$sqlc." CNum FROM $tb1 as a where a.fid=".$id." order by a.`sort` asc";
		$r=mysql_query($sqlc);
		$num=mysql_num_rows($r);
		while ($rsc=mysql_fetch_array($r))
		{
			$id=$rsc[0];
			$cntitle=$rsc[1];
			$fid=$rsc[2];
			$sorts=$rsc[3];
			$isshow=$rsc[4];
			$ty=$rsc[5];
			$kdel=$rsc[6];
			$url=$rsc[7];
			$entitle=$rsc['Additional'];
			$zcount=$rsc[9];

			if ($fid==0){$blm=$id;}
			$bg1='';$bg2='';$do1='';$do2='';
			if ($rsc["CNum"]>0)
			{
				$bg1=' style="background:#CFDFEF;" class="no"';
				$bg2=' style="background:#CFDFEF;" class="no2"';
			}
			
			if ($fid==0) { $do1='<a href="?m=attr&a=add&fid='.$id.'">添加子类</a> |';} 
			if ($kdel==0){$do2='| <a href="javascript:void(0)" onclick="del(\'del\','.$id.')">删除</a>';}
			$fhtm.='<tr'.$bg1.'><td'.$bg2.'><input type="hidden" name="sid" value="'.$id.'" />
						<span class="fright">
							'.$do1.'<a href="?m=attr&a=add&id='.$id.'">修改</a>
							'.$do2.'|</span>'.$str.'├
						<a href="?m=attr&a=add&id='.$id.'">'.$cntitle.' '.$entitle.'  [ID:'.$id.']</a>
						</td>
						<td align="center"'.$bg2.'>
						<input name="sort" value="'.$sorts.'" class="w30 center form-control" />
						</td>
					</tr>';
			if ($rsc["CNum"]>0)
			{
				$fhtm.=$this->lmlist($rsc[0],$str."　");
			}
		}
		return $fhtm;
	}
	
}