<?php
import('jadmin.Action.func');
class OrderAction extends Action {
    var $config;
	function _initialize() {
		$config=getconfig();
		$this->sysfig=$config;
		$this->menu_flm=11;
		checkadmin();

		$this->etime=$sys['cfg_time'];
		$adminid =session('adminid');
		$this->adminid=$adminid;
		checkqx(2,'i');
	}
	public function index()
	{
		$arc=M('order');
		$lm=(int)$this->_get('lm');
		$this->lm=$lm;
		$page=(int)$this->_get('p');
		$pty=(int)$this->_get('pty');
		$yid=(int)$this->_get('yid');
		
		
		$order=cookie("order_Order");
		$lmoption =getlmoption($lm);
		$this->lmoption=$lmoption;
		$x3=cookie('order_x3');

		if ($order==''){$order='id';}
		$desc=cookie("order_desc");
		if ($desc==''){$desc='asc';}
		$keys=$this->_get('key');
		$this->order=$order;
		$this->desc=$desc;
		$this->keys=$keys;		
		$tbq=C('DB_PREFIX');
		$user=$tbq."user";
		$x2=$this->_get("x2");		
		$this->x2=$x2;
		switch ($x2)
		{
			case '':
			case '99': 
				$this->x2=99;	
				break;
			case '1':
				$msql2.=" and zt='$x2' ";
				break;
			case '0':
				$msql2.=" and zt='0' ";
				break;
			default:
				$msql2.=" and zt='$x2' ";
				//$this->x2=99;
				break;
		}
		
		$this->x3=$x3;
		switch ($x3)
		{
			case '':
			case '99': 
				$this->x3=99;	
				break;
			case '1':
				$msql2.=" and paytime>'0' ";
				break;
			case '0':
				$msql2.=" and paytime='0' ";
				break;
		}
		
		if ($yid>0)
		{
			$msql2.=" and yhjstr like '%[$yid]%'";
		}
		
		$t1=cookie("order_time1");
		$t2=cookie("order_time2");
		
		$sys=$this->sysfig;
		$etime=$sys['cfg_time'];
		$etime=$sys['cfg_time'];
		
		if ($t1!=''){$msql2.=" and addtime>=".(strtotime($t1))."";}
		if ($t2!=''){$msql2.=" and addtime<".(strtotime($t2)+24*3600)."";}
		$this->time1=$t1;
		$this->time2=$t2;
		
		import("@.ORG.Page");
		$sql="  (zt<'999') and del='0' and (paytime>'0' or uid>0)";
		$sql="  (zt<'999') and del='0' ";
		if ($pty>0)
		{
			$sql.=" and pty='$pty'";	
		}
		$this->pty=$pty;
		//$sql="  (zt<'999') ";				
		if ($keys!="")
		{
			$sql.=" and (orderid like '%$keys%' or sh_name like '%$keys%' or sh_tel like '%$keys%' or sh_address like '%$keys%')";	
		}		
		$this->keys=$keys;
		$count = $arc->where($sql.$msql2)->count();
		$this->count=$count;
		//echo $arc->GetLastSql();
		$pgsize=(int)cookie('T_pgsize');
		if ($pgsize==0){$pgsize=10;}
		$selectpg=selectpg($pgsize);
		$this->selectpg=$selectpg;
		
		$parameter='&key='.urldecode($keys).'&x2='.$x2;
		
		$page = new Page($count,$pgsize,$parameter);
		$plist = $page->show();				
		$list = $arc->where($sql.$msql2)->order("`$order` $desc,id desc")->limit($page->firstRow.','.$page->listRows)->select();
		$zmoney=$arc->where($sql.$msql2)->sum("money");
		$znum=$arc->where($sql.$msql2)->sum("num");
		$this->zmoney=$zmoney;
		$this->znum=$znum;
		
		cookie('xlssql2',$sql.$msql2,1800);
		cookie('xlssql_order2',"`$order` $desc,id desc",1800);
		//echo $arc->GetLastSql();
		$this->lists=$list;
		$this->page=$plist;
		$htm=$this->display();
	}
	
	
	
	public function add()
	{

		$id=(int)$_GET['id'];
		if ($id==0){$act='add';}
		$actionType='查看';
		$this->act=$act;
		$arc=M("order");
		$data['view']=1;
		$data['vtime']=time();
		$arc->where('id='.$id.'')->save($data);
		$vo=M('order')->where(" id='$id'")->find();
		if ((int)$vo['id']>0)
		{
			$this->vo=$vo;
			
		}else{exit(0);}
		$this->actionType=$actionType;
		$this->id=$id;
		$this->display();
	}
	


