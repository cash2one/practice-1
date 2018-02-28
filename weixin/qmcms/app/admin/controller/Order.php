<?php
namespace app\admin\controller;
use app\admin\controller\Comm;
use \think\Db;

class Order extends Comm
{
    function _initialize() {
        parent::_initialize();
        error_reporting(E_ERROR | E_WARNING | E_PARSE);         
        $tbq=config('database.prefix');
        $this->assign('menu_flm',71);
        $this->assign('tbq',$tbq);
        qmcheck('order');
    }
    
    public function index()
    {
        $arc=Db::name('order');
        $request=\think\Request::instance();
        $order=cookie("order_order");
        $assign=$this->assign; 
        $admin=$assign['admin'];
        if ($order=='' || $order=='undefined'){$order='id';}
        $desc=cookie("order_desc");
        if ($desc=='' || $desc=='undefined'){$desc='desc';}
        $audit=(int)$request->get('audit');
        $keys=$request->get('key');
        $this->assign('keys',$keys);
        $this->assign('order',$order);
        $this->assign('desc',$desc);
        $this->assign('audit',$audit);
        if ($keys!=''){$msql2.=" and (`orderid` like '%".$keys."%' or `truename` like '%".$keys."%' or `phone` like '%".$keys."%')";}
        $t1=cookie("order_time1");
        $t2=cookie("order_time2");
        $this->assign('time1',$t1);
        $this->assign('time2',$t2);
        if ($t1!=''){$ts1=$t1." 00:00:01";$msql2.=" and time>=".strtotime($ts1)."";}
        if ($t2!=''){$ts2=$t2." 23:59:59";$msql2.=" and time<=".strtotime($ts2)."";}
        $sql="del='0'";     
        $count = $arc->where($sql.$msql2)->count();
        $pgsize=(int)cookie('T_pgsize');
        if ($pgsize==0){$pgsize=10;}
        $selectpg=selectpg($pgsize);
        $order="`$order` $desc,id asc";
        $prar=['query' => $request->param()];
        $list = $arc->where($sql.$msql2)->order($order)->paginate($pgsize,false,$prar);
        $pagestr=$list->render();
        $pagestr=str_replace('</ul>','',$pagestr);
        $plist=$pagestr."<li>".$selectpg."</li></ul>";
        $this->assign('lists',$list);
        $this->assign('page',$plist);
        $html=$this->fetch();
        return $html;
    }



    public function view()
    {
        $request=\think\Request::instance(); 
        $id=(int)$request->get('id');
        if ($id==0){$act='add';}
        $action='添加';
        $mtb1=Db::name('order');
        $vo=$mtb1->where(" id='$id'")->find();
        if ($vo)
        {
            qmcheck('edit',1);
            $action='修改';
            $act='edit';
            $this->assign('vo',$vo);
        }
        else
        {
            exit;
            qmcheck('add',1);            
            $vo['audit']=1; 
            $this->assign('vo',$vo); 
        }
        $this->assign('id',$id);
        $this->assign('act',$act);             
        $this->assign('action',$action);
        $html=$this->fetch();
        return $html;
    }

    public function save()
    {
        qmcheck('edit',1);
        $id=(int)$_POST['id'];
        $arc=Db::name('order');       
        $assign=$this->assign;
        $vo=$arc->where(" id='$id'")->find();  
        $z1=$_POST['z1'];
        $z2=$_POST['z2'];
        $z3=$_POST['z3'];
        $z4=$_POST['z4'];
        $z5=$_POST['z5'];
        $z6=$_POST['z6'];
        $Qcontent=$_POST['Qcontent'];          
        if(is_null($z1)){$z1='';}
        if(is_null($z2)){$z2='';}
        if(is_null($z3)){$z3='';}
        if(is_null($z4)){$z4='';}
        if(is_null($z5)){$z5='';}
        if(is_null($z6)){$z6='';}
        if(is_null($Qcontent)){$Qcontent='';}

        if ($Qcontent=="")
        {
            msg(-1,'信息错误');
        }       
        $data["Qcontent"] = $Qcontent;
        $data["Qtime"]    = date("Y-m-d H:i:s");       
        if ($vo)
        {
            qmcheck('edit',3);
            //$arc->where('id='.$id.'')->update($data); 
            $from=$_POST['from'];
            msg(1,"编辑成功",$from);
        }
    }

    public function add2()
    {
        $request=\think\Request::instance(); 
        $uid=(int)$request->get('uid');
        $id==0;
        $act='add';
        $action='添加';
        $mtb1=Db::name('member');
        $arc=$mtb1->where(" user_id='$uid'")->find();
        if ($arc)
        {
            $this->assign('arc',$arc); 
        }
        else
        {
            exit;            
        }
        $this->assign('id',$id);
        $this->assign('act',$act);             
        $this->assign('action',$action);
        $html=$this->fetch();
        return $html;
    }

