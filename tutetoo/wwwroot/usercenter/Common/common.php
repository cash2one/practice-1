<?php
function adf($id,$str)
{
  $m=M('ad');$m=$m->where("id='$id'")->find();return $m[$str];
}
function adfs($id)
{
  $m=M('ad');return $m->where("id='$id'")->find();
}
function substr_CN($str,$mylen){
    $len=strlen($str);
    $content='';
    $count=0;
    for($i=0;$i<$len;$i++){
        if(ord(substr($str,$i,1))>127){
            $content.=substr($str,$i,2);
            $i++;
        }else{
            $content.=substr($str,$i,1);
        }
        if(++$count==$mylen){
            break;
        }
    }
    return $content;
}

function SendMail($sendemail,$title,$content)
{
	import("@.ORG.Mail");
	$cfg_smtp_server="ssl://smtp.gmail.com";
	$cfg_smtp_usermail="###@gmail.com";
	$cfg_smtp_password="460";
	$cfg_smtp_port="465";	
	$cfg_smtp_server="smtp.163.com";
	$cfg_smtp_usermail="candy_domail@163.com";
	$cfg_smtp_password="5969754";
	$cfg_smtp_port="25";	
	$cfg_soft_lang="utf-8";
	$headers = "From: ".$cfg_smtp_usermail."\r\nReply-To: ".$cfg_smtp_usermail;
	$mailtype = 'HTML';
	$smtp = new Mail($cfg_smtp_server,$cfg_smtp_port,true,$cfg_smtp_usermail,$cfg_smtp_password);
	$smtp->debug = false;
	$smtp->sendmail($sendemail,$cfg_smtp_usermail,$title,$content,$mailtype);
}

function extend_3($file_name)    
{    
	$extend =explode("." , $file_name);    
	$va=count($extend)-1;    
	return ".".$extend[$va];    
} 

function cntitle($id)
{
	$lm=M('lm')->where("id='".$id."'")->find();
	return $lm['cntitle'];
}
function mktimes($str,$val){
	return date($str,strtotime($val));
}
function injCheck($sql_str)
{
	$rstr='/select|insert|update|delete|\'|\/\*|\*|\.\.\/|\.\/|union|into|load_file|outfile/';  
    $check = preg_match($rstr, $sql_str); 
    if ($check)
	{ 
		echo '非法字符！！'; exit; 
    } 
	else
	{ 
        return $sql_str; 
    } 
} 
/*验证码*/
function getcode()
{
import("@.ORG.Image");
Image::buildImageVerify();
}
//删除2维数组 返回删除后的数组 $s 查找元素在数组的位置
function del_arr2($array,$str,$s)
{
	$len = count($array);
	for( $i=0;$i<$len; $i++)
	{
		if($array[$i][$s]==$str)
		{
			unset($array[$i]);
		}
	}
	return 	$array;	
}
function array_remove(&$arr,$offset){
    array_splice($arr,$offset,1);
}
//查找2维数组元素 返回元素的位置1维位置  -1表示未查询到
function search_arr2($array,$str,$s)
{
	if (!$array){return -1;}
	$f=-1;
	$len = count($array);
	for( $i=0;$i<$len; $i++)
	{
		if($array[$i][$s]==$str)
		{
			return $i;
		}
	}
	return 	$f;	
}

//删除数组 返回删除后的数组
function del_arr($array,$str)
{
	$len = count($array);
	for( $i=0;$i<$len; $i++)
	{
		if($array[$i]==$str)
		{
			unset($array[$i]);
		}
	}
	return 	$array;	
}

//查找元素 返回元素的位置 -1表示未查询到
function search_arr($array,$str)
{
	$f=-1;
	$len = count($array);
	for( $i=0;$i<$len; $i++)
	{
		if($array[$i]==$str)
		{
			return $i;
		}
	}
	return 	$f;	
}
//获取所有子分类
function get_sons($fb_ids)
{
	//$fb_ids='1,2,3,5,6,8,9,17';
	$f_child_array=explode(",",$fb_ids);
	foreach ($f_child_array as $fb_id)
	{
		$ids[]             = $fb_id;
		$frame_child_array = get_son($fb_id);
		if ($frame_child_array) {
			foreach ($frame_child_array as $frame_child) {
				$ids = array_merge($ids,get_sons($frame_child));
			}
		}
	}
	return $ids;
}	
	
function get_son($type){
	$array  = array();	
	$m=M("lm");
	$ms=$m->where("fid ='$type'")->select();
	foreach($ms as $ky){
		$array[]=$ky[0];
	}
	return rep_array($array);
}				

//获取上级树
function get_fpath($type){
	$array  = array();	
	$array[]=$type;
	$m=M("lm");
	$ms=$m->where("id ='$type'")->find();
	$fid=(int)$ms['fid'];
	if($fid>0){
		$array[]=$fid;
		$array = array_merge($array,get_fpath($fid)); //合并数组
	}
	return rep_array($array);
}

//数组去除重复
function rep_array($array)
{
   $out = array();
   foreach ($array as $key=>$value) {
   if (!in_array($value, $out))
	{
		   $out[$key] = $value;
	   }
   }
   return $out;
} 

