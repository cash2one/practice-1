<?php
namespace app\index\controller;
use think\Controller;
error_reporting(E_ERROR | E_WARNING | E_PARSE);
/*
微信端用户操作
 */
class User extends Controller
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
    function _initialize(){
        $config=getconfig();
        $this->assign('sysfig',$config);
        $this->assign('webhost',$_SERVER['HTTP_HOST']);  
        $this->assign('utyname','会员中心');
        $mobtpl="user/";        
        $this->mbtpl=$mobtpl;
        $this->seo();
        $this->assign('mbtpl',$mobtpl);
        $appid=config('APPID');
        $appsecret=config('APPSECRET');
        $apiurl=config('APIURL');
        $home=config('HOME');
        $this->appid=$appid;
        $this->appsecret=$appsecret;
        $this->apiurl=$apiurl;
        $this->home=$home;
        //session('user_id',null);
        $user_id=(int)session('user_id');
        $this->user_id=$user_id;
        $this->assign('user_id',$user_id);
        if($user_id==0)
        {
            $url=$_SERVER['REQUEST_URI'];
            if ($url==str_replace('/user/wlogin','',$url) && $url==str_replace('/user/get_winfo','',$url))
            {
                cookie('gourl',$url);
                $this->wlogin();
                exit;
            }
        }
        else
        {
            $user=M('member')->where("user_id='$user_id'")->find();
            $this->assign('user',$user);
            if ($user['user_name']=='' || $user['isbind']==0)
            {
                session('backurl',$_SERVER['REQUEST_URI']);
            }
        }
    }

    public function seo($lm=0,$id=0)
    {   
        $seo=siteseo($lm,$id);
        $this->assign('title',$seo[0]);
        $this->assign('keywords',$seo[1]);
        $this->assign('description',$seo[2]);
    }

    /*
    用户主页
     */
    public function index()
    {
        $user_id=$this->user_id;
        $user=M('member')->where("user_id='$user_id'")->find();
        if ($user['user_name']=='' || $user['isbind']==0)
        {
            $this->auth();
            exit;
        }
        $mb=$this->mbtpl.'index';
        $htm=$this->fetch($mb);
        echo $htm;
    }

    /*加入购物车操作*/
    public function addcart()
    {
        $mtb1=M('info');
        $mtb2=M('cart');
        $user_id=$this->user_id;
        $time=time();
        $request=\think\Request::instance();
        $id=(int)$request->post('id');
        if ($id==0)
        {
            msg(-1,'产品参数错误');
        }
        $vo=$mtb1->where("id='$id'")->field('id,cntitle,s1')->find();
        if (!$vo)
        {
            msg(-1,'产品参数错误');
        }
        $where="uid='$user_id' and pid='$id'";
        $row=$mtb2->where($where)->find();
        $data['del']=0;
        if ($row)
        {
            if ($row['audit']==0 || $row['del']==1)
            {
                $data['num']=1;
            }
            else
            {
                $data['num']=$row['num']+1;
            }
            $data['time']=$time;
            $data['cntitle']=$vo['cntitle'];
            $data['price']=$vo['s1'];
            $mtb2->where($where)->save($data);
        }
        else
        {
            $data['uid']=$user_id;
            $data['pid']=$id;
            $data['num']=1;
            $data['time']=$time;
            $data['cntitle']=$vo['cntitle'];
            $data['price']=$vo['s1'];
            $mtb2->add($data);
        }
        msg(1,'产品购买成功','/user/buy');

    }

    /*移除购物车*/
    public function removecart()
    {
        $mtb1=M('info');
        $mtb2=M('cart');
        $user_id=$this->user_id;
        $time=time();
        $request=\think\Request::instance();
        $id=(int)$request->post('id');
        if ($id==0)
        {
            msg(-1,'产品参数错误');
        }
        $vo=$mtb1->where("id='$id'")->field('id,cntitle,s1')->find();
        if (!$vo)
        {
            msg(-1,'产品参数错误');
        }
        $where="uid='$user_id' and pid='$id'";
        $row=$mtb2->where($where)->find();
        if ($row)
        {
            $data['time']=$time;
            $data['del']=1;
            $mtb2->where($where)->save($data);
        }
        msg(1,'操作成功');
    }

    /*修改购物车*/
    public function updatecart()
    {
        $mtb1=M('info');
        $mtb2=M('cart');
        $user_id=$this->user_id;
        $time=time();
        $request=\think\Request::instance();
        $id=(int)$request->post('id');
        $num=(int)$request->post('num');
        if ($id==0)
        {
            msg(-1,'产品参数错误');
        }
        $vo=$mtb1->where("id='$id'")->field('id,cntitle,s1')->find();
        if (!$vo)
        {
            msg(-1,'产品参数错误');
        }
        $where="uid='$user_id' and pid='$id'";
        $row=$mtb2->where($where)->find();
        $data['del']=0;
        $data['audit']=1;
        if ($row)
        {
            $data['time']=$time;
            if ($num==0)
            {
                /*如果数量为0 即删除*/
                $data['del']=1;
            }
            $data['num']=$num;
            $data['cntitle']=$vo['cntitle'];
            $data['price']=$vo['s1'];
            $mtb2->where($where)->save($data);
        }
        msg(1,'操作成功');
    }


    /*购物车*/
    public function buy()
    {
        $mtb2=M('cart');
        $user_id=$this->user_id;
        $where="uid='$user_id' and audit='1' and del='0'";
        $list=$mtb2->where($where)->order('id asc')->select();
        $this->assign('list',$list);

        $this->assign('utyname','购物车');
        $mb=$this->mbtpl.'buy';
        $htm=$this->fetch($mb);
        echo $htm;
    }

    /*订单结算*/
    public function cart()
    {
        $mtb2=M('cart');
        $user_id=$this->user_id;
        $where="uid='$user_id' and audit='1' and del='0'";
        $list=$mtb2->where($where)->order('id asc')->select();
        $this->assign('list',$list);

        $this->assign('utyname','订单结算');
        $mb=$this->mbtpl.'cart';
        $htm=$this->fetch($mb);
        echo $htm;
    }

    /*更新订单结算表选择的产品 把非选中的产品移除购物车*/
    public function updatebuy()
    {

        $mtb2=M('cart');
        $user_id=$this->user_id;
        $request=\think\Request::instance();
        $id=(int)$request->post('id');
        $num=(int)$request->post('num');
        if ($id==0)
        {
            msg(-1,'e11001');
        }
        $data2['del']=0;
        $data2['num']=$num;
        $data2['audit']=1;
        $where="uid='$user_id' and pid='$id'";
        $mtb2->where($where)->save($data2);

    }

    public function updatebuy2()
    {
        $mtb2=M('cart');
        $user_id=$this->user_id;
        $request=\think\Request::instance();
        $idstr=$request->post('id');
        if ($idstr=='')
        {
            msg(-1,'e11001');
        }
        $data1['del']=1;
        $data2['del']=0;
        $data2['audit']=1;
        $where="uid='$user_id' and audit='1' and pid not in($idstr) and del='0'";
        $mtb2->where($where)->save($data1);

/*        $where="uid='$user_id' and pid in($idstr)";
        $mtb2->where($where)->save($data2);*/

    }

    /*写入购买产品服务订单结算表 订单表 订单明细表 同时要新增一个使用记录表来记录消费使用的情况*/
    public function savecart()
    {
        $sysfig=getconfig();
        $mtb2=M('cart');
        $mtb1=M('info');
        $user_id=$this->user_id;
        $where="uid='$user_id' and audit='1' and del='0'";
        $list=$mtb2->where($where)->order('id asc')->select();
        /*遍历下单信息 写入订单明细表 然后写入订单表 如果需要支付则进入微信支付界面 如果不需要支付则进入订单列表管理页*/
        if (count($list)==0)
        {
            msg(-1,'提交失败');
        }
        /*定义订单编号*/
        $request=\think\Request::instance();
        $orderid=$user_id.'-'.date('Ymdhis');
        $bz=$request->post('bz');
        $jf=(int)$request->post('jf');/*使用积分*/
        $yh_id=(int)$request->post('yhq');/*使用优惠券*/     
        $time=time();

        $data['time']=$time;
        $data2['time']=$time;
        $data['uid']=$user_id;
        $data2['uid']=$user_id;
        $data['orderid']=$orderid;
        $data2['orderid']=$orderid;
        $data2['bz']=$bz;
        $data2['jf']=$jf;

        $mtb3=M('order');
        $mtb4=M('order_goods');
        $mtbu=M('member');

        foreach ($list as $ky)
        {
            $vo=$mtb1->where("id='".$ky['pid']."'")->field('id,cntitle,img,s1,fid,fidpath')->find();
            $allmoney+=$vo['s1']*$ky['num'];
            $allnum+=$ky['num'];
            /*写入订单明细表*/
            $data['ty']=1;
            $data['pid']=$ky['pid'];
            $data['cntitle']=$vo['cntitle'];
            $data['img']=$vo['img'];
            $data['price']=$vo['s1'];
            $data['num']=$ky['num'];
            $data['snum']=$ky['num'];
            $data['fid']=$vo['fid'];
            $data['fidpath']=$vo['fidpath'];
            $mtb4->add($data);
        }
        /*写入订单表*/
        $data2['ty']=1;/*订单类型 产品服务类型的订单*/
        $data2['num']=$allnum;
        $data2['snum']=$allnum;
        $data2['money']=$allmoney;
        $data2['payjf']=$jf;

        $uinfo=$mtbu->where("user_id='$user_id'")->find();
        $data2['truename']=$uinfo['truename'];
        $data2['phone']=$uinfo['phone'];
        $data2['yh_money']=0;
        $mtb6=M('user_yh');
        $dtime=strtotime(date('Y-m-d'));
        $where2="id='$yh_id' and uid='$user_id' and audit='0' and del='0' and usemoney<='$allmoney' and endtime>='$dtime'";
        $voh=$mtb6->where($where2)->find();
        if ($voh)
        {
            $data2['yh_id']=$yh_id;
            $data2['yh_money']=$voh['money'];
            /*更新用户优惠券表未已使用*/
            $data5['audit']=1;
            $data5['usetime']=$time;
            $data5['useorderid']=$orderid;
            $mtb6->where($where2)->save($data5);
        }

        $paymoney=$allmoney-$data2['yh_money']-$jf/10;/*应付金额-优惠券金额-积分抵扣金额*/
        if ($paymoney<0){$paymoney=0;}
        $data2['paymoney']=$paymoney;
        $sjf=$paymoney*$sysfig['cfg_f6']/100;
        $sjf=(int)$sjf;
        $data2['jf']=$sjf;
        /*判断支付金额是否大于0 如果大于0则进入支付界面，否则进入订单管理界面*/
        $gourl='/user/paymoney/'.$orderid.'.html';
        if ($paymoney==0)
        {
            $data['paytime']=$time;
            $gourl='/user/order';
        }
        $mtb3->add($data2);

        $mtb7=M('member');
        /*如果抵扣积分大于0 写入积分记录表 使用积分类型  同时更新用户剩余积分记录为0*/
        if ($payjf>0)
        {
            $data6['jf']=0;
            $mtb7->where("user_id='$user_id'")->save($data6);
            /*写入记录*/
            $data7['ty']=2;
            $data7['uid']=$user_id;
            $data7['num']=$payjf;
            $data7['orderid']=$orderid;
            $data7['time']=$time;
            M('user_jf')->add($data7);
        }
        /*如果赠送积分大于0 写入积分记录表 赠送积分类型 同时用户积分增加获取的积分*/
        if ($sjf>0)
        {
            $mtb7->where("user_id='$user_id'")->setInc('jf',$sjf);
            $mtb7->where("user_id='$user_id'")->setInc('zjf',$sjf);
            /*写入记录*/
            $data7['ty']=1;
            $data7['uid']=$user_id;
            $data7['num']=$sjf;
            $data7['orderid']=$orderid;
            $data7['time']=$time;
            M('user_jf')->add($data7);
        }

        /*删除购物车数据*/
        $where="uid='$user_id' and del='1'";
        $xdata['del']=1;
        $mtb2->where($where)->save($xdata);
        msg(1,'提交成功',$gourl);
    }


    /*写入预约技师订单结算表 订单表 订单明细表 同时要新增一个使用记录表来记录消费使用的情况*/
    public function savecart2()
    {
        $mtb2=M('cart');
        $mtb1=M('info');
        $user_id=$this->user_id;
        $where="uid='$user_id' and audit='1' and del='0'";
        $list=$mtb2->where($where)->order('id asc')->select();
        /*遍历下单信息 写入订单明细表 然后写入订单表 如果需要支付则进入微信支付界面 如果不需要支付则进入订单列表管理页*/
        if (count($list)==0)
        {
            msg(-1,'提交失败');
        }
        /*定义订单编号*/
        $request=\think\Request::instance();
        $orderid=$user_id.'-'.date('Ymdhis');
        $bz=$request->post('bz');
        $jf=(int)$request->post('jf');/*使用积分*/
        $yh_id=(int)$request->post('yhq');/*使用优惠券*/     
        $time=time();

        $data['time']=$time;
        $data2['time']=$time;
        $data['uid']=$user_id;
        $data2['uid']=$user_id;
        $data['orderid']=$orderid;
        $data2['orderid']=$orderid;
        $data2['bz']=$bz;
        $data2['jf']=$jf;

        $mtb3=M('order');
        $mtb4=M('order_goods');

        foreach ($list as $ky)
        {
            $vo=$mtb1->where("id='".$ky['pid']."'")->field('id,cntitle,img,s1,fid,fidpath')->find();
            $allmoney+=$vo['s1']*$ky['num'];
            $allnum+=$ky['num'];
            /*写入订单明细表*/
            $data['ty']=2;
            $data['pid']=$ky['pid'];
            $data['cntitle']=$vo['cntitle'];
            $data['img']=$vo['img'];
            $data['price']=$vo['s1'];
            $data['num']=$ky['num'];
            $data['snum']=$ky['num'];
            $data['fid']=$vo['fid'];
            $data['fidpath']=$vo['fidpath'];
            $mtb4->add($data);
        }
        /*写入订单表*/
        $data2['ty']=2;/*订单类型 产品服务类型的订单*/
        $data2['num']=$allnum;
        $data2['snum']=$allnum;
        $data2['money']=$allmoney;
        $data2['payjf']=$jf;

        $data2['yh_money']=0;
        $mtb6=M('user_yh');
        $dtime=strtotime(date('Y-m-d'));
        $where2="id='$yh_id' and uid='$user_id' and audit='0' and del='0' and usemoney<='$allmoney' and endtime>='$dtime'";
        $voh=$mtb6->where($where2)->find();
        if ($voh)
        {
            $data2['yh_id']=$yh_id;
            $data2['yh_money']=$voh['money'];
            /*更新用户优惠券表未已使用*/
            $data5['audit']=1;
            $data5['usetime']=$time;
            $data5['useorderid']=$orderid;
            $mtb6->where($where2)->save($data5);
        }

        $paymoney=$allmoney-$data2['yh_money']-$jf/10;/*应付金额-优惠券金额-积分抵扣金额*/
        $data2['paymoney']=$paymoney;
        $sjf=$paymoney*$sysfig['cfg_f6']/100;
        $sjf=(int)$sjf;
        $data2['jf']=$sjf;
        /*判断支付金额是否大于0 如果大于0则进入支付界面，否则进入订单管理界面*/
        $gourl='/user/order';
        if ($paymoney>0)
        {
            $data['paytime']=$time;
            $gourl='/user/pay/'.$orderid;
        }
        $mtb3->add($data2);

        $mtb7=M('member');
        /*如果抵扣积分大于0 写入积分记录表 使用积分类型  同时更新用户剩余积分记录为0*/
        if ($payjf>0)
        {
            $data6['jf']=0;
            $mtb7->where("user_id='$user_id'")->save($data6);
            /*写入记录*/
            $data7['ty']=2;
            $data7['uid']=$user_id;
            $data7['num']=$payjf;
            $data7['orderid']=$orderid;
            $data7['time']=$time;
            M('user_jf')->add($data7);
        }
        /*如果赠送积分大于0 写入积分记录表 赠送积分类型 同时用户积分增加获取的积分*/
        if ($sjf>0)
        {
            $mtb7->where("user_id='$user_id'")->setInc('jf',$sjf);
            $mtb7->where("user_id='$user_id'")->setInc('zjf',$sjf);
            /*写入记录*/
            $data7['ty']=1;
            $data7['uid']=$user_id;
            $data7['num']=$sjf;
            $data7['orderid']=$orderid;
            $data7['time']=$time;
            M('user_jf')->add($data7);
        }

        /*删除购物车数据*/
        $where="uid='$user_id' and del='1'";
        $xdata['del']=1;
        $mtb2->where($where)->save($xdata);
        msg(1,'提交成功',$gourl);
    }


    /*积分*/
    public function jf()
    {
        $this->assign('utyname','我的积分');
        $mb=$this->mbtpl.'jifen';
        $htm=$this->fetch($mb);
        echo $htm;
    }

    /*积分明细*/
    public function jfinfo()
    {
        $user_id=$this->user_id;
        $request=\think\Request::instance();
        $mtb=M('user_jf');
        $where="uid='$user_id'";
        $ty=(int)$request->get('ty');
        if ($ty>0)
        {
            $where.=" and ty='$ty'";
        }
        $list=$mtb->where($where)->order('id desc')->limit(500)->select();
        $this->assign('list',$list);
        $this->assign('ty',$ty);
        $this->assign('utyname','我的积分');
        $mb=$this->mbtpl.'jfinfo';
        $htm=$this->fetch($mb);
        echo $htm;
    }

    /*领取优惠券1 50元优惠券 关注的用户赠送 满599元可以使用*/
    public function yh1()
    {
        $user_id=$this->user_id;
        $user=M('member')->where("user_id='$user_id'")->find();
        if ($user['user_name']=='' || $user['isbind']==0)
        {
            msg(-1,'请先绑定手机号');
        }
        $gz=(int)$this->isguanzhu($user['openid']);
        if ($gz==0)
        {
            msg(-1,'请先关注微信公众号');
        }
        /*判断是否领取 如果没有领取则写入*/
        $mtb=M('user_yh');
        $where="uid='$user_id' and ty='1'";
        $vo=$mtb->where($where)->field('id')->find();
        if (!$vo)
        {
            $data['uid']=$user_id;
            $data['ty']=1;
            $data['usemoney']=599;
            $data['money']=50;
            $data['time']=time();
            $data['endtime']=strtotime(date('Y-m-d'))+365*24*3600;
            $mtb->add($data);
            msg(1,'领取成功');
        }
        else
        {
            msg(-1,'领取失败，请勿重复领取');
        }

    }



    /*领取优惠券2 30元优惠券 推荐5位用户关注赠送 满399元可以使用*/
    public function yh2()
    {
        $user_id=$this->user_id;
        $user=M('member')->where("user_id='$user_id'")->find();
        if ($user['user_name']=='' || $user['isbind']==0)
        {
            msg(-1,'请先绑定手机号');
        }
        $gz=(int)$this->isguanzhu($user['openid']);
        if ($gz==0)
        {
            msg(-1,'请先关注微信公众号');
        }
        /*判断推荐用户是否大于等于5人*/
        $mtb=M('member');
        $where="tjid='$user_id'";
        $count=(int)$mtb->where($where)->count();
        if ($count<5)
        {
            msg(-1,'推荐用户人数小于5');
        }
        else
        {
            /*判断是否领取 如果没有领取则写入*/
            $mtb=M('user_yh');
            $where="uid='$user_id' and ty='2'";
            $vo=$mtb->where($where)->field('id')->find();
            if (!$vo)
            {
                $data['uid']=$user_id;
                $data['ty']=1;
                $data['usemoney']=399;
                $data['money']=30;
                $data['time']=time();
                $data['endtime']=strtotime(date('Y-m-d'))+365*24*3600;
                $mtb->add($data);
                msg(1,'领取成功');
            }
            else
            {
                msg(-1,'领取失败，请勿重复领取');
            }
        }
    }

    /*领取优惠券3 领取后台发布的优惠券*/
    public function yh3()
    {
        $user_id=$this->user_id;
        $user=M('member')->where("user_id='$user_id'")->find();
        if ($user['user_name']=='' || $user['isbind']==0)
        {
            msg(-1,'请先绑定手机号');
        }

        /*判断是否领取*/
        $request = \think\Request::instance();
        $id=(int)$request->post('id');
        $mtb=M('user_yh');
        $where="uid='$user_id' and pid='$id' and ty='3'";
        $count=(int)$mtb->where($where)->count();
        if ($count>0)
        {
            msg(-1,'领取失败，请勿重复领取');
        }
        else
        {
            $datetime=strtotime(date('Y-m-d'))-1;
            $vo=M('info')->where("id='$id' and audit='1' and del='0' and time_end>'$datetime'")->field('audit,id,maxmoney,dkmoney,time_start,time_end')->find();
            if (!$vo)
            {
                msg(-1,'领取失败');        
            }
            $data['uid']=$user_id;
            $data['pid']=$id;
            $data['ty']=3;
            $data['usemoney']=$vo['maxmoney'];
            $data['money']=$vo['dkmoney'];
            $data['time']=time();
            $data['start_time']=$vo['time_start'];
            $data['endtime']=$vo['time_end'];
            $mtb->add($data);
            msg(1,'领取成功');
        }
    }



    /*资料*/
    public function info()
    {
        $user_id=$this->user_id;
        $user=M('member')->where("user_id='$user_id'")->find();
        if ($user['user_name']=='' || $user['isbind']==0)
        {
            $this->auth();
            exit;
        }
        $this->assign('utyname','我的资料');
        $mb=$this->mbtpl.'info';
        $htm=$this->fetch($mb);
        echo $htm;
    }
    
    /*
    修改资料
     */
    public function saveinfo()
    {
        $user_id=$this->user_id;
        checkrefer();
        $mtb=M('member');
        $user=$mtb->where("user_id='$uid'")->find();
        $request = \think\Request::instance();
        //$sex=$request->post('sex/s');
        $truename=$request->post('truename/s');
        $phone=$request->post('phone/s');
        $birthday=$request->post('birthday/s');
        $address=$request->post('address/s');
        if ($truename=='' || $phone=='')
        {
            msg(-1,'请认真填写信息');
        }
        //$data["sex"] = msubstr($sex,0,10);
        //if ($user['truename']!='')
        //{
            $data["truename"]= msubstr($truename,0,20);
        //}
        if ($user['phone']=='')
        {
            $data["phone"]= msubstr($phone,0,20);
        }
        $data["birthday"]= msubstr($birthday,0,35);
        $data["address"] = msubstr($address,0,55);
        $mtb=M('member');
        $vo=$mtb->where("(user_name='$phone' or phone='$phone') and user_id!='$user_id'")->field('user_id')->find();
        if ($vo)
        {
            msg(-1,'手机号已使用，请更换');
        }
        $mtb->where("user_id='$user_id'")->save($data);
        msg(1,'更新成功','/user/info');
    }

    /**
     * *发送用户认证的验证码 首先是没有验证的用户才发送 已验证的不能发送
     * @return [rs] [发送结果]
     */
    public function sms()
    {
        $uid=$this->user_id;
        $mtb=M('member');
        $user=$mtb->where("user_id='$uid'")->find();
        //已绑定
        if ($user['isbind']==1)
        {
            exit('01');
        }
        $request = \think\Request::instance();
        $tel=$request->post('tel/s');
        if (!isPhone($tel))
        {
            exit('02');
        }
        /*首先验证手机号是否已经绑定*/       
        $mtb2=M('rsms');
        $where="user_name='$tel' or phone='$tel'";
        $vo=$mtb->where($where)->field('user_id')->find();
        if ($vo)
        {
            exit('cc');
        }

        /*限制一个用户最多发送20次验证码 而且号码最多不超过5个*/
        $where1="uid='$uid' and rs='1'";
        $count=(int)$mtb2->where($where1)->count();
        if ($count>=20)
        {
            exit('03');
        }
        /*限制一个用户最多只能更换5个不同的手机号*/
        $count2=(int)$mtb2->distinct(true)->field('tel')->where($where1)->count();
        if ($count2>=5)
        {
            exit('04');
        }

        /*发送验证码*/
        $wrnd=randomnum(5);
        $content='您本次用户认证的短信验证码是['.$wrnd.'] 【美丽莎】';        
        $rs=xtsms($tel,$content);
        
        //写入发送短信记录
        $data['uid']=$uid;
        $data['tel']=$tel;
        $data['x1']=$wrnd;
        $data['addtime']=time();
        $data['ip']=GetIP();
        $data['rs']=$rs;
        $mtb2->add($data);
        echo $rs;
    }

    /**
     * 执行用户认证
     * *
     */
    public function saveauth()
    {
        $uid=$this->user_id;
        $mtb=M('member');
        $user=$mtb->where("user_id='$uid'")->find();
        //已绑定
        if ($user['isbind']==1)
        {
           msg(-1,'已绑定，不能重复绑定');
        }
        $request = \think\Request::instance();
        $tel=$request->post('phone/s');
        $truename=$request->post('truename/s');
        $tcode=$request->post('tcode/s');
        if (!isPhone($tel))
        {
             msg(-1,'手机号码格式错误');
        }
        if ($tel=='' || $tcode=='')
        {
             msg(-1,'信息填写错误');
        }
        /*首先验证手机号是否已经绑定*/       
        $mtb2=M('rsms');
        $where="user_name='$tel' or phone='$tel'";
        $vo=$mtb->where($where)->field('user_id')->find();
        if ($vo)
        {
             msg(-1,'手机号已存在，请更换');
        }

        /*验证短信号码是否正确*/
        $where1="tel='$tel'";
        $vos=$mtb2->where($where1)->order('id desc')->find();
        if (!$vos || $vos['x1']!=$tcode || $vos['audit']==1)
        {
            msg(-1,'验证码错误');
        }

        /*更新已验证*/
        $where2="id='".$vos['id']."'";
        $data1['audit']=1;
        $mtb2->where($where2)->update($data1);

        /*绑定用户资料 同时更改绑定的状态*/
        $data2['isbind']=1;
        $data2['isbind_time']=time();
       // $data2['truename']=$truename;
        $data2['user_name']=$tel;
        $data2['phone']=$tel;
        $mtb->where("user_id='$uid'")->update($data2);
        msg(1,'绑定成功','/user/index');
    }


    /*认证*/
    public function auth()
    {
        $user_id=$this->user_id;
        $user=M('member')->where("user_id='$user_id'")->find();
        if ($user['isbind']==1)
        {
            $url=session('backurl');
            Gourl($url);
            exit;
        }
        $this->assign('utyname','用户认证');
        $mb=$this->mbtpl.'auth';
        $htm=$this->fetch($mb);
        echo $htm;
    }


    /*订单管理*/
    public function order()
    {

        $user_id=$this->user_id;
        $mtb=M('order');
        $where="uid='$user_id' and del='0'";        
        $request = \think\Request::instance();
        $key=$request->get('k/s');
        $key=str_replace('%','',$key);
        $key=str_replace('"','',$key);
        $key=str_replace("'","",$key);
        if ($key!='')
        {
            $where2=$where." and cntitle like '%$key%'";
            $arr=M('order_goods')->where($where2)->field('orderid')->select();
            foreach ($arr as $ky)
            {
                $idlist[]=$ky['orderid'];
            }            
            if ($arr)
            {
                $idlist=implode(',',$idlist);
                $where.=" and (orderid like '%$key' or FIND_IN_SET(orderid,'$idlist'))";
            }
            else
            {
                $where.=" and (orderid like '%$key')";
            }
        }    
        $list=$mtb->where($where)->order('id desc')->limit(500)->select();
        $this->assign('key',$key);
        $this->assign('list',$list);
        $this->assign('utyname','订单管理');
        $mb=$this->mbtpl.'order';
        $htm=$this->fetch($mb);
        echo $htm;
    }

    /*我的预约*/
    public function yuyue()
    {
        $user_id=$this->user_id;
        $mtb=M('order_yuyue');
        $where="uid='$user_id' and del='0' and orderid!='' and audit>'-1'";
        $request=\think\Request::instance();
        $key=$request->get('k');
        $key=str_replace('%','',$key);
        $key=str_replace('"','',$key);
        $key=str_replace(' ','',$key);
        $key=str_replace("'","",$key);
        $timex=strtotime('2017-10-01');
        $timed=strtotime($key);
        if ($key!='')
        {
            if ($timed>$timex)
            {
                $time1=strtotime(date('Y-m-d',$timed));
                $time2=$time1+24*3600;
                $where.=" and yytime>='$time1' and yytime<'$time2'";
                $list=$mtb->where($where)->order('yytime asc')->limit(100)->select();
            }
            else
            {
                $where.=" and cntitle like '%$key%'";
                $list=$mtb->where($where)->order('yytime desc')->limit(300)->select();
            }
        }
        else
        {
            $list=$mtb->where($where)->order('yytime desc')->limit(500)->select();
        }


        

        $this->assign('list',$list);
        $this->assign('utyname','我的预约');
        $mb=$this->mbtpl.'yuyue';
        $htm=$this->fetch($mb);
        echo $htm;
    }


    /*预约服务详情页*/
    public function yyfw()
    {
        $request = \think\Request::instance();
        $id=(int)$request->get('id/s');

        $user_id=$this->user_id;
        $mtb=M('order_goods');
        $where="id='$id' and uid='$user_id' and del='0'";
        $arc=$mtb->where($where)->find();

        $this->assign('id',$arc['pid']);
        $this->assign('yyid',$arc['id']);
        $this->assign('arc2',$arc);
        $this->assign('utyname','预约服务详情');
        $mb=$this->mbtpl.'yyfw';
        $htm=$this->fetch($mb);
        echo $htm;
    }

   /*编辑预约服务详情页*/
    public function yyfw2()
    {
        $request = \think\Request::instance();        
        $edid=(int)$request->get('edid/s');
        $user_id=$this->user_id;
        $mtb2=M('order_yuyue');
        $where2="id='$edid' and uid='$user_id' and del='0'";
        $arc2=$mtb2->where($where2)->find();
        $id=$arc2['pid'];

        $mtb=M('order_goods');
        $where="orderid='".$arc2['orderid']."' and pid='$id' and uid='$user_id' and del='0'";
        $arc=$mtb->where($where)->find();
        $this->assign('id',$arc['pid']);
        $this->assign('yyid',$arc['id']);
        $this->assign('arc2',$arc);
        $this->assign('vof',$arc2);
        $this->assign('edid',$edid);
        $this->assign('utyname','预约服务详情');
        $mb=$this->mbtpl.'yyfw2';
        $htm=$this->fetch($mb);
        echo $htm;
    }

    /*提交预约服务申请*/
    public function yy1save()
    {
        $request = \think\Request::instance();
        $id=(int)$request->post('id');
        $yytime=$request->post('yytime');
        $time=time()+3600*2;
        $dtime=strtotime(date('Y-m-d'));
        $dtime2=$dtime+24*3600;
        $fwjs=(int)$request->post('fwjs');
        $xtime=(int)$request->post('xtime');
        $v=(int)($xtime/2);
        if ($v<10)
        {
            $v='0'.$v;
        }
        $mod=$f%2;
        if ($mod==0)
        {
            $xtime2=$v.':00';
        }
        else
        {
            $xtime2=$v.':30';
        }

        $yys1=strtotime($yytime);
        $yytime2=date('Y-m-d',$yys1);
        $yys2=strtotime($yytime2)+24*3600;        
        $yytime=strtotime($yytime.' '.$xtime2);
        if ($yytime<$time)
        {
            msg(-1,'预约时间至少提前1小时');
        }

        $user_id=$this->user_id;
        $mtb=M('order_goods');
        $where="id='$id' and uid='$user_id' and del='0' and snum>'0'";
        $arc=$mtb->where($where)->find();
        if (!$arc)
        {
            msg(-1,'提交失败~');
        }

        $mtb2=M('info');
        $fwxm=$arc['pid'];
        $where="id='$fwxm' and audit='1' and del='0'";
        $arc2=$mtb2->where($where)->find();
        if (!$arc2)
        {
            msg(-1,'提交失败~');
        }

        $where="id='$fwjs' and audit='1' and del='0'";
        $arc3=$mtb2->where($where)->find();
        if (!$arc3)
        {
            msg(-1,'提交失败~');
        }


        $user=M('member')->where("user_id='$user_id'")->find();
        $mtb=M('order_yuyue');
        $where="uid='$user_id' and pid='".$arc['pid']."' and yytime>'$yys1' and yytime<'$yys2'";
        $s1=$mtb->where($where)->count();
        if ($s1>1)
        {
            msg(-1,'提交失败,一天最多预约2次');
        }

        /*增加同一个服务同一天 同一时间段只能预约一次*/
        $sqla="uid='$user_id' and pid='".$arc['pid']."' and yytime>'$yys1' and yytime<'$yys2'";
        $sqla.=" and ((yytimeint2>'$xtime2' and yytimeint<='$xtime2') or (yytimeint2>'$xtime' and yytimeint<='$xtime'))";
        $s1=$mtb->where($sqla)->count();
        if ($s1>0)
        {
            msg(-1,'提交失败,同一服务同一时间段只能预约一次');
        }

        /*增加判断预约的时间段是否被占用问题*/
        $xtime2=$xtime+$arc2['s2']*2;
        $sql="yy_teacher_id='$fwjs' and yytime>='$yys1' and yytime<'$yys2' and audit='0'";
        $sql.=" and ((yytimeint2>'$xtime2' and yytimeint<='$xtime2') or (yytimeint2>'$xtime' and yytimeint<='$xtime'))";
        $vo2=$mtb->where($sql)->count();
        if ($vo2)
        {
            msg(-1,'提交失败，该时间段已被预约');
        }

        /*写入预约申请记录表*/
        $data['uid']=$user_id;
        $data['orderid']=$arc['orderid'];
        $data['pid']=$arc['pid'];
        $data['truename']=$user['truename'];
        $data['phone']=$user['phone'];
        $data['cntitle']=$arc['cntitle'];
        $data['num']=1;
        $data['yytime']=$yytime;
        $data['yy_teacher_id']=$fwjs;
        $data['yy_teacher_name']=info_ty($data['yy_teacher_id'],0,'cntitle');
        $data['time']=$time-7200; 

        $data['yytimeint']=$xtime;/*开始时间*/
        $data['timeint']=$arc2['s2']*2;/*做多久*/
        $data['yytimeint2']=$xtime2;/*结束时间*/      
        $mtb->add($data);
        msg(1,'预约成功',htmlname(25));
    }



    /*提交预约服务申请*/
    public function yy1save2()
    {
        $request = \think\Request::instance();
        $id=(int)$request->post('id');
        $edid=(int)$request->post('edid');
        $yytime=$request->post('yytime');
        $time=time()+3600*2;
        $dtime=strtotime(date('Y-m-d'));
        $fwjs=(int)$request->post('fwjs');
        $xtime=(int)$request->post('xtime');
        $user_id=$this->user_id;
        $cancel=(int)$request->post('cancel');
        if ($cancel==1)
        {
            $mtb=M('order_yuyue');
            $where="id='$edid' and uid='$user_id' and audit='0'";
            $s1=(int)$mtb->where($where)->count();
            if ($s1==0)
            {
                msg(-1,'提交失败~~');
            }
            $data['audit']=-1;
            $mtb->where($where)->update($data);
            msg(1,'取消预约成功','/mlyy/');
        }
        
        $mtb=M('order_goods');
        $where="id='$id' and uid='$user_id' and del='0' and snum>'0'";
        $arc=$mtb->where($where)->find();
        if (!$arc)
        {
            msg(-1,'提交失败~');
        }

        $mtb2=M('info');
        $fwxm=$arc['pid'];
        $where="id='$fwxm' and audit='1' and del='0'";
        $arc2=$mtb2->where($where)->find();
        if (!$arc2)
        {
            msg(-1,'提交失败~');
        }

        $where="id='$fwjs' and audit='1' and del='0'";
        $arc3=$mtb2->where($where)->find();
        if (!$arc3)
        {
            msg(-1,'提交失败~');
        }

        $v=(int)($xtime/2);
        if ($v<10)
        {
            $v='0'.$v;
        }
        $mod=$f%2;
        if ($mod==0)
        {
            $xtime2=$v.':00';
        }
        else
        {
            $xtime2=$v.':30';
        }
        $yys1=strtotime($yytime);
        $yytime2=date('Y-m-d',$yys1);
        $yys2=strtotime($yytime2)+24*3600;

        $yytime=strtotime($yytime.' '.$xtime2);
        if ($yytime<$time)
        {
            msg(-1,'预约时间至少提前2小时');
        }

        $user=M('member')->where("user_id='$user_id'")->find();
        $mtb=M('order_yuyue');
        $where="id!='$edid' and uid='$user_id' and pid='".$arc['pid']."' and yytime>'$yys1' and yytime<'$yys2'";
        $s1=(int)$mtb->where($where)->count();
        if ($s1>1)
        {
            msg(-1,'已预约，提交失败~~');
        }

        /*增加同一个服务同一天 同一时间段只能预约一次*/
        $sqla="id!='$edid' and uid='$user_id' and pid='".$arc['pid']."' and yytime>'$yys1' and yytime<'$yys2'";
        $sqla.=" and ((yytimeint2>'$xtime2' and yytimeint<='$xtime2') or (yytimeint2>'$xtime' and yytimeint<='$xtime'))";
        $s1=$mtb->where($sqla)->count();
        if ($s1>0)
        {
            msg(-1,'提交失败,同一服务同一时间段只能预约一次');
        }

        /*增加判断预约的时间段是否被占用问题*/
        $xtime2=$xtime+$arc2['s2']*2;
        $sql="id!='$edid' and yy_teacher_id='$fwjs' and yytime>='$yys1' and yytime<'$yys2' and audit='0'";
        $sql.=" and ((yytimeint2>'$xtime2' and yytimeint<='$xtime2') or (yytimeint2>'$xtime' and yytimeint<='$xtime'))";
        $vo2=$mtb->where($sql)->count();
        if ($vo2)
        {
            msg(-1,'提交失败，该时间段已被预约');
        }

        /*写入预约申请记录表*/
        $data['uid']=$user_id;
        $data['orderid']=$arc['orderid'];
        $data['pid']=$arc['pid'];
        $data['truename']=$user['truename'];
        $data['phone']=$user['phone'];
        $data['cntitle']=$arc['cntitle'];
        $data['num']=1;
        $data['yytime']=$yytime;
        $data['yy_teacher_id']=$fwjs;
        $data['yy_teacher_name']=info_ty($data['yy_teacher_id'],0,'cntitle');
        $data['time']=$time-7200; 
        $data['yytimeint']=$xtime;/*开始时间*/
        $data['timeint']=$arc2['s2']*2;/*做多久*/
        $data['yytimeint2']=$xtime2;/*结束时间*/
        $mtb->where("id='$edid'")->update($data);
        msg(1,'修改预约成功',htmlname(25));
    }

    /*提交预约技师 申请*/
    public function yy2save()
    {
        $request = \think\Request::instance();
        $id=(int)$request->post('id');
        $fwxm=(int)$request->post('fwxm');
        $yytime=$request->post('yytime');
        $time=time()+3600*1;
        $fwxm=(int)$request->post('fwxm');
        $xtime=(int)$request->post('xtime');
        $v=(int)($xtime/2);
        if ($v<10)
        {
            $v='0'.$v;
        }
        $mod=$f%2;
        if ($mod==0)
        {
            $xtime2=$v.':00';
        }
        else
        {
            $xtime2=$v.':30';
        }

        $yys1=strtotime($yytime);
        $yytime2=date('Y-m-d',$yys1);
        $yys2=strtotime($yytime2)+24*3600;


        $dtime=strtotime(date('Y-m-d'));
        $dtime2=$dtime+24*3600;
        $yytime=$yytime.' '.$xtime2;
        $yytime=strtotime($yytime);
        if ($yytime<$time)
        {
            msg(-1,'预约时间至少提前1小时');
        }

        //echo $time.'#'.$yytime;
        //exit;
        $user_id=$this->user_id;
        $mtb=M('info');
        $where="id='$fwxm' and audit='1' and del='0'";
        $arc2=$mtb->where($where)->find();
        if (!$arc2)
        {
            msg(-1,'提交失败');
        }
        
        $where="id='$id' and audit='1' and del='0'";
        $arc=$mtb->where($where)->find();
        if (!$arc)
        {
            msg(-1,'提交失败~');
        }
        $user=M('member')->where("user_id='$user_id'")->find();
        $mtb=M('order_yuyue');
        $where="uid='$user_id' and pid='$id' and yytime>'$yys1' and yytime<'$yys2' and del='0'";
        $s1=$mtb->where($where)->count();
        if ($s1>1)
        {
            msg(-1,'提交失败,一天最多预约2次');
        }

        /*增加同一个服务同一天 同一时间段只能预约一次*/
        $sqla="uid='$user_id' and pid='$id' and yytime>'$yys1' and yytime<'$yys2' and del='0'";
        $sqla.=" and ((yytimeint2>'$xtime2' and yytimeint<='$xtime2') or (yytimeint2>'$xtime' and yytimeint<='$xtime'))";
        $s1=$mtb->where($sqla)->count();
        if ($s1>0)
        {
            msg(-1,'提交失败,同一服务同一时间段只能预约一次');
        }


        /*增加判断预约的时间段是否被占用问题*/
        $xtime2=$xtime+$arc2['s2']*2;
        $sql="yy_teacher_id='$id' and yytime>='$dtime' and yytime<'$dtime2' and audit='0' and del='0'";
        $sql.=" and ((yytimeint2>'$xtime2' and yytimeint<='$xtime2') or (yytimeint2>'$xtime' and yytimeint<='$xtime'))";
        $vo2=$mtb->where($sql)->count();
        if ($vo2)
        {
            msg(-1,'提交失败，该时间段已被预约');
        }

        /*写入预约申请记录表*/
        $pid=$arc['id'];
        $where="uid='$user_id' and pid='$fwxm' and snum>'0' and paytime>'0'";
        $orderid=M('order_goods')->where($where)->order('id asc')->value('orderid');
        $data['uid']=$user_id;
        $data['orderid']=$orderid;
        $data['pid']=$fwxm;
        $data['truename']=$user['truename'];
        $data['phone']=$user['phone'];

        $data['cntitle']=$arc2['cntitle'];
        $data['num']=1;
        $data['yytime']=$yytime;
        $data['yy_teacher_id']=$arc['id'];
        $data['yy_teacher_name']=$arc['cntitle'];
        $data['time']=$time-7200;
        $data['yytimeint']=$xtime;/*开始时间*/
        $data['timeint']=$arc2['s2']*2;/*做多久*/
        $data['yytimeint2']=$xtime2;/*结束时间*/

        $mtb->add($data);
        msg(1,'预约成功',htmlname(25));
    }



    /*我的卡券*/
    public function kaquan()
    {

        $user_id=$this->user_id;
        $request = \think\Request::instance();
        $ty=(int)$request->get('ty');
        switch ($ty)
        {
            case 0:
                $mtb=M('user_yh');
                $where="uid='$user_id' and del='0'";
                break;
            case 2:
                $mtb=M('user_yh');
                $datetime=strtotime(date('Y-m-d'));
                $where="uid='$user_id' and del='0' and endtime<'$datetime'";
                break;
            case 1:    
                /*显示可以领取的优惠券*/
                $mtb=M('youhuiquan');
                $datetime=strtotime(date('Y-m-d'))-1;
                $where="time_end>'$datetime' and audit='1' and del='0'";
                break;
        }
        $list=$mtb->where($where)->select();
        $mtb=M('user_yh');
        $datetime=strtotime(date('Y-m-d'));
        $where="uid='$user_id' and del='0' and endtime<'$datetime'";
        $s2=$mtb->where($where)->count();
        $this->assign('list',$list);
        $this->assign('ty',$ty);
        $this->assign('s2',$s2);
        $this->assign('utyname','我的卡券');
        $mb=$this->mbtpl.'kaquan';
        $htm=$this->fetch($mb);
        echo $htm;
    }

    /*管理用户扫描客户预约二维码*/
    public function saomiao()
    {
        /*参数 qrcode=预约的ID*/
        $user_id=$this->user_id;
        $mod=M('member');
        $where="user_id='$user_id' and saomiao='1' and del='0'";
        $vo=$mod->where($where)->field('saomiao')->find();
        if (!$vo)
        {
            /*扫描失败 权限不足 直接显示扫描失败 没有权限*/
            $sm_result=0;
            $sm_alt='您没有扫描的权限';
        }
        else
        {
            /*有扫描的权限 判断预约是否存在 同时预约必须是当天的预约*/
            $mod2=M('order_yuyue');
            $request=\think\Request::instance();
            $id=$request->get('id');
            $orderid=$request->get('oid');
            $date=date('Y-m-d');
            $time1=strtotime($date);
            $time2=$time1+24*3600;
            $where="id='$id' and orderid='$orderid' and yytime>'$time1' and yytime<'$time2'";
            $vo=$mod2->where($where)->field('id')->find();
            if (!$vo)
            {
                $sm_result=0;
                $sm_alt='二维码错误';
            }
            else
            {
                $data['audit']=1;
                $data['usetime']=time();
                $where2=$where." and audit='0' and usetime='0'";
                $mod2->where($where2)->update($data);
                $sm_result=1;
                $sm_alt='扫描成功';
            }
        }
        $this->assign('sm_result',$sm_result);
        $this->assign('sm_alt',$sm_alt);
        $mb=$this->mbtpl.'saomiao';
        $htm=$this->fetch($mb);
        echo $htm;
    }



    /*判断用户是否关注*/
    public function isguanzhu($openid)
    {
        $access_token = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=".$this->appid."&secret=".$this->appsecret."";
        $access_msg = json_decode(file_get_contents($access_token));
        $token = $access_msg->access_token;
        $subscribe_msg = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=$token&openid=".$openid;
        $subscribe = json_decode(file_get_contents($subscribe_msg));
        $gz = $subscribe->subscribe;
        return $gz;
    }

    public function wlogin()
    {
        $weburl=$this->home."whome/user/get_winfo";
        $url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid='.$this->appid.'&redirect_uri='.$weburl.'&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect';
        Gourl($url);
    }
    /*获取微信用户资料*/
    public function get_winfo()
    {
        $code=$_GET['code'];
        $token_url = $this->apiurl.'sns/oauth2/access_token?appid='.$this->appid.'&secret='.$this->appsecret.'&code='.$code.'&grant_type=authorization_code';
        $tokens = file_get_contents($token_url);
        $token = json_decode($tokens);
        $opendid= $token->openid;
        $token0=$token->refresh_token;
/*        echo '<pre>';
        print_r($token);
        echo '{1}<br/>';*/
        
        //f2这里的token用户获取用户的详细资料
        $token_url2='https://api.weixin.qq.com/sns/oauth2/refresh_token?appid='.$this->appid.'&grant_type=refresh_token&refresh_token='.$token0;
        $token = json_decode(file_get_contents($token_url2));
        $access_token2 = $token->access_token;

        $info_url='https://api.weixin.qq.com/sns/userinfo?access_token='.$access_token2.'&openid='.$opendid.'&lang=zh_CN';
        $info = json_decode(file_get_contents($info_url));

        $nickname = $info->nickname;
        $photo= $info->headimgurl;
        $subscribe=(int)$info->subscribe;
        $third_num=3;
        $third_name=$nickname;
        $area=$info->province.' '.$info->city;
        $sex=$info->sex;
        switch ($sex) {
            case '1':
                $sex='男';
                break;
            case '2':
                $sex='女';
                break;
            default:
                $sex='未知';
                break;
        }
        $mtb=M("member");
        $user=$mtb;        
        $isid=$mtb->where("openid='$opendid' and openid!=''")->find();  
        if (!$isid && $opendid!='')
        {
            //首先判断第三方登录
            //如果不存在则创建账号 同时生成openid的coookie用户注册绑定微信账户
            $vo=$user->where("third_num='3' and openid='$openid'")->find();
            if (!$vo)
            {
                $data['third_num']=$third_num;//第三方编号
                $data['third_name']=$third_name;//第三方昵称
                $data['openid']=$opendid;//第三方openid
                $data['wx_photo']=$photo;//第三方头像
                $data['photo']=$photo;
                $data['sex']=$sex;
                $data['wx_sex']=$sex;
                $data['area']=$area;
                $data['nc']=$third_name;    
                $data['subscribe']=$subscribe;  
                //写入其它默认信息
                $addtimex=time();   
                $user_name='';
                $drg5=substr($addtimex,-6);
                $drg55=$drg5;
                $class=1;
                $data["user_name"] = $user_name;
                $data["password"] = md5($drg5.$user_name);
                $data["ip"] = GetIP();
                $data["time"] = $addtimex;
                $data["class"] = $class;
                $data["state"] = 1;
                $data["del"]=0;/*默认为删除状态*/
                $data["wrnd"] = cookie('wxlogin');
                $data['logintime']=time();
                cookie('regwxid',$opendid);
                cookie('wx_photo',$photo);
                cookie('nc',$third_name);
                $user_id=$user->add($data);
                $user_name=$isid['user_name'];
                session('user_id',$user_id);
                session('user_name',$user_name);
            }
        }
        if ($isid)
        {
            if ($isid['del']==0)
            {
                $user_id=$isid['user_id'];
                $user_name=$isid['user_name'];
                $data['wx_photo']=$photo;//第三方头像
                if ($isid['photo']==''){$data['photo']=$photo;}
                if ($isid['nc']==''){$data['nc']=$third_name;}  
                $data['subscribe']=$subscribe;
                $data["wrnd"] = cookie('wxlogin');
                $data['logintime']=time();
                $data['wx_sex']=$sex;
                $data['area']=$area;
                $user_id2=$user->where("user_id='$user_id'")->save($data);
                session('user_id',$user_id);
                session('user_name',$user_name);
            }   
        }
        
        $weburl=cookie('gourl');
        if ($weburl=="" || $weburl!=str_replace('favicon','',$weburl))
        {
            if ($user_id==1)
            {
                //echo $weburl;
                //exit;
            }
            Gourl('/');    
            exit;
        }
        //获取用户数据后返回来源的页面
        Gourl($weburl);
        //return $opendid;            
    }


}
