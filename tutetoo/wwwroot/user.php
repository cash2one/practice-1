<?php
//$stime=microtime(true);
define("ThinkPHP_PATH","jiang/");
define('WIFIROOT',str_replace("\\",'/',dirname(__FILE__)));
define("APP_NAME","usercenter");
define("APP_PATH","usercenter/");
define('APP_DEBUG',true);
require_once(ThinkPHP_PATH."ThinkPHP.php");
//$etime=microtime(true);