//删除目录下的文件：
function del_onedir($dir)
{
	$dh=opendir($dir);
	while ($file=readdir($dh))
	{
		if($file!="." && $file!="..")
		{
			$fullpath=$dir."/".$file;
			if(!is_dir($fullpath))
			{
			  unlink($fullpath);
			}
			else
			{
			  deldir($fullpath);
			}
		}
	}
  closedir($dh);
}
function inid($sql)
{
	$rs=mysql_query($sql);
	$temp="0";
	while ($Trs=mysql_fetch_array($rs))
	{
		$temp=$temp.",".$Trs[0];	
	}
	return $temp;
}
//获取数组0
function array0($str)
{
	$sarr=explode("@",$str);
	return $sarr[0];
}
function ary($str,$id)
{
	$sarr=explode("-",$str);
	for ($i=0;$i<count($sarr);$i++)
	{
		if ($i==$id){return $sarr[$i];}
	}
}
function aryx($str,$id)
{
	$sarr=explode(",",$str);
	for ($i=0;$i<count($sarr);$i++)
	{
		if ($i==$id){return $sarr[$i];}
	}
	return 0;
}
function ary3($str,$id)
{
	$sarr=explode("?page=",$str);
	for ($i=0;$i<count($sarr);$i++)
	{
		if ($i==$id){return $sarr[$i];}
	}
}
//获得当前的脚本网址 
function GetCurUrl() 
{ 
if(!empty($_SERVER["REQUEST_URI"])) 
{ 
$scriptName = $_SERVER["REQUEST_URI"]; 
$nowurl = $scriptName; 
} 
else 
{ 
$scriptName = $_SERVER["PHP_SELF"]; 
if(empty($_SERVER["QUERY_STRING"])) 
{ 
$nowurl = $scriptName; 
} 
else 
{ 
$nowurl = $scriptName."?".$_SERVER["QUERY_STRING"]; 
} 
} 
return $nowurl; 
} 
function sget($str)
{
$str = preg_replace( "@<script(.*?)</script>@is", "", $str ); 
$str = preg_replace( "@<iframe(.*?)</iframe>@is", "", $str ); 
$str = preg_replace( "@<style(.*?)</style>@is", "", $str ); 
$str = preg_replace( "@<(.*?)>@is", "", $str ); 
return $str;
}
/* 将URL中的某参数设为某值*/
function url_set_value($url,$key,$value) 
{ 
$a=explode('?',$url); 
$url_f=$a[0]; 
$query=$a[1]; 
parse_str($query,$arr); 
$arr[$key]=$value; 
return query;
//return $url_f.'?'.http_build_query($arr); 
} 
function byte_format2($input, $dec=0) 
{ 
$prefix_arr = array(',', ',', ',', ',', ',', ','); 
$value = round($input, $dec); 
$i=0; 
while ($value>1000) 
{ 
$value /= 1000; 
$i++; 
} 
$return_str = round($value, $dec).$prefix_arr[$i]; 
return $return_str; 
} 

function byte_format($input, $dec=0) 
{ 
$prefix_arr = array('', '', '', '', ''); 
$value = round($input, $dec); 
$i=0; 
while ($value>1000) 
{ 
$value /= 1000; 
$i++; 
} 
$return_str = round($value, $dec).$prefix_arr[$i]; 
return $return_str; 
} 


//产生随机字符串函数
function random($length)
{
	$hash = '';
	$chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
	$max = strlen($chars) - 1;
	mt_srand((double)microtime() * 1000000);
	for($i = 0; $i < $length; $i++) 
	{
		$hash .= $chars[mt_rand(0, $max)];
	}
	return $hash;
}
function random2($length)
{
	$hash = '';
	$chars = 'abcdefghijklmnopqrstuvwxyz123456789';
	$max = strlen($chars) - 1;
	mt_srand((double)microtime() * 1000000);
	for($i = 0; $i < $length; $i++) 
	{
		$hash .= $chars[mt_rand(0, $max)];
	}
	return $hash;
}

function GetDateTimeMk($mktime)
{
   return date('Y-m-d',strtotime($mktime));
}

function leng($str,$length)
{
	//$length=38;
	$encoding='utf8';
	$length2=$length+2;
	if(mb_substr(ClearHtml2($str),0,($length2),$encoding)!=ClearHtml2($str))
	{
		$title=mb_substr(ClearHtml2($str),0,$length,$encoding).'..';
	}
	else
	{
		$title=ClearHtml2($str);
	}
	return $title;
}

function gcontent2($strInfo, $nLenSet){
    $m_bDeflated = false;
    for($ii = 0; $ii<strlen($strInfo); $ii++) {
        $m_strChar = substr($strInfo, $ii, 1);
        $m_iCode=ord($m_strChar);
        if($m_iCode>=160){
            $ii++;
            $m_strChar=$m_strChar.substr($strInfo, $ii, 1);
        }
        if ($m_iCode<160) {
            $m_nLen = $m_nLen + 1;
        } else {
            $m_nLen = $m_nLen + 1;
        }
        if ( $m_nLen <= $nLenSet ) {
            if ( $m_nLen <= $nLenSet - 3 ) {
                $m_strResult = $m_strResult.$m_strChar;
            }
        } else {
            $m_bDeflated = true;
            break;
        }
    }
    if( $m_bDeflated ) {
        $m_strResult = "{$m_strResult}...";
    } else {
        $m_strResult = $strInfo;
    }
    return $m_strResult;
}
function ClearHtml2($str){return Gtext($str);}
function Gtext($str) {
	$str = preg_replace("/<a[^>]*>/i", "", $str);
	$str = preg_replace("/<\/a>/i", "", $str);
	$str = preg_replace("/<div[^>]*>/i", "", $str);
	$str = preg_replace("/<\/div>/i", "", $str);
	$str = preg_replace("/<!--[^>]*-->/i", "", $str);//注释内容
	$str = preg_replace("/style=.+?['|\"]/i",'',$str);//去除样式
	$str = preg_replace("/class=.+?['|\"]/i",'',$str);//去除样式
	$str = preg_replace("/id=.+?['|\"]/i",'',$str);//去除样式
	$str = preg_replace("/lang=.+?['|\"]/i",'',$str);//去除样式
	$str = preg_replace("/width=.+?['|\"]/i",'',$str);//去除样式
	$str = preg_replace("/height=.+?['|\"]/i",'',$str);//去除样式
	$str = preg_replace("/border=.+?['|\"]/i",'',$str);//去除样式
	$str = preg_replace("/face=.+?['|\"]/i",'',$str);//去除样式
	$str = preg_replace("/face=.+?['|\"]/",'',$str);//去除样式 只允许小写 正则匹配没有带 i 参数
	$str = trim($str); 
	return strip_tags($str);
} 


