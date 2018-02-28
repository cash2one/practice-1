<?php
import('usercenter.Action.func');
class IndexAction extends Action {
    var $config;
	/*初始化*/
	function _initialize() {
		//checkuser();//验证是否登录
		$config=getconfig();
		$this->sysfig=$config;
		$this->seo();
		$mobtpl="Index/";
		if (isMOB()){$mobtpl="m/";}
		$this->mbtpl=$mobtpl;
		$user_id=(int)$_SESSION['user_id'];
		$this->seo();
		$this->user_id=$user_id;
		$this->user_name=$user_name;
		$this->ls_nid=0;
		$userinfo=M('user')->where('user_id='.$user_id.'')->find();
		$this->user=$userinfo;
		$count=M("buy")->where("uid='$user_id' and del='0'")->sum("num");
		$this->cart_num=(int)$count;
		$this->umod=0;
		$this->from=$_SERVER['HTTP_REFERER'];
		if ( strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false ) {
				$weixin=1;
		}
		$this->weixin=$weixin;
		
		$xxnum=M("websms")->where("uid='$user_id' and del='0' and audit='1' and view='0'")->count();
		if ($xxnum>0)
		{
			$this->xxnum=$xxnum;
		}
		$this->uppl($user_id);
	}
	/*公用设置 seo 底部版权*/
    public function seo($lm=0,$id=0)
	{	
		$seo=siteseo($lm,$id);
		$this->title=$seo[0];
		$this->keywords=$seo[1];
		$this->description=$seo[2];	
    }
	public function gcode()
	{
		return getcode();
	}
	
