<?php
import('jadmin.Action.func');
class LmAction extends Action {
    var $config;
	function _initialize() {
		$config=getconfig();
		$this->sysfig=$config;
		$this->menu_flm=2;
		$this->menu_lm=0;
		checkadmin();
		qmadmin();
	}
	public function index()
	{
		$this->menu_lm=0;
		$lm=M('lm');
		$id=(int)$_GET['id'];
		$lmlist=$this->lmlist($id,' ');
		$lmoption =getlmoption($id);
		$this->id=$id;
		$this->lmoption=$lmoption;
		$this->lmlist=$lmlist;
		$this->display();
	}
	
	public function add()
	{
		$getcoloroption =getcoloroption($vo['color']);
		$this->getcoloroption=$getcoloroption;
		$this->menu_lm=1;
		$tbq=C('DB_PREFIX');
		$tb1=$tbq."lm";
		$tb2=$tbq."info";		
		$id=(int)$_GET['id'];
		$fid=(int)$_GET['fid'];
		$this->fid=$fid;
		if ($id==0){$act='add';}
		$this->act=$act;
		$lmoption =getlmoption($fid);
		$action='添加';
		$vo=M('lm')->where(" id='$id'")->find();
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
			
			$lmoption =getlmoption($vo['fid']);
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
		$lm=M('lm');	
		$vo=M('lm')->where(" id='$id'")->find();
		$cntitle=$_POST['cntitle'];
		$kdel=(int)$_POST['kdel'];
		$sort=(int)$_POST['sort'];
		$isshow=(int)$_POST['isshow'];
		$ty=(int)$_POST['tys'];
		$img=$_POST['img'];
		$entitle=$_POST['entitle'];
		$url=$_POST['url'];
		$title=$_POST['title'];
		$dtitle=$_POST['dtitle'];
		$keywords=$_POST['keywords'];
		$description=$_POST['description'];	
		$Additional=$_POST['Additional'];			
		if ($cntitle=="")
		{
			$json = array("status"=>'-1',"message"=>"没有填写标题","url"=>U('/?m=lm&lm='.$fid.''));
			echo json_encode($json);
			exit();
		}
	
		if ($fid>0 && $id==$fid)
		{
			$json = array("status"=>'-1',"message"=>"父栏目错误","url"=>U('/?m=lm&lm='.$fid.''));
			echo json_encode($json);
			exit();	
		}	
		
		$urlpath=$_POST['urlpath'];
		$weburl=$_POST['weburl'];
		$urlpath=strtolower($urlpath);
		$weburl=strtolower($weburl);
		if ($urlpath=="")
		{
			$json = array("status"=>'-1',"message"=>"请填写路径","url"=>U('/?m=lm&lm='.$fid.''));
			echo json_encode($json);
			exit();
		}	
		if ($urlpath!='')
		{
			$urlpath='/'.$urlpath.'/';
			$urlpath=str_replace('//','/',$urlpath);	
		}
		$weburl=$urlpath.$weburl;
		//$weburl='/'.$weburl.'/';
		$weburl=str_replace('//','/',$weburl);
		$weburl=str_replace('//','/',$weburl);
		
		if ($weburl=='/' || $weburl=='')
		{
			$json = array("status"=>'-1',"message"=>"网站url不能为空","url"=>U('/?m=lm&lm='.$fid.''));
			echo json_encode($json);
			exit();	
		}

		//判断url不能重复
		$isid=M("lm")->where("weburl='$weburl' and id!='$id'")->find();
		if ($isid)
		{
			$json = array("status"=>'-1',"message"=>"网站url重复，请更换","url"=>U('/?m=lm&lm='.$fid.''));
			echo json_encode($json);
			exit();		
		}
		$imglist=$this->srequest('imglist');
		$data["urlpath"] = $urlpath;
		$data["weburl"] = $weburl;	
		$data["imglist"]=$imglist;
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
		$data["url"] = $url;
		$data["title"] = $title;	
		$data["dtitle"] = $dtitle;
		$data["urlpath"] = $urlpath;
		$data["weburl"] = $weburl;	
		$data["keywords"] = $keywords;
		$data["description"] = $description;
		$data['Additional']=$Additional;
		if ($vo)
		{
			$data["id"] = $id;
			$lm->where('id='.$id.'')->save($data);
			$adimg=$this->srequest('adimg');
			$adurl=$this->srequest('adurl');
			if ($fid==1 && $adimg!='')
			{
				$datax['img']=$adimg;
				$datax['url']=$adurl;
				$datax['pid']=$id;
				$is=M("lm_ad")->where("pid='$id'")->find();
				if ($is)
				{
					M("lm_ad")->where("pid='$id'")->save($datax);
				}
				else
				{
					M("lm_ad")->add($datax);
				}
			}
			//判断栏目的路径是否更改 如果更改了 对应的文档url也要更改
			if ($vo['urlpath']!=$urlpath)
			{
				$mtb=M();
				$tbq=C('DB_PREFIX');
				$tb=$tbq."info";
				$sonid=getsonid($id);//子栏目
				$sarr=explode(',',$sonid);
				foreach ($sarr as $ky)
				{
					$wpath=$lm->where("id='$ky'")->getField("urlpath");
					$asql="update $tb set weburl=CONCAT('$wpath',id,'.html') where fid='$ky'";
					$mtb->query($asql);	
				}
			}
			$json = array("status"=>'1',"message"=>"编辑成功","url"=>U('/?m=lm&id='.$fid.''));
			echo json_encode($json);
			exit();
		}
		else
		{
			$lastInsId = $lm->add($data);
			$adimg=$this->srequest('adimg');
			$adurl=$this->srequest('adurl');
			if ($fid==1 && $adimg!='')
			{
				$data['img']=$adimg;
				$data['url']=$adurl;
				$data['pid']=$lastInsId;
				M("lm_ad")->add($datax);
			}		
			$json = array("status"=>'1',"message"=>"添加成功","url"=>U('/?m=lm&id='.$fid.''));
			echo json_encode($json);
			exit();
			
		}
	}
	
	
	public function doact()
	{
		$lmoption =getlmoption(0);
		$this->lmoption=$lmoption;
		$action=$this->_post('action');
		$id=(int)$this->_post('id');
		$idstr=$this->_post('idstr');
		$idstr=$_REQUEST["idstr"];
		switch ($action)
		{
			case 'del':
				$lm=M('lm');
				$info=M('info');
				$lminfo=$lm->where(" fid='".$id."'")->find();
				if ((int)$lminfo['id']>0)
				{
					exit('删除失败,请先删除该栏目的子栏目');
					$json = array("status"=>'0',"message"=>"删除失败,请先删除该栏目的子栏目");
					echo json_encode($json);
					exit();
				}
				$infoc=$info->where("CONCAT(',', fidpath, ',') like '%,".$id.",%'")->find();
				if ((int)$infoc['id']>0)
				{
					exit('删除失败,请先删除该栏目的文档');
					$json = array("status"=>'0',"message"=>"删除失败,请先删除该栏目的文档");
					echo json_encode($json);
					exit();
				}
				$lm->where(" id='".$id."' and kdel='0'")->delete();
				exit('删除成功');
				$json = array("status"=>'1',"message"=>"删除成功","url"=>U('/?m=lm&rs=ok'));
				echo json_encode($json);
				exit();
				break;
			case 'sort':			
				$sortstr=$_REQUEST["sortstr"];
				$idarr=explode(",",$idstr);
				$sortarr=explode(",",$sortstr);
				$nums=count($sortarr);
				$info=M('lm');
				for ($i=0;$i<$nums;$i++)
				{
					$data['sort']=$sortarr[$i];
					$info->where(" id='".$idarr[$i]."'")->save($data);	
				}
				
				$json = array("status"=>'1',"message"=>"更新成功","url"=>U('/?m=lm&rs=ok'));
				echo json_encode($json);
				exit();
		}
	}
	public function lmlist($id,$str)
	{
		$tbq=C('DB_PREFIX');
		$cid=$id;
		$tb1=$tbq."lm";
		$tb2=$tbq."info";
		$sqlc="SELECT a.id,a.cntitle,a.fid,a.`sort`,a.isshow,a.ty,a.kdel,a.url,(select count(b.id) from $tb1 as b where b.fid=a.id) as";
		$sqlc=$sqlc." CNum,(select count(c.id) from $tb2 as c where CONCAT(',', c.fidpath, ',') like '%,a.id,%') as zcount,Additional FROM $tb1 as a where a.fid=".$id." order by a.`sort` asc";
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
			$ftree=get_fpath($id);
			$blm=$ftree[2];
			if ($fid==0){$blm=$id;}
			$zcount=(int)shows("select count(id) from $tb2 where CONCAT(',', fidpath, ',') like '%,$id,%'");
			$bg1='';$bg2='';$do1='';$do2='';
			if ($rsc["CNum"]>0)
			{
				//$bg1=' style="background:#CFDFEF;" class="no"';
				//$bg2=' style="background:#CFDFEF;" class="no2"';
			}
			$sid=M("lm")->where("id='$cid'")->getField("fid");
			if ($fid==0 || $blm==1)
			{ 
			$do1='<a href="?m=lm&a=add&fid='.$id.'">添加子类</a> |';
			$do3='<a href="?m=lm&id='.$id.'">下级栏目('.$rsc["CNum"].')</a> |';
			} 
			if ($fid>0){$do0='<a href="?m=lm&id='.$sid.'">上级</a> |';}
			if ($kdel==0){$do2='| <a href="javascript:void(0)" onclick="del(\'del\','.$id.')">删除</a>';}
			$fhtm.='<tr'.$bg1.'><td'.$bg2.'><input type="hidden" name="sid" value="'.$id.'" />
						<span class="fright">'.$do0.'
						'.$do3.'
							'.$do1.'<a href="?m=lm&a=add&id='.$id.'">修改</a>
							'.$do2.'|</span>'.$str.'├
						<a href="?m=lm&a=add&id='.$id.'">'.$cntitle.' '.$entitle.'  [ID:'.$id.']<!-- [文章:'.$zcount.']--></a>
						</td>
						<td align="center"'.$bg2.'>
						<input name="sort" value="'.$sorts.'" class="w30 center form-control" />
						</td>
					</tr>';
			if ($rsc["CNum"]>0)
			{
				//$fhtm.=$this->lmlist($rsc[0],$str."　");
			}
		}
		return $fhtm;
	}
	
}