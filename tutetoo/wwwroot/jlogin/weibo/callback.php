<?php
header("Cache-control:no-cache,no-store,must-revalidate");
header("Pragma:no-cache");
header("Expires:0");
session_start();
error_reporting(E_ALL || ~E_NOTICE);
include_once('config.php');
include_once('saetv2.ex.class.php');

$o = new SaeTOAuthV2(WB_AKEY , WB_SKEY);

if(isset($_REQUEST['code'])){
	$keys = array();
	$keys['code'] = $_REQUEST['code'];
	$keys['redirect_uri'] = WB_CALLBACK_URL;
	try{
		$token = $o->getAccessToken('code', $keys);
	}catch(OAuthException $e){
		
	}
}

if($token){
	//授权成功，将token记入session
	$_SESSION['token'] = $token;
	setcookie( 'weibojs_'.$o->client_id, http_build_query($token));
	
	$c = new SaeTClientV2( WB_AKEY , WB_SKEY , $_SESSION['token']['access_token']);
	$ms  = $c->home_timeline(); // done
	$uid=0;
	$uid_get = $c->get_uid();
	$uid = $uid_get['uid'];
	$user_message="";
	$weibo_nc="";
	$weibo_id=0;
	$user_message = $c->show_user_by_id($uid);
	//微博账号
	$weibo_nc=$user_message['screen_name'];
	$weibo_id=$uid;
	//print_r($user_message);exit();
	$_SESSION['weibo_nc'] = $weibo_nc;
	$_SESSION['weibo_id'] = $weibo_id;
	$_SESSION['loginty']=3;
	$rz_urls="";
	$rz_urls=$_SESSION['fr'];

	$rz_urls=$_SERVER['HTTP_HOST'];
	$wifiguanjia_wifiauth="http://".$rz_urls."/?weiboapi=1&a=uapi&m=dox&t=".time();
	echo '<meta charset="UTF-8">';
	echo "微博:".$weibo_nc."登录成功";

	header("Refresh:1;url=".$wifiguanjia_wifiauth);exit();
	?>
    <h2><?=$weibo_nc;?>微博登录成功</h2>
	<?php
}else{
	?>授权失败。<?php
}
?>