	//判断订单是否评论
	public function ispl($orderid)
	{
		$mtb=M('order_goods');
		$mtb2=M('comment');
		$s1=$mtb->where("orderid='$orderid'")->count();
		$s2=$mtb2->where("orderid='$orderid'")->count();
		if ($s1>$s2)
		{
			return 0;	
		}
		return 1;
	}
	//批量更新会员 订单是否全部评论
	public function uppl($uid)
	{
		$mtb=M("order");
		$arr=$mtb->where("uid='$uid' and ispl='0' and del='0'")->field("orderid")->select();
		foreach ($arr as $ky)
		{
			$ispl=$this->ispl($ky['orderid']);
			if ($ispl==1)
			{
				$data['ispl']=1;
				$mtb->where("orderid='".$ky['orderid']."'")->save($data);
			}
		}
	}
	
	
    public function index(){
		checkuser();
		$this->seo();
		$k=$this->_get('k');
		$k=trim(str_replace('"','',$k));	
		$k=str_replace(' ','',$k);
		$k=str_replace('%','',$k);
		$k=str_replace("'","",$k);
		$mtb=M("order");
		
		
		$user_id=$this->user_id;
		$arr=$mtb->where("uid='$user_id' and ispl='0' and (zt='2' or zt='3') and del='0'")->count();
		//echo $mtb->GetLastSql();
		$this->num_wpl=$arr;
		$lm=0;$id=0;		
		$uty=(int)$_GET['ty'];
		$uid=(int)$_GET['sid'];
		$xid=(int)$_GET['xid'];
		$pgsize=12;
		$utys=$uty;
		$udo=1;
		$oldpage='uty_'.$uty;
		switch ($uty)
		{
			case 1://会员资料
				$utyname="我的订单";
				$v=$_GET['v'];
				$this->v=$v;
				$this->vid=$v;
				if ($v=='')
				{
					
				$c1=(int)$_GET['c1'];
				$this->c1=$c1;
				$arc=M("order_goods");
				$arc2=M('order');
				$goods=M('order_goods');
				$info=M('info');	
				$list=$arc2->where("uid='$user_id' and zt='0' and paytime='0'")->select();

				/*2017-01-04  更新订单中未支付的订单的金额*/
				foreach ($list as $ky)
				{
					if ($ky['zt']==0 && $ky['paytime']=='0')
					{
						$oid=$ky['orderid'];
						$arrs=$goods->where("orderid='$oid'")->select();
						$change=0;
						foreach ($arrs as $key => $vos) {
							$pid=$vos['pid'];
							$money=$vos['money'];
							$num=$vos['num'];
							$old_price=$vos['price'];
							$nvo=$info->where("id='$pid' and audit='1' and kucun>'0'")->field('kucun,s2')->find();
							$now_price=$nvo['s2'];
							if (($old_price!=$now_price || $nvo['kucun']<$num) && $nvo)
							{
								if ($nvo['kucun']<$num)
								{
									$num=$nvo['kucun'];
									$data['num']=$num;
								}
								$data['price']=$now_price;
								$data['money']=$now_price*$num;
								$data['del']=0;
								$goods->where("orderid='$oid' and pid='$pid'")->save($data);
								$change=1;
							}
							if (!$nvo)
							{
								$data['del']=1;
								$goods->where("orderid='$oid' and pid='$pid'")->save($data);
								$change=1;	
							}
						}

						if ($change==1)
						{
							//统计总金额和产品总数量							
							$jf_bl=$ky['jf_bl'];
							$jf_num=$ky['jf_num'];
							$num=$goods->where("orderid='$oid' and del='0'")->sum('num');
							$money=$goods->where("orderid='$oid' and del='0'")->sum('money');
							$jf_num=$money*$jf_bl/100;
							$jf_num=(int)$jf_num;
							$datas['num']=$num;
							$datas['money']=$money;
							$datas['paymoney']=$money;
							$datas['jf_num']=$jf_num;
							if ($money<=0)
							{
								$datas['money']=0;
								$datas['paymoney']=0;
								$datas['zt']=95;
							}
							$arc2->where("orderid='$oid'")->save($datas);
						}
					}
				}



				$pgsize=5;
				import("@.ORG.Page");
				$otb=C('DB_PREFIX').'order';
				$sql="uid='$user_id' and oty='0' and del='0'";
				//$sql="1=1";
				$arr=M("order")->where($sql2)->select();
				foreach ($arr as $ky)
				{
					$idarr2[]=$ky['orderid'];	
				}
				$idstr2=implode(',',$idarr2);
				$sql.=" and FIND_IN_SET(orderid,'$idstr2')";
				switch ($c1)
				{
					case 1:
						$arr=M("order")->where($sql." and paytime='0'")->select();
						foreach ($arr as $ky)
						{
							$idarr[]=$ky['orderid'];	
						}
						$idstr=implode(',',$idarr);
						$sql.=" and FIND_IN_SET(orderid,'$idstr')";
						$sql3=" and paytime='0'";
						break;
					case 2:
						$arr=M("order")->where($sql." and paytime>'0' and sh_kuaidi=''")->select();
						foreach ($arr as $ky)
						{
							$idarr[]=$ky['orderid'];	
						}
						$idstr=implode(',',$idarr);
						$sql.=" and FIND_IN_SET(orderid,'$idstr')";
						$sql3=" and paytime>'0' and zt='1' and sh_kuaidi!=''";
						break;
					case 3:
						$sql.=" and s3='0'";
						$sql3=" and uid='$user_id' and ispl='0' and (zt='2' or zt='3') and del='0'";
						break;
					case 4:
						$arr=M("order")->where($sql." and paytime>'0' and (zt='3' or zt='2')")->select();
						foreach ($arr as $ky)
						{
							$idarr[]=$ky['orderid'];	
						}
						$idstr=implode(',',$idarr);
						$sql.=" and FIND_IN_SET(orderid,'$idstr')";
						$sql3=" and paytime>'0' and (zt='3' or zt='2')";
						break;
					case 9:
						$arr=M("order")->where($sql." and paytime>'0' and (zt='3' or zt='2')")->select();
						foreach ($arr as $ky)
						{
							$idarr[]=$ky['orderid'];	
						}
						$idstr=implode(',',$idarr);
						$sql.=" and FIND_IN_SET(orderid,'$idstr')";
						$sql3=" and paytime>'0' and (zt='91' or zt='92' or zt='93' or zt='94')";
						break;
				}
				
				$sql="uid='$user_id' and oty='0' and del='0'$sql3";
				$count = $arc2->where($sql)->count();
				$page = new Page($count,$pgsize);
				$plist = $page->show('?ty=1&c1='.$c1);		
				if ($k!=''){$plist = $page->show('?k='.$k.'&ty=1&v='.$v);}	
				$list = $arc2->where($sql)->order('id desc')->limit($page->firstRow.','.$page->listRows)->select();
				//
				//echo $arc2->GetLastSql();
				$this->lists=$list;
				$this->counts=$count;
				$this->page=$plist;
				}
				else
				{
					$vo=M("order")->where("orderid='$v' and del='0'")->find();
					if (!$vo)
					{
						exit('<script>location.href="?ty=1";</script>');
					}
					$goods=M("order_goods")->where("orderid='$v'")->select();
					$this->order=$vo;
					$this->goods=$goods;	
				}
				break;
				
			case 21://会员资料
				$utyname="积分订单";
				$v=$_GET['v'];
				$this->v=$v;
				$this->vid=$v;
				if ($v=='')
				{
					
				$c1=(int)$_GET['c1'];
				$this->c1=$c1;
				$arc=M("order_goods");
				$pgsize=5;
				import("@.ORG.Page");
				$otb=C('DB_PREFIX').'order';
				$sql="uid='$user_id' and oty='1' and del='0'";
				//$sql="1=1";
				$arr=M("order")->where($sql2)->select();
				foreach ($arr as $ky)
				{
					$idarr2[]=$ky['orderid'];	
				}
				$idstr2=implode(',',$idarr2);
				$sql.=" and FIND_IN_SET(orderid,'$idstr2')";
				switch ($c1)
				{
					case 1:
						$arr=M("order")->where($sql." and paytime='0'")->select();
						foreach ($arr as $ky)
						{
							$idarr[]=$ky['orderid'];	
						}
						$idstr=implode(',',$idarr);
						$sql.=" and FIND_IN_SET(orderid,'$idstr')";
						break;
					case 2:
						$arr=M("order")->where($sql." and paytime>'0' and sh_kuaidi=''")->select();
						foreach ($arr as $ky)
						{
							$idarr[]=$ky['orderid'];	
						}
						$idstr=implode(',',$idarr);
						$sql.=" and FIND_IN_SET(orderid,'$idstr')";
						break;
					case 3:
						$sql.=" and s3='0'";
						break;
					case 4:
						$arr=M("order")->where($sql." and paytime>'0' and zt='3'")->select();
						foreach ($arr as $ky)
						{
							$idarr[]=$ky['orderid'];	
						}
						$idstr=implode(',',$idarr);
						$sql.=" and FIND_IN_SET(orderid,'$idstr')";
						break;
				}
				$count = $arc->where($sql)->count();
				$page = new Page($count,$pgsize);
				$plist = $page->show('?ty=1&c1='.$c1);		
				if ($k!=''){$plist = $page->show('?k='.$k.'&ty=1&v='.$v);}	
				$list = $arc->where($sql)->order('id desc')->limit($page->firstRow.','.$page->listRows)->select();
				//echo $arc->GetLastSql();
				$this->lists=$list;
				$this->counts=$count;
				$this->page=$plist;
				}
				else
				{
					$vo=M("order")->where("orderid='$v' and del='0'")->find();
					if (!$vo)
					{
						exit('<script>location.href="?ty=21";</script>');
					}
					$goods=M("order_goods")->where("orderid='$v'")->select();
					$this->order=$vo;
					$this->goods=$goods;	
				}
				break;
			case 2:
				$utyname="我的收藏";
				$arc=M("info");
				$pgsize=6;
				import("@.ORG.Page");
				$fid=1;				
				$sonid=getsonid($fid);
				$sql="fid in (".$sonid.")";
				if ($k!=''){$sql.=" and cntitle like '%$k%'";}
				$sql.=$ssql;		
				$tid='0';
				$arr=M("addf")->where("uid='$user_id' and del='0'")->field("pid")->select();
				foreach ($arr as $ky)
				{
					$tid.=','.$ky['pid'];
				}
				$sql.=" and id in($tid)";				
				$sql.=" and audit=1";
				$count = $arc->where($sql)->count();
				$page = new Page($count,$pgsize);
				$plist = $page->show('?ty=2');		
				if ($k!=''){$plist = $page->show('?ty=2');}	
				$list = $arc->where($sql)->order('sort asc,id desc')->limit($page->firstRow.','.$page->listRows)->select();	
				$this->lists=$list;
				$this->counts=$count;
				$this->page=$plist;
				break;
			case 3:
				$utyname="历史记录";
				$arc=M("info");
				$pgsize=5;
				import("@.ORG.Page");
				$fid=1;				
				$sonid=getsonid($fid);
				$sql="fid in (".$sonid.")";
				if ($k!=''){$sql.=" and cntitle like '%$k%'";}
				$sql.=$ssql;		
				$tid='0';
				$arr=M("view")->where("uid='$user_id' and del='0'")->field("pid")->select();
				foreach ($arr as $ky)
				{
					$tid.=','.$ky['pid'];
				}
				$sql.=" and id in($tid) and audit=1";
				
				$count = $arc->where($sql)->count();
				$page = new Page($count,$pgsize);
				$plist = $page->show('?ty='.$uty);		
				if ($k!=''){$plist = $page->show('?ty=3');}		
				$list = $arc->where($sql)->order('sort asc,id desc')->limit($page->firstRow.','.$page->listRows)->select();	
				$this->lists=$list;
				$this->counts=$count;
				$this->page=$plist;
				break;
			case 4:
				$utyname="购物车";
				$pgsize=6;
				$arc=M("buy");
				$sql=" uid='$user_id' and del='0'";		
				import("@.ORG.Page");					
				$count = $arc->where($sql)->count();
				$page = new Page($count,$pgsize);
				$plist = $page->show('?ty='.$uty);				
				$list = $arc->where($sql)->order('id desc')->limit($page->firstRow.','.$page->listRows)->select();	
						
				$this->lists=$list;
				$this->page=$plist;
				break;
			case 5://个人资料
				$utyname="个人资料";
				break;
			case 8://我的优惠劵
				$utyname="我的优惠劵";
				$arc=M("youhui_info");
				$pgsize=95;
				import("@.ORG.Page");
				$sql="uid='$user_id' and del='0'";
				if ($k!=''){$sql.=" and attr like '%$k%'";}				
				$count = $arc->where($sql)->count();
				$page = new Page($count,$pgsize);
				$plist = $page->show('?ty='.$uty);		
				if ($k!=''){$plist = $page->show('?ty=8&k='.$k);}		
				$list = $arc->where($sql)->order('uaddtime desc,id desc')->limit($page->firstRow.','.$page->listRows)->select();	
				$this->lists=$list;
				$this->counts=$count;
				$this->page=$plist;
				
				break;		
			case 9://个人资料
				$utyname="收货地址管理";
				break;	
			case 11://我的评论
				$this->buying=2;
				$utyname="我的评论";
				$c1=(int)$_GET['c1'];
				$this->c1=$c1;
				$arc=M("order_goods");
				$pgsize=5;
				import("@.ORG.Page");
				$otb=C('DB_PREFIX').'order';
				$sql="uid='$user_id' and oty='0' and del='0' and (zt>'1' and zt<'5')";
				$arr=M("order")->where($sql)->select();
				foreach ($arr as $ky)
				{
					$idarr2[]=$ky['orderid'];	
				}
				$idstr2=implode(',',$idarr2);
				//echo $idstr2;
				$sql="uid='$user_id'  and del='0'";	
				$sql.=" and FIND_IN_SET(orderid,'$idstr2')";	
						
				$count = $arc->where($sql)->count();
				$page = new Page($count,$pgsize);
				$plist = $page->show('?ty=11&c1='.$c1);		
				if ($k!=''){$plist = $page->show('?k='.$k.'&ty=11&v='.$v);}	
				$list = $arc->where($sql)->order('id desc')->limit($page->firstRow.','.$page->listRows)->select();
				//echo $arc->GetLastSql();
				$this->lists=$list;
				$this->counts=$count;
				$this->page=$plist;
				
				
				break;	
			case 14://个人资料
				$utyname="个人中心";
				break;	
				break;	
			case 15://账户提现
				$jmoney=$this->tmoney();
				$this->jmoney=$jmoney;
				$arc=M('money');
				$pgsize=12;
				import("@.ORG.Page");				
				
				$sql="uid='$user_id' and del='0'";	
				$count = $arc->where($sql)->count();
				$page = new Page($count,$pgsize);
				$plist = $page->show('?ty='.$uty);					
				$list=$arc->where($sql)->order('id desc')->limit($page->firstRow.','.$page->listRows)->select();
				//echo "<!--".$arc->GetLastSql()."-->";
				$this->lists=$list;
				$this->page=$plist;
				
				$utyname="账户提现";
				break;		
			case 6://修改密码
				$utyname="修改密码";
				break;
			case 7://消息中心
			
				$utyname="消息中心";
				$pgsize=4;
				$arc=M("websms");
				$sql=" uid='$user_id' and del='0' and audit='1'";		
				import("@.ORG.Page");					
				$count = $arc->where($sql)->count();
				$page = new Page($count,$pgsize);
				$plist = $page->show('?ty='.$uty);				
				$list = $arc->where($sql)->order('id desc')->limit($page->firstRow.','.$page->listRows)->select();	
				$this->counts=$count;
				$this->lists=$list;
				$this->page=$plist;
				$xdata['view']=1;
				foreach ($list as $ky)
				{
					$arc->where("id='".$ky['id']."' and uid='$user_id' and del='0'")->save($xdata);	
				}
				
				$v=$_GET['xid'];
				$this->v=$v;
				$this->xid=$v;
				$c1=(int)$v;
				if ($c1>0)
				{
					$sql=" id='$c1' and uid='$user_id' and del='0' and audit='1'";		
					$article = $arc->where($sql)->find();	
					$this->article=$article;
					if (!$article)
					{
						$this->xid=0;
						$this->v=0;
						exit("<script>location.href='/user/?ty=7';</script>");
					}
				}
				
				break;
			case 22://已生成的订单 重新付款
				$udo=0;
				$this->buying=2;
				$utyname="立即付款";
				$id=$this->srequest2("id");
				$orderid=$this->srequest2('orderid');
				$arc=M("order")->where("orderid='".$orderid."'")->find();
				//echo M("order")->GetLastSql();
				$this->arc=$arc;
				$this->order=$arc;
				if (!$arc)
				{
					exit('<script>location.href="/user/?ucenter";</script>');	
				}
				session('orderid',$arc['orderid']);
				$oldpage='pay';
				$this->lists=$list;
				$this->page=$plist;
				break;

			default:
				$uty=0;
				$oldpage='uty_'.$uty;
				$utyname="会员中心";
				$url="index";
				$user=M('user');
				$ufo=$user->where("user_id='$user_id'")->find();
				$this->ufo=$ufo;


				$arc=M("order_goods");
				$arc2=M('order');
				$goods=M('order_goods');
				$info=M('info');	
				$list=$arc2->where("uid='$user_id' and zt='0' and paytime='0'")->select();
				
				/*2017-01-04  更新订单中未支付的订单的金额*/
				foreach ($list as $ky)
				{
					if ($ky['zt']==0 && $ky['paytime']=='0')
					{
						$oid=$ky['orderid'];
						$arrs=$goods->where("orderid='$oid'")->select();
						$change=0;
						foreach ($arrs as $key => $vos) {
							$pid=$vos['pid'];
							$money=$vos['money'];
							$num=$vos['num'];
							$old_price=$vos['price'];
							$nvo=$info->where("id='$pid' and audit='1' and kucun>'0'")->field('kucun,s2')->find();
							$now_price=$nvo['s2'];
							if (($old_price!=$now_price || $nvo['kucun']<$num) && $nvo)
							{
								if ($nvo['kucun']<$num)
								{
									$num=$nvo['kucun'];
									$data['num']=$num;
								}
								$data['price']=$now_price;
								$data['money']=$now_price*$num;
								$data['del']=0;
								$goods->where("orderid='$oid' and pid='$pid'")->save($data);
								$change=1;
							}
							if (!$nvo)
							{
								$data['del']=1;
								$goods->where("orderid='$oid' and pid='$pid'")->save($data);
								$change=1;	
							}
						}

						if ($change==1)
						{
							//统计总金额和产品总数量							
							$jf_bl=$ky['jf_bl'];
							$jf_num=$ky['jf_num'];
							$num=$goods->where("orderid='$oid' and del='0'")->sum('num');
							$money=$goods->where("orderid='$oid' and del='0'")->sum('money');
							$jf_num=$money*$jf_bl/100;
							$jf_num=(int)$jf_num;
							$datas['num']=$num;
							$datas['money']=$money;
							$datas['paymoney']=$money;
							$datas['jf_num']=$jf_num;
							if ($money<=0)
							{
								$datas['money']=0;
								$datas['paymoney']=0;
								$datas['zt']=95;
							}
							$arc2->where("orderid='$oid'")->save($datas);
						}
					}
				}
				
				$mt=M('comment');				
				$pgsize=6;
				import("@.ORG.Page");				
				$sql="pid='$user_id' and ty='2' and audit='1' and del='0' and hid='0'";
				$count = $mt->where($sql)->count();
				$page = new Page($count,$pgsize);
				$plist = $page->show('');					
				$list=$mt->where($sql)->order('id desc')->limit($page->firstRow.','.$page->listRows)->select();
				$this->lists=$list;
				$this->page=$plist;
				
				
				break;
		}		
		$this->user_id=(int)$this->user_id;
		$this->uty=(int)$utys;
		$this->udo=$udo;
		$this->uid=$uid;
		$this->xid=$xid;
		$this->utyname=$utyname;
		$this->user_name=$this->user_name;
		$htm=$this->fetch($this->mbtpl.$oldpage);
		echo $htm;		
    }
	//优惠劵查询
	public function yhj()
	{
		$user_id=$this->user_id;
		if ($user_id==0){exit();}
		$attr=$this->srequest('k');
		$arc=M("youhui_info");
		$sql="uid='0' and attr='$attr' and del='0'";
		$vo=$arc->where($sql)->find();
		//判断优惠劵是否被使用
		if (!$vo)
		{
			$json = array("status"=>'-1',"message"=>"优惠劵编号错误","url"=>'reload');
			echo json_encode($json);
			exit();
		}	
		//检查优惠劵是否启用
		$arc2=M("youhui");
		$sql2="id='".$vo['yid']."' and audit='1' and del='0'";
		$vo=$arc2->where($sql2)->find();
		//$sql3=$arc2->GetLastSql();
		//判断优惠劵是否被使用
		if (!$vo)
		{
			$json = array("status"=>'-1',"message"=>"优惠劵编号错误!","url"=>'reload');
			echo json_encode($json);
			exit();
		}
		//更新优惠劵的用户id为当前用户id
		$data['uid']=$user_id;
		$data['uaddtime']=time();
		$arc->where($sql)->save($data);		
		$json = array("status"=>'1',"message"=>"优惠劵编号正确！","url"=>'reload');
		echo json_encode($json);
		exit();
	}
	
	
	//操作函数
	public function doact()
	{
		$user_id=$this->user_id;
		if ($user_id==0){exit();}		
		$ty=$this->srequest("ty");
		$id=(int)$this->srequest("id");
		$orderid=$this->srequest("orderid");
		$orderid=$this->srequest("id");
		switch ($ty)
		{
			case 'delorder':
			case 'return9':
				$data['del']=1;
				$vo=M("order")->where("orderid='$orderid' and uid='$user_id'")->find();
				if ($vo && $vo['zt']=='0')
				{	
					M("order")->where("orderid='$orderid' and uid='$user_id'")->save($data);
					M("order_goods")->where("orderid='$orderid' and uid='$user_id'")->save($data);
					if ($vo['pty']==9)
					{
						$datax['usetime']=0;
						//更新兑换状态和兑换时间
						$yhjstr=$vo['yhjstr'];
						$yhjstr=str_replace('][',',',$yhjstr);
						$yhjstr=str_replace(']','',$yhjstr);
						$yhjstr=str_replace('[','',$yhjstr);
						$arr=explode(',',$yhjstr);
						foreach ($arr as $ky)
						{
							M("youhui_info")->where("id='$ky' and uid='$user_id' and usetime>'0' and del='0'")->save($datax);
						}
					}
					//echo M('order')->GetLastSql();
				}
				$json = array("status"=>'1',"message"=>"操作成功","url"=>'reload');
				echo json_encode($json);
				exit();	
				break;
			case 'return991':
				$data['del']=2;//删除订单 人工删除
				if ((int)$id>0)
				{
					M("youhui_info")->where("id='$id' and uid='$user_id'")->save($data);	
				}
				$json = array("status"=>'1',"message"=>"操作成功","url"=>'reload');
				echo json_encode($json);
				exit();	
				break;
				
			case 'return999':
				$data['del']=1;//删除优惠劵
				if ($orderid!='')
				{
					M("order")->where("orderid='$orderid' and uid='$user_id'")->save($data);	
					M("order_goods")->where("orderid='$orderid' and uid='$user_id'")->save($data);
				}
				$json = array("status"=>'1',"message"=>"操作成功","url"=>'reload');
				echo json_encode($json);
				exit();	
				break;	
			case 'return1':
				$data['zt']=91;
				$data['view']=0;
				$order=M("order")->where("orderid='$orderid' and uid='$user_id'")->find();
				if ($order['paytime']>=0)
				{
					M("order")->where("orderid='$orderid'")->save($data);
				}
				//echo M("order")->GetLastSql();
				$json = array("status"=>'1',"message"=>"操作成功","url"=>'reload');
				echo json_encode($json);
				exit();	
				break;
			case 'return2':
				$data['zt']=3;
				$order=M("order")->where("orderid='$orderid' and uid='$user_id'")->find();
				if ($order['paytime']>=0)
				{
					$data['cxtime']=time();
					M("order")->where("orderid='$orderid'")->save($data);
				}
				
				$json = array("status"=>'1',"message"=>"操作成功","url"=>'reload');
				echo json_encode($json);
				exit();	
				break;
				
			case 'return3':
				$data['zt']=2;
				$order=M("order")->where("orderid='$orderid' and uid='$user_id'")->find();
				if ($order['paytime']>=0)
				{
					$data['cxtime']=time();
					M("order")->where("orderid='$orderid'")->save($data);
				}				
				$json = array("status"=>'1',"message"=>"操作成功","url"=>'reload');
				echo json_encode($json);
				exit();	
				break;
				
			case 'time2':
				$addtime2=date('Y-m-d H:i:s');
				$data['addtime2']=$addtime2;
				M("info")->where("id='$id' and vid='$user_id'")->save($data);	
				$json = array("status"=>'1',"message"=>"操作成功","url"=>'reload');
				echo json_encode($json);
				exit();	
				break;
			case 'del2':
				$data['del']=1;
				if ($id==0)
				{
					M("addf")->where("uid='$user_id'")->save($data);	
				}
				else
				{
					M("addf")->where("uid='$user_id' and pid='$id'")->save($data);	
				}
				break;	
			case 'deladd':
				$data['del']=1;
				M("address")->where("uid='$user_id' and id='$id'")->save($data);
					$json = array("status"=>'1',"message"=>"删除成功","url"=>'reload');
					echo json_encode($json);
					exit();	
				break;
			case 'del3':
				$data['del']=1;
				if ($id==0)
				{
					M("view")->where("uid='$user_id'")->save($data);	
				}
				else
				{
					M("view")->where("uid='$user_id' and pid='$id'")->save($data);	
				}
				break;	
			case 'del7':
				$data['del']=1;
				if ($id==0)
				{
					M("websms")->where("uid='$user_id'")->save($data);	
				}
				else
				{
					M("websms")->where("uid='$user_id' and id='$id'")->save($data);	
				}
				$json = array("status"=>'1',"message"=>"删除成功","url"=>'reload');
				echo json_encode($json);
				exit();	
				break;
			case "addf":
				$isid=M("addf")->where("uid='$user_id' and pid='$id'")->find();
				if ($isid)
				{
					$data['del']=1;	
					$json = array("status"=>'1',"message"=>"取消收藏成功","url"=>'reload');
					
					if ($isid['del']==1)
					{
						$data['del']=0;
						$data['addtime']=time();
						$json = array("status"=>'1',"message"=>"收藏成功","url"=>'reload');
					}
					//print_r($json);
					M("addf")->where("uid='$user_id' and pid='$id'")->save($data);	
					echo json_encode($json);
					exit();	
				}
				else
				{
					$data['uid']=$user_id;
					$data['pid']=$id;
					$data['addtime']=time();
					M("addf")->add($data);
					$json = array("status"=>'1',"message"=>"收藏成功","url"=>'reload');
					echo json_encode($json);
					exit();	
				}
				break;	
		}	
	}
	