function format_date($STRING1)//把2007-01-09转换为类似于2007年1月9日
{
    $STRING1 = str_replace( "-0", "-", $STRING1 );
    $STR = strtok( $STRING1, "-" );
    $STRING2 = $STR."-";
    $STR = strtok( "-" );
    $STRING2 .= $STR."-";
    $STR = strtok( " " );
    $STRING2 .= $STR."";
    return $STRING2;
}

function shows($sql)
{
	$rs=mysql_query($sql);
	$Trs=mysql_fetch_array($rs);
	if ($Trs)
	{
		return $Trs[0];
	}
}
function show($sql)
{
	$rs=mysql_query($sql);
	$Trs=mysql_fetch_array($rs);
	return $Trs;
}

function escape($str)   
{     
      preg_match_all("/[\x80-\xff].|[\x01-\x7f]+/",$str,$r);     
      $ar   =   $r[0];     
      foreach($ar   as   $k=>$v){     
          if(ord($v[0])   <   128)     
              $ar[$k]   =   rawurlencode($v);     
          else     
              $ar[$k]   =   "%u".bin2hex(iconv("GBK","UCS-2",$v));   
      }     
      return   join("",$ar);     
 }     
      
function unescape($str)
{
    $ret = '';
    $len = strlen($str);
    for ($i=0;$i<$len; $i++)
    {
        if ($str[$i] == '%' && $str[$i+1] == 'u')
        {
            $val = hexdec(substr($str, $i+2, 4));
            if ($val < 0x7f) $ret .= chr($val);
            else if($val < 0x800) $ret .= chr(0xc0|($val>>6)).chr(0x80|($val&0x3f));
            else $ret .= chr(0xe0|($val>>12)).chr(0x80|(($val>>6)&0x3f)).chr(0x80|($val&0x3f));
            $i += 5;
        }else if ($str[$i] == '%'){
            $ret .= urldecode(substr($str, $i, 3));
            $i += 2;
        }else $ret .= $str[$i];
    }
	return $ret;
}

function request($str)
{
	$cs=$_REQUEST[$str];
	return unescape($cs);
}

function GetCkVdValue()
{
	@session_start();
	return isset($_SESSION['wifi_ckstr']) ? $_SESSION['wifi_ckstr'] : '';
}

function ResetVdValue()
{
	@session_start();
	$_SESSION['wifi_ckstr'] = '';
	$_SESSION['wifi_ckstr_last'] = '';
}

function GetCkVdValue2()
{
	@session_start();
	return isset($_SESSION['wifi_ckstr']) ? $_SESSION['wifi_ckstr'] : '';
}

function ResetVdValue2()
{
	@session_start();
	$_SESSION['wifi_ckstr'] = '';
	$_SESSION['wifi_ckstr_last'] = '';
}

function GetIP()
{
	if(!empty($_SERVER["HTTP_CLIENT_IP"]))
	{
		$cip = $_SERVER["HTTP_CLIENT_IP"];
	}
	else if(!empty($_SERVER["HTTP_X_FORWARDED_FOR"]))
	{
		$cip = $_SERVER["HTTP_X_FORWARDED_FOR"];
	}
	else if(!empty($_SERVER["REMOTE_ADDR"]))
	{
		$cip = $_SERVER["REMOTE_ADDR"];
	}
	else
	{
		$cip = '';
	}
	preg_match("/[\d\.]{7,15}/", $cip, $cips);
	$cip = isset($cips[0]) ? $cips[0] : 'unknown';
	unset($cips);
	return $cip;
}

//返回格林威治标准时间
function MyDate($format='Y-m-d H:i:s',$timest=0)
{
	global $cfg_cli_time;
	$addtime = $cfg_cli_time * 3600;
	if(empty($format))
	{
		$format = 'Y-m-d H:i:s';
	}
	return gmdate ($format,$timest+$addtime);
}

function GetAlabNum($fnum)
{
	$nums = array("０","１","２","３","４","５","６","７","８","９");
	//$fnums = "0123456789";
	$fnums = array("0","1","2","3","4","5","6","7","8","9");
	$fnum = str_replace($nums,$fnums,$fnum);
	$fnum = ereg_replace("[^0-9\.-]",'',$fnum);
	if($fnum=='')
	{
		$fnum=0;
	}
	return $fnum;
}

function first_img($obj)
{ 
	$obj="".$obj;
	$obj=str_replace("\\","",$obj);
	$temp="";
	if ( preg_match( '/img.*?src=.*?"(.*?)"/si', $obj, $regs ) )
	{ 
		$temp = $regs[1] ; 
		$temp=str_replace("\\","",$temp);
	}

	return $temp;
}
//读取远程网址内容
function read_url($str) 
{ 
	$file=fopen($str,"r"); 
	while(!feof($file)) 
	{ 
		$result.=fgets($file,9999); 
	} 
	fclose($file); 
	return $result; 
}
//生成html
function savehtml($s_fname,$o_fname)
{
	$url = "http://".$_SERVER['HTTP_HOST']."/".$s_fname;
	$contents = file_get_contents($url);
	$o_fname="/".$o_fname;
	$o_fname=str_replace("//","",$o_fname);
	$fp = fopen($o_fname,"w+");
	fwrite($fp,$contents); 
	fclose($fp);
}

