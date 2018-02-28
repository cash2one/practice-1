<?php
header("Cache-control:no-cache,no-store,must-revalidate");
header("Pragma:no-cache");
header("Expires:0");
session_start();
error_reporting(E_ALL || ~E_NOTICE);
$f='';
$f=$_GET['f'];
$_SESSION['fr']=$f;
include_once( 'config.php' );
include_once( 'saetv2.ex.class.php' );

	
$o = new SaeTOAuthV2(WB_AKEY , WB_SKEY);

$code_url = $o->getAuthorizeURL(WB_CALLBACK_URL);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新浪微博</title>
<script type="text/javascript">
	var childWindow;
	function toQzoneLogin(){
		childWindow = window.open("<?php echo $code_url?>","TencentLogin","width=450,height=320,menubar=0,scrollbars=1, resizable=1,status=1,titlebar=0,toolbar=0,location=1");
	} 
	
	function closeChildWindow(){
		childWindow.close();
	}
	location.href='<?php echo $code_url?>';
</script>
</head>

<body>
<a href="javascript:;" onclick="toQzoneLogin();">微博登录</a>
</body>
</html>
