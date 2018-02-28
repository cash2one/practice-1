<?php
import('wxpay.Action.func');
//import('Think.WeChat.wechat');
class IndexAction extends Action {
    var $config;
	/*初始化*/
	function _initialize()
	{
		
		$config=getconfig();
		$this->sysfig=$config;
		$this->seo();
	
		$user_id=(int)$_SESSION['user_id'];
		$this->seo();		
		$this->user_id=$user_id;
		$this->user_name=$user_name;
		$this->ls_nid=0;
		$userinfo=M('user')->where('user_id='.$user_id.'')->find();
		$this->user=$userinfo;
		$this->umod=0;
		
		//支付宝接口配置参数设置 可做成后台设置为系统参数
		
		$payment_type=C('payment_type');//支付方式 担保交易2 即时到账1 双向0
		$pay_user=C('pay_user');//账号
		$pay_code=C('pay_code');;//密钥
		$pay_id=C('pay_id');;//签名ID	
			
		if ($pay_user=='' || $pay_code=='' || $pay_id==''){exit();}
		$this->payment_type=$payment_type;
		$this->pay_user=$pay_user;
		$this->pay_code=$pay_code;
		$this->pay_id=$pay_id;
		$this->show_url=C('show_url');		
		
	}
	
	/*公用设置 seo 底部版权*/
    public function seo($lm=0,$id=0)
	{	
		$seo=siteseo($lm,$id);
		$this->title=$seo[0];
		$this->keywords=$seo[1];
		$this->description=$seo[2];	
    }

	
	//电脑端 支付宝支付 1初始化支付参数
    public function index()
	{
		//不一定要登录后才能支付 只要支付了对应订单即可
		$orderid=session("orderid");
		//$orderid=$this->srequest2('id');//订单编号
		$info=M("order")->where("orderid='$orderid'")->find();
		if (!$info)
		{
			exit('<script>history.go(-2);</script>');	
		}
		$rs=$info;
		$user=$this->user;
		$tel=$user['user_name'];		
		$money=$rs['paymoney'];
		$show_url=$this->show_url;//商品展示地址
		//獲取支付宝配置信息
		$payment_type=$this->payment_type;
		$pay_user=$this->pay_user;
		$pay_code=$this->pay_code;
		$pay_id=$this->pay_id;
		if ($pay_user=='' || $pay_code=='' || $pay_id==''){exit();}
		
		$uid=$user_id;
		$price2=$money;		
		$price2=0.01;
		require_once("alipay.config.php");
		require_once("Lib/alipay_submit.class.php");
		
/**************************请求参数**************************/
        //服务器异步通知页面路径
        $notify_url = "http://www.tutetoo.com/alipay/pay/notify_url/";
        $return_url = "http://www.tutetoo.com/alipay/pay/return_url/";
        $out_trade_no = $orderid;
        //商户网站订单系统中唯一订单号，必填
        //订单名称
        $subject = "土特土-订单编号($orderid)";
        //付款金额
        $total_fee = $price2;
        //订单描述
		$body = "订单编号:".$orderid."，订购金额：".$price2."";
        //防钓鱼时间戳
        $anti_phishing_key = "";
       // $exter_invoke_ip = GetIP();

		/************************************************************/
		//构造要请求的参数数组，无需改动
		$parameter = array(
				"service"       => "create_direct_pay_by_user",
				"partner"       => trim($pay_id),
				"seller_email"  => trim($pay_user),
				"payment_type"	=> $payment_type,
				"notify_url"	=> $notify_url,
				"return_url"	=> $return_url,
				"out_trade_no"	=> $out_trade_no,
				"subject"	    => $subject,
				"total_fee"   	=> $total_fee,
				"body"	        => $body,
				"show_url"   	=> $show_url,
				"anti_phishing_key"	=> $anti_phishing_key,
				"exter_invoke_ip"	=> $exter_invoke_ip,
				"_input_charset"	=> trim(strtolower($alipay_config['input_charset']))
		);
		//print_r($parameter);
		//exit();
		//建立请求
		$alipaySubmit = new AlipaySubmit($alipay_config);
		$html_text = $alipaySubmit->buildRequestForm($parameter,"get", "确认");
		echo $html_text;
		exit();
	}
	
	
	//手机端 支付宝支付 1初始化支付参数
    public function wapindex()
	{
		//不一定要登录后才能支付 只要支付了对应订单即可
		$orderid=session("orderid");
		//$orderid=$this->srequest2('id');//订单编号
		$info=M("order")->where("orderid='$orderid'")->find();
		if (!$info)
		{
			exit('<script>history.go(-2);</script>');	
		}
		$rs=$info;
		$user=$this->user;
		$tel=$user['user_name'];		
		$money=$rs['paymoney'];
		//$money=0.01;
		$show_url=$this->show_url;//商品展示地址
		//獲取支付宝配置信息
		$payment_type=$this->payment_type;
		$pay_user=$this->pay_user;
		$pay_code=$this->pay_code;
		$pay_id=$this->pay_id;
		if ($pay_user=='' || $pay_code=='' || $pay_id==''){exit();}
		
		$uid=$user_id;
		$total_fee=$money;		
        $notify_url = "http://www.tutetoo.com/alipay/pay/notify_url/";
        $return_url = "http://www.tutetoo.com/alipay/pay/return_url/";
		
		require_once("lib_wap/alipay.config.php");
		require_once("lib_wap/alipay_submit.class.php");
		/**************************请求参数**************************/
        //商户订单号，商户网站订单系统中唯一订单号，必填
        $out_trade_no =$orderid;
        //订单名称，必填
		$subject = "土特土-订单编号($orderid)";
        //商品描述，可空
        $body = "订单编号:".$orderid."，订购金额：".$total_fee."";
		/************************************************************/
		
		//构造要请求的参数数组，无需改动
		$parameter = array(
				"service"       => $alipay_config['service'],
				"partner"       => $alipay_config['partner'],
				"seller_id"  => $alipay_config['seller_id'],
				"payment_type"	=> $alipay_config['payment_type'],
				"notify_url"	=> $alipay_config['notify_url'],
				"return_url"	=> $alipay_config['return_url'],
				"_input_charset"	=> trim(strtolower($alipay_config['input_charset'])),
				"out_trade_no"	=> $out_trade_no,
				"subject"	=> $subject,
				"total_fee"	=> $total_fee,
				"show_url"	=> $show_url,
				"body"	=> $body,
				//其他业务参数根据在线开发文档，添加参数.文档地址:https://doc.open.alipay.com/doc2/detail.htm?spm=a219a.7629140.0.0.2Z6TSk&treeId=60&articleId=103693&docType=1
				//如"参数名"	=> "参数值"   注：上一个参数末尾需要“,”逗号。
				
		);
		
		//建立请求
		$alipaySubmit = new AlipaySubmit($alipay_config);
		$html_text = $alipaySubmit->buildRequestForm($parameter,"get", "确认");
		echo $html_text;
		exit();
	}
		
