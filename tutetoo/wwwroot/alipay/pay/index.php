<?php
@header("Content-Type:text/html; charset=utf-8");
define("ThinkPHP_PATH","../../jiang/");
define('WIFIROOT',str_replace("\\",'/',dirname(__FILE__)));
define("APP_NAME","wxpay");
define("APP_PATH","./");
define('APP_DEBUG',true);

session_start();
require_once(ThinkPHP_PATH."ThinkPHP.php");