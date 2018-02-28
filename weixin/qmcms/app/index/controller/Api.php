<?php
namespace app\index\controller;
use think\Controller;

use app\index\model\Order;
use wxpay\database\WxPayUnifiedOrder;
use wxpay\JsApiPay;
use wxpay\NativePay;
use wxpay\PayNotifyCallBack;
use think\Log;
use wxpay\WxPayApi;
use wxpay\WxPayConfig;

error_reporting(E_ERROR | E_WARNING | E_PARSE);
class Api extends Controller
{
    var $config;
    var $mbtpl;
    var $mob_state;
    var $dohtml;
    public $weburl;
    public $nowpage;
    public $appid;
    public $appsecret;
    public $apiurl;
    public $home;
    public $user_id;
    public $uid;
    function _initialize(){
        $config=getconfig();
        $this->assign('sysfig',$config);
        $this->assign('webhost',$_SERVER['HTTP_HOST']);  
        $mobtpl=APP_YY.'/';
        $this->mbtpl=$mobtpl;
        $this->seo();
        $this->mob_state=0;
        $this->nowpage=1;
        $this->dohtml=0;
        $this->weburl='home.html';
        $this->assign('blm',0);
        $this->assign('mbtpl',$mobtpl);
        $user_id=(int)session('user_id');
        $ckname=config('ckname');
        $cookv=cookie($ckname);
        if ($cookv=='')
        {
            $ip=GetIP();
            $cookv=sha1(time().$ip);
            cookie($ckname,$cookv,array('expire'=>30*24*3600));
            /*写入用户记录表*/
            $data['wrnd']=$ckname;
            $data['cook']=$cookv;
            $data['ip']=$ip;
            $data['url']=APP_SURL;
            $data['date']=date('Y-m-d');
            $data['time']=time();
            $data['wrnd']=$ckname;
            $data['uid']=$user_id;
            $uid=M('user')->add($data);            
        }
        else
        {
            $uid=M('user')->where("cook='$cookv'")->value('id');
        }
        $this->uid=$uid;
        $this->user_id=$user_id;
        $this->assign('uid',$uid);
        $this->assign('user_id',$user_id);
    }

    public function seo($lm=0,$id=0)
    {   
        $seo=siteseo($lm,$id);
        $this->assign('title',$seo[0]);
        $this->assign('keywords',$seo[1]);
        $this->assign('description',$seo[2]);
    }

    public function index()
    {
        return time();
    }

    public function qrcode()
    {
        $request = \think\Request::instance();
        $orderid=$request->param('id');
        $this->assign('orderid',$orderid);
        return $this->fetch();
    }

    /*微信支付异步返回 */
    /**
     * 异步接收订单返回信息，订单成功付款后，处理订单状态并批量生成用户的二维码
     * @param int $id 订单编号
     */
    public function notify($id = 0)
    {
        $request = \think\Request::instance();
        $out_trade_no=$request->param('id');  
        $time=time();

        if (!empty($input) && empty($_GET['out_trade_no'])) {
            $obj = simplexml_load_string($input, 'SimpleXMLElement', LIBXML_NOCDATA);
            $data = json_decode(json_encode($obj), true);
            //根据$data处理自己所要的逻辑
        }
        $input = file_get_contents('php://input');
        file_put_contents('log/'.date('Y-m-d').'.txt',$input.'{#'.$out_trade_no.'#}');

        $orderid=$out_trade_no;
        $mtb=M('order');
        $where['orderid']=$orderid;
        $vo=$mtb->where($where)->find();
        if ($vo)
        {
            $data['paytime']=$time;
            $mtb->where($where)->update($data);
            echo "验证成功";
        }
    }

    /**
     * 微信支付使用 JSAPI 的样例
     * @return mixed
     */
    public function wxpayJSAPI()
    {
        $user_id=$this->user_id;
        $user=M('member')->where("user_id='$user_id'")->find();
        if (!$user)
        {
            msg(-1,'data error');
        }
        $openId=$user['openid'];
        $home=config('HOME');
        $orderid=session('orderid');
        $mtb=M('order');
        $where="orderid='$orderid' and uid='$user_id' and del='0'";
        $vo=$mtb->where($where)->find();
        if (!$vo)
        {
            msg(-1,'order error');
        }        
        $info=$vo;
        $paymoney=$info['paymoney'];
        $uid=$user_id;
        $money=$paymoney*100;
        $money=(int)$money;
        if ($user_id==6)
        {
            $money=1;
        }
        $money=1;
        $id=$vo['id'];

        if (isset($id) && $id != 0) {
            //获取用户openid
            $tools = new JsApiPay();
            //$openId = $tools->GetOpenid();
            //echo $openId.'#';
            //统一下单
            $title='订单编号：'.$orderid;
            $input = new WxPayUnifiedOrder();
            $input->setBody($title);
            $input->setAttach($orderid);
            $input->setOutTradeNo($orderid);
            $input->setTotalFee($money);
            $input->setTimeStart(date("YmdHis"));
            $input->setTimeExpire(date("YmdHis", time() + 600));
            $input->setGoodsTag($orderid);
            $input->setNotifyUrl($home."api/notify/id/".$orderid);
            $input->setTradeType("JSAPI");
            $input->setOpenid($openId);

            $order = WxPayApi::unifiedOrder($input);
            $jsApiParameters = $tools->getJsApiParameters($order);
            $this->assign('money', $money);
            $this->assign('ddorderid',$orderid);
            $this->assign('order', $order);
            $this->assign('jsApiParameters',$jsApiParameters);
            return $this->fetch('jsapi');
        }
    }

    public function paymoney()
    {
        $request = \think\Request::instance();
        $orderid=$request->get('orderid');
        $user_id=$this->user_id;
        $mtb=M('order');
        $where="orderid='$orderid' and uid='$user_id' and del='0'";
        $vo=$mtb->where($where)->select();
        if (!$vo)
        {
            msg(-1,'order error');
        }
        session('orderid',$orderid);
        gourl('/api/wxpayJSAPI');
    }

    /**
     * 使用微信支付SDK生成支付用的二维码
     * @param $id
     */
    public function wxpayQRCode($id)
    {
        $orderid=$id;
        $user_id=$this->user_id;
        $user=M('member')->where("user_id='$user_id'")->find();
        if (!$user)
        {
            msg(-1,'data error');
        }
        $home=config('HOME');
        $mtb=M('order');
        $where="orderid='$orderid' and uid='$user_id' and del='0'";
        $vo=$mtb->where($where)->find();
        if (!$vo)
        {
            msg(-1,'order error!');
        }        
        $info=$vo;
        $paymoney=$info['paymoney'];
        $uid=$user_id;
        $money=$paymoney*100;
        $money=(int)$money;
        if ($user_id==6)
        {
            $money=1;
        }
        $id=$vo['id'];
        //$orderid.=time();//测试防止订单编号重复使用
        $notify = new NativePay();
        $input = new WxPayUnifiedOrder();
        $input->setBody('订单-'.$orderid);
        $input->setAttach($orderid);
        $input->setOutTradeNo($orderid);
        $input->setTotalFee($money);
        $input->setTimeStart(date("YmdHis"));
        $input->setTimeExpire(date("YmdHis",time()+600));
        $input->setGoodsTag("QRCode");
        $input->setNotifyUrl($home."api/notify/id/".$orderid);
        $input->setTradeType("NATIVE");
        $input->setProductId($id);
        $result = $notify->getPayUrl($input);
        $url = $result["code_url"];
/*        print_r($input);
        print_r($result);
        echo $url;*/
        //生成二维码
        return qrcodes($url);
    }



}
