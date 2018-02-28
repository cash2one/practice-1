<?php
/*******
 * WiFi管家 微信公众平台 PHP SDK 示例文件
 * @author WiFi管家 <wifiguanjia@163.com>
*******/
define('TOKEN','jinshuosunshine');
define('rootf', str_replace("\\", '/', dirname(__FILE__) ) );
$wifi=rootf.'/wlog/';
function wlog($msg,$file="")
{	
	return false;
	global $wifi;
	if ($file=="")
	{
		$file = $wifi."wog_".date("Y-m-d").".txt";	
	}
	
	if( file_exists( $file ))
	{
		$con=file_get_contents($file);
		$con=$con.$msg."\n";
	}
	else
	{
		$fp=fopen($file,"w");
		$con=$msg."\n";
		fclose($fp);
	}
	$fp=fopen($file,"w");
	fputs($fp,$con);
	fclose($fp);
}
session_start();


class Wechat
{
    public $token;
	public $openid;
	public $userFakeid;
	public $nickname;
	private $_account;
	private $_password;
	private $url;
	private $send_data;
	private $getHeader = 0;
	private $host = 'mp.weixin.qq.com';
	private $origin = 'https://mp.weixin.qq.com';
	private $referer;
	private $cookie;
	private $pageSize = 100000;
	private $userAgent = 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0';
	private $home;
	private $appid;
	private $appsecret;
	private $sys_token;
	private $wxh;
	private $apiurl;
	private $gztext;
	
    public function __construct($token='',$openid='',$nickname='',$debug = FALSE)
	{
		$this->appid=C('APPID');
		$this->appsecret=C('APPSECRET');
		$this->home=C('HOME');
		$this->apiurl=C('APIURL');
		$this->wxh=C('WXH');
		//获取token
		$this->Get_Token();
    }
	
    public function valid()
    {
        $echoStr = $_GET["echostr"];
		//echo $echoStr;
        if($this->checkSignature()){
            echo $echoStr;
            exit;
        }
    }
	
	//获取凭证Token  //可以通过查询数据库来根据时间来获取 并不需要每次都远程获取
	public function Get_Token()
	{
		$turl=$this->apiurl.'cgi-bin/token?grant_type=client_credential&appid='.$this->appid.'&secret='.$this->appsecret.'';
		//首先获取token和openid json_decode($data,true)输出的