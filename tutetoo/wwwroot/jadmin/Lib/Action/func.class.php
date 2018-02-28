<?php
function newNum()
{
	$times=time()-60*3600*24;
	$newnum=M("order")->where("addtime>'$times' and del='0' and view='0' and (zt<'999') and del='0' and (paytime>'0' or uid>0)")->count();
return $newnum;	
}
function checkqx($ty,$f='0')
{
	$adminid =session('admin_id');
	$m=M('admin');
	$vo=$m->where("username='$adminid' and `Lock`='0'")->find();
	if (!$vo)
	{
		exit('error00');
	}
	$lm=M('lm');
	$f1=','.$vo['flag1'].',';
	$f2=','.$vo['flag2'].',';
	switch ($ty)
	{
		case 3://检查是否是总管理员
			if 	((int)$vo['id']>1 || (int)$vo['Grade']!=9){exit('error001');}
			break;	
		case 2://检测其它权限
			if 	((int)$vo['id']=1){return false;}
			switch ($f)
			{
				case "a":
					if ($f2==str_replace('a','',$f2)){exit('error002');}
					break;
				case "b":
					if ($f2==str_replace('b','',$f2)){exit('error003');}
					break;
				case "c":
					if ($f2==str_replace('c','',$f2)){exit('error004');}
					break;	
				case "d":
					if ($f2==str_replace('d','',$f2)){exit('error005');}
					break;
				case "e":
					if ($f2==str_replace('e','',$f2)){exit('error006');}
					break;
				case "f":
					if ($f2==str_replace('f','',$f2)){exit('error007');}
					break;
				case "g":
					if ($f2==str_replace('f','',$f2)){exit('error008');}
					break;	
				case "m":
					if ($f2==str_replace('m','',$f2)){exit('error014');}
					break;	
				case "h":
					if ($f2==str_replace('h','',$f2)){exit('error009');}
					break;
				case "i":
					if ($f2==str_replace('i','',$f2)){exit('error010');}
					break;
				case "j":
					if ($f2==str_replace('j','',$f2)){exit('error011');}
					break;
				case "k":
					if ($f2==str_replace('k','',$f2)){exit('error012');}
					break;
				case "l":
					if ($f2==str_replace('l','',$f2)){exit('error013');}
					break;		
			}
			break;
		case 1:
			if 	((int)$vo['id']=1){return false;}
			$vox=$lm->where(" fid='0' and id='$f' and id in(".$vo['flag1'].")")->find();
			if (!$vox){exit('error009');}
			break;	
	}
		
}
function adminqx($f,$ty)
{
	$f2=','.$f.',';
	switch ($ty)
	{
		case 1:
			$lm=M('lm');
			if ($f==''){return '';}
			$lmlist=$lm->where("fid='0' and id in($f)")->order('sort asc,id asc')->select();
			foreach($lmlist as $k=>$vo)
			{	
				$qx.=' '.$vo['cntitle'];	
			}
			break;
		case 2:
			if ($f2!=str_replace('a','',$f2)){$qx.=' 网站栏目管理';}
			if ($f2!=str_replace('k','',$f2)){$qx.=' 账单评价管理';}
			if ($f2!=str_replace('l','',$f2)){$qx.=' 网站浏览管理';}
			
			break;		
	}
	return $qx;
}