	//发表的评论
	public function comment()
	{
		$user_id=$this->user_id;
		if ($user_id==0)
		{
			$json = array("status"=>'-1',"message"=>$id."未登录！评论失败");
			echo json_encode($json);
			exit();		
		}		
		$id=(int)$_POST['pid'];
		$pid=(int)$_POST['pid'];
		$hid=(int)$_POST['hid'];
		$ty=(int)$_POST['ty'];
		$content=$this->srequest('content');
		$content=msubstr($content,0,700);
		if ($ty!=2)
		{
			$ty=1;	
		}
		//活动评论
		if ($ty==1)
		{
			$m=M('info');	
			$vo=$m->where("id='$id'")->find();
			if (!$vo)
			{
				$json = array("status"=>'-1',"message"=>$id."评论失败！","url"=>'reload');
				echo json_encode($json);
				exit();		
			}
		}
		else
		{
			//会员评论
			$m=M('user');	
			$vo=$m->where("user_id='$id'")->find();
			if (!$vo)
			{
				$json = array("status"=>'-1',"message"=>"评论失败!!","url"=>'reload');
				echo json_encode($json);
				exit();		
			}				
		}
		$mtb=M('comment');
		$time=time()-60;
		//限制同一个评论id不能大于200 
		$num=$mtb->where("uid='$user_id' and ty='$ty' and pid='$pid' and addtime>'$time'")->count('id');
		if ($num>0)
		{
			$json = array("status"=>'-1',"message"=>"请稍后评论","url"=>'reload');
			echo json_encode($json);
			exit();
		}
		//写入评论
		//如果是会员评论 则自己不能给自己评论 但是可以回复评论 即只能回复评论
		$ishid=$mtb->where("pid='$pid' and id='$hid' and ty='$ty'")->find();
		$fidpath='0';
		$s1=0;
		if ($hid>0)
		{
			$fidpath='[0],['.$hid.']';
			$s1=1;	
		}
		if ($ishid)
		{
			$s1=$ishid['s1']+1;
			$fidpath=$ishid['fidpath'].',['.$hid.']';
		}
		$data['ip']=GetIp();
		$data['uid']=$user_id;
		$data['pid']=$id;
		$data['ty']=$ty;
		$data['hid']=$hid;
		$data['addtime']=time();
		$data['content']=$content;
		$data['fidpath']=$fidpath;
		$data['s1']=$s1;
		$mtb->add($data);
		
		$json = array("status"=>'1',"message"=>"评论成功","url"=>'reload');
		echo json_encode($json);
		exit();
		
	}
	
	
	//立即报名
	public function order()
	{
		$user_id=$this->user_id;
		if ($user_id==0){exit('请登录');}
		echo 'ok';
	}
	