    public function addsave()
    {
        qmcheck('add',1);
        $sysfig=getconfig();
        $uid=(int)$_POST['uid'];
        $arc=Db::name('member');       
        $assign=$this->assign;
        $vo=$arc->where(" user_id='$uid'")->find();  
        $num_arr=$_POST['num'];
        $snum_arr=$_POST['snum'];
        $price_arr=$_POST['price'];        
        $proid=$_POST['proid'];
        $bz=$_POST['bz'];
        $f=0;
        $zsnum=0;
        $znum=0;
        $zmoney=0;
        foreach ($proid as $ky)
        {
            $znum+=$num_arr[$f];
            $zsnum+=$snum_arr[$f];
            $zmoney+=$num_arr[$f]*$price_arr[$f];
            $f++;
        }
        if ($znum<1)
        {
            msg(-1,'信息错误');
        }

        /*定义订单编号*/
        $user_id=$uid;
        $request=\think\Request::instance();
        $orderid=$uid.'-'.date('Ymdhis');
        $bz=$request->post('bz');
        $jf=0;/*使用积分*/
        $yh_id=0;/*使用优惠券*/     
        $time=time();
        $data['time']=$time;
        $data2['time']=$time;
        $data['uid']=$user_id;
        $data2['uid']=$user_id;
        $data['orderid']=$orderid;
        $data2['orderid']=$orderid;
        $data2['bz']=$bz;
        $data2['jf']=$jf;
        $mtb1=M('info');
        $mtb3=M('order');
        $mtb4=M('order_goods');
        $mtbu=M('member');
        $data['ty']=1;
        $f=0;
        foreach ($proid as $ky)
        {
            $cpid=$ky;
            $vo=$mtb1->where("id='$cpid'")->field('id,cntitle,img,s1,fid,fidpath')->find();
            /*写入订单明细表*/            
            $data['pid']=$cpid;
            $data['cntitle']=$vo['cntitle'];
            $data['img']=$vo['img'];
            $data['price']=$price_arr[$f];
            $data['num']=$num_arr[$f];
            $data['snum']=$snum_arr[$f];
            $data['fid']=$vo['fid'];
            $data['fidpath']=$vo['fidpath'];
            $data['paytime']=$time;
            $mtb4->add($data);
            $f++;
        }
        /*写入订单表*/
        
        $data2['cty']=1;
        $data2['ty']=1;/*订单类型 产品服务类型的订单*/
        $data2['num']=$znum;
        $data2['snum']=$zsnum;
        $data2['money']=$zmoney;
        $data2['payjf']=$jf;
        $uinfo=$mtbu->where("user_id='$user_id'")->find();
        $data2['truename']=$uinfo['truename'];
        $data2['phone']=$uinfo['phone'];
        $paymoney=$zmoney-$data2['yh_money']-$jf/10;/*应付金额-优惠券金额-积分抵扣金额*/
        if ($paymoney<0){$paymoney=0;}
        $data2['paymoney']=$paymoney;
        $sjf=$paymoney*$sysfig['cfg_f6']/100;
        $sjf=(int)$sjf;
        $data2['jf']=$sjf;
        $data2['paytime']=$time;
        $mtb3->add($data2);
        $from=$_POST['from'];
        msg(1,"添加成功",$from);
    }



    public function doact()
    {
        $request=\think\Request::instance();
        $_POST=$request->post();
        $action=$request->post('action');
        $info=M('order_yuyue');
        $idstr=$request->post('idstr');
        $idarr=explode(",",$idstr);
        $nums=count($idarr);
        switch ($action)
        {
            case 'Xsave':
                qmcheck('edit',1);
                $bz=$_POST['bz'];  
                $bz=unescape($bz);    
                $num=(int)$_POST['num'];
                $id=(int)$_POST['id'];
                $gid=(int)$_POST['gid'];
                $pid=(int)$_POST['pid'];
                $time=time();
                $data['pid']=$pid;
                $data['num']=$num;
                $data['bz']=$bz;
                $data['audit']=1;
                $data['usetime']=$time;
                
                $mtb=M('order_goods');
                $vog=$mtb->where("id='$gid'")->find();
                if (!$vog)
                {
                   echo "操作失败";
                   exit; 
                }
                if ($vog['snum']<$num)
                {
                   echo "预约人次不能大于".$vog['num'];
                   exit;   
                }
                $vo=$info->where(" id='".$id."'")->find();
                if ($vo)
                {
                    $info->where(" id='".$id."'")->update($data);
                }
                else
                {
                    $uid=$vog['uid'];
                    $orderid=$vog['orderid'];
                    $user=M('member')->where("user_id='$uid'")->find();
                    $data['uid']=$uid;
                    $data['orderid']=$orderid;
                    $data['truename']=$user['truename'];
                    $data['cntitle']=$vog['cntitle'];
                    $data['phone']=$user['phone'];
                    $data['yy_teacher_id']=info_ty($pid,0,'s3');
                    $data['yy_teacher_name']=info_ty($data['yy_teacher_id'],0,'cntitle');
                    $data['yytime']=$time;
                    $data['time']=$time;
                    $info->insertGetId($data);
                }
                $mtb->where("id='$gid'")->setDec('snum',$num);
                M('order')->where("orderid='".$vog['orderid']."'")->setDec('snum',$num); 
                echo "操作成功";
                break;      
        }
    }
    public function attr()
    {
        qmcheck('edit',1);
        $request=\think\Request::instance();
        $_POST=$request->post();
        $_GET =$request->get();
        $id=(int)$_GET["id"];
        $ty=(int)$_GET['ty'];
        $mtb1=M('order_yuyue');
        $mtb2=M('order_goods');
        switch ($ty)
        {
            case 1:
                $action='设置预约已完成';
                $vos=$mtb2->where("id='$id'")->find();
                if (!$vos)
                {
                    exit;
                }
                $date=date('Y-m-d');
                $time1=strtotime($date);
                $time2=$time1+24*3600;
                $where="orderid='".$vos['orderid']."' and pid='".$vos['pid']."' and (yytime>'$time1' and yytime<'$time2')";
                $vo=$mtb1->where($where)->order('id desc')->find();
                if (!$vo)
                {
                    $vo['audit']=1;
                    $vo['id']=0;
                    $vo['num']=1;
                    $vo['bz']='';
                    $action='添加预约服务';
                }
                
                $this->assign('vo',$vo);
                $this->assign('vos',$vos);
                $this->assign('action',$action);
                return $this->fetch('attr_1');
                break;
        }
    }

}