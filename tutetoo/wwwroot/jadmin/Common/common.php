<?php
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
/*    $a = array('a','b','c','d');
    array_remove($a,2);
    print_r($a);*/

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
	$tbq=C('DB_PREFIX');
	$result = mysql_query("select id from ".$tbq."lm where fid ='$type'");
	while($row = mysql_fetch_array($result)){
		$array[]=$row[0];
	}
	return rep_array($array);
}				

//获取上级树
function get_fpath($type){
	$fpath=M('lm')->where("id='$type'")->getField("fidpath");
	return explode(',',$fpath);
/*	$tbq=C('DB_PREFIX');
	$array  = array();	
	$array[]=$type;
	$fid=(int)shows("select fid from ".$tbq."lm where id ='$type'");
	if($fid>0){
		$array[]=$fid;
		$array = array_merge($array,get_fpath($fid)); //合并数组
	}
	return rep_array(array_reverse($array));*/
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
	print_r($rs);
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

//兼容php4
if(!function_exists('file_put_contents'))
{
	function file_put_contents($n,$d)
	{
		$f=@fopen($n,"w");
		if (!$f)
		{
			return false;
		}
		else
		{
			fwrite($f,$d);
			fclose($f);
			return true;
		}
	}
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


function GetDateTimeMk($mktime)
{
   return date('Y-m-d',strtotime($mktime));
}
function GetDateTimeMk3($mktime)
{
   return date('Y.m.d',strtotime($mktime));
}
function GetDateTimeMk4($mktime)
{
   return date('m.d',strtotime($mktime));
}
function MT($f='Y-m-d',$mktime)
{
   return date($f,strtotime($mktime));
}

function leng($str,$length)
{
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

function ClearHtml2($content) {
	$content = preg_replace("/<a[^>]*>/i", "", $content);
	$content = preg_replace("/<\/a>/i", "", $content);
	$content = preg_replace("/<div[^>]*>/i", "", $content);
	$content = preg_replace("/<\/div>/i", "", $content);
	$content = preg_replace("/<!--[^>]*-->/i", "", $content);//注释内容
	$content = preg_replace("/style=.+?['|\"]/i",'',$content);//去除样式
	$content = preg_replace("/class=.+?['|\"]/i",'',$content);//去除样式
	$content = preg_replace("/id=.+?['|\"]/i",'',$content);//去除样式
	$content = preg_replace("/lang=.+?['|\"]/i",'',$content);//去除样式
	$content = preg_replace("/width=.+?['|\"]/i",'',$content);//去除样式
	$content = preg_replace("/height=.+?['|\"]/i",'',$content);//去除样式
	$content = preg_replace("/border=.+?['|\"]/i",'',$content);//去除样式
	$content = preg_replace("/face=.+?['|\"]/i",'',$content);//去除样式
	$content = preg_replace("/face=.+?['|\"]/",'',$content);//去除样式 只允许小写 正则匹配没有带 i 参数
	$str = trim($content); 
	$str = strip_tags($str,""); 
	$str = ereg_replace("\t","",$str); 
	$str = ereg_replace("\r\n","",$str); 
	$str = ereg_replace("\r","",$str); 
	$str = ereg_replace("\n","",$str); 
	$str = ereg_replace(" "," ",$str); 	 
	$str = ereg_replace("&nbsp;","",$str);   
	$str = ereg_replace("　","",$str); 
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
	return isset($_SESSION['dd_ckstr']) ? $_SESSION['dd_ckstr'] : '';
}

function ResetVdValue()
{
	@session_start();
	$_SESSION['dd_ckstr'] = '';
	$_SESSION['dd_ckstr_last'] = '';
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

function ClearHtml($content) {
	$content = preg_replace("/<a[^>]*>/i", "", $content);
	$content = preg_replace("/<\/a>/i", "", $content);
	$content = preg_replace("/<div[^>]*>/i", "", $content);
	$content = preg_replace("/<\/div>/i", "", $content);
	$content = preg_replace("/<!--[^>]*-->/i", "", $content);//注释内容
	$content = preg_replace("/style=.+?['|\"]/i",'',$content);//去除样式
	$content = preg_replace("/class=.+?['|\"]/i",'',$content);//去除样式
	$content = preg_replace("/id=.+?['|\"]/i",'',$content);//去除样式
	$content = preg_replace("/lang=.+?['|\"]/i",'',$content);//去除样式
	$content = preg_replace("/width=.+?['|\"]/i",'',$content);//去除样式
	$content = preg_replace("/height=.+?['|\"]/i",'',$content);//去除样式
	$content = preg_replace("/border=.+?['|\"]/i",'',$content);//去除样式
	$content = preg_replace("/face=.+?['|\"]/i",'',$content);//去除样式
	$content = preg_replace("/face=.+?['|\"]/",'',$content);//去除样式 只允许小写 正则匹配没有带 i 参数
	$str = trim($content); 
	$str = strip_tags($str,""); 
	$str = str_replace("\t","",$str); 
	$str = str_replace("\r\n","",$str); 
	$str = str_replace("\r","",$str); 
	$str = str_replace("\n","",$str); 
	$str = str_replace(" "," ",$str); 	 
	$str = str_replace("&nbsp;","",$str);   
	$str = str_replace("　","",$str); 
	return strip_tags($str);
} 
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
function info_ty($id,$lmx,$str)
{
	if ($id>0)
	{
		$m=M('info');		
		$m=$m->where("id='$id' and audit='1'")->find();
		return $m[$str];
	}
	$lm=M('lm');		
	$m=$lm->where("id='$lmx'")->find();
	return $m[$str];
}

function maketime($str,$ty)
{
	return $str;	
}
function htmlname($id)
{
	$url=info_ty(0,$id,'url');
	if ($url!=''){return $url;}
	return '?lm='.$id;	
}
function idlname($id)
{
	$url=info_ty($id,0,'url');
	if ($url!=''){return $url;}
	return '?id='.$id;	
}
?>