	//购物车
	public function cart()
	{
		$user_id=$this->user_id;
		if ($user_id==0){exit();}		
		$utyname="购物车";
		$this->utyname=$utyname;
		$lists=M("buy")->where ("uid='$user_id' and del='0'")->select();
		$this->lists=$lists;
		$cpage='buy';
		$htm=$this->fetch($this->mbtpl.$cpage);
		echo $htm;
	}
	public function is_weixin()
	{ 
		if ( strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false )
		{
				return true;
		}    
		return false;
	}
	//处理修改订单
	public function dopay()
	{

		$pty=(int)$_POST['pay-d'];//支付
		$adta['sh_bz']=$pty;//支付方式
		if ($this->mbtpl=='m/')
		{
			$pty=1;
			$adta['sh_bz']='3';//手机支付宝支付
			//如果是手机端则自动选择支付方式 如果是微信端则进入微信支付 否则进入支付宝手机支付
			if ($this->is_weixin())
			{
				$pty=2;	
				$adta['sh_bz']='4';//微信原生支付
			}			
		}
		$adta['pty']=$pty;	
		$orderid=session('orderid');
		$vo=M('order')->where("orderid='$orderid'")->find();
		if (!$vo)
		{
			exit('订单错误');
		}
		M('order')->where("orderid='$orderid'")->save($data);
		if ($this->mbtpl!='m/')
		{
			//电脑端的处理
			if ($pty==2)
			{
				exit('<script src="/js/j.js"></script><script>$(".wpay").show();$(".wpay2").hide();$(".wpay").empty().html("<iframe frameborder=\'0\' class=\'wxpay\' scrolling=\'no\' width=\'280\' height=\'280\' src=\'/wxpay/pay/index.php?a=native\'></iframe>")</script>');
			}
			else
			{
				//支付宝支付直接跳转到支付支付的页面
				exit('<script src="/js/j.js"></script>
				<script>
				$(".wpay").hide();
				$(".wpay2").show();
				var ftml="<form id=\'alipayform\' target=\'_blank\' action=\'/alipay/pay/index.php\'></form>";
				//$(".wpay").empty().html(ftml);$("#alipayform").submit();
				</script>');
				//Gourl('/alipay/pay/index.php');		
			}
		}
		else
		{
			//手机端的处理
			if ($pty==1)
			{
				//手机支付宝支付
				$url='/alipay/pay/index.php?a=wapindex';
			}
			else
			{
				//微信jspi支付
				$url='/wxpay/pay/index.php';
			}
			exit('<script>location.href="'.$url.'";</script>');		
		}		
		/*exit('<script>location.href="/user.php?a=pay";</script>');	*/
	}
	
	//支付
	public function pay()
	{
		$user_id=$this->user_id;
		if ($user_id==0){exit();}		
		$utyname="立即支付";
		$this->utyname=$utyname;
		$lists=M("buy")->where ("uid='$user_id' and del='0'")->select();
		$this->lists=$lists;		
		if (!$lists)
		{
			exit('<script>history.go(-1);</script>');	
		}		
		$utyname="立即购买";
		$this->utyname=$utyname;
		$cpage='pay';
		$htm=$this->fetch($this->mbtpl.$cpage);
		echo $htm;
		exit();
	}
	
	//检查是否付款
	public function checkwxpay()
	{
		$user_id=$this->user_id;
		$timex=time()-10;
		if ($user_id>=0)
		{
			$isid=M("order")->where("uid='$user_id' and paytime>'$timex'")->find();
		}
		else
		{
			$user_cid=cookie('user_cid');
			$isid=M("order")->where("uid='0' and cid='$user_cid' and paytime>'$timex'")->find();
		}
		//echo M("order")->GetLastSql();
		if ($isid)
		{
			echo 'ok';	
		}
		exit();
	}
	
	//新增评论
	public function add_comment()
	{
		$user_id=$this->user_id;
		if ($user_id<1)
		{
			$json = array("status"=>'-1',"message"=>"评论失败","url"=>'reload');
			echo json_encode($json);
			exit();
		}
		
		$id=(int)$this->srequest("comment_id");
		$orderid=$this->srequest("orderid");
		$content=$this->srequest('content');		
		$content=msubstr($content,0,500,"utf-8",false);	
		if ($orderid=='' || $content=='' || $id==0)
		{
			$json = array("status"=>'-1',"message"=>$content."评论失败!","url"=>'reload');
			echo json_encode($json);
			exit();
		}
		
		$mtb0=M("order_goods");
		$mtb1=M("info");		
		$vo=$mtb0->where("uid='$user_id' and id='$id'")->find();
		if ($vo)
		{
			$id2=$vo['pid'];	
		}
		else
		{
			$json = array("status"=>'-1',"message"=>"评论失败","url"=>'reload');
			echo json_encode($json);
			exit();	
		}
		$mtb=M("comment");
		$vo=$mtb->where("uid='$user_id' and orderid='$orderid' and pid='$id2'")->find();
		if ($vo)
		{
			$json = array("status"=>'-1',"message"=>"评论失败","url"=>'reload');
			echo json_encode($json);
			exit();
		}
		else
		{
			$data['uid']=$user_id;
			$data['pid']=$id2;
			$data['ty']=1;
			$data['ip']=GetIp();
			$data['audit']=1;
			$data['addtime']=time();
			$data['content']=$content;
			$data['orderid']=$orderid;
			$mtb->add($data);	
			$data2['s3']=1;
			$mtb0->where("uid='$user_id' and id='$id'")->save($data2);			
			$vos=$mtb1->where("id='$id2'")->find();
			$data3['s9']=$vos['s9']+1;
			$mtb1->where("id='$id2'")->save($data3);
			$json = array("status"=>'1',"message"=>"评论成功","url"=>'reload');
			echo json_encode($json);
		}
	}
	
	//提交兑换 填写收货相关信息
	public function exchange()
	{
		$user_id=$this->user_id;
		if ($user_id==0)
		{
			exit();	
		}
		$yhj_id=$this->srequest("checkboxv");
		session('yhjid',$yhj_id);
		$this->display($this->mbtpl."exchange");	
	}
	
	//执行兑换程序
	public function doexchange()
	{
		$user_id=$this->user_id;
		if ($user_id==0)
		{
			exit();	
		}
		//获取优惠劵id
		$yhjid=session('yhjid');
		$address=(int)$_POST['address'];//配送地址 如果是非会员则配送id为0
		$wtype=1;//运送方式
		$yhtype=0;//是否使用优惠劵
		$youhuijuan='';//优惠劵编号
		$sh_bz=$this->srequest("bz");//订单备注	

		$user_cid=0;
		$addr=M("address")->where("id='$address'")->find();
		if (!$addr)
		{
			exit('<script>alert("请选择收货地址！");history.go(-1);</script>');	
		}
		$arearr=explode(',',$addr['addr1']);
		$prv=$arearr[0];
		$prv=str_replace('省','',$prv);
		$prv=str_replace('市','',$prv);
		$sort=M('region')->where("`name` like '$prv%' and `level`=2")->getField("sort");	
		$f=0;		
		$allnum=0;
		$allmoney=0;
		$allyf=0;
		$jtime=1467963113;
		$jtime=1467863113;
		$timed=time()-$jtime;		
		$orderid=$user_id.'-'.$timed;
		if ($user_id==0)
		{
			$orderid=$user_cid.'-'.$timed;
		}	
		$array=explode(',',$yhjid);
		$datay['usetime']=time();
		foreach ($array as $ky)
		{
			$yfo=M('youhui_info')->where("attr='$ky' and uid='$user_id' and usetime='0' and del='0'")->find();
			
			//echo M('youhui_info')->GetLastSql();
			//exit();
			$pid=$yfo['pid'];
			//判断优惠劵是否有效 大于开始时间 小于截止时间
			$time1=strtotime(date('Y-m-d'));
			$time2=strtotime(date('Y-m-d'));
			//$vos=M("youhui")->where("id='".$yfo['yid']."' and s1<='$time1' and s2>='$time2'")->find();
			$vos=M("youhui")->where("id='".$yfo['yid']."' and s2>='$time2'")->find();
			//echo M("youhui")->GetLastSql();
			//exit();
			if ($vos)
			{
				$yhjstr.='['.$yfo['id'].']';
				M("youhui_info")->where("attr='$ky' and uid='$user_id' and usetime='0' and del='0'")->save($datay);
				$num=1;
				$pro=M("info")->where("id='".$pid."'")->find();
				$f++;
				$yf=J_yunfei($pid,$sort);
				//写入订单详细表
				$dataxx['yf']=0;//优惠劵兑换 运费为0
				$dataxx['cntitle']=$vos['attr'];//优惠劵名称
				$dataxx['pic']=$pro['img'];
				$dataxx['aid']=$address;
				$dataxx['money']=$pro['s2']*$num;
				$dataxx['price']=$pro['s2'];
				$dataxx['num']=$num;
				$dataxx['pid']=$pid;
				$dataxx['uid']=$user_id;
				$data['oty']=0;
				$dataxx['gys']=0;
				$dataxx['orderid']=$orderid;
				$dataxx['addtime']=time();
				$allnum+=$num;
				$allyf+=$yf;
				$allmoney+=$pro['s2']*$num;
				$dataxx['del']=0;
				M("order_goods")->add($dataxx);
				//写入购买表
				M("buy")->where("id='".$ky['id']."'")->save($databuy);			
				$do='yes';
			}
		}
		if ($do!='yes')
		{
			exit('no id');	
		}
		//$allmoney=0;
		//写入订单表
		$data['orderid']=$orderid;
		$data['uid']=$user_id;
		$data['oty']=0;
		$data['cid']=$user_cid;
		$data['aid']=$address;
		$data['num']=$allnum;
		$data['money']=$allmoney;
		$paymoney=0;
		$data['paymoney']=$paymoney;		
		$data['ip']=GetIP();
		$data['addtime']=time();
		/**收货信息**/	
		$data['sh_name']=$addr['name'];
		$data['sh_tel']=$addr['tel'];
		$data['sh_area']=$addr['addr1'];
		$data['sh_address']=$addr['addr1'].' '.$addr['addr2'];		
		$data['sh_qq']=$addr['qq'];
		$data['sh_bz']=$sh_bz;
		$data['sh_zipcode']=$addr['zipcode'];		
		$data['pty']=9;//优惠劵兑换		
		$data['yhjstr']=$yhjstr;//用到的优惠劵
		/**运费 物流**/
		$data['paytime']=time();//兑换时间
		$data['sh_yunfei']=0;
		$data['wtype']=1;//运费付款类型 兑换为1 运费一起支付
		
		$yhj=0;
		M("order")->add($data);	
		session('yhjid',null);	
		exit('<script>location.href="/user/?ty=1";</script>');
	}
	//退货提交
	public function app_tuihuo()
	{
		$user_id=$this->user_id;
		if ($user_id==0)
		{
			exit();	
		}
		$orderid=$this->srequest2("id");
		$this->id=$orderid;
		$vo=M('order')->where("uid='$user_id' and orderid='$orderid' and zt='2'")->find();
		if ($vo)
		{
			$this->display($this->mbtpl."app_tuihuo");	
		}
		else
		{
			exit();	
		}
	}
	
	//执行提交退货
	public function do_tuihuo()
	{
		$user_id=$this->user_id;
		if ($user_id==0){exit();}
		$orderid=$this->srequest("id");		
		$vo=M('order')->where("uid='$user_id' and orderid='$orderid' and zt='2'")->find();
		if ($vo)
		{
			//获取提交的参数 退货原因 凭证图片
			$content=$this->srequest("content");
			$img= implode(',',$_POST['img']);
			
			if ($content=='')
			{
				$json = array("status"=>'-1',"message"=>'请填写退货原因','reload');
				echo json_encode($json);
				exit();	
			}
			//更新订单表
			$datax['zt']=91;
			$datax['view']=0;
			$order=M("order")->where("orderid='$orderid' and uid='$user_id'")->find();
			if ($order['paytime']>=0)
			{
				M("order")->where("orderid='$orderid'")->save($datax);
			}
				
			//写入退货表
			$data['user_id']=$user_id;
			$data['content']=$content;
			$data['orderid']=$orderid;
			$data['img']=$img;
			$data['addtime']=time();
			$data['ip']=GetIP();
			M("tuihuo")->add($data);
			$json = array("status"=>'3',"message"=>'提交成功','reload');
			echo json_encode($json);
			exit();	
		}
		else
		{
			exit();	
		}
	}
	
	//退出
    public function doexit(){
		session('user_id',null);
		session('user_pwd',null);
		session('user_name',null);
		
		cookie('user_id',null);
		cookie('user_pwd',null);
		cookie('user_name',null);
		echo "<script type='text/javascript'>location.href='/';</script>";
    }

}