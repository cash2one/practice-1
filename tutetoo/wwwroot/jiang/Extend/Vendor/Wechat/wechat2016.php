<?php
/*******
 * WiFi管家 微信公众平台 PHP SDK 示例文件
 * @author WiFi管家 <wifiguanjia@163.com>
*******/
define('rootf', str_replace("\\", '/', dirname(__FILE__) ) );
$wifi=rootf.'/wlog/';
function wlog($msg,$file="")
{	
	global $wifi;
	if ($file=="")
	{
		$file = $wifi."log_".date("Y-m-d").".txt";	
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


$appid='wxd65b4725cc119bd0';
$appsecret='365dcdad2d529eb0104548afaccc48d0';
$sys_token='jiumeisheng2016';
$wxh='jiumeisheng_mall';
$home='http://www.jiumeisheng.com/';
$apiurl='https://api.weixin.qq.com/';

$token_url= $apiurl.'cgi-bin/token?grant_type=client_credential&appid='.$appid.'&secret='.$appsecret.'';
//首先获取token和openid
//这里的token用户获取用户的详细资料
$getc=file_get_contents($token_url);
$nowtoken = json_decode($getc);
$access_token = $nowtoken->access_token;
$opendid= $nowtoken->openid;
$nickname= $nowtoken->nickname;
define("TOKEN",$sys_token);


class wechat2016
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
	
    public function __construct($token,$openid='',$nickname='',$debug = FALSE)
	{
	
      $this->token  = $token;
	  $this->openid = $openid;
	  global $home;
	  $this->home=$home;
    }
	
    public function valid()
    {
        $echoStr = $_GET["echostr"];
        if($this->checkSignature()){
            echo $echoStr;
            exit;
        }
    }
	//关注和取消关注
	private function receiveEvent($object,$toid,$nickname){ 
	   $content = ""; 
	   $shijian=$object->Event;
	   
	   switch ($shijian){ 
		case "subscribe":
			$content = "
欢迎您，久娃终于等到你，久美盛商城只卖地道食品。为了您获得更好的服务，请按如下选项进行操作。\n
1、如果您在此之前已注册久美盛商城正式用户，请点击<a href='http://www.jiumeisheng.com/weixin/geturl.php?gourl=http://qqurl.com/d1Zy'>【直接登陆商城】</a>只需一次登陆即可实现账号绑定。\n
2、如果您是新用户请点击<a href='http://www.jiumeisheng.com/weixin/geturl.php?do=apply'>【申请用户】</a>，一键注册即可在“久美盛商城”公众号随时购买。如果想在电脑、手机、APP上面使用统一账号登陆商城，请点击<a href='http://www.jiumeisheng.com/weixin/geturl.php?gourl=http://qqurl.com/c1Zy'>【绑定用户】</a>使用手机号实现与微信的绑定。";//
			$this->send_text($toid,$content); 
			$content=$nickname.'关注了久美盛';
			$this->send_text('oyQ7ew89WCoz_HsDn6JBMNXHzNIE',$content);
			break;
		case "unsubscribe":
			$content=$nickname.'取消了关注久美盛';
			$this->send_text('oyQ7ew89WCoz_HsDn6JBMNXHzNIE',$content);
			break; 
	   } 
	   wlog($time.'shijian='.$shijian.' content='.$content.'
	   ');
	  
	   return $result; 
	} 
	
	//处理接收消息函数 声音为arm格式 可通过flash播放
    public function responseMsg()
    {
		$nowtoken = $this->token;
        $postStr = $GLOBALS["HTTP_RAW_POST_DATA"];
		
		//如果接受了数据
        if (!empty($postStr)){
            $postObj = simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
            $fromUsername = $postObj->FromUserName;
            $toUsername = $postObj->ToUserName;
            $keyword = trim($postObj->Content);
			$MsgType=trim($postObj->MsgType);
			$MediaId=trim($postObj->MediaId);
            $time = time();
			
			$this->openid=$fromUsername;
			$nickname=$this->getUinfo($fromUsername);
			$this->nickname=$nickname;			

			//$xttext=date('Y-m-d H:i:s').$nickname.'互动 jiumeisheng{'.$keyword.'}';
			//$this->send_text('oyQ7ew9eYSL9VkYuvj43ArWtX0pg',$xttext);
			wlog($time."互动说明=".$xttext.$postStr."");
				
			switch ($MsgType)
			{
				case "event":	
					//wlog($time.'post:'.$postStr.'\n');				
					$result = $this->receiveEvent($postObj,$fromUsername,$nickname);
					 
					break; 	
				case 'text'://文字
					if ($keyword=='绑定' || $keyword=='bangding')
					{
						$urlx=$this->home.'weixin/geturl.php?wechatid='.$fromUsername.'';
						//urlencode($urlx)
						$sendcon='<a href=\''.$urlx.'\'>点击绑定微信</a>';
						$result=$this->send_text($fromUsername,$sendcon);
					}
					switch ($keyword)
					{
						case "商城":
						case "mall":
							$urlx=$this->home.'weixin/geturl.php?gourl=http://qqurl.com/s1Zy';
							$sendcon='<a href=\''.$urlx.'\'>点击绑定微信</a>';
							$result=$this->send_text($fromUsername,$sendcon);
							break;	
						case "member":
						case "会员":
							$urlx=$this->home.'weixin/geturl.php?gourl=http://qqurl.com/c1Zy';
							$sendcon='<a href=\''.$urlx.'\'>点击绑定微信</a>';
							$result=$this->send_text($fromUsername,$sendcon);
							break;	
						case "特色":	
						case "特色馆":
						case "tese":
							$urlx=$this->home.'weixin/geturl.php?gourl=http://qqurl.com/s1Zy';
							$sendcon='<a href=\''.$urlx.'\'>点击绑定微信</a>';
							$result=$this->send_text($fromUsername,$sendcon);
							break;
					}					
					break;	
				case 'image'://图	
					exit();				
					$mediaid =$MsgId;
$url = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=".$nowtoken."&media_id=$MediaId";					
					$fileInfo = $this->downloadWeixinFile($url);					
					$filearr = $this->getType($url);
					$filename2='img/'.$filearr['Content-disposition'];
					$filename2=str_replace('attachment; filename="','',$filename2);
					$filename2=str_replace('"','',$filename2);
					$this->saveWeixinFile($filename2, $fileInfo["body"]);					
					break;	
				case 'voice'://语音				
				case 'video'://视频
				case "shortvideo"://小视频
					exit();
					$mediaid =$MsgId;
					$url = "http://file.api.weixin.qq.com/cgi-bin/media/get?access_token=".$nowtoken."&media_id=$MediaId";					
					$fileInfo = $this->downloadWeixinFile($url);					
					$filearr = $this->getType($url);
					$filename2='img/'.$filearr['Content-disposition'];
					$filename2=str_replace('attachment; filename="','',$filename2);
					$filename2=str_replace('"','',$filename2);
					$this->saveWeixinFile($filename2, $fileInfo["body"]);
									
					break;	
				case "location"://地理位置信息				
					break;
				case "link"://链接类型				
					break;

			}
			
			
        }
		
    }
	

	
	
	//公众号向微信会员发送文本消息 toid 接收的id  text 接收文字
	public function send_text($toid,$text)
	{ 			
		$postdata ='{"touser":"'.$toid.'","msgtype":"text","text":{"content":"'.$text.'"}}';
		//模拟头部
		$opts = array(
			'http' => array(
				'method' => 'POST',
				'Content-Length' => strlen($postdata),
				'Host' => 'api.weixin.qq.com',
				'Content-Type' => 'application/json',
				'content' => $postdata
			)
		);
		//提交请求
		$context = stream_context_create($opts);
		$result = file_get_contents('https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token='.$this->token.'', true, $context);
		wlog($time.'shijian=推送消息\n toid='.$toid.' content='.$text.$result.'\\n');
		return $result;
	}	
	
	//获取用户信息
	public function getUinfo($opendid)
	{
		/*$appid='wxd65b4725cc119bd0';
		$appsecret='365dcdad2d529eb0104548afaccc48d0';
		$home='http://www.jiumeisheng.com/';
				
		$token_url2 = $apiurl.'cgi-bin/token?grant_type=client_credential&appid='.$appid.'&secret='.$appsecret.'';		
		$tokens = json_decode(file_get_contents($token_url2));
		$tken = $tokens->access_token;*/
		$tken=$this->token;
		$apiurl='https://api.weixin.qq.com/';
		$info_url= $apiurl.'cgi-bin/user/info?access_token='.$tken.'&openid='.$opendid.'&lang=zh_CN';
		$info = json_decode(file_get_contents($info_url));
		//wlog($time.'{$info_url}='.$info_url.'\r\n');
		return $info->nickname;		
	}
     
    //群发消息
    public function sendMessage($content='',$userId='') {
        if(is_array($userId) && !empty($userId)){
            foreach($userId as $v){
                $json = json_decode($this->send($v,$content));
                if($json->ret!=0){
                    $errUser[] = $v;
                }
            }
        }else{
            foreach($this->userFakeid as $v){
                $json = json_decode($this->send($v['fakeid'],$content));
                if($json->ret!=0){
                    $errUser[] = $v['fakeid'];
                }
            }
        }
                 //共发送用户数
        $count = count($this->userFakeid);
        //发送失败用户数
        $errCount = count($errUser);
        //发送成功用户数
        $succeCount = $count-$errCount;
         
        $data = array(
            'status'=>0,
            'count'=>$count,
            'succeCount'=>$succeCount,
            'errCount'=>$errCount,
            'errUser'=>$errUser
        );         
        return json_encode($data);
    }
    //获取所有用户信息
    public function getAllUserInfo(){
        foreach($this->userFakeid as $v){
            $info[] = $this->getUserInfo($v['groupid'],$v['fakeid']);
        }         
        return $info;
    }
     
     
     
    //获取用户信息
    public function getUserInfo($groupId,$fakeId){
        $url = "https://mp.weixin.qq.com/cgi-bin/getcontactinfo?t=ajax-getcontactinfo&lang=zh_CN&fakeid={$fakeId}";
        $this->getHeader = 0;
        $this->referer = 'https://mp.weixin.qq.com/cgi-bin/contactmanagepage?token='.$this->token.'&t=wxm-friend&lang=zh_CN&pagesize='.$this->pageSize.'&pageidx=0&type=0&groupid='.$groupId;
        $this->send_data = array(
            'token'=>$this->token,
            'ajax'=>1
        );
        $message_opt = $this->curlPost($url);
        return $message_opt;
    }
     
    //获取所有用户fakeid
    private function getUserFakeid(){
        ini_set('max_execution_time',600);
        $pageSize = 1000000;
		$mpurl='https://mp.weixin.qq.com/cgi-bin/';
        $this->referer =$mpurl."home?t=home/index&lang=zh_CN&token=".$this->token."";
        $url =$mpurl."contactmanage?t=user/index&pagesize=".$pageSize."&pageidx=0&type=0&groupid=0&token=".$this->token."&lang=zh_CN";
        $user = $this->vget($url);
        $preg = "/\"id\":(\d+),\"nick_name\"/";
        preg_match_all($preg,$user,$b);
        $i = 0;
        foreach($b[1] as $v)
        {
            $arr[$i]['fakeid'] = $v;
            $arr[$i]['groupid'] = 0;
            $i++;
        }
        return $arr;
    }
 
    /**
     * curl模拟登录的post方法
     * @param $url request地址
     * @param $header 模拟headre头信息
     * @return json
     */
    private function curlPost($url) {
        $header = array(
            'Accept:*/*',
            'Accept-Charset:GBK,utf-8;q=0.7,*;q=0.3',
            'Accept-Encoding:gzip,deflate,sdch',
            'Accept-Language:zh-CN,zh;q=0.8',
            'Connection:keep-alive',
            'Host:'.$this->host,
            'Origin:'.$this->origin,
            'Referer:'.$this->referer,
            'X-Requested-With:XMLHttpRequest'
        );
        $curl = curl_init(); //启动一个curl会话
        curl_setopt($curl, CURLOPT_URL, $url); //要访问的地址
        curl_setopt($curl, CURLOPT_HTTPHEADER, $header); //设置HTTP头字段的数组
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0); //对认证证书来源的检查
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 1); //从证书中检查SSL加密算法是否存在
        curl_setopt($curl, CURLOPT_USERAGENT, $this->useragent); //模拟用户使用的浏览器
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1); //使用自动跳转
        curl_setopt($curl, CURLOPT_AUTOREFERER, 1); //自动设置Referer
        curl_setopt($curl, CURLOPT_POST, 1); //发送一个常规的Post请求
        curl_setopt($curl, CURLOPT_POSTFIELDS, $this->send_data); //Post提交的数据包
        curl_setopt($curl, CURLOPT_COOKIE, $this->cookie); //读取储存的Cookie信息
        curl_setopt($curl, CURLOPT_TIMEOUT, 30); //设置超时限制防止死循环
        curl_setopt($curl, CURLOPT_HEADER, $this->getHeader); //显示返回的Header区域内容
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1); //获取的信息以文件流的形式返回
        $result = curl_exec($curl); //执行一个curl会话
        curl_close($curl); //关闭curl
		
		wlog('{send_singlemessage} url='.$url.'&post='.$this->send_data.'&result='.$result.'\n');
        return $result;
    }
     
    private function vget($url){ // 模拟获取内容函数
        $header = array(
                'Accept: */*',
                'Connection: keep-alive',
                'Host: mp.weixin.qq.com',
                'Referer: '.$this->referer,
                'X-Requested-With: XMLHttpRequest'
        );
         
        $useragent = 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0';
        $curl = curl_init(); // 启动一个CURL会话
        curl_setopt($curl, CURLOPT_URL, $url); // 要访问的地址
        curl_setopt($curl, CURLOPT_HTTPHEADER, $header); //设置HTTP头字段的数组
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0); // 对认证证书来源的检查
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 1); // 从证书中检查SSL加密算法是否存在
        curl_setopt($curl, CURLOPT_USERAGENT, $useragent); // 模拟用户使用的浏览器
        curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1); // 使用自动跳转
        curl_setopt($curl, CURLOPT_AUTOREFERER, 1); // 自动设置Referer
        curl_setopt($curl, CURLOPT_HTTPGET, 1); // 发送一个常规的GET请求
        curl_setopt($curl, CURLOPT_COOKIE, $this->cookie); // 读取上面所储存的Cookie信息
        curl_setopt($curl, CURLOPT_TIMEOUT, 30); // 设置超时限制防止死循环
        curl_setopt($curl, CURLOPT_HEADER, $this->getHeader); // 显示返回的Header区域内容
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1); // 获取的信息以文件流的形式返回
        $tmpInfo = curl_exec($curl); // 执行操作
        if (curl_errno($curl)) {
            // echo 'Errno'.curl_error($curl);
        }
        curl_close($curl); // 关闭CURL会话
        return $tmpInfo; // 返回数据
    }
	
	//上传多媒体文件 在发送图片 声音 视频等必须先上传图片获取media_id才能发送
     public function upload_media($type, $file)
     {
         $data = array("media"  => "@".dirname(__FILE__).'\\'.$file);
         $url = "http://file.api.weixin.qq.com/cgi-bin/media/upload?access_token=".$this->access_token."&type=".$type;
         $res = $this->https_request($url, $data);
         return json_decode($res, true);
     }
 
     //https请求（支持GET和POST）
     protected function https_request($url, $data = null)
     {
         $curl = curl_init();
         curl_setopt($curl, CURLOPT_URL, $url);
         curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
         curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
         if (!empty($data)){
             curl_setopt($curl, CURLOPT_POST, 1);
             curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
         }
         curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
         $output = curl_exec($curl);
         curl_close($curl);
         return $output;
     }
	
	//下载文件
	private function downloadWeixinFile($url)
	{
		$ch = curl_init($url);
		curl_setopt($ch, CURLOPT_HEADER, 0);    
		curl_setopt($ch, CURLOPT_NOBODY, 0);    //只取body头
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		$package = curl_exec($ch);
		$httpinfo = curl_getinfo($ch);
		curl_close($ch);
		$imageAll = array_merge(array('header' => $httpinfo), array('body' => $package)); 
		return $imageAll;
	}
	 
	//保存文件 
	private function saveWeixinFile($filename, $filecontent)
	{
		$local_file = fopen($filename, 'w');
		if (false !== $local_file){
			if (false !== fwrite($local_file, $filecontent)) {
				fclose($local_file);
			}
		}
	}
	
 	//验证函数签名
    private function checkSignature()
    {
        $signature = $_GET["signature"];
        $timestamp = $_GET["timestamp"];
        $nonce = $_GET["nonce"];
        $token =TOKEN;
        $tmpArr = array($token, $timestamp, $nonce);
        sort($tmpArr);
        $tmpStr = implode( $tmpArr );
        $tmpStr = sha1( $tmpStr );
 
        if( $tmpStr == $signature ){
            return true;
        }else{
            return false;
        }
    }
	
	//获取文件头部类型
	private function getType($url)
	{
		$arr=get_headers($url,1);
		return $arr;
	}
}

?>