<?php
header("Content-Type:text/html; charset=utf-8");
$runtime_start = microtime(true);
define('APP_PATH', __DIR__ . '/qmcms/app/');
define('WX_PATH', __DIR__ . '/qmcms/vendor/wxpay/');
/*301跳转*/
$the_host = $_SERVER['HTTP_HOST'];
if($the_host=='quanmeicm.net')
{
    header('HTTP/1.1 301 Moved Permanently');
    header('Location:http://www.quanmeicm.net');
    exit();
}

$url=$_SERVER['REQUEST_URI'];
$url=strtolower($url);
$yy='cn';
$surl=$url;
define('APP_HTML', __DIR__ . '/pub/HTML/'.$yy.'/');
define('APP_YY',$yy);
define('APP_SURL',$surl);

//require __DIR__ . '/qmcms/core/init.php';
require __DIR__ . '/qmcms/core/start.php';