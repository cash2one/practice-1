<?php
header("Cache-control:no-cache,no-store,must-revalidate");
header("Pragma:no-cache");
header("Expires:0");
error_reporting(E_ALL || ~E_NOTICE);
require_once("../../API/qqConnectAPI.php");;
$qc = new QC();

$ck=$qc->qq_callback();
$openid=$qc->get_openid();

//echo $openid;exit();
$_SESSION['qq_id'] =$openid;

$qc = new QC($ck,$openid); 
$arr = $qc->get_user_info();

$_SESSION['qq_nc'] = $arr["nickname"];
$_SESSION['photo']=$arr['figureurl_2'];
$_SESSION['loginty']=2;
$rz_urls="";
$rz_urls=$_SESSION['fr'];
$rz_urls=$_SERVER['HTTP_HOST'];
$wifiguanjia_wifiauth="http://".$rz_urls."/?qqapi=1&a=uapi&m=dox&t=".time();
echo '<meta charset="UTF-8">';
echo "QQ:".$arr["nickname"]."登录成功";
header("Refresh:1;url=".$wifiguanjia_wifiauth);exit();


//$wifiguanjia_wifiauth="user.php?c=$openid&c=".time();
//header("Refresh:1;url=".$wifiguanjia_wifiauth);exit();
exit();