function Jadd($table,$data) {
    return M($table)->add($data);
}
function Jadd2($table)
{
	$add = M($table);
	$add->create();
	return $add->add();
}
function mflag($id)
{
	$m=M('info');
	$arc=$m->where("id=".$id)->find();
	$flag=$arc['flag'];
	$temp='0';
	if ($arc['settop']==1){$temp.=',置顶';}
	if ($arc['vouch']==1){$temp.=',推荐';}
	if ($arc['audit']!=1){$temp.=',未审核';}
	if ($flag!=''){
		$m=M('flag');
		$lmlist=$m->where("1=1")->order('id asc')->select();
		$str='';
		foreach($lmlist as $k=>$vo){		
			if (strpos($flag,$vo['att'])>-1)
			{		
				$temp.=",".$vo['attname']."";
			}
		}
	}
	$temp=str_replace('0,','',$temp);
	$temp=str_replace('0','',$temp);
	if ($temp!=''){
		return '<span class="red">['.$temp.']</span>';
	}
}
function issimg($id)
{
	$m=M('info');
	$arc=$m->where("id=".$id)->find();
	if ($arc['img']!=''){return '<span pic="'.$arc['img'].'" style="color:#f00">[图]</span>';}
	if ($arc['simg']!=''){return '<span pic="'.$arc['img'].'" style="color:#f00">[图]</span>';}
}
function selectpg($pgsize=10)
{
	return "　每页显示<select id='pgsize' onchange='selpgsize()'>
<option value='5'>5</option>
<option value='10'>10</option>
<option value='15'>15</option>
<option value='20'>20</option>
<option value='40'>40</option>
<option value='60'>60</option>
<option value='80'>80</option>
<option value='100'>100</option>
<option value='200'>200</option>
</select>条
<script type='text/javascript'>$('#pgsize').val('$pgsize');</script>";
}
function getcoloroption($x)
{
	$m=M('color');
	$lmlist=$m->where("1=1")->order('id asc')->select();
	$str='';
	foreach($lmlist as $k=>$vo){
	$selstr=($vo['color']==$x)?" selected='selected'":"";
	$str.="<option value='{$vo['color']}' {$selstr} style='background:{$vo['color']};'>{$vo['color']}</option>";
	}
	return $str;	
}
function getlmoption($nid=0,$id=0,$x=''){
	$adminid =session('admin_id');
	$m=M('admin');
	$admin=$m->where("username='$adminid'")->find();		
	$m=M('lm');
	if ($admin['Grade']!=9 && $id==0)
	{
		$lmlist=$m->where("fid=".$id." and id<'5'")->order('sort asc')->select();
	}
	else
	{
		$lmlist=$m->where("fid=".$id)->order('sort asc')->select();
	}	
	$str='';
	if(is_array($lmlist)){
	
		$x2=($id==0)?"":"└";
		foreach($lmlist as $k=>$vo){
		
			$selstr=($vo['id']==$nid)?" selected='selected'":"";
			
			$str.="<option value='{$vo['id']}' {$selstr}>{$x}{$x2}{$vo['cntitle']}</option>
			".getlmoption($nid,$vo['id'],$x.'　');

		}
		
	}
	return $str;
}

function Goption($nid=0,$id=0,$tb='lm',$x=''){
	$adminid =session('admin_id');
	$m=M('admin');
	$admin=$m->where("username='$adminid'")->find();		
	$m=M($tb);
	if ($admin['Grade']!=9 && $id==0)
	{
		$lmlist=$m->where("fid=".$id." and id<'5'")->order('sort asc')->select();
	}
	else
	{
		$lmlist=$m->where("fid=".$id)->order('sort asc')->select();
	}	
	$str='';
	if(is_array($lmlist)){
	
		$x2=($id==0)?"":"└";
		foreach($lmlist as $k=>$vo){		
			$selstr=($vo['id']==$nid)?" selected='selected'":"";			
			$str.="<option value='{$vo['id']}' {$selstr}>{$x}{$x2}{$vo['cntitle']}</option>
			".Goption($nid,$vo['id'],$x.'　');
		}		
	}
	return $str;
}

function getflagoption($x='',$j=0){

	$m=M('flag');
	$lmlist=$m->where("1=1")->order('id asc')->select();
	$str='';
	foreach($lmlist as $k=>$vo){		
			$selstr=(strpos($x,$vo['att'])>-1)?" checked='checked'":"";		
			if ($j==1)
			{
			$vo['attname']=msubstr($vo['attname'],0,1,'utf-8',false);	
			}	
			$str.="<input name='Xflag' type='checkbox' value='{$vo['att']}' {$selstr}>{$vo['attname']}[{$vo['att']}]</option>";
		}
	return $str;
}
function getflagoption2($x=''){

	$m=M('flag');
	$lmlist=$m->where("1=1")->order('id asc')->select();
	$str='';
	foreach($lmlist as $k=>$vo){		
			$selstr=(strpos($x,$vo['att'])>-1)?" checked='checked'":"";			
			$str.="<input name='flag[]' type='checkbox' value='{$vo['att']}' {$selstr}>{$vo['attname']}[{$vo['att']}]</option>";
		}
	return $str;
}