	public function sall()
	{
		$tbq=C('DB_PREFIX');
		$goods=$tbq."order_goods";
		$time=time();		
		$order=cookie("orderx_Order");

		$order='xiaoliang';
		$desc=cookie("orderx_desc");
		if ($desc==''){$desc='desc';}		
		$keys=$this->_get('key');
		$this->order=$order;
		$this->desc=$desc;
		$this->keys=$keys;	
	
		$t1=cookie("orderx_time1");
		$t2=cookie("orderx_time2");

		$sys=$this->sysfig;
		$etime=$sys['cfg_time'];
		
		//$t1=date("Y-m-d $etime",time()-24*3600);
		//$t2=date("Y-m-d $etime",time());
		
		if ($t1!=''){$ts1=$t1." $etime";$msql2.=" and addtime>=".strtotime($ts1)."";}
		if ($t2!=''){$ts2=$t2." $etime";$msql2.=" and addtime<=".strtotime($ts2)."";}
		$this->time1=$t1;
		$this->time2=$t2;
		if ($t1==""){$t1=date('Y-m-d',time()-365*24*3600);}
		if ($t2==""){$t2=date('Y-m-d');}
		import("@.ORG.Page");
				
		if ($keys!="")
		{
			$sqls=" and (cntitle like '%$keys%')";	
		}		
		$this->keys=$keys;
		
		$sys=$this->sysfig;
		$etime=$sys['cfg_time'];
		$time1=strtotime(date('Y-m-d '.$etime.'',(strtotime($t1)-24*3600)));//下午2点半之前下单的
		$time2=strtotime(date('Y-m-d '.$etime.'',strtotime($t2)));
		

		$where="addtime>'$time1' and addtime<'$time2' and del='0'$sqls";
		$arr=M("order")->where("paytime='0'")->field("orderid")->select();
		$datax['del']=1;
		foreach ($arr as $ky)
		{
			M("order_goods")->where("orderid='".$ky['orderid']."'")->save($datax);
		}

		

		
		$pgsize=(int)cookie('T_pgsize');
		if ($pgsize==0){$pgsize=10;}
		$selectpg=selectpg($pgsize);
		$this->selectpg=$selectpg;
		
		$parameter='&a=sall&key='.urldecode($keys);
		$page = new Page($count,$pgsize,$parameter);
		$plist = $page->show();	
			
		$mtb=M();				
		$limit="limit ".$page->firstRow.",".$page->listRows."";
		$sql="SELECT DISTINCT pid, SUM(money) AS pro_allmoney, SUM(num) AS xiaoliang, COUNT(*) AS bi FROM $goods WHERE ($where) GROUP BY pid ORDER BY xiaoliang DESC ";
		$sql2=$sql.$limit;
		//echo "<!--".$sql2."-->";
		$list = $mtb->query($sql2);
		$this->count=count($list);
		
		$arc=M("order_goods");
		$zmoney=$arc->where($where)->sum("money");
		$znum=$arc->where($where)->sum("num");
		$this->zmoney=$zmoney;
		$this->znum=$znum;
		
		cookie('dxlssql2',$sql,9900);
		cookie('dxlssql_order2',"`$order` $desc",9900);
		
		$this->lists=$list;
		$this->display();	
	}

