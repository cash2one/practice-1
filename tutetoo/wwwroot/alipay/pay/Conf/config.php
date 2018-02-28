<?php
define('WIFIADMIN', str_replace("\\", '/', dirname(__FILE__) ) );
if (!defined('THINK_PATH')) exit();
//载入数据库配置
$db_config = require WIFIADMIN.'/../../../config.php';
//设定项目配置
$array	=	array(
//'APP_DEBUG' => true, // 开启调试模式

);
//合并输出配置
return array_merge($db_config,$array);