	//功能：支付宝页面跳转同步通知页面
   public function return_url()
   {
		//獲取支付宝配置信息
		$payment_type=$this->payment_type;
		$pay_user=$this->pay_user;
		$pay_code=$this->pay_code;
		$pay_id=$this->pay_id;
		require_once("alipay.config.php");
		require_once("Lib/alipay_notify.class.php");
		$alipayNotify = new AlipayNotify($alipay_config);
		$verify_result = $alipayNotify->verifyReturn();
		if($verify_result)
		{
			$out_trade_no = $_GET['out_trade_no'];
			//支付宝交易号
			$trade_no = $_GET['trade_no'];
			$trade_status = $_GET['trade_status'];
			$this->dopayover($out_trade_no);
		}
		else
		{
			echo "<script>location.href='/?a=payok';</script>";exit();
			echo "<script>location.href='/user/?ty=1&v=2';</script>";
			
		}
		 
   }
		
   //异步通知提醒		
   public function notify_url()
   {
		//獲取支付宝配置信息
		$payment_type=$this->payment_type;
		$pay_user=$this->pay_user;
		$pay_code=$this->pay_code;
		$pay_id=$this->pay_id;
		require_once("alipay.config.php");
		require_once("Lib/alipay_notify.class.php");		
		//计算得出通知验证结果
		$alipayNotify = new AlipayNotify($alipay_config);
		$verify_result = $alipayNotify->verifyNotify();
		if($verify_result)
		{//验证成功
			$out_trade_no = $_POST['out_trade_no'];
			$trade_no = $_POST['trade_no'];
			$trade_status = $_POST['trade_status'];		
			$this->dopayover($out_trade_no);
		}
		else
		{
			//验证失败
			echo "<script>location.href='/user/?ty=1&v=2';</script>";
			//logResult("这里写入想要调试的代码变量值，或其他运行的结果记录");
		}
		exit();   
   }
   
   
   public function dopayover($out_trade_no)
   {
	  $isid=M("order")->where("orderid='$out_trade_no' and paytime='0'")->find();
	  if ($isid)
	  {
		  $data['paytime']=time();
		  $data['pty']=1;
		  $data['del']=0;	
		  M("order")->where("orderid='$out_trade_no'")->save($data);			
		  $data2['del']=1;
		  M("buy")->where ("uid='".$isid['uid']."' and del='0'")->save($data2);	
		  $dsql="uid='".$isid['uid']."' and orderid='$out_trade_no'";			
		  $goodsarr=M("order_goods")->where($dsql)->order("id desc")->find();
		  $adta['del']=0;
		  
		  foreach ($goodsarr as $goods)
		  {
			  $num=$goods['num'];
			  $id=$goods['pid'];
			  $aisid=M("info")->where("id='$id'")->find();	
			  $nownum=$aisid['s6']+$num;
			  $kucun=$aisid['kucun']-$num;
			  if ($aisid)
			  {
				  //更新库存数量
				  $datax['s6']=$nownum;
				  $datax['kucun']=$kucun;
				  M("info")->where("id='$id'")->save($datax);	
			  }
			  M("order_goods")->where("id='".$goods['id']."' and orderid='$out_trade_no'")->save($adta);
		  }
		  
		  //判断是否存在订单赠送积分的记录 如果存在则更新生效状态为生效
		  $uid=$isid['uid'];
		  if ($uid>0)
		  {
				$mtb=M('integral');
				$vo=$mtb->where("uid='$uid' and orderid='$out_trade_no'")->find();
				if (!$vo)
				{
					//新增
					$attr='订单['.$out_trade_no.']获取积分';
					$data2['addtime']=time();
					$data2['audit']=1;
					$data2['uid']=$uid;
					$data2['orderid']=$out_trade_no;
					$data2['type']=1;
					$data2['del']=0;
					$data2['s1']=$isid['jf_num'];
					$data2['attr']=$attr;
					$mtb->add($data2);
				}
				else
				{
					//修改为启用
					$data2['audit']=1;
					$mtb->where("uid='$uid' and orderid='$out_trade_no' and del='0' and audit='0'")->save($data2);
				}
		  }
		  
	  }		
	  echo "<script>location.href='/?a=payok&over';</script>";exit();  
	  echo "验证成功";exit("<script type='text/javascript'>location.href='/user/?ty=1&v=2'</script>");   
   }
   
      

}