	public function save()
	{
		$id=$_POST['id'];
		$zt=(int)$this->_post('zt');
		$bz2=$this->_post('bz2');
		$sh_kuaidi=$this->srequest('sh_kuaidi');
		$arc=M('order');
		
		$vo=$arc->where(" id='$id' and del='0'")->find();
		$addtime2=date("Y-m-d H:i:s");		
		if ($vo)
		{
			$data['vtime']=time();
			$data['gbz']=$bz2;
			$data['zt']=$zt;			
			$data['sh_kuaidi']=$sh_kuaidi;
			if ($sh_kuaidi!='' && ($vo['sh_kuaidi']=='' || $vo['ftime']==0))
			{
				$data['ftime']=time();//更新发货时间
			}
			//$arc->where("id='$id' and zt='0'")->save($data);
			$arc->where("id='$id'")->save($data);
			
			if ($vo['sgh_kuaidi']=='' && $sh_kuaidi!='' && $vo['uid']>0)
			{
				//发货后发送一条发货消息的站内信。
				$uinfo=M('user')->where("user_id='".$vo['uid']."'")->find();
				$sysfig=$this->sysfig;
				$content=$sysfig['cfg_mb3'];
				$user_name=$uinfo['user_name'];
				if ($user_name=='')
				{
					$user_name=$uinfo['tel'];
				}
				if ($user_name=='')
				{
					$user_name=$uinfo['nc'];
				}
				$content=str_replace('[#user#]',$user_name,$content);
				$content=str_replace('[#订单号#]',$vo['orderid'],$content);
				$content=str_replace('[#快递#]',$vo['sh_kuaidi'],$content);
				$mtb=M('websms');
				$xdata['uid']=$vo['uid'];
				$xdata['type']=2;	
				$xdata['ip']=GetIP();
				$xdata['audit']=1;
				$xdata['addtime']=time();
				$xdata['content']=$content;
				$mtb->add($xdata);
			}
		}
		$json = array("status"=>'1',"message"=>"编辑成功","url"=>U('/?m=order'));
		echo json_encode($json);
		exit();
	}
	
	

	
	public function doact()
	{
		if ($this->adminid!='dcf78d0d09445f3cd4d378f7756bc74d'){exit('error');}				
		$action=$this->_post('action');
		$idstr=$_REQUEST["idstr"];
		switch ($action)
		{
			case 'del':
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
				$info=M('order');
				$id=(int)$_POST['id'];
				$data['del']=1;

				$info->where(" id='".$id."'")->save($data);
		
				exit("删除成功");	
				break;
		}
	}
	/*导出xls*/
	public function export()
	{
		//if ($this->adminid!='dcf78d0d09445f3cd4d378f7756bc74d'){exit('error');}
		//获取cookiesql
		$sql=cookie('xlssql2');
		$sql=str_replace("\'","'",$sql);
		$order=cookie('xlssql_order2');
		$arc=M("order");
		$info=M("info");
		$list = $arc->where($sql)->order($order)->limit(99999)->select();  
		$zmoney = $arc->where($sql)->order($order)->limit(99999)->sum('paymoney');
		$znum = $arc->where($sql)->order($order)->limit(99999)->sum('num');
		//$str="序号,订单状态,订单编号,订单时间,收货人,收货地址,收货人电话,数量,金额\n";
		$mtbf=M('order_goods');
		$str="订单编号,货物名称,货物编号,订单数量,订单金额,收货人,收货人电话,收货人地址\n";		
		foreach ($list as  $row)   
		{   
			$vos=M("user")->where("user_id='".$row['uid']."'")->find();
			$add=M("address")->where("id='".$row['aid']."'")->find();			
			$i++;
			$user_name=$vos['user_name'];
			$z1=$row["orderid"];
			$z4=$row['num'];
			$z5=$row['paymoney'];			
			//$z2=date('Y-m-d H:i:s',$row["addtime"]);
			$z6=$row['sh_name'];
			$z7=$row['sh_tel'];
			$z8=$row['sh_address'].$add['addr2'];	
			$z8=str_replace(',','-',$z8);		
			$arr=$mtbf->where("orderid='$z1'")->field("pid,cntitle")->select();
			switch ($row['zt'])
			{
				case 1:
					$mk="已完成";
					break;	
			}
			foreach ($arr as $ky)
			{
				$pid=$ky['pid'];
			    $vos=$info->where("id='$pid'")->field("bz2")->find();
				$z2=$ky['cntitle'];
				$z3=$vos['bz2'];				
				$str .= $z1.",".$z2.",".$z3.",".$z4.",".$z5.",".$z6.",".$z7.",".$z8."\n"; 
			}
		}   
		//$str.='订购总金额：'.$zmoney.' 订购产品数量：'.$znum.',,,,,,,,,'."\n";
		$filename = 'order_'.date('Ymd').'.csv';
		$this->export_csv($filename,$str); //导出 
	}
	
	
	public function export2()
	{

		$sql=cookie('dxlssql2');
		$sql=str_replace("\'","'",$sql);
		$arc=M();
		$list = $arc->query($sql);

		$str="序号,产品编号,产品名称,订单笔数,数量,总金额\n";
		foreach ($list as  $row)   
		{   
   			$vos=M("order_goods")->where("pid='".$vo['pid']."'")->find();			
			$i++;
			$user_name=$vos['user_name'];
			$z1=$row["pid"];
			$z2=$vos["cntitle"];
			$z3=$row['bi'];
			$z4=$row['xiaoliang'];
			$z5=$row['pro_allmoney'];	  
			$str .= $i.",".$z1.",".$z2.",".$z3.",".$z4.",".$z5."\n"; 
			$znum+=$row['xiaoliang'];  
			$zmoney+=$z5;
		}   
		$str.= "总销量,".$znum.",总金额,".$zmoney.",,\n";
		$filename = 'beihuo_'.date('Ymd').'.csv';
		$this->export_csv($filename,$str); //导出 
	}
	
	
	public function export_csv($filename,$data)   
	{   
		header('Content-Type: application/download');
		header("Content-type:text/csv;charset=gb2312"); 
		header("Content-Disposition:attachment;filename=".$filename); 	
		header("Content-Encoding: binary");
		header("Content-Length:".filesize($filepath));
		header("Pragma: no-cache");
		header("Expires: 0");

		$data =iconv('utf-8','gb2312',$data);	
		echo $data;   
	} 
}