function CreateFolder($path)
{
	$path="/".$path."/";
	$path=str_replace("//","",$path);
	$path=str_replace("/../","../",$path);
   if (!file_exists($path))
   {
    CreateFolder2(dirname($path));
    mkdir($path, 0777);
   }
}

function CreateFolder2($path)
{
   if (!file_exists($path))
   {
    CreateFolder2(dirname($path));
    mkdir($path, 0777);
   }
}
function GetContent($file)
{
	if(file_exists($file)){$content = file_get_contents($file);}
	return $content;
}

//检查是否是外部提交
function checkrefer()
{
	if(preg_match("/^http:\/\/".$_SERVER["SERVER_NAME"]."\/.*/i",$_SERVER['HTTP_REFERER'])){}else{echo "a";die(); }
}
function jq($str,$len)
{
$length=$len;
$encoding='utf8';
if(mb_strlen(ClearHtml($str),$encoding)>$length){
$title=mb_substr(ClearHtml($str),0,$length,$encoding).'...';
}
else{$title=ClearHtml($str);}
return $title;
}
function jq33($str,$len)
{
$length=$len;
$encoding='utf8';
if(mb_strlen(ClearHtml($str),$encoding)>$length){
$title=mb_substr(ClearHtml($str),0,$length,$encoding).'';
}
else{$title=ClearHtml($str);}
return $title;
}
function jq1($str,$len)
{
$length=$len;
$encoding='utf8';
if(mb_strlen(ClearHtml($str),$encoding)>$length){
$title=mb_substr(ClearHtml($str),0,$length,$encoding);}
else{$title=ClearHtml($str);}
return $title;
}
function jq2($strInfo, $nLenSet){
    $m_bDeflated = false;
	if ($strInfo!=""){$strInfo=ClearHtml($strInfo);}
    for($ii = 0; $ii<strlen($strInfo); $ii++) {
        $m_strChar = substr($strInfo, $ii, 1);
        $m_iCode=ord($m_strChar);
        if($m_iCode>=160){
            $ii++;
            $m_strChar=$m_strChar.substr($strInfo, $ii, 1);
        }
        if ($m_iCode<160) {
            $m_nLen = $m_nLen + 1;
        } else {
            $m_nLen = $m_nLen + 1;
        }
        if ( $m_nLen <= $nLenSet ) {
            if ( $m_nLen <= $nLenSet - 3 ) {
                $m_strResult = $m_strResult.$m_strChar;
            }
        } else {
            $m_bDeflated = true;
            break;
        }
    }
    if( $m_bDeflated ) {
        $m_strResult = "$m_strResult...";
    } else {
        $m_strResult = $strInfo;
    }
    return $m_strResult;
}

function ClearHtml($content) {return Gtext($str);} 
//取得所有链接 
function get_tag_data($str, $start, $end){ 
    if ( $start == '' || $end == '' ){ 
        return; 
    } 
    $str = explode($start, $str); 
    $str = explode($end, $str[1]); 
    return $str[0]; 
}
function isMobile($num) {
	if (!$num) {return false;}
	return preg_match('#^13[\d]{9}$|14^[0-9]\d{8}|^15[0-9]\d{8}$|^18[0-9]\d{8}$#', $num) ? true : false;
}


function lmdid($lm,$str)
{
  $m=M('info');		
  $m=$m->where("fid='$lm' and audit='1'")->find();
  return $m[$str];
}
function get_lmfid($id,$lm,$str)
{
	return info_ty(0,fidt($lm,$id),"fid");
}
function fidt($lm,$id)
{
	if ($id>0)
	{
		$m=M('info');		
		$m=$m->where("id='$id' and audit='1'")->find();
		return (int)$m['fid'];
	}
	return (int)$lm;
}
function info_ty($id,$lm,$str)
{
	if ($id>0)
	{
		$m=M('info');		
		$m=$m->where("id='$id' and audit='1'")->find();
		return $m[$str];
	}
	$ms=M('lm');		
	$m=$ms->where("id='$lm'")->find();
	return $m[$str];
}
function lminfo($lm,$str)
{
	$ms=M('lm');		
	$m=$ms->where("id='$lm'")->getField($str);
	return $m;
}

