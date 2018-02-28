<?php
/*字段值加1*/
function hitadd($id,$field='hit',$tb='info',$wzd='id')
{
	$mtb=M($tb);
	$old=$mtb->where("$wzd='$id'")->getField($field);
	$old++;
	$data["$field"]=$old;
	$mtb->where("$wzd='$id'")->save($data);
}

/*获取商户姓名*/
function stt($id)
{
	$sql="user_id='$id'";
	$name=M("user")->where($sql)->getField("truename");
	if ($name=='')
	{
		$name=M("user")->where($sql)->getField("nc");
	}
	if ($name=='')
	{
		$name=M("user")->where($sql)->getField("user_id");
		$name='love_'.((int)$name+198);
	}
	return $name;
}
/*获取产品被评论的星级*/
function g_xing($id)
{
	$cs=(int)M("comment")->where("pid='$id' and del='0'")->count();
	if ($cs==0){return 5;}
	$css=M("comment")->where("pid='$id' and del='0'")->sum("s1");
	$xj=$css/$cs;
	$xj=$xj*10;
	$xj=(int)$xj/10;
	return $xj;
}

/*自动获取城市id号*/
function g_ipc3($ip='')
{
	$ipInfos = GetIpLookup();
	//print_r($ipInfosz);
	$s1=$ipInfos['province'];
	$s2=$ipInfos['city'];
	if ($s1=='' || $s2==''){return 0;}
	$marr=M("region")->where("`name` like '$s1%' and name!=''")->select();
	foreach ($marr as $ky)
	{
		$pid=(int)M("region")->where("pid='".$ky['id']."' and name like '$s2%' and name!=''")->getField("id");
		if ($pid>0)
		{
			return $pid;	
		}
	}
	
	return 0;

}


/*获取会员最新发布的分享*/
function g_f1fx($id)
{
	$sql="uid='$id' and audit='1' and CONCAT(',', fidpath, ',') like '%,2,%'";
	return M("info")->where($sql)->order("id desc")->limit(1)->find();
}

/*根据生日获取星座*/
function g_xingzuo($birth)
{	
	$str = substr($birth,0,4);//截取年
	$month = substr($birth,5,2);//截取月
	$day = substr($birth,8,2);//截取日
	$year = date('Y',time());//转换年
	$age = $year - $str;
	$day   = intval($day);
	$month = intval($month);
	if ($month < 1 || $month > 12 || $day < 1 || $day > 31) return false;
	$signs = array(
			array('20'=>'宝瓶座'),
			array('19'=>'双鱼座'),
			array('21'=>'白羊座'),
			array('20'=>'金牛座'),
			array('21'=>'双子座'),
			array('22'=>'巨蟹座'),
			array('23'=>'狮子座'),
			array('23'=>'处女座'),
			array('23'=>'天秤座'),
			array('24'=>'天蝎座'),
			array('22'=>'射手座'),
			array('22'=>'摩羯座')
	);
	list($start, $name) = each($signs[$month-1]);
	if ($day < $start)
		list($start, $name) = each($signs[($month-2 < 0) ? 11 : $month-2]);
	return $name;	
}

/*获取学校名称*/
function g_school($id)
{
	$id=(int)$id;
	$temp=M("shool_info")->where("sh_id='$id'")->getField("sh_shool");
	return $temp;
}

/*记录会员查看记录*/
function w_user($id,$uid)
{
	$tb='view';
	$mtb=M($tb);
	$ip=GetIp();
	/*删除之前查看的相同会员信息*/
	$datax['del']=1;
	$mtb->where("uid='$uid' and vid='$id'")->save($datax);
	$data['vid']=$id;
	$data['ip']=$ip;
	$data['uid']=$uid;
	$data['time']=time();		
	$mtb->add($data);
}

/*通过生日计算年龄*/
function g_age($birth)
{
	list($by,$bm,$bd)=explode('-',$birth);
	$cm=date('n');
	$cd=date('j');
	$age=date('Y')-$by-1;
	if ($cm>$bm || $cm==$bm && $cd>$bd)
	{
		$age++;
	}	
	return (int)$age;
}

/*获取分享评论次数*/
function pl_count($id)
{
	return M("comment_s")->where("cid='$id' and audit='1' and del='0'")->count();
}

/*获取会员头像*/
function gu_pic($id)
{
	$pic=M("user")->where("user_id='$id'")->getField("photo");
	if ($pic==''){$pic='/images/tx.jpg';}
	return $pic;	
}
function guinfo($id,$str)
{
	return M("user")->where("user_id='$id'")->getField($str);
}


function tcount($id)
{
	$m=M('info');
	$fid=getsonid($id);
	$time1=date('Y-m-d').' 00:00:01';
	$time2=date('Y-m-d').' 23:59:59';
	return (int)$m->where("fid in (".$fid.") and audit='1' and addtime>='$time1' and addtime<='$time2'")->count();
}
function Gzt($ty)
{
	switch ($ty)
	{
		case 0:
			return '<span class="red">正在处理</span>';
			break;
		case 2:	
		case 3:		
		default:			
			return '<span class="lv">已处理</span>';
			break;
	}	
}
function grecord($str,$gt)
{
	$rid=M("record")->where("pid='$str'")->order("id desc")->find();
	switch ($gt)
	{
		case "addtime":
			return date('Y-m-d H:i:s',$rid[$gt]);
			break;	
	}	
	return $rid[$gt]; 
}
function gorder($str,$gt)
{
	$str=explode(' ',$str);
	$id=$str[1];
	return gtborder($id,$gt);
}

