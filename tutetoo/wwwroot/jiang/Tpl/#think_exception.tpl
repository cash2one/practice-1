<?php
$f=$_SERVER["HTTP_REFERER"];
$f=$url=$_SERVER['REQUEST_URI'];//获取当前页面url
$f2=$f;
$f=str_replace('?','',$f);
$f=str_replace('.','',$f);
$f=str_replace('=','',$f);//去掉? =
if (strlen($f)>80)
{
	$f="";
	$f2="";
}
header("Location:$f/?$f2");//跳转页面 同时带上来源页面 目的可以查看这样的错误页面来源页面
?>