function checkadmin()
{		
	$adminid =session('admin_id');
	$pwd =session('admin_pwd');
	$mpwd =session('admin_cookie');
	if($adminid!='' && $pwd!='' && $mpwd!=''){
		$m=M('admin');
		$u=$m->where("username='$adminid' and del='0'")->find();
		$cookie=$u['cookie'];
		$password=$u['password'];
		if ($cookie!=$mpwd)
		{
			redirect('?m=login&e=1');
		}
		if ($password!=$pwd)
		{
			redirect('?m=login&e=2');
		}
		if ($Lock!=0)
		{
			redirect('?m=login&e=3');
		}


		
	}else{
		redirect('?m=login');
		  
	}	
}

function qmadmin()
{
  $adminid =session('admin_id');
  $m=M('admin');
  $admin=$m->where("username='$adminid' and Grade='9'")->find();
  if (!$admin)
  {
	  exit('qm_10086');	
  }		
}
function arclist($fid,$limit='12',$order='sort asc,id desc'){
	$m=M('info');
	$fid=getsonid($fid);
	$newlist=$m->where("fid in (".$fid.") and audit='1'")->order($order)->limit($limit)->select();
	return $newlist;	
}
function getlmlist($id=0,$x='　'){
$m=M('lm');
$lmlist=$m->where(" fid=".$id)->order('sort asc')->select();
$rt='';
if(is_array($lmlist)){
	
	$x2=($id==0)?"":"└";
	foreach($lmlist as $k=>$vo){	
		$rt[]=array_merge($vo,array('x'=>$x,'x2'=>$x2));		
		$rt1=getlmlist($vo['id'],$x.'　');
		if(!empty($rt1)&&is_array($rt1)){
			foreach($rt1 as $k1=>$v1){
				$rt[]=$v1;
			}
		}
	}
}
return $rt;
}
/*上一篇 下一篇*/
function sxpage($m,$arc,$ty)
{
	$id=$arc['id'];$tsort=$arc['sort'];
	$where='fid in ('.$arc['fid'].') and id!='.$id.' and audit=1 ';
	if ($ty==1)
	{
	$new=$m->where($where.'and sort<='.$tsort.'')->order('sort desc,id desc')->find();
	$new2=$m->where($where.'and id>'.$id.'')->order('id asc')->find();	
	}
	else
	{		
	$new=$m->where($where.'and sort>='.$tsort.'')->order('sort asc,id asc')->find();
	$new2=$m->where($where.'and id<'.$id.'')->order('id desc')->find();
	}
	//echo $m->getlastsql();//获取sql语句
	if ((int)$new['id']>0)
	{
		if ($new['sort']==$tsort){return $new2;}return $new;
	}
}
	
function cn_substr($str,$len,$from=0){
	return preg_replace('#^(?:[\x00-\x7F]|[\xC0-\xFF][\x80-\xBF]+){0,'.$from.'}'.
     '((?:[\x00-\x7F]|[\xC0-\xFF][\x80-\xBF]+){0,'.$len.'}).*#s',
     '$1',$str);
}

function Html2Text($str){
	$str=strip_tags($str);
	$str=str_replace(' ','',$str);
	$str=str_replace('&nbsp;','',$str);
	$str=str_replace('　','',$str);
	return $str;
}



function rtdate($val){
	return date("Y-m-d",$val);
}

function getdate1(&$content,$key,$field){
	$content[$field] = rtdate($content[$field]);
}


function rttime($field){
	return date("Y-m-d H:i:s",$field);
}

function gettime1(&$content,$key,$field){
	$content[$field] = rttime($content[$field]);
}




/*图片地址验证*/

function noimgx(&$arr,$key,$field='img'){
	
	noximg($arr,$field);
}
function noimgd(&$arr,$key,$field='img'){
	
	nodimg($arr,$field);
}

function nodimg(&$arr,$field='img'){
	
	if(empty($arr[$field])){
		$arr[$field]=c('UPLOAD_PATH').'blank.gif';
	}else{
	
		$filepath=c('UPLOAD_PATH').$arr['mid'];
		
		$filename=$arr[$field];
		if(file_exists('.'.$filename)){
			$arr[$field]=$filename;
		}else{
			$filename=$filepath.'/'.$arr[$field];
			if(file_exists('.'.$filename)){
				$arr[$field]=$filename;
			}else{
				$filename=$filepath.'/m_'.$arr[$field];
				if(file_exists('.'.$filename)){
					$arr[$field]=$filename;
				}else{
					$filename=$filepath.'/s_'.$arr[$field];
					if(file_exists('.'.$filename)){
						$arr[$field]=$filename;
					}else{
						$arr[$field]=c('UPLOAD_PATH').'blank.gif';
					}
				}
			}
		}
	}
}