function gorder2($str,$gt)
{
	$str=explode(' ',$str);
	$id=$str[1];
	$bz2=gtborder($id,'bz2');
	$barray=unserialize($bz2);
	foreach($barray as $pro) 
	{ 
	return $pro[$gt];
	}
}
function gtborder($id,$str)
{
	return M("order")->where("orderid='$id'")->getField($str);
}
function gtbinfo($tb,$id,$str)
{
	switch ($tb)
	{
		case "user":
			return M($tb)->where("user_id='$id'")->getField($str);
			break;	
	}	
	return M($tb)->where("id='$id'")->getField($str);
}
function gaddr($str)
{
	$cs=explode(',',$str);
	$tb=M('region');
	foreach ($cs as $ky)
	{
		$addr.=$tb->where("id='$ky'")->getField("name")."-";
	}	
	return $addr;
}
function usetime(&$content,$key,$field)
{
	$s=$content[$field];
	if ((int)$s==0)
	{
		$content[$field]="";
	}
	else
	{
		$content[$field]=date('Y年m月d日',$s);
	}
}
function usetime2($s)
{
	if ((int)$s==0)
	{
		return "";
	}
	else
	{
		return date('Y年m月d日',$s);
	}
}
function checkuser()
{		
	$user_id =session('user_id');
	$user_pwd =session('user_pwd');
	$user_name =session('user_name');
	if($user_id!='')
	{
		$m=M('user');
		$u=$m->where("user_id='$user_id'")->find();
		$user_pwd2=$u['password'];
		$user_name2=$u['user_name'];
		if ((int)$u['state']==0)
		{
			exit('<script type="text/javascript">location.href="/login/?loginfalse3";</script>');
		}
	}
	else
	{
		session('user_id',null);
		session('user_pwd',null);
		session('user_name',null);
		exit('<script type="text/javascript">location.href="/login/?loginfalse";</script>');
		//redirect('/');
	}	
}


function LsidAdd($tims=21600)
{
	$lstb=M('cookuser');
	$lstbmax=$lstb->order('id desc')->getField('id');
	$lstbmax=(int)$lstbmax+1;
	if ($lstbmax>0)
	{
		$datax["id"] = $lstbmax;
		$rnd='wifiw2015rnd456'.$lstbmax;
		$datax["rnd"] = substr(md5($rnd),2,28);
		$datax["time"] = time();
		$lstb->add($datax);	
		cookie('user_lsid',substr(md5($rnd),2,28),$tims);
	}	
}
function siteseo($lm=0,$id=0)
{
	if ($lm>0)
	{
		$lmm=M('lm');
		$lmseo=$lmm->where("id=$lm")->select();
		$lmseo=$lmseo[0];
		$title=$lmseo['title'];
		$keywords=$lmseo['keywords'];
		$description=$lmseo['description'];
		$mtitle=$lmseo['cntitle'];	
	}
	if ($id>0)
	{
		$info=M('info');	
		$info=$info->where("id=$id")->select();
		$info=$info[0];
		$title=$info['title'];
		$keywords=$info['keywords'];
		$description=$info['description'];
		$mtitle=$info['cntitle'];	
	}
	$config=getconfig();
	if ($lm==0 && $id==0)
	{
		$seo[0]=$config['cfg_webname'];
		$seo[1]=$config['cfg_keywords'];
		$seo[2]=$config['cfg_description'];
	}
	else
	{
		if ($title==''){$seo[0]=$mtitle."_".$config['cfg_webname'];}else{$seo[0]=$title;}
		if ($keywords==''){$seo[1]=$mtitle."_".$config['cfg_keywords'];}else{$seo[1]=$keywords;}
		if ($description==''){$seo[2]=$mtitle."_".$config['cfg_description'];}else{$seo[2]=$description;}
	}
	return $seo;
}

function htmlname($id)
{
	return "/?lm=$id";
}
function idlname($id)
{
	return "/?id=$id";
}
function lmlist($fid,$limit='12',$order='sort asc,id asc'){
	$m=M('lm');
	$newlist=$m->where("fid='$fid.'")->order($order)->limit($limit)->select();
	return $newlist;	
}
function arclist($fid,$limit='12',$order='sort asc,id desc',$uid=0){
	$m=M('info');
	$fid=getsonid($fid);
	if ($uid==0)
	{
		$newlist=$m->where("fid in (".$fid.") and audit='1'")->order($order)->limit($limit)->select();
	}
	else
	{
		$newlist=$m->where("fid in (".$fid.") and uid='$uid' and audit='1'")->order($order)->limit($limit)->select();	
	}
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

/*获取缓存config*/
function getconfig($ty=0){
	if(empty($config) || $ty==0){
		$m=M('config');
		$cm=$m->select();
		$config=array();
		foreach($cm as $vo){
			$config[$vo['varname']]=$vo['value'];
		}
		S('config',$config);
	}
	return $config;
}

/*返回id及子栏目*/
function getsonid($fid=0,$sty=0){
	if(empty($str) || $sty==1 || $sty==0){
		$m=M('lm');
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
	if(empty($lm) || $ty==1 || $ty==0){
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
	if(empty($str) || $sty==1 || $sty==0){
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
function isMobilex($num) {
	if (!$num) {return false;}
	return preg_match('#^13[\d]{9}$|14^[0-9]\d{8}|^15[0-9]\d{8}$|^18[0-9]\d{8}$#', $num) ? true : false;
}
?>