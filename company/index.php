<?php
header("Content-Type:text/html; charset=utf-8");
$runtime_start = microtime(true);
define('APP_PATH', __DIR__ . '/qmcms/app/');
define('APP_HTML', __DIR__ . '/pub/HTML/');


/*301跳转*/
$the_host = $_SERVER['HTTP_HOST'];
if($the_host=='quanmeicm.net')
{
    header('HTTP/1.1 301 Moved Permanently');
    header('Location:http://www.quanmeicm.net');
    exit();
}

/*禁止访问带index.php文件*/
$url=$_SERVER['REQUEST_URI'];
$url=strtolower($url);
if ($url!=str_replace('index.php','',$url))
{
    header('HTTP/1.1 301 Moved Permanently');
    header('Location:/');
    exit();
}

require __DIR__ . '/qmcms/core/init.php';
require __DIR__ . '/qmcms/core/start.php';