function noximg(&$arr,$field='img'){
	
	if(empty($arr[$field])){
		$arr[$field]=c('UPLOAD_PATH').'blank.gif';
	}else{
	
	$filepath=c('UPLOAD_PATH').$arr['mid'];
	
		$filename=$filepath.'/s_'.$arr[$field];
		if(file_exists('.'.$filename)){
			$arr[$field]=$filename;
		}else{
			$filename=$filepath.'/m_'.$arr[$field];
			if(file_exists('.'.$filename)){
				$arr[$field]=$filename;
			}else{
				$filename=$filepath.'/'.$arr[$field];
				if(file_exists('.'.$filename)){
					$arr[$field]=$filename;
				}else{
					$arr[$field]=c('UPLOAD_PATH').'blank.gif';
				}
			}
		}

	}
	
}

function delimg($mid,$img){
	
	/*if(file_exists('.'.$img)){
		unlink('.'.$img);
	}*/
	
	$filename='.'.c('UPLOAD_PATH').$mid;
	
	if(file_exists($filename.'/'.$img)){
		unlink($filename.'/'.$img);
	}
	if(file_exists($filename.'/m_' . $img)){
		unlink($filename.'/m_' . $img);
	}
	if(file_exists($filename.'/s_' . $img)){
		unlink($filename.'/s_' . $img);
	}
}


function nologo(&$arr,$key){
	if(empty($arr['logo'])){
		$arr['logo']=c('UPLOAD_PATH').'blank.gif';
	}else{
		$filename=c('UPLOAD_PATH').'logo/m_'.$arr['logo'];
		if(file_exists('.'.$filename)){
			$arr['logo']=$filename;
		}else{
			$arr['logo']=c('UPLOAD_PATH').'blank.gif';
		}
	}
}


function uploadImage($width='1000,400',$height='1000,300',$admin='images',$delold=false,$Pfix='m_,s_',$exts= 'jpg,gif,png,jpeg,swf'){
	import("cms.ORG.UploadFile");
	$upload = new UploadFile();
	$upload->maxSize = 3292200;
	$upload->allowExts = explode(',',$exts);
	$upload->savePath =  '.'.c('UPLOAD_PATH').$admin.'/';
	$upload->thumb = true;
	$upload->imageClassPath = 'cms.ORG.Image';
	$upload->thumbPrefix = $Pfix;
	$upload->thumbMaxWidth = $width;
	$upload->thumbMaxHeight = $height;
	$upload->saveRule = uniqid;
	$upload->thumbRemoveOrigin = $delold;
	if(! $upload->upload()){

		return null; //exit($upload->getErrorMsg());
	}else{

		$uploadList = $upload->getUploadFileInfo();

            //Image::water($uploadList[0]['savepath'].'m_'.$uploadList[0]['savename'], '../Public/Images/logo2.png');
		return $uploadList[0]['savename'];
	}
}



/*查询id col 的值*/


function sellm($id,$col='cntitle'){
	$m=getlm($id);
	return $m[$col];
}


function getPage($id,$filed='content'){
	if($id>0){
		$m=M('page');
		$arc=$m->find($id);
		return $arc[$filed];
	}
}

/*获取缓存config*/
function getconfig($ty=0){

	//$config=S('config');
	if(empty($config) || $ty==0){
		$m=M('config');
		$cm=$m->select();
		$config=array();
		foreach($cm as $vo){
			$config[$vo['varname']]=$vo['value'];
		}
		//S('config',$config);
	}
	return $config;
}

/*获取缓存链接*/
function getflink($ty=0){
	$flink=S('flink');
	if(empty($flink)||$ty==1){
		$m=M('flink');
		$flink=$m->order('sort asc')->select();
		S('flink',$flink);
	}
	return $flink;
}





/*更新栏目缓存*/

function lmupdates($lm){
	$vo=$lm->select();
	foreach($vo as $v){
		getlm($v['id'],1);
		getsonid($v['id'],1);
		gettopid($v['id'],1);
	}
}

