<?php
header("Content-Type:text/html; charset=utf-8");
define("ThinkPHP_PATH","jiang/");
define('WIFIROOT',str_replace("\\",'/',dirname(__FILE__)));
define("APP_NAME","wifi");
define("APP_PATH","wifi/");
define('APP_DEBUG',true);
$the_host = $_SERVER['HTTP_HOST'];
$request_uri = isset($_SERVER['REQUEST_URI']) ? $_SERVER['REQUEST_URI'] : '';
if($the_host== 'tutetoo.com' || $the_host=='www.tutetoo.com')
{
	echo '产品已过期,请续费！';
	exit();
	header('HTTP/1.1 301 Moved Permanently');
	header('Location: http://www.tutetoo.com');
}

require_once(ThinkPHP_PATH."ThinkPHP.php");