function maketime($str,$ty)
{
	return $str;	
}
function webload($url,$lm,$id,$nowlm,$str='')
{
	define('WIFIROOT', str_replace("\\", '/', dirname(__FILE__) ) );
	$url=WIFIROOT."/../Tpl".$url;
	define('WIFICACHE',WIFIROOT."/xcache/htm");
	$tbq=C('DB_PREFIX');
	$page=(int)$_GET['page'];
	if ($page<1){$page=1;}
	$curl=WIFICACHE."/".md5($url.$lm."_".$id."_".$page).".php";
	$curl=WIFICACHE."/".md5($lm."_".$id."_".$page).".php";
	if ($str=='')
	{
		$Temphtml=file_get_contents($url);
	}
	else
	{
		$Temphtml=$str;
	}
	$tagStartWord="{t:";
	$fullTagEndWord="{/t:";
	$sTagEndWord="/}";
	$tagEndWord="}";	
	$preg='|'.$tagStartWord.'[^>]+'.$sTagEndWord.'|U';
	$tfg='.';
	$tfg2=' ';	
	$ret=preg_match_all($preg,$Temphtml,$out, PREG_PATTERN_ORDER);
	$Matches=$out[0];
	foreach ($Matches as $Mstr)
	{
		$thtml=str_replace($tagStartWord,"",$Mstr);
		$thtml=str_replace($sTagEndWord,"",$thtml);
		$tarr=explode($tfg,$thtml);
		switch ($tarr[0])
		{
			case 'global':
			case 'var':
				$sconfig=M('config');		
				$sconfig=$sconfig->where("varname='".trim($tarr[1])."'")->find();
				$rval=$sconfig['value'];
				$Temphtml=str_replace($Mstr,$rval,$Temphtml);
				break;
			case 'test':
				$Temphtml=str_replace($Mstr,$tarr[1],$Temphtml);
				break;
			case 'asp':
				$rval=eval(trim($tarr[1]));
				$Temphtml=str_replace($Mstr,$rval,$Temphtml);
				break;
			case 'field':
				if ($lm>0 && $id==0)
				{
					switch ($tarr[1])
					{
						case 'position':
							//获取网站栏目路径
							//$rval=getsite($lm);
							$Temphtml=str_replace($Mstr,$rval,$Temphtml);
							break;
						default:
							$rval=info_ty(0,$lm,"`".trim($tarr[1])."`");
							$Temphtml=str_replace($Mstr,$rval,$Temphtml);
							break;	
					}	
				}
				else
				{
					switch ($tarr[1])
					{
						case 'position':
							//获取网站栏目路径
							//$rval=getsite($lm);
							$Temphtml=str_replace($Mstr,$rval,$Temphtml);
							break;
						default:
							info_ty($id,0,"`".trim($tarr[1])."`");
							$Temphtml=str_replace($Mstr,$rval,$Temphtml);
							break;	
					}	
				}
				break;	
			case 'lmfield':
				//$lm=fidt($lm,$id);
				switch ($tarr[1])
				{
					case 'position':
						//获取网站栏目路径
						//$rval=getsite($lm);
						$Temphtml=str_replace($Mstr,$rval,$Temphtml);
						break;
					default:
						$rval=info_ty((int)$lm,0,"`".trim($tarr[1])."`");
						$Temphtml=str_replace($Mstr,$rval,$Temphtml);
						break;	
				}	
				break;					
		}
		$tarr=explode($tfg2,$thtml);
		switch ($tarr[0])
		{
			case 'include':
				$tarrs=explode('"',$tarr[1]);
				$Temphtml=str_replace($Mstr,webload($tarrs[1],$lm,$id,$nowlm),$Temphtml);
				break;
			case 'body':
				$tarrs=explode("'",$tarr[1]);
				if ($tarr[1]!='')
				{ 
					$rval=info_ty((int)$tarrs[1],0,'content');
				}
				else
				{
					$rval="";
				}
				$Temphtml=str_replace($Mstr,$rval,$Temphtml);
				break;
			case 'lmname':
				$tarrs=explode("'",$tarr[1]);
				$lmid=trim($tarrs[1]);
				if ($id==0 && $lm>0)
				{
					$rval=info_ty(0,(int)$tarrs[1],'cntitle');
					$Temphtml=str_replace($Mstr,$rval,$Temphtml);
				}
				else
				{
					$Temphtml=str_replace($Mstr,'',$Temphtml);
				}	
				break;	
			case 'prenext':
				//上一页 下一页
				
				break;
			case 'pagelist':
				//文档列表分页
				$pagesize=10;
				$nowlm=$lm;
				foreach ($tarr as $ky)
				{
					$tarrf=explode("'",$ky);
					switch ($tarrf[0])
					{
						case 'pagesize=':
							$pagesize=(int)$tarrf[1];
							break;
						case 'typeid=':
							$nowlm=(int)$tarrf[1];
							break;
					}	
				}
				$a=9;
				$p="page";
				$para="&lm=".$lm;
				global $keyword;
				if ($keyword!='')
				{
					$para=$para."&keyword=".$keyword;
					$pcount=M('info');		
					$pcount=$pcount->where("CONCAT(',', fidpath, ',') like '%,".$nowlm.",%' and audit='1' and cntitle like '%".$keyword."%'")->select();
					$pcount=count($pcount);				
				}
				else
				{
					$pcount=M('info');		
					$pcount=$pcount->where("CONCAT(',', fidpath, ',') like '%,".$nowlm.",%' and audit='1'")->select();
					$pcount=count($pcount);
						
					
				}			
				$shtml="";
				if ($pcount>0)
				{
					$maxcount=ceil($pcount/$pagesize);
					if ($maxcount>1)
					{
						$shtml.="<a href ='?".$p."=1".$para."'>首页</a>";
						if ($page>1)
						{
							$shtml.="<a href ='?".$p."=".($page-1).$para."'>上一页</a>";
						}
						if ($page>$a-1 && $maxcount>$a)
						{
							 if ($page+(int)($a-1)/2>$maxcount)
							 {
								 $pagenow = $maxcount - $a+1;
							 }
							 else
							 {
								$pagenow = $page - (int)($a-1)/2;
							 }
							 for ($i=1;$i<=$a;$i++)
							 {
								 if ($pagenow==$page)
								 {
									$pagenowclass="a-pg sa";
								 }
								 else
								 {
									$pagenowclass="a-pg";
								 }
								 $shtml.="<a class='".$pagenowclass."' href='?".$p."=".$pagenow.$para."'>".$pagenow."</a>";
								 $pagenow++;
							 }
						}
						else
						{
							 if ($maxcount < $a)
							 {
								 for ($i=1;$i<=$maxcount;$i++)
								 {
									 if ($i==$page)
									 {
										$pagenowclass="a-pg sa";
									 }
									 else
									 {
										$pagenowclass="a-pg";
									 }
								$shtml.="<a class='".$pagenowclass."' href='?".$p."=".$i.$para."'>".$i."</a>";
								 }
							 }
							 else
							 {
								 for ($i=1;$i<=$a;$i++)
								 {
									 if ($i==$page)
									 {
										$pagenowclass="a-pg sa";
									 }
									 else
									 {
										$pagenowclass="a-pg";
									 }
								 $shtml.="<a class='".$pagenowclass."' href='?".$p."=".$i.$para."'>".$i."</a>";
								 }
							 }
						}
						if ($page<$maxcount)
						{
							$shtml.="<a href ='?".$p."=".($page+1).$para."'>下一页</a>";
						}
						$shtml.="<a href ='?".$p."=".$maxcount.$para."'>尾页</a>";
						
						$shtml.="<select name='sldd' style='width:36px' onchange='location.href=this.options[this.selectedIndex].value;'>";
						for ($i=1;$i<=$maxcount;$i++)
						{
							if ($i==$page)
							{
								$nowpg=" selected";
							}
							else
							{
								$nowpg="";
							}
							$shtml.="<option value='?page=".$i.$para."'".$nowpg.">".$i."</option>";
						}
						$shtml.="</select>";
						
					}					
					$Temphtml=str_replace($Mstr,$shtml."<span class='pageinfo'>共<strong>".$maxcount."</strong>页 <strong>".$pcount."</strong>条记录</span>",$Temphtml);
				}
				else
				{
					$Temphtml=str_replace($Mstr,"",$Temphtml);	
				}
				break;
			case 'lmpagelist':
				//栏目列表分页
				break;			
		}	
	}
	$preg='|'.$tagStartWord.'[^>]+'.$tagEndWord.'([\s\S]*)'.$fullTagEndWord.'[^>]+'.$tagEndWord.'|U';
	$tfg='.';
	$tfg2=' ';	
	$ret=preg_match_all($preg,$Temphtml,$out, PREG_PATTERN_ORDER);
	$Matches=$out[0];
	foreach ($Matches as $Mstr)
	{	
		$tarrs=explode($tagEndWord,$Mstr);
		$thtml=str_replace($tagStartWord,"",$tarrs[0]);
		$tarr=explode($tfg2,$thtml);
		$zhtml=explode($fullTagEndWord,$tarrs[1]);
	
		switch ($tarr[0])
		{
			case 'channel':
				$tarrg=explode($tfg2,trim(str_replace($tarr[0],"",$thtml)));
				$row=0;
				$typeid=0;
				$links="";
				$jgf="";
				$orderby="";
				$col="id,cntitle,entitle,dir,description,img,z1";
				$col2="id";
				foreach ($tarrg as $ky)
				{
					$tarrf=explode("'",$ky);
					switch ($tarrf[0])
					{
						case "tb=":
							$tb=(int)$tarrf[1];
							break;
						case "row=":
							$row=(int)$tarrf[1];
							break;
						case "limit=":
							$limits=$tarrf[1];
							break;	
						case "typeid=":
							$typeid=(int)$tarrf[1];
							break;	
						case "link=":
							$links=$tarrf[1];
							break;	
						case "zid=":
							$zid=(int)$tarrf[1];
							break;	
						case "where=":
							$where=$tarrf[1];
							break;
						case "orderby=":
							$orderby=$tarrf[1];
							break;		
						case "jgf=":
							$jgf=$tarrf[1];
							break;	
					}
				}
				//内页nid
				if ($zid==1){global $nid;$typeid=$nid;}
				if ($row>0){$limit=" limit $row";}
				if ($limits!=''){$limit=" limit $limits";}
				if ($where!="")
				{
					$where=str_replace("#","'",$where);
					$where=str_replace("$"," ",$where);
					$where=" and ".$where;
				}
				if ($orderby!="")
				{
					$orderby=str_replace("#","'",$orderby);
					$orderby=str_replace("$"," ",$orderby);
					$orderby=$orderby.",";
				}
				$vhtml="";
				$titelarr=explode(",",$col);
				$limit=str_replace('limit','',$limit);
				$rss=M('lm')->where("fid='$typeid' $where and isshow=1")->field("$col2")->limit("$limit")->order("$orderby sort asc")->select();
				foreach ($rss as $rs)
				{
					$shtml=$zhtml[0];
					$tid=(int)$rs['id'];
					foreach ($titelarr as $ky)
					{
						$ky=str_replace('`','',$ky);
						if ($ky=="dir")
						{
							$dir=$rs["dir"];
							if ($dir=='')
							{
								$shtml=str_replace('[field:dir/]','',$shtml);
							}
							else
							{
								$shtml=str_replace('[field:dir/]',$dir,$shtml);
							}
						}
						else
						{
							$kval='';$kval=info_ty(0,$tid,$ky);
							$shtml=str_replace("[field:".$ky."/]",$kval,$shtml);
							$shtml=str_replace("[field:href/]",htmlname($tid),$shtml);
						}
					}

					$shtml=str_replace("[field:global.autoindex/]",($i+1),$shtml);
					$shtml=str_replace("[field:global.tbindex/]",($i+2),$shtml);
					if (substr($rs["dir"],0,7)=="http://")
					{
						$shtml=str_replace("[field:rel/]"," target='_blank'",$shtml);
					}
					else
					{
						$shtml=str_replace("[field:rel/]","",$shtml);
					}
					
					if ($rs['ty']==4 && substr($rs["dir"],0,7)=="http://")
					{
						$shtml=str_replace("[field:link/]",$rs["dir"],$shtml);
					}
					else
					{
						$dir=$rs["dir"];
						if ($dir=="")
						{
							$dir=$rs["fdir"];
						}						
						if ($links=="")
						{
							$links=$dir;
						}						
						$shtml=str_replace("[field:link/]",$links."?id=".$rs['id'],$shtml);
					}
					$gpath=info_ty(0,fidt($lm,$id),"fidpath").",".fidt($lm,$id);
					if (str_replace(''.$rs['id'].'','',$gpath)!=$gpath)
					{
						$shtml=str_replace("[field:now/]"," class='r'",$shtml);
					}
					else
					{
						$shtml=str_replace("[field:now/]"," class='m'",$shtml);
					}
					
					if ($i==0)
					{
						$vhtml=$vhtml.$shtml;
					}
					else
					{
						$vhtml=$vhtml.$jgf.$shtml;
					}	
					$i++;
				}
				$Temphtml=str_replace($Mstr,$vhtml,$Temphtml);
				break;
			case 'arclist':
				$tarrg=explode($tfg2,trim(str_replace($tarr[0],"",$thtml)));
				$row=0;
				$flag='';
				$typeid=0;
				$orderby='';
				$limits='';
				
				$img=0;
				$length=100;
				$where='';
				$col="`id`,`cntitle`";
				$col2=" id";
				foreach ($tarrg as $ky)
				{
					$tarrf=explode("'",$ky);
					switch ($tarrf[0])
					{
						case 'row=':
							$row=(int)$tarrf[1];
							break;
						case 'limit=':
							$limits=$tarrf[1];
							break;
						case 'col=':
							if ($tarrf[1]!=''){$col.=','.$tarrf[1];}							
							break;		
						case 'flag=':
							if ($flag==""){$flag.=$tarrf[1];}else{$flag.=','.$tarrf[1];}
							break;
						case 'typeid=':
							$row=$tarrf[1];
							if ($tarrf[1]=="did")
							{
								global $did;
								$typeid=(int)$did;
							}
							else
							{
								$typeid=(int)$tarrf[1];
							}
							break;
						case 'img=':
							$img=(int)$tarrf[1];
							break;	
						case 'orderby=':
							$orderby=$tarrf[1];
							break;
						case 'where=':
							$row=$tarrf[1];
							break;
						case 'cut=':
							$cut=$tarrf[1];
							$length=$cut;
							break;
					}				
				}
				
				if ($limits!=''){$limit=" limit $limits";}else{if ($row>0){$limit=" limit $row";}}
				if ($limit==''){$limit=" limit 10";}
				$vhtml="";
				$titelarr=explode(",",$col);				
				$wheresql1="";
				$wheresql2="";
				if ($typeid>0)
				{
					$wheresql1=" CONCAT(',', fidpath, ',') like '%,".$typeid.",%' and ";
				}
				else
				{
					$wheresql1=" CONCAT(',', fidpath, ',') like '%,".$typeid.",%' and ";
				}
				if ($where!="")
				{
					$where=str_replace("#","'",$where);
					$where=str_replace("$"," ",$where);
					$wheresql1.=$where." and";
				}
				if ($orderby!="")
				{
					$orderby=str_replace("#","'",$orderby);
					$orderby=str_replace("$"," ",$orderby);
					$orderby=$orderby.",";
				}

				if ($img==1)
				{
					$wheresql2=" img!='' and ";
				}
				$wheresql=$wheresql1.$wheresql2;				
				$i=0;				
				$limit=str_replace('limit','',$limit);
				$rss=M('info')->where("$wheresql audit='1'")->field("$col2")->limit("$limit")->order("$orderby sort asc")->select();
				foreach ($rss as $srs)
				{
					$shtml=$zhtml[0];
					$shtml=str_replace("[field:autoindex/]",(i+1),$shtml);
					$tid=(int)$srs["id"];
					foreach ($titelarr as $ky)
					{
						$ky=str_replace('`','',$ky);
						$sval=info_ty($tid,0,$ky);
						if ($ky=="cntitle")
						{											  
						  if ($srs["color"]!="")
						  {
							  $sval="<font style='color:".info_ty($tid,0,'color')."'>".$sval."</font>";
						  }
						  else
						  {
							  $sval=$sval;
						  }
						$shtml=str_replace("[field:".$ky."/]",$sval,$shtml);
						}
						else
						{
							$ky=str_replace('`','',$ky);
							$sval=info_ty($tid,0,$ky);
							$shtml=str_replace("[field:".$ky."/]",$sval,$shtml);	
						}
					}
					$shtml=str_replace("[field:stime/]",maketime($srs["addtime"],2),$shtml);
					$shtml=str_replace("[field:stime2/]",maketime($srs["addtime"],3),$shtml);
					$shtml=str_replace("[field:stime3/]",maketime($srs["addtime"],4),$shtml);
					$shtml=str_replace("[field:href/]",idlname($tid),$shtml);//bz8 是页面摘要 截取300的html
					$shtml=str_replace("[field:scon/]",jq1($srs["bz8"],$length),$shtml);
					$shtml=str_replace("[field:stitle/]",jq1(info_ty($tid,0,'cntitle'),$length),$shtml);
					$timg=info_ty($tid,0,'img');
					if ($timg="")
					{
						$timg=info_ty($tid,0,'simg');
						$shtml=str_replace("[field:img/]",$timg,$shtml);
					}					
					//标签内的内容 $zhtml;
					$vhtml.=$shtml;
				}
				$Temphtml=str_replace($Mstr,$vhtml,$Temphtml);
				break;
			case 'list':
				$nowlm=$lm;
				$length=100;
				$pagesize=10;
				$orderby='';
				$tarrg=explode($tfg2,trim(str_replace($tarr[0],"",$thtml)));		
				$col="`id`,`cntitle`";
				$col2="`id`";				
				foreach ($tarrg as $ky)
				{
					$tarrf=explode("'",$ky);
					switch ($tarrf[0])
					{
						case 'flag=':
							if ($flag==""){$flag.=$tarrf[1];}else{$flag.=','.$tarrf[1];}
							break;
						case 'typeid=':
							$row=$tarrf[1];
							if ($tarrf[1]=="did")
							{
								global $did;
								$typeid=(int)$did;
							}
							else
							{
								$typeid=(int)$tarrf[1];
							}
							break;
						case 'col=':
							if ($tarrf[1]!=''){$col.=','.$tarrf[1];}	
							break;
						case 'pagesize=':
							$pagesize=(int)$tarrf[1];
							break;	
						case 'img=':
							$img=(int)$tarrf[1];
							break;	
						case 'orderby=':
							$orderby=$tarrf[1];
							break;
						case 'where=':
							$row=$tarrf[1];
							break;
						case 'cut=':
							$cut=$tarrf[1];
							$length=$cut;
							break;
					}				
				}
				$vhtml="";
				$titelarr=explode(",",$col);				
				$wheresql1="";
				$wheresql2="";
				if ($typeid>0)
				{
					$wheresql1=" CONCAT(',', fidpath, ',') like '%,".$typeid.",%' and ";
				}
				else
				{
					$wheresql1=" CONCAT(',', fidpath, ',') like '%,".$typeid.",%' and ";
				}
				if ($where!="")
				{
					$where=str_replace("#","'",$where);
					$where=str_replace("$"," ",$where);
					$wheresql1.=$where." and";
				}
				if ($orderby!="")
				{
					$orderby=str_replace("#","'",$orderby);
					$orderby=str_replace("$"," ",$orderby);
					$orderby=$orderby.",";
				}

				if ($img==1)
				{
					$wheresql2=" img!='' and ";
				}
				$wheresql=$wheresql1.$wheresql2;
				global $keyword;				
				if ($keyword!='')
				{
					$wheresql.=" cntitle like '%".$keyword."%' and ";
				}			
				$ntable="".$tbq."info";
				$csql= "select count(id) from $ntable where $wheresql audit='1'";

				$rows=(int)shows($csql);
				$total=$rows;
				$pgsize=$pagesize;

				$pageno=(int)$_GET['page'];
				if ($pageno<=1){$pageno=1;}
				$pagecount=ceil($rows/$pgsize);
				if ($pageno>$pagecount && $pagecount>0){$pageno=$pagecount;}
				$limit=" limit ".(($pageno - 1) * $pagesize).", ".$pagesize."";				
				$inid=inid("select id from $ntable where $wheresql audit='1' order by $orderby sort asc $limit");
				if ($inid=="0")
				{
					$sql="select `id` from $ntable where 1=2";	
				}
				else
				{
					$sql="select $col from $ntable where id in($inid) order by $orderby sort asc";	
				}
				if ($rows>0)
				{	
					$br=mysql_query($sql);
					$sorts=($pageno - 1) * $pagesize;
					while ($srs=mysql_fetch_array($br))
					{	$id=$srs["id"];				
						$i=0;
						$shtml=$zhtml[0];
						$shtml=str_replace("[field:autoindex/]",(i+1),$shtml);
						foreach ($titelarr as $ky)
						{
							$ky=str_replace('`','',$ky);
							if ($ky=="cntitle")
							{
								$sval=$srs[$ky];	
														
								if ($srs["color"]!="")
								{
									$sval="<font style='color:".$srs["color"]."'>".$sval."</font>";
								}
								else
								{
									$sval=$sval;
								}
								if (strpos($srs["flag"],"b")>=0)
								{
									$shtml=str_replace("[field:".$ky."/]","<strong>".$sval."</strong>",$shtml);
								}
								else
								{
									$shtml=str_replace("[field:".$ky."/]",$sval,$shtml);
								}
							}
							else
							{
								if ($srs[$ky]!='')
								{
									$kval=$srs[$ky];
								}
								else
								{
									$kval="";
								}
								
								$shtml=str_replace("[field:".$ky."/]",$kval,$shtml);
								$shtml=str_replace("[field:stime/]",maketime($srs["addtime"],2),$shtml);
								$shtml=str_replace("[field:stime2/]",maketime($srs["addtime"],3),$shtml);
								$shtml=str_replace("[field:stime3/]",maketime($srs["addtime"],4),$shtml);
								$shtml=str_replace("[field:href/]",idlname($srs["id"]),$shtml);
								$shtml=str_replace("[field:scon/]",jq1($srs["bz8"],$length),$shtml);
								$shtml=str_replace("[field:stitle/]",jq1($srs["cntitle"],$length),$shtml);
								if ($srs["img"]="")
								{
									$shtml=str_replace("[field:img/]",$srs["simg"],$shtml);
								}
							}
							
						}
						$i++;
						$vhtml.=$shtml;
					}
				}

				$Temphtml=str_replace($Mstr,$vhtml,$Temphtml);
				break;	
			case 'clist'://栏目列表
				
		}	
	}
	//写入缓存
	/*file_put_contents($curl,$Temphtml);*/
	//返回内容
	return $Temphtml;
}
?>