/*返回id及子栏目*/
function getsonid($fid=0,$sty=0){
	$adminid =session('admin_id');
	$m=M('admin');
	$admin=$m->where("username='$adminid'")->find();		
	if(empty($str)||$sty==1){
		$m=M('lm');
		$v=array($fid);
		if ($admin['Grade']!=9 && $fid==0)
		{
			$ar=$m->where("fid=".$fid." and id<'5'")->order('sort asc')->select();
		}
		else
		{
			$ar=$m->where("fid=".$fid)->order('sort asc')->select();
		}	
		if(is_array($ar)){
			foreach($ar as $vo){
				$x=_getsonid($m,$vo['id']);
				if(!empty($x)){
					$v[]=$x;
				}else{
					$v[]=$vo['id'];
				}
			}
		}
		$str=join(',',$v);
		S('sonid_'.$fid,$str);
	}
	return $str;
}
function _getsonid($m,$fid=0){

		$v=array($fid);
		$ar=$m->where("fid=".$fid)->order('sort asc')->select();
		if(is_array($ar)){
			foreach($ar as $vo){
				$x=_getsonid($m,$vo['id']);
				if(!empty($x)){
					$v[]=$x;
				}else{
					$v[]=$vo['id'];
				}
			}
		}
	return join(',',$v);
}

/*返回栏目id行*/
function getlm($id=0,$ty=0){

	//$lm=S('lmtable');
	if(empty($lm)||$ty==1){

		$m=M('lm');
		$cm=$m->select();
		$lm=array();
		foreach($cm as $vo){
			$lm[$vo['id']]=$vo;
		}
		S('lmtable',$lm);
	}
	if($id==0){
	return $lm;
	}else{
	return $lm[$id];
	}
}

/*返回顶级id*/
function gettopid($id=0,$sty=0){

	$str=S('topid_'.$id);
	if(empty($str)||$sty==1){
		$m=M('lm');
		$ar=$m->find($id);
		if(is_array($ar)){
			if($ar['fid']==0){
				$str=$id;
			}else{
				$str=_gettopid($m,$ar['fid']);
			}
		}
		S('topid_'.$id,$str);
	}
	return $str;

}
function _gettopid($m,$id=0){
	$str='';
	$ar=$m->find($id);
	if(is_array($ar)){
		if($ar['fid']==0){
			$str=$id;
		}else{
			$str=_gettopid($m,$ar['fid']);
		}			
	}
	return $str;
}



/*闭合html标签*/
function closetags($html) {
    preg_match_all('#<([a-z]+)(?: .*)?(?<![/|/ ])>#iU',$html,$result);
	
	$openedtags = $result[1];
	preg_match_all('#</([a-z]+)>#iU',$html,$result);
	$closedtags = $result[1];
	$len_opened = count($openedtags);
	if (count($closedtags) == $len_opened) {    return $html;  }
	$openedtags = array_reverse($openedtags);
	for ($i=0; $i < $len_opened; $i++) {
		if (!in_array($openedtags[$i], $closedtags)){
			$html .= '</'.$openedtags[$i].'>';
			
		} else {
		unset($closedtags[array_search($openedtags[$i], $closedtags)]);
		}
	}
  return $html;
}


function content_page($content='',$maxpage=1000){//内容分页 按照html标签
	if($content=='') return $content;
	$html = array('div','p','ul','table','dl');
	$ar_content = explode('<', $content);
	$data = array();
	$i = $show_time = 0;
	$tag='';
	if(is_array($ar_content)){
		foreach($ar_content as $y => $c){
			if($y == 0){
				$data[$i] = $c;
 				if(strlen(strip_tags($c))>=$maxpage){
					$i++;
				}
				continue;
			}
			$data[$i] .= '<'.$c;
			if($tag=='' && $show_time==0)
			{
				foreach($html as $h)
				{
					if(strpos($c, $h)===0){
						$tag = $h;
						$show_time++;
						break;
					}
				}
			}
			elseif($show_time && $tag){
				if(strpos($c, $tag)===0){
					$show_time++;
				}
				if(strpos($c, '/'.$tag)===0){
					$show_time--;
					if($show_time==0) $tag = '';
				}
			}
			if(strlen(strip_tags($data[$i]))>=$maxpage && $show_time==0){
				$i++;
			}
		}
	}
	return $data;
}

function cbody($body){
	$rt=contentpage($body,300);
	return $rt[0];
}
?>