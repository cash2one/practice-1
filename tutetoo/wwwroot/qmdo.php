<?php
@header("Content-Type:text/html; charset=utf-8");
define("ThinkPHP_PATH","jiang/");
define('WIFIROOT',str_replace("\\",'/',dirname(__FILE__)));
define("APP_NAME","wifi");
define("APP_PATH","wifi/");
define('APP_DEBUG',true);
require_once(ThinkPHP_PATH."ThinkPHP.php");
