<?php
header('Content-Type: text/html; charset=UTF-8');
$webhost=$_SERVER['HTTP_HOST'];
define( "WB_AKEY" , '3320266854' );
define( "WB_SKEY" , 'dd47451886019525879fb76cf95df7ef' );
define( "WB_CALLBACK_URL" , 'http://'.$webhost.'/jlogin/weibo/callback.php');