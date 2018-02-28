<?php
import('jadmin.Action.func');
class AdAction extends Action {
    var $config;
	function _initialize() {
		$config=getconfig();
		$this->sysfig=$config;
		$this->menu_flm=6;
		checkadmin();
	}
	public function index()
	{
		$arc=M('ad');
		$page=(int)$this->_get('p');
		import("@.ORG.Page");
		$count = $arc->where($sql.$msql2)->count();
		$pgsize=(int)cookie('T_pgsize');
		if ($pgsize==0){$pgsize=10;}
		$selectpg=selectpg($pgsize);
		$this->selectpg=$selectpg;
		$parameter='';
		$page = new Page($count,$pgsize,$parameter);
		$plist = $page->show();				
		$list = $arc->where($sql.$msql2)->order("id asc")->limit($page->firstRow.','.$page->listRows)->select();
		$this->lists=$list;
		$this->page=$plist;			
		$htm=$this->display();
	}
	
	public function add()
	{
		$id=(int)$_GET['id'];
		if ($id==0){$act='add';}
		$this->act=$act;
		$action='添加';
		$vo=M('ad')->where(" id='$id'")->find();
		if ((int)$vo['id']>0)
		{
			$action='修改';
			$this->vo=$vo;
		}
		$this->action=$action;
		$this->id=$id;
		$this->display();
	}
	
	public function save()
	{
		$id=(int)$_POST['id'];
		$m=M('ad');
		$vo=$m->where(" id='$id'")->find();
		$img=$_REQUEST['img'];
		$ty=(int)$_REQUEST['ty'];
		$cntitle=$_REQUEST['cntitle'];
		$width=$_REQUEST['width'];
		$height=$_REQUEST['height'];
		$ids_bz1=$_REQUEST['ids_bz1'];
		$url=$_REQUEST['url'];
		$data["img"] = $img;
		$data["ty"] = $ty;
		$data["cntitle"] = $cntitle;
		$data["width"] = $width;
		$data["height"] = $height;
		$data["ids_bz1"] = $ids_bz1;
		$data["url"] = $url;
		if ($cntitle=="")
		{
			$json = array("status"=>'0',"message"=>"请填写广告名称");
			echo json_encode($json);
			exit();
		}
		if ((int)$vo['id']>0)
		{
			$m->where("id='$id'")->save($data);
			//$this->makejs($id);
			$json = array("status"=>'1',"message"=>"编辑成功","url"=>U('/?m=ad'));
			echo json_encode($json);
			exit();
		}
		else
		{
			$id = $m->add($data);
			//$this->makejs($id);
			$json = array("status"=>'1',"message"=>"添加成功","url"=>U('/?m=ad'));
			echo json_encode($json);
			exit();
		}
	}
	public function makejs($id)
	{
		$m=M('ad');
		$crs=$m->where(" id='$id'")->find();
		$aty=(int)($crs['ty']);
		$atitle=$crs['cntitle'];
		$aimg=$crs['img'];
		//$aimg=str_replace("/","\/",$aimg);
		$aflash=$crs['flash'];
		//$aflash=str_replace("/","\/",$aflash);
		$aurl=$crs['url'];
		//$aurl=str_replace("/","\/",$aurl);
		$awidth=$crs['width'];
		$wheight=$crs['height'];
		$aheight=$crs['height'];
		$A_alt=$crs['ids_bz1'];
		if ($aty==0){exit();}
		switch ($aty)
		{
		case 1:
		  if ($awidth==""){$Wtemp="";}else{$Wtemp=" width='".$awidth."'";}
		  if ($aheight==""){$Htemp="";}else{$Htemp=" height='".$aheight."'";}
		  if (trim($aurl)=="")
		  {$temp="<a title='".$A_alt."'><img src='".$aimg."'".$Wtemp.$Htemp." title='".$A_alt."' /></a>";}
		  else{$temp="<a href='".$aurl."' target='_blank' title='".$A_alt."'><img src='".$aimg."'".$Wtemp.$Htemp." title='".$A_alt."' /></a>";}
		  $temp="document.writeln(\"".$temp."\");";
		  break;
		case 2:
		  if ($awidth!=""){$temp="flash('".$aimg."',".$awidth.",".$aheight.")";}
		  break;
		}
		$roots=WIFIROOT;
		$tofile=$roots."/ad/".$id.".js";
		$tofile=str_replace('//','/',$tofile);
		$this->sad($temp,$tofile);	
	}
	public function sad($con,$file)
	{
		$fp = fopen($file,"w+");
		fwrite($fp,$con); 
		fclose($fp);
	}
	public function view()
	{
		$id=(int)$_GET['id'];
		$m=M('ad');
		$vo=$m->where(" id='$id'")->find();
		$this->vo=$vo;
		if ($vo['ty']==1)
		{
			$this->show('<p style="text-align:center; padding:100px 0 0 0;"><img src="'.$vo['img'].'" title="'.$vo['ids_bz1'].'" border="0" width="'.$vo['width'].'" height="'.$vo['height'].'" /></p>');
			exit();
		}
		$this->show('<p style="text-align:center; padding:100px 0 0 0;">
		<embed  width="'.$vo['width'].'" height="'.$vo['height'].'" type="application/x-shockwave-flash" wmode="transparent" menu="true" loop="true" play="true" src="'.$vo['img'].'"  pluginspage="http://www.macromedia.com/go/getflashplayer"></embed></p>');
	}
	
	public function doactx()
	{
		$lmoption =getlmoption(0);
		$this->lmoption=$lmoption;
		$action=$this->_post('action');
		$idstr=$this->_post('idstr');
		$idstr=$_REQUEST["idstr"];
		switch ($action)
		{
			case 'delall':
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
				$info=M('ad');
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" id='".$idarr[$i]."'")->delete();
				}
				exit("删除成功");	
				break;
		}
	}

}