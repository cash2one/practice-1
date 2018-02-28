<?php
header("Cache-control:no-cache,no-store,must-revalidate");
header("Pragma:no-cache");
header("Expires:0");
error_reporting(E_ALL || ~E_NOTICE);
session_start();
$f='';
$f=$_GET['f'];
$_SESSION['fr']=$f;
require_once("../../API/qqConnectAPI.php");
$qc = new QC();
$qc->qq_login();
