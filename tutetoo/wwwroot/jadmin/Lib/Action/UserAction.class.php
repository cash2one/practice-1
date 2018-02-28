<?php
import('jadmin.Action.func');
class UserAction extends Action {
    var $config;
	function _initialize() {
		$config=getconfig();
		$this->sysfig=$config;
		$this->menu_flm=10;
		checkadmin();
		checkqx(2,'h');
		$adminid =session('adminid');
		$this->adminid=$adminid;
	}
	public function index()
	{
		$arc=M('user');
		$datax['class']=1;
		$arc->where("class='0'")->save($datax);
		$page=(int)$this->_get('p');
		$order=cookie("user_Order");
		if ($order==''){$order='user_id';}
		$desc=cookie("user_desc");
		if ($desc==''){$desc='desc';}
		$state=(int)$_GET['state'];
		$sty=(int)$_GET['sty'];
		$key2=$this->_get("key2");
		$keys=$this->_get('key');
		$this->order=$order;
		$this->desc=$desc;
		$this->keys=$keys;
		$this->state=$state;
		
		$t1=cookie("u_time1");
		$t2=cookie("u_time2");
		if ($t1!=''){$ts1=$t1." 00:00:01";$msql2.=" and time>=".strtotime($ts1)."";}
		if ($t2!=''){$ts2=$t2." 23:59:59";$msql2.=" and time<=".strtotime($ts2)."";}
		$this->time1=$t1;
		$this->time2=$t2;
		$class=(int)cookie("class");
		$this->class=$class;
/*		$add1=(int)cookie("u_add1");
		$add2=(int)cookie("u_add2");
		$add3=(int)cookie("u_add3");
		
		if ($add1>0)
		{
			$add2=str_replace("0","%",$add2);
			$add3=str_replace("0","%",$add3);
			$address=$add1.",".$add2.",".$add3;
			$this->address=$address;
			$msql2.=" and address like '$address'";
		}*/
		
		if ($keys!=''){$msql2.=" and CONCAT(`user_id`,`truename`,`nc`,`user_name`) like '%".$keys."%'";}				
		if ($state>0){$msql2.=" and `state`='1'";}	
		if ($class>0){$msql2.=" and `class`='$class'";}	
		$this->sty=$sty;
		$this->key2=$key2;
		import("@.ORG.Page");				
		$sql='del=0';					
		$count = $arc->where($sql.$msql2)->count();
		$pgsize=(int)cookie('T_pgsize');
		if ($pgsize==0){$pgsize=10;}
		$selectpg=selectpg($pgsize);
		$this->selectpg=$selectpg;
		$parameter='&key='.$keys;
		if ($sty!="")
		{
			$parameter='&key='.$keys.'&sty='.$sty.'&key2='.$key2;
		}
		$page = new Page($count,$pgsize,$parameter);
		$plist = $page->show();				
		$list = $arc->where($sql.$msql2)->order("`$order` $desc,user_id desc")->limit($page->firstRow.','.$page->listRows)->select();
		cookie('xlssql',$sql.$msql2,1800);
		cookie('xlssql_order',"`$order` $desc,user_id desc",1800);
		//echo "<!--".$arc->GetLastSql()."-->";
		$this->lists=$list;
		$this->page=$plist;
		$htm=$this->display();
	}
	
	public function add()
	{
		$id=(int)$_GET['id'];
		$this->act=$act;
		$vo=M('user')->where(" user_id='$id'")->find();
		if ((int)$vo['user_id']>0)
		{
			$actionType='查看';
			$vo['times']=date("Y-m-d H:i:s",$vo['time']);		
			$this->vo=$vo;
			$this->audit=$vo['state'];	
			$this->user_id=$vo['user_id'];		
		}
		else
		{
			exit('no data');
		}
		$this->actionType=$actionType;
		$this->id=$id;
		$this->lmoption=$lmoption;
		$this->display();
	}
	
	public function save()
	{
		$id=(int)$_POST['id'];
		$m=M('user');
		$arc=M('user');
		$vo=$m->where(" user_id='$id'")->find();
		$drg5=$_POST['drg5'];	
		$state=(int)$_POST['audit'];
		$class=(int)$_POST['class'];		
/*		$data["state"] =(int)$state;*/

		if ($vo)
		{
			if ($drg5!=''){
                $data["password"] =md5($drg5.$vo['user_name']);
			}
			$data["class"] =$class;
			$arc->where('user_id='.$id.'')->save($data);
			$json = array("status"=>'1',"message"=>"编辑成功","url"=>U('/?m=user&lm='.$fid.''));
			echo json_encode($json);
			exit();
		}
		else
		{
			$json = array("status"=>'-1',"message"=>"编辑失败","url"=>U('/?m=user&lm='.$fid.''));
			echo json_encode($json);
			exit();
			$this->error('userid error');
		}
	}
	
	public function doact()
	{
		$lmoption =getlmoption(0);
		$this->lmoption=$lmoption;
		$action=$this->_post('action');
		//$idstr=$_POST['idstr'];
		$idstr=$_REQUEST["idstr"];
		switch ($action)
		{
			case 's1':
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
				$info=M('user');
				$data['state']='1';
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" user_id='".$idarr[$i]."'")->save($data);
				}				
				exit("审核成功");				
				break;
			case 's2':
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
				$info=M('user');
				$data['state']=0;
				for ($i=0;$i<$nums;$i++)
				{
					$info->where(" user_id='".$idarr[$i]."'")->save($data);
				}
				exit("操作成功");				
				break;

			case 'delall':
				$idarr=explode(",",$idstr);
				$nums=count($idarr);
				$info=M('user');
				for ($i=0;$i<$nums;$i++)
				{
					$data['del']=1;
					$data['state']=0;
					$name=$info->where(" user_id='".$idarr[$i]."'")->find();
					$user_name='del_'.$name['user_name'];
					$openid='del_'.$name['openid'];
					$data['user_name']=$user_name;
					$data['openid']=$openid;
					$info->where(" user_id='".$idarr[$i]."'")->save($data);
				}
				exit("删除成功");	
				break;
			case 'sendmail'://发送站内信
				set_time_limit(0);
				$idarr=explode(",",$idstr);				
				$info=M('user');
				if ($idstr=='' || $idstr=='0')
				{
					$list=$info->where(" del='0'")->select();	
				}
				else
				{
					$list=$info->where("user_id in($idstr) and del='0'")->select();	
				}				
				$mtb=M('websms');
				$data['addtime']=time();
				$data['type']=0;
				$data['audit']=1;
				$data['ip']=GetIP();
				$content=$_POST['content'];
				$data["content"] = stripslashes($content);				
				mysql_query('BEGIN');
				foreach ($list as $ky)
				{
					$ks++;
					$data['uid']=$ky['user_id'];
					$mtb->add($data);	
					if($ks%1000==0)
					{
						mysql_query('COMMIT');
						mysql_query('BEGIN');
					}			
				}
				mysql_query('COMMIT');
				exit("发送成功!");							
				break;
		}
	}
	
	public function attr()
	{
		$idstr=$_REQUEST["idstr"];
		$id=(int)$_REQUEST["id"];
		$this->idstr=$idstr;
		$ty=(int)$_GET['ty'];
		switch ($ty)
		{
			case 3:
				$this->display('sendsms');
				break;	
			case 2:
				//$this->display('attr_2');
				break;	
		}
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
	/**
	 *导出到CSV文件
	 * @param $data   导出数组
	 * @param $file_name 文件名
	 */
	function export_csv2($file_name='',$data)
	{
	
		$file_name = $file_name.'_'.date('YmdHi').'.csv';
		$encoded_filename  = urlencode($file_name);
			$encoded_filename  = str_replace("+","%20",$encoded_filename );
		$content = $this->array_to_string($data);
		header('Cache-control: private');
		//判断浏览器，输出双字节文件名不乱码
		$ua = $_SERVER["HTTP_USER_AGENT"];
		if (preg_match("/MSIE/", $ua)) {
			header('Content-Disposition: attachment; filename="' . $encoded_filename . '"');
		}
		else if (preg_match("/Firefox/", $ua)) {
			header('Content-Disposition: attachment; filename*="utf8\'\'' . $file_name . '"');
		}
		else {
			header('Content-Disposition: attachment; filename="' . $file_name . '"');
		}
		if(function_exists('mb_convert_encoding')){
			header('Content-type: text/csv; charset=UTF-16LE');
			//输出BOM
			echo(chr(255).chr(254));
			echo(mb_convert_encoding($content,"UTF-16LE","UTF-8"));
			exit;
		}
	}
	/**
	 *导出数据转换
	 * @param $result
	 */
	function array_to_string($result)
	{
		if(empty($result)){
			return i("没有符合您要求的数据！^_^");
		}
		$size_result = count($result);
		for($i = 0 ; $i < $size_result ;  $i++) {
			$data .= $result[$i]."\n";
		}
		return $data;
	}
	
	
	/*导出xls*/
	public function export()
	{
		//获取cookiesql
		if ($this->adminid!='c4ca4238a0b923820dcc509a6f75849b'){exit('error');}	
		$sql=cookie('xlssql');
		$order=cookie('xlssql_order');
		$arc=M("user");
		$list = $arc->where($sql.' and del=0')->order($order)->limit(99999)->select();  
		$str="序号,会员级别,会员账号,姓名,昵称,头像,生日,邮箱,地址,注册时间\n";
		foreach ($list as  $row)   
		{   
			$i++;			
			$z1=$carr=M('class')->where("id='".$row['class']."'")->getField("classname");
			if ($z1==''){$z1='普通会员';}
			$z2=$row["user_name"];
			$z3=$row["truename"];
			$z4=$row["nc"];
			$z5=$row["photo"];
			$z6=$row["birthday"];
			$z7=$row["email"];
			$row["address"]=str_replace(',','-',$row["address"]);
			$z8=$row["address"];			
			$z9=date('Y-m-d H:i:s',$row["time"]);
			if ($row['state']==0){$mk="[未审核]";}else{$mk="";}			
			$str .= $i.",".$z1.$mk.",".$z2.$mk.",".$z3.",".$z4.",".$z5.",".$z6.",".$z7.",".$z8.",".$z9."\n";   
		}   
		$filename = 'user-'.date('Ymd').'.csv';
		$this->export_csv($filename,$str); //导出	
		
		
	}
	
}