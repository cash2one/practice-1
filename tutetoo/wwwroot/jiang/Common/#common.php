<?php
function deladw($con)
{
	$arr=array('国家级','世界级','最高级','最佳','最大','第一','唯一','首个','首选','最好','最大','精确','顶级','最高','最低','最','最具','最便宜','最新','最先进','最大程度','最新技术','最先进科学','国家级产品','填补国内空白','绝对','独家','首家','最新','最先进','第一品牌','金牌','名牌','优秀','最先','顶级','独家','全网销量第一','全球首发','全国首家','全网首发','世界领先','顶级工艺','最新科学','最新技术','最先进加工工艺','最时尚','极品','顶级','顶尖','终极','最受欢迎','王牌','销量冠军','第一','NO.1','Top1','极致','永久','王牌','掌门人','领袖品牌','独一无二','独家','绝无仅有','前无古人','史无前例','万能');
	foreach ($arr as $ky)
	{
		$con=str_replace($ky,'',$con);	
	}
	return $con;
}
function jtime($time)
{
$time=time()-$time;	
$yourday = (int)($time/(3600*24));
$yourhour = (int)(($time%(3600*24))/(3600));
$yourmin = (int)($time%(3600)/60);
if ($yourmin==0){$yourmin=1;}
if ($yourday>0){$xyourday=$yourday.'天';}
if ($yourhour>0){$xyourhour=$yourhour.'小时';}
$xyourmin=$yourmin.'分';
return $xyourday.$xyourhour.$xyourmin;
}
function hidtel($phone)
{
 $IsWhat = preg_match('/(0[0-9]{2,3}[\-]?[2-9][0-9]{6,7}[\-]?[0-9]?)/i',$phone); //固定电话
 if($IsWhat == 1)
 {
  return preg_replace('/(0[0-9]{2,3}[\-]?[2-9])[0-9]{3,4}([0-9]{3}[\-]?[0-9]?)/i','$1****$2',$phone);

 }
 else
 {
  return  preg_replace('/(1[358]{1}[0-9])[0-9]{4}([0-9]{4})/i','$1****$2',$phone);
 }
}
/*运费计算*/
function J_yunfei($id,$c=0)
{
	$vo=M("info")->where("id='$id'")->find();
	if ($vo['s5']==1)
	{
		return 0;	
	}
	$yarr=$vo['z5'];
	
	if ($yarr!='')
	{
		$yarr=explode(',',$yarr);
		if ($yarr[$c]!='')
		{
			return (int)$yarr[$c];	
		}
	}
	return (int)$vo['s3'];
}



/*产品成交数量*/
function J_buynum($id)
{
	$f= M('order_goods')->where('pid='.$id.'')->sum('num');	
	//M('order_goods')->GetLastSql();
	return (int)$f;
}
//某个分类产品的数量
function J_lmnum($id)
{
	$f= M('info')->where("CONCAT(',', fidpath, ',') like '%,".$id.",%'")->count('id');	
	return $f;
}
/*评价数量*/
function J_comment($id)
{
	return M('comment')->where('pid='.$id.' and del=0 and audit=1')->count('id');	
}


/******评论类显示函数********/
function show_comment($id,$ty,$wap)
{
	$comm=new Qmcomment($id,$ty,$wap);
	return $comm->show_pl0();
}

//购物车操作类
class Qmcart
{
	public $uid;//会员id
	public $pid;//产品id
	public $num;//产品数量
	public $ty;//购物车类型 0产品购物车 1积分购物车
	public function __construct($uid,$pid,$num,$ty)
	{
		$this->pid=$pid;
		$this->uid=$uid;
		$this->num=$num;
		$ty=(int)$ty;
		if ($ty!=1){$ty=0;}
		$this->ty=$ty;
	}
	
	//加入购物车 如果购物车为0 表示删除
	public function add_cart()
	{
		
		$pid=$this->pid;
		$num=$this->num;
		$uid=$this->uid;		
		if ($this->ty==1)
		{
			$sql=" and CONCAT(',', fidpath, ',') like '%,5,%'";	
		}
		else
		{
			$sql=" and CONCAT(',', fidpath, ',') like '%,1,%'";	
		}
		$info=M("info")->where("id='$pid' and audit='1' and kucun>'0'".$sql)->find();
		$vos=$info;
		if (!$info){return false;}
		//获取当前购物车信息 2遍历购物车 清楚无效产品（无库存 下架 删除状态的产品）
		//$orderinfo=cookie('qmcart');
		$orderinfo=$this->check_cart();
		$array_=explode('{q#fg1#m}',$orderinfo);
		foreach ($array_ as $ky)
		{
			$array[]=explode('{q#fg2#m}',$ky);		
		}
		$ckid=$pid;
		$sid=$this->search_arr2($array,$ckid,'0');				
		if ($sid==-1)
		{
			$add = array('id'=>$pid,'num'=>$num,'name'=>$vos['cntitle'],'price'=>$vos['s2'],'zk'=>10);
			array_push($array,$add);
		}
		else
		{
			//$array[$sid][1]=$array[$sid][1]+1;
			$array[$sid][1]=$num;
		}
		//将数组转换成字符串
		$len = count($array);
		$cart_str="";
		for( $i=0;$i<$len;$i++)
		{
			if ($cart_str!="")
			{
				$cart_str.="{q#fg1#m}";
			}
			$cart_str.=implode("{q#fg2#m}",$array[$i]);			
		}
		cookie('qmcart'.$this->ty,$cart_str,3600*24*30);
		
		return $cart_str;
	}
	
	//删除购物车
	public function del_cart()
	{
		$pid=$this->pid;
		$num=$this->num;
		$uid=$this->uid;
		$orderinfo=$this->check_cart();
		$array_=explode('{q#fg1#m}',$orderinfo);
		
		foreach ($array_ as $ky)
		{
			$now_array=explode('{q#fg2#m}',$ky);
			if ($now_array[0]!=$pid)
			{
				$array[]=$now_array;	
			}
		}

		//将数组转换成字符串
		$len = count($array);
		$cart_str="";
		for( $i=0;$i<$len; $i++)
		{
			if ($cart_str!="")
			{
				$cart_str.="{q#fg1#m}";
			}
			$cart_str.=implode("{q#fg2#m}",$array[$i]);			
		}
		if ($cart_str=='')
		{
			cookie('qmcart'.$this->ty,null,3600*24*30);
		}
		else
		{
			cookie('qmcart'.$this->ty,$cart_str,3600*24*30);
		}
		return $cart_str;
	}
	
	//检测购物车 清楚无效的产品 下架 无库存 等情况
	public function check_cart()
	{
		$orderinfo=cookie('qmcart'.$this->ty);
		$array_=explode('{q#fg1#m}',$orderinfo);
		
		$mtb=M("info");
		foreach ($array_ as $ky)
		{
			$now_array=explode('{q#fg2#m}',$ky);
			$pid=$now_array[0];
			$isid=$mtb->where("id='$pid' and audit='1' and kucun>'0'")->find();
			if ($isid)
			{
				//检测库存
				if ($now_array[1]>$isid['kucun'])
				{
					$now_array[1]=$isid['kucun'];	
				}
				$array[]=$now_array;
			}			
		}	
		//将数组转换成字符串
		$len = count($array);		
		$cart_str="";
		for( $i=0;$i<$len; $i++)
		{
			if ($cart_str!="")
			{
				$cart_str.="{q#fg1#m}";
			}
			$cart_str.=implode("{q#fg2#m}",$array[$i]);			
		}
		cookie('qmcart'.$this->ty,$cart_str,3600*24*30);
		
		//echo cookie('qmcart'.$this->ty);
		//echo '{#ck#}'.$this->ty.$cart_str.'{#ck#}';
		return $cart_str;
	}
	
	
	//删除数组 返回删除后的数组
	public function del_arr($array,$str)
	{
		$len = count($array);
		for( $i=0;$i<$len; $i++)
		{
			if($array[$i]==$str)
			{
				unset($array[$i]);
			}
		}
		return 	$array;	
	}
	
	//查找元素 返回元素的位置 -1表示未查询到
	public function search_arr($array,$str)
	{
		$f=-1;
		$len = count($array);
		for( $i=0;$i<$len; $i++)
		{
			if($array[$i]==$str)
			{
				return $i;
			}
		}
		return 	$f;	
	}
	
	//删除2维数组 返回删除后的数组 $s 查找元素在数组的位置
	public function del_arr2($array,$str,$s)
	{
		$len = count($array);
		for( $i=0;$i<$len; $i++)
		{
			if($array[$i][$s]==$str)
			{
				unset($array[$i]);
			}
		}
		return 	$array;
	}
	
	//查找2维数组元素 返回元素的位置1维位置  -1表示未查询到
	public function search_arr2($array,$str,$s)
	{
		$f=-1;
		$len = count($array);
		for( $i=0;$i<$len; $i++)
		{
			if($array[$i][$s]==$str)
			{
				return $i;
			}
		}
		return 	$f;	
	}
}

class Qmcomment
{
	public $id;        
    public $ty;
	public $wap;//显示类型  电脑端和移动端的显示类型不一样
    public function __construct($id=0,$ty=1,$wap=0){
        $this->id=$id;
		$this->ty=$ty;
		$this->wap=$wap;
    }
	public function show_pl0()
	{
		$id=$this->id;
		$ty=$this->ty;
		$class=2;//显示2个层级
		$mtb=M('comment');
		//$sql="pid='$id' and ty='$ty' and audit='1' and del='0' and (hid='0' or s1>'$class')";		
		$pgsize=6;
		import("@.ORG.Page");				
		$sql="pid='$id' and ty='$ty' and audit='1' and del='0' and (hid='0')";
		$count = $mtb->where($sql)->count();
		$page = new Page($count,$pgsize);			
		$list = $mtb->where($sql)->order('id desc')->limit($page->firstRow.','.$page->listRows)->select();
		//echo $plist;
		//exit();
		if(is_array($list))
		{
			foreach($list as $k=>$vo)
			{	
				$str.=$this->show_pl_one($vo['id'],$ty);
			}		
		}
		return $str;
	}
	
	public function show_pl_one($id,$ty)
	{
		$mtb=M('comment');
		$sql="id='$id' and ty='$ty' and audit='1' and del='0'";
		$vo=$mtb->where($sql)->find();
		//echo $mtb->GetLastSql();
		//首先判断是否有子评论
		$str_parent=$this->show_pl($vo['id'],$ty);			
		$str_now=$this->show_pl_tpl($vo['id']);
		if ($str_parent!='')
		{
			$aa=$this->wap;
			
			if ($this->wap==1)
			{
				$str_parent='<div class="more-mess-wrap"><ul>'.$str_parent.'</ul></div>';		
			}
			else
			{
				$str_parent='<ul class="comment-children aa'.$aa.'">'.$str_parent.'</ul>';
			}
			$str_now.=$str_parent;
		}	
		if ($str_now!='')
		{	
			$str.="<li>$str_now</li>";	
		}
		return $str;
	}
	
	public function show_pl($id=0,$ty=1)
	{
		$class=13;//显示2个层级 超过2个层级按2个层级显示
		$mtb=M('comment');
		$sql="hid='$id' and ty='$ty' and audit='1' and del='0' and s1<'$class'";
		//echo $sql;
		$list=$mtb->where($sql)->order("id desc")->select();
		if(is_array($list))
		{
			foreach($list as $k=>$vo)
			{	
				//首先判断是否有子评论
				$str_parent=$this->show_pl($vo['id'],$ty);			
				$str_now=$this->show_pl_tpl($vo['id']);
				$class=$vo['s1'];
				if ($class>2)
				{
					$class2=' class="qei"';	
				}
				if ($str_parent!='')
				{
					$aa=$this->wap;
					$str_parent='<ul class="comment-children aa'.$aa.'">'.$str_parent.'</ul>';
					if ($this->wap==1)
					{
						$str_parent='<div class="more-mess-wrap"><ul>'.$str_parent.'</ul></div>';		
					}
					
					$str_now.=$str_parent;
				}		
				if ($str_now!='')
				{	
					$str.="<li$class2>$str_now</li>";	
				}
			}		
		}
		return $str;
	}
	
	public function show_pl_tpl($id)
	{
		$mtb=M('comment');
		$sql="id='$id' and audit='1' and del='0'";
		$list=$mtb->where($sql)->find();
		if ($list)
		{
			$uid=$list['uid'];
			$ufo=M("user")->where("user_id='$uid'")->find();
			//获取评论人的头像 评论人的内容
			$nc=$ufo['nc'];
			$uimg=$ufo['photo'];
			$ty=$list['ty'];
			if ($uimg=='')
			{
				$uimg='/img/muser.png';	
			}
			$time=date('Y-m-d H:i:s',$list['addtime']);
			$content=$list['content'];
			$pid=$list['pid'];
			if ($this->wap==0)
			{
				$str='
						<a href="#no" class="pic"><img src="'.$uimg.'" alt="'.$nc.'"/></a>
					<div class="detail-wrap">
					  <span class="name">'.$nc.'</span><span class="time">'.$time.'</span>
					  <p class="detail">'.$content.'</p>
					  <button class="btn btn-reply">回复</button>
					  <div class="replay-wrap">
						<form class="form-horizontal message-form" action="/user/?a=comment">
						<input type="hidden" name="pid" value="'.$pid.'" />
						<input type="hidden" name="hid" value="'.$id.'" />
						<input type="hidden" name="ty" value="'.$ty.'" />
						<span class="glyphicon glyphicon-triangle-top"></span>
						<button class="btn btn-f" type="submit">发布</button>
						<textarea rows="3" name="content" datatype="*5-516"></textarea>
						</form>
					  </div>
					</div>		
				';	
			}
			else
			{
				$str='
			<div class="detail-wrap fle">
			<div class="pic"><img src="'.$uimg.'" alt="'.$nc.'"/></div>
			<div class="details">
				<p><span class="name">'.$nc.'</span>&nbsp;&nbsp;'.$time.'</p>
				<p class="mess-detail">'.$content.'</p>
				<p><a class="btn-replay">回复</a></p>
				<div class="text-wrap">
				  <form class="form-horizontal message-form" action="/user/?a=comment">
					<input type="hidden" name="pid" value="'.$pid.'" />
					<input type="hidden" name="hid" value="'.$id.'" />
					<input type="hidden" name="ty" value="'.$ty.'" />
					<textarea rows="3" name="content" datatype="*5-516"></textarea>
					<div class="text-right">
					<button class="btn btn-default btn-f" type="submit">发表</button>
					</div>
				  </form>
				</div>
			</div>
			</div>
				';			
			}
			return $str;
		}
	}
}
/******活动评论显示函数 end********/

function Jrand($length)
{
	$hash = '';
	$chars = '0123456789abcdefghijklmnopqrstuvwxyz';
	$max = strlen($chars) - 1;
	mt_srand((double)microtime() * 1000000);
	for($i = 0; $i < $length; $i++) 
	{
		$hash .= $chars[mt_rand(0, $max)];
	}
	return $hash;
}
function randomnum($length)
{
	$hash = '';
	$chars = '0123456789';
	$max = strlen($chars) - 1;
	mt_srand((double)microtime() * 1000000);
	for($i = 0; $i < $length; $i++) 
	{
		$hash .= $chars[mt_rand(0, $max)];
	}
	return $hash;
}
function xtsms($tel,$content)
{	
		$content.="【土特土】";
		$strs=urlencode($content);
		$url='http://www.duanxin10086.com/sms.aspx?action=send';
		$url=$url."&userid=14894&account=jinshuoyangguang&password=123456&content=$strs&mobile=$tel&sendtime=&taskName=getpwd&checkcontent=1&mobilenumber=1&countnumber=1&telephonenumber=1";   
		$result = file_get_contents($url); 
		$results2=0;
		if ($result!=str_replace('<returnstatus>Success</returnstatus>','',$result))
		{
			if ($result!=str_replace('<message>ok</message>','',$result))
			{
				$results2="1";
			}
		}
		$results2="1";
		return $results2;
}
function isMOB()
{ 
		if ( strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false ) {
				return true;
		}    
    // 如果有HTTP_X_WAP_PROFILE则一定是移动设备
    if (isset ($_SERVER['HTTP_X_WAP_PROFILE']))
    {
        return true;
    } 
    // 如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
    if (isset ($_SERVER['HTTP_VIA']))
    { 
        // 找不到为flase,否则为true
        return stristr($_SERVER['HTTP_VIA'], "wap") ? true : false;
    } 
    // 脑残法，判断手机发送的客户端标志,兼容性有待提高
    if (isset ($_SERVER['HTTP_USER_AGENT']))
    {
        $clientkeywords = array ('nokia',
            'sony',
            'ericsson',
            'mot',
            'samsung',
            'htc',
            'sgh',
            'lg',
            'sharp',
            'sie-',
            'philips',
            'panasonic',
            'alcatel',
            'lenovo',
            'iphone',
            'ipod',
            'blackberry',
            'meizu',
            'android',
            'netfront',
            'symbian',
            'ucweb',
            'windowsce',
            'palm',
            'operamini',
            'operamobi',
            'openwave',
            'nexusone',
            'cldc',
            'midp',
            'wap',
            'mobile'
            ); 
        // 从HTTP_USER_AGENT中查找手机浏览器的关键字
        if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT'])))
        {
            return true;
        } 
    } 
    // 协议法，因为有可能不准确，放到最后判断
    if (isset ($_SERVER['HTTP_ACCEPT']))
    { 
        // 如果只支持wml并且不支持html那一定是移动设备
        // 如果支持wml和html但是wml在html之前则是移动设备
        if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html'))))
        {
            return true;
        } 
    } 
    return false;
} 

/**
 * 字符串截取，支持中文和其他编码
 * @static
 * @access public
 * @param string $str 需要转换的字符串
 * @param string $start 开始位置
 * @param string $length 截取长度
 * @param string $charset 编码格式
 * @param string $suffix 截断显示字符
 * @return string
 */
function msubstr($str, $start=0, $length, $charset="utf-8", $suffix=true) {
$str=strip_tags($str);
$str=preg_replace("/<\s*img\s+[^>]*?src\s*=\s*(\'|\")(.*?)\\1[^>]*?\/?\s*>/i", " ", $str); //过滤img标签  
$str=preg_replace("/\s+/", " ", $str); //过滤多余回车  
$str=preg_replace("/<[ ]+/si","<",$str); //过滤<__("<"号后面带空格
$str=preg_replace("/<\!--.*?-->/si","",$str); //注释  
$str=preg_replace("/<(\!.*?)>/si","",$str); //过滤DOCTYPE  
$str=preg_replace("/<(\/?html.*?)>/si","",$str); //过滤html标签  
$str=preg_replace("/<(\/?head.*?)>/si","",$str); //过滤head标签  
$str=preg_replace("/<(\/?meta.*?)>/si","",$str); //过滤meta标签  
$str=preg_replace("/<(\/?body.*?)>/si","",$str); //过滤body标签  
$str=preg_replace("/<(\/?link.*?)>/si","",$str); //过滤link标签  
$str=preg_replace("/<(\/?form.*?)>/si","",$str); //过滤form标签  
$str=preg_replace("/cookie/si","COOKIE",$str); //过滤COOKIE标签  
$str=preg_replace("/<(applet.*?)>(.*?)<(\/applet.*?)>/si","",$str); //过滤applet标签  
$str=preg_replace("/<(\/?applet.*?)>/si","",$str); //过滤applet标签  
$str=preg_replace("/<(style.*?)>(.*?)<(\/style.*?)>/si","",$str); //过滤style标签  
$str=preg_replace("/<(\/?style.*?)>/si","",$str); //过滤style标签  
$str=preg_replace("/<(title.*?)>(.*?)<(\/title.*?)>/si","",$str); //过滤title标签
  $str=preg_replace("/<(\/?title.*?)>/si","",$str); //过滤title标签  
$str=preg_replace("/<(object.*?)>(.*?)<(\/object.*?)>/si","",$str); //过滤object标签
  $str=preg_replace("/<(\/?objec.*?)>/si","",$str); //过滤object标签  
$str=preg_replace("/<(noframes.*?)>(.*?)<(\/noframes.*?)>/si","",$str); //过滤noframes标签  
$str=preg_replace("/<(\/?noframes.*?)>/si","",$str); //过滤noframes标签  
$str=preg_replace("/<(i?frame.*?)>(.*?)<(\/i?frame.*?)>/si","",$str); //过滤frame标签  
$str=preg_replace("/<(\/?i?frame.*?)>/si","",$str); //过滤frame标签  
$str=preg_replace("/<(script.*?)>(.*?)<(\/script.*?)>/si","",$str); //过滤script标签  
$str=preg_replace("/<(\/?script.*?)>/si","",$str); //过滤script标签  
$str=preg_replace("/javascript/si","Javascript",$str); //过滤script标签  
$str=preg_replace("/vbscript/si","Vbscript",$str); //过滤script标签  
$str=preg_replace("/on([a-z]+)\s*=/si","On\\1=",$str); //过滤script标签  
$str=preg_replace("/&#/si","&＃",$str); //过滤script标签
    if(function_exists("mb_substr"))
        $slice = mb_substr($str, $start, $length, $charset);
    elseif(function_exists('iconv_substr')) {
        $slice = iconv_substr($str,$start,$length,$charset);
        if(false === $slice) {
            $slice = '';
        }
    }else{
        $re['utf-8']   = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
        $re['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
        $re['gbk']    = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
        $re['big5']   = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
        preg_match_all($re[$charset], $str, $match);
        $slice = join("",array_slice($match[0], $start, $length));
    }
	$slice=str_replace('　','',$slice);
	$slice=str_replace('&nbsp;','',$slice);
	$slice=trim($slice);
    return $suffix ? $slice.'' : $slice;
}

function compress_html($string) { 
$string = str_replace("\r\n", '', $string); //清除换行符 
$string = str_replace("\n", '', $string); //清除换行符 
$string = str_replace("\t", '', $string); //清除制表符 
$pattern = array ( 
"/> *([^ ]*) *</", //去掉注释标记 
"/[\s]+/", 
"/<!--[^!]*-->/", 
"/\" /", 
"/ \"/", 
"'/\*[^*]*\*/'" 
); 
$replace = array ( 
">\\1<", 
" ", 
"", 
"\" ", 
"\" ", 
" " 
); 
$string=preg_replace($pattern, $replace, $string); 
$string=str_replace('"content="','" content="', $string);
return $string;
} 

//取数字
function isNum($n)
{
   return preg_match('/^\d*$/',$n);
}
/**
 * 只保留字符串首尾字符，隐藏中间用*代替（两个字符时只显示第一个）
 * @param string $user_name 姓名
 * @return string 格式化后的姓名
 */
function substr_cut($user_name){
	$user_name=$user_name.'#';
    $strlen     = mb_strlen($user_name, 'utf-8');
    $firstStr     = mb_substr($user_name, 0, 2, 'utf-8');
    $lastStr     = mb_substr($user_name, -1, 1, 'utf-8');
    $str= $strlen == 2 ? $firstStr . str_repeat('*', mb_strlen($user_name, 'utf-8') - 2) : $firstStr . str_repeat("*", $strlen - 2) . $lastStr;
	return str_replace('#','',$str);
}


 /**
 * 获取当前页面完整URL地址
 */
 function get_wurl() {
    $sys_protocal = isset($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == '443' ? 'https://' : 'http://';
    $php_self = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
    $path_info = isset($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : '';
    $relate_url = isset($_SERVER['REQUEST_URI']) ? $_SERVER['REQUEST_URI'] : $php_self.(isset($_SERVER['QUERY_STRING']) ? '?'.$_SERVER['QUERY_STRING'] : $path_info);
    return $sys_protocal.(isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : '').$relate_url;
 }
 

function Gourl($url)
{
	Tourl($url);
}
function Tourl($url)
{
@header('Content-type:text/html;charset=utf-8');
$gohtml='
<html>
<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<meta http-equiv="refresh" content="0.1;url='.$url.'">
<title>加载中...</title>
</head>
<body></body>
</html>
';
echo $gohtml;	
}

function CheckWlogin()
{
	$islogin=$_SESSION['qm_wloginid'];
	if ($islogin=='')
	{
		$islogin=$_GET['wrnd'];
		$islogin='o_T3Wwb9bOa2lHBDt9E9CBvjzOE4';
	}
	$login=0;
	if ($islogin!='')
	{
		$islogin=ereg_replace("[^0-9a-zA-Z_@!\.-]",'',$islogin);
		$isid=M("user")->where("openid='$islogin' and third_num='3' and del='0' and state='1'")->find();
		if ($isid)
		{
			session('user_id',$isid['user_id']);
			session('qm_wloginid',$isid['openid']);
			session('user_pwd',md5($isid['password']));
		}
	}
	else
	{
		$url=get_wurl();
		$url=urlencode($url);
		cookie('frome',$url);
		//exit($url);
		exit('<script>location.href="/?a=wlogin/?wurl='.$url.'";</script>');	
	}
}


function T($template='',$layer=''){
        if(is_file($template)) {
            return $template;
        }
        if(false === strpos($template,'://')){
            $template   =   APP_NAME.'://'.str_replace(':', '/',$template);
        }        
        $info   =   parse_url($template);
        $file   =   $info['host'].(isset($info['path'])?$info['path']:'');
        $group  =   isset($info['user'])?$info['user'].'/':(defined('GROUP_NAME')?GROUP_NAME.'/':'');
        $app    =   $info['scheme'];
        $layer  =   $layer?$layer:C('DEFAULT_V_LAYER');

        if(($list = C('EXTEND_GROUP_LIST')) && isset($list[$app])){ 
            $baseUrl    =   $list[$app].'/'.$group.$layer.'/';
        }elseif(1==C('APP_GROUP_MODE')){ 
            $baseUrl    =   dirname(BASE_LIB_PATH).'/'.$group.$layer.'/';
        }else{ 
            $baseUrl    =   TMPL_PATH.$group;
        }

        if('' == $file) {
            $file = MODULE_NAME . C('TMPL_FILE_DEPR') . ACTION_NAME;
        }elseif(false === strpos($file, '/')){
            $file = MODULE_NAME . C('TMPL_FILE_DEPR') . $file;
        }
        return $baseUrl.$file.C('TMPL_TEMPLATE_SUFFIX');
}

function I($name,$default='',$filter=null) {
    if(strpos($name,'.')) {
        list($method,$name) =   explode('.',$name,2);
    }else{
        $method =   'param';
    }
    switch(strtolower($method)) {
        case 'get'     :   $input =& $_GET;break;
        case 'post'    :   $input =& $_POST;break;
        case 'put'     :   parse_str(file_get_contents('php://input'), $input);break;
        case 'param'   :  
            switch($_SERVER['REQUEST_METHOD']) {
                case 'POST':
                    $input  =  $_POST;
                    break;
                case 'PUT':
                    parse_str(file_get_contents('php://input'), $input);
                    break;
                default:
                    $input  =  $_GET;
            }
            if(C('VAR_URL_PARAMS') && isset($_GET[C('VAR_URL_PARAMS')])){
                $input  =   array_merge($input,$_GET[C('VAR_URL_PARAMS')]);
            }
            break;
        case 'request' :   $input =& $_REQUEST;   break;
        case 'session' :   $input =& $_SESSION;   break;
        case 'cookie'  :   $input =& $_COOKIE;    break;
        case 'server'  :   $input =& $_SERVER;    break;
        case 'globals' :   $input =& $GLOBALS;    break;
        default:
            return NULL;
    }
   
    if(C('VAR_FILTERS')) {
        $_filters    =   explode(',',C('VAR_FILTERS'));
        foreach($_filters as $_filter){
            
            array_walk_recursive($input,$_filter);
        }
    }
    if(empty($name)) { 
        $data       =   $input; 
        $filters    =   isset($filter)?$filter:C('DEFAULT_FILTER');
        if($filters) {
            $filters    =   explode(',',$filters);
            foreach($filters as $filter){
                $data   =   array_map($filter,$data); 
            }
        }        
    }elseif(isset($input[$name])) { 
        $data       =	$input[$name];
        $filters    =   isset($filter)?$filter:C('DEFAULT_FILTER');
        if($filters) {
            $filters    =   explode(',',$filters);
            foreach($filters as $filter){
                if(function_exists($filter)) {
                    $data   =   is_array($data)?array_map($filter,$data):$filter($data); 
                }else{
                    $data   =   filter_var($data,is_int($filter)?$filter:filter_id($filter));
                    if(false === $data) {
                        return	 isset($default)?$default:NULL;
                    }
                }
            }
        }
    }else{ 
        $data       =	 isset($default)?$default:NULL;
    }
    return $data;
}


function G($start,$end='',$dec=4) {
    static $_info       =   array();
    static $_mem        =   array();
    if(is_float($end)) { 
        $_info[$start]  =   $end;
    }elseif(!empty($end)){
        if(!isset($_info[$end])) $_info[$end]       =  microtime(TRUE);
        if(MEMORY_LIMIT_ON && $dec=='m'){
            if(!isset($_mem[$end])) $_mem[$end]     =  memory_get_usage();
            return number_format(($_mem[$end]-$_mem[$start])/1024);          
        }else{
            return number_format(($_info[$end]-$_info[$start]),$dec);
        }       
            
    }else{ 
        $_info[$start]  =  microtime(TRUE);
        if(MEMORY_LIMIT_ON) $_mem[$start]           =  memory_get_usage();
    }
}


function N($key, $step=0,$save=false) {
    static $_num    = array();
    if (!isset($_num[$key])) {
        $_num[$key] = (false !== $save)? S('N_'.$key) :  0;
    }
    if (empty($step))
        return $_num[$key];
    else
        $_num[$key] = $_num[$key] + (int) $step;
    if(false !== $save){ 
        S('N_'.$key,$_num[$key],$save);
    }
}


function parse_name($name, $type=0) {
    if ($type) {
        return ucfirst(preg_replace("/_([a-zA-Z])/e", "strtoupper('\\1')", $name));
    } else {
        return strtolower(trim(preg_replace("/[A-Z]/", "_\\0", $name), "_"));
    }
}


function require_cache($filename) {
    static $_importFiles = array();
    if (!isset($_importFiles[$filename])) {
        if (file_exists_case($filename)) {
            require $filename;
            $_importFiles[$filename] = true;
        } else {
            $_importFiles[$filename] = false;
        }
    }
    return $_importFiles[$filename];
}

function require_array($array,$return=false){
    foreach ($array as $file){
        if (require_cache($file) && $return) return true;
    }
    if($return) return false;
}


function file_exists_case($filename) {
    if (is_file($filename)) {
        if (IS_WIN && C('APP_FILE_CASE')) {
            if (basename(realpath($filename)) != basename($filename))
                return false;
        }
        return true;
    }
    return false;
}


function import($class, $baseUrl = '', $ext='.class.php') {
    static $_file = array();
    $class = str_replace(array('.', '#'), array('/', '.'), $class);
    if ('' === $baseUrl && false === strpos($class, '/')) {
        return alias_import($class);
    }
    if (isset($_file[$class . $baseUrl]))
        return true;
    else
        $_file[$class . $baseUrl] = true;
    $class_strut     = explode('/', $class);
    if (empty($baseUrl)) {
        $libPath    =   defined('BASE_LIB_PATH')?BASE_LIB_PATH:LIB_PATH;
        if ('@' == $class_strut[0] || APP_NAME == $class_strut[0]) {
           
            $baseUrl = dirname($libPath);
            $class   = substr_replace($class, basename($libPath).'/', 0, strlen($class_strut[0]) + 1);
        }elseif ('think' == strtolower($class_strut[0])){ 
            $baseUrl = CORE_PATH;
            $class   = substr($class,6);
        }elseif (in_array(strtolower($class_strut[0]), array('org', 'com'))) {
           
            $baseUrl = LIBRARY_PATH;
        }else { 
            $class   = substr_replace($class, '', 0, strlen($class_strut[0]) + 1);
            $baseUrl = APP_PATH . '../' . $class_strut[0] . '/'.basename($libPath).'/';
        }
    }
    if (substr($baseUrl, -1) != '/')
        $baseUrl    .= '/';
    $classfile       = $baseUrl . $class . $ext;
    if (!class_exists(basename($class),false)) {

        return require_cache($classfile);
    }
}


function load($name, $baseUrl='', $ext='.php') {
    $name = str_replace(array('.', '#'), array('/', '.'), $name);
    if (empty($baseUrl)) {
        if (0 === strpos($name, '@/')) {
            $baseUrl    = COMMON_PATH;
            $name       = substr($name, 2);
        } else {
            $baseUrl    = EXTEND_PATH . 'Function/';
        }
    }
    if (substr($baseUrl, -1) != '/')
        $baseUrl       .= '/';
    require_cache($baseUrl . $name . $ext);
}


function vendor($class, $baseUrl = '', $ext='.php') {
    if (empty($baseUrl))
        $baseUrl = VENDOR_PATH;
    return import($class, $baseUrl, $ext);
}


function alias_import($alias, $classfile='') {
    static $_alias = array();
    if (is_string($alias)) {
        if(isset($_alias[$alias])) {
            return require_cache($_alias[$alias]);
        }elseif ('' !== $classfile) {
            $_alias[$alias] = $classfile;
            return;
        }
    }elseif (is_array($alias)) {
        $_alias   =  array_merge($_alias,$alias);
        return;
    }
    return false;
}


function D($name='',$layer='') {
    if(empty($name)) return new Model;
    static $_model  =   array();
    $layer          =   $layer?$layer:C('DEFAULT_M_LAYER');
    if(strpos($name,'://')) {
        list($app)  =   explode('://',$name);
        $name       =   str_replace('://','/'.$layer.'/',$name);
    }else{
        $app        =   C('DEFAULT_APP');
        $name       =   $app.'/'.$layer.'/'.$name;
    }
    if(isset($_model[$name]))   return $_model[$name];
    $path           =   explode('/',$name);
    if($list = C('EXTEND_GROUP_LIST') && isset($list[$app])){
        $baseUrl    =   $list[$app];
        import($path[2].'/'.$path[1].'/'.$path[3].$layer,$baseUrl);
    }elseif(count($path)>3 && 1 == C('APP_GROUP_MODE')) { 
        $baseUrl    =   $path[0]== '@' ? dirname(BASE_LIB_PATH) : APP_PATH.'../'.$path[0].'/'.C('APP_GROUP_PATH').'/';
        import($path[2].'/'.$path[1].'/'.$path[3].$layer,$baseUrl);
    }else{
        import($name.$layer);
    } 
    $class          =   basename($name.$layer);
    if(class_exists($class)) {
        $model      =   new $class(basename($name));
    }else {
        $model      =   new Model(basename($name));
    }
    $_model[$name]  =  $model;
    return $model;
}

function M($name='', $tablePrefix='',$connection='') {
    static $_model  = array();
    if(strpos($name,':')) {
        list($class,$name)    =  explode(':',$name);
    }else{
        $class      =   'Model';
    }
    $guid           =   $tablePrefix . $name . '_' . $class;
    if (!isset($_model[$guid]))
        $_model[$guid] = new $class($name,$tablePrefix,$connection);
    return $_model[$guid];
}

function A($name,$layer='',$common=false) {
    static $_action = array();
    $layer      =   $layer?$layer:C('DEFAULT_C_LAYER');
    if(strpos($name,'://')) {
        list($app)  =   explode('://',$name);
        $name   =  str_replace('://','/'.$layer.'/',$name);
    }else{
        $app    =   '@';
        $name   =  '@/'.$layer.'/'.$name;
    }
    if(isset($_action[$name]))  return $_action[$name];
    $path           =   explode('/',$name);
    if($list = C('EXTEND_GROUP_LIST') && isset($list[$app])){ 
        $baseUrl    =   $list[$app];
        import($path[2].'/'.$path[1].'/'.$path[3].$layer,$baseUrl);
    }elseif(count($path)>3 && 1 == C('APP_GROUP_MODE')) { 
        $baseUrl    =   $path[0]== '@' ? dirname(BASE_LIB_PATH) : APP_PATH.'../'.$path[0].'/'.C('APP_GROUP_PATH').'/';
        import($path[2].'/'.$path[1].'/'.$path[3].$layer,$baseUrl);
    }elseif($common) { 
        import(str_replace('@/','',$name).$layer,LIB_PATH);
    }else{
        import($name.$layer);
    }
    $class      =   basename($name.$layer);
    if(class_exists($class,false)) {
        $action             =   new $class();
        $_action[$name]     =   $action;
        return $action;
    }else {
        return false;
    }
}

function R($url,$vars=array(),$layer='') {
    $info   =   pathinfo($url);
    $action =   $info['basename'];
    $module =   $info['dirname'];
    $class  =   A($module,$layer);
    if($class){
        if(is_string($vars)) {
            parse_str($vars,$vars);
        }
        return call_user_func_array(array(&$class,$action.C('ACTION_SUFFIX')),$vars);
    }else{
        return false;
    }
}

function L($name=null, $value=null) {
    static $_lang = array();
   
    if (empty($name))
        return $_lang;
    
    if (is_string($name)) {
        $name = strtoupper($name);
        if (is_null($value))
            return isset($_lang[$name]) ? $_lang[$name] : $name;
        $_lang[$name] = $value;
        return;
    }
    
    if (is_array($name))
        $_lang = array_merge($_lang, array_change_key_case($name, CASE_UPPER));
    return;
}


function C($name=null, $value=null) {
    static $_config = array();
    if (empty($name)) {
        if(!empty($value) && $array = S('c_'.$value)) {
            $_config = array_merge($_config, array_change_key_case($array));
        }
        return $_config;
    }
    
    if (is_string($name)) {
        if (!strpos($name, '.')) {
            $name = strtolower($name);
            if (is_null($value))
                return isset($_config[$name]) ? $_config[$name] : null;
            $_config[$name] = $value;
            return;
        }
       
        $name = explode('.', $name);
        $name[0]   =  strtolower($name[0]);
        if (is_null($value))
            return isset($_config[$name[0]][$name[1]]) ? $_config[$name[0]][$name[1]] : null;
        $_config[$name[0]][$name[1]] = $value;
        return;
    }
    if (is_array($name)){
        $_config = array_merge($_config, array_change_key_case($name));
        if(!empty($value)) {
            S('c_'.$value,$_config);
        }
        return;
    }
    return null;
}


function tag($tag, &$params=NULL) {

    $extends    = C('extends.' . $tag);
    $tags       = C('tags.' . $tag);
    if (!empty($tags)) {
        if(empty($tags['_overlay']) && !empty($extends)) { 
            $tags = array_unique(array_merge($extends,$tags));
        }elseif(isset($tags['_overlay'])){ 
            unset($tags['_overlay']);
        }
    }elseif(!empty($extends)) {
        $tags = $extends;
    }
    if($tags) {
        if(APP_DEBUG) {
            G($tag.'Start');
            trace('[ '.$tag.' ] --START--','','INFO');
        }
        foreach ($tags as $key=>$name) {
            if(!is_int($key)) { 
                $name   = $key;
            }
            B($name, $params);
        }
        if(APP_DEBUG) {
            trace('[ '.$tag.' ] --END-- [ RunTime:'.G($tag.'Start',$tag.'End',6).'s ]','','INFO');
        }
    }else{ 
        return false;
    }
}

function add_tag_behavior($tag,$behavior,$path='') {
    $array      =  C('tags.'.$tag);
    if(!$array) {
        $array  =  array();
    }
    if($path) {
        $array[$behavior] = $path;
    }else{
        $array[] =  $behavior;
    }
    C('tags.'.$tag,$array);
}

function B($name, &$params=NULL) {
    if(strpos($name,'/')){
        list($name,$method) = explode('/',$name);
    }else{
        $method     =   'run';
    }
    $class      = $name.'Behavior';
    if(APP_DEBUG) {
        G('behaviorStart');
    }
    $behavior   = new $class();
    $behavior->$method($params);
    if(APP_DEBUG) {
        G('behaviorEnd');
        trace($name.' Behavior ::'.$method.' [ RunTime:'.G('behaviorStart','behaviorEnd',6).'s ]','','INFO');
    }
}


function strip_whitespace($content) {
    $stripStr   = '';
    $tokens     = token_get_all($content);
    $last_space = false;
    for ($i = 0, $j = count($tokens); $i < $j; $i++) {
        if (is_string($tokens[$i])) {
            $last_space = false;
            $stripStr  .= $tokens[$i];
        } else {
            switch ($tokens[$i][0]) {
                case T_COMMENT:
                case T_DOC_COMMENT:
                    break;
                case T_WHITESPACE:
                    if (!$last_space) {
                        $stripStr  .= ' ';
                        $last_space = true;
                    }
                    break;
                case T_START_HEREDOC:
                    $stripStr .= "<<<THINK\n";
                    break;
                case T_END_HEREDOC:
                    $stripStr .= "THINK;\n";
                    for($k = $i+1; $k < $j; $k++) {
                        if(is_string($tokens[$k]) && $tokens[$k] == ';') {
                            $i = $k;
                            break;
                        } else if($tokens[$k][0] == T_CLOSE_TAG) {
                            break;
                        }
                    }
                    break;
                default:
                    $last_space = false;
                    $stripStr  .= $tokens[$i][1];
            }
        }
    }
    return $stripStr;
}

function compile($filename) {
    $content        = file_get_contents($filename);
    $content        = preg_replace('/\/\/\[RUNTIME\](.*?)\/\/\[\/RUNTIME\]/s', '', $content);
    $content        = substr(trim($content), 5);
    if ('?>' == substr($content, -2))
        $content    = substr($content, 0, -2);
    return $content;
}

function array_define($array,$check=true) {
    $content = "\n";
    foreach ($array as $key => $val) {
        $key = strtoupper($key);
        if($check)   $content .= 'defined(\'' . $key . '\') or ';
        if (is_int($val) || is_float($val)) {
            $content .= "define('" . $key . "'," . $val . ');';
        } elseif (is_bool($val)) {
            $val = ($val) ? 'true' : 'false';
            $content .= "define('" . $key . "'," . $val . ');';
        } elseif (is_string($val)) {
            $content .= "define('" . $key . "','" . addslashes($val) . "');";
        }
        $content    .= "\n";
    }
    return $content;
}

function trace($value='[think]',$label='',$level='DEBUG',$record=false) {
    static $_trace =  array();
    if('[think]' === $value){ 
        return $_trace;
    }else{
        $info   =   ($label?$label.':':'').print_r($value,true);
        if('ERR' == $level && C('TRACE_EXCEPTION')) {
            throw_exception($info);
        }
        $level  =   strtoupper($level);
        if(!isset($_trace[$level])) {
                $_trace[$level] =   array();
            }
        $_trace[$level][]   = $info;
        if((defined('IS_AJAX') && IS_AJAX) || !C('SHOW_PAGE_TRACE')  || $record) {
            Log::record($info,$level,$record);
        }
    }
}


class Qmkuaidi
{
/*    public $kdifo;	
    public function __construct($kdifo)
	{
      $this->kdifo  = $kdifo;
    }*/
public function getKname($str)
{
$kdarray=array (
'ems'=>'EMS快递',
'shentong'=>'申通快递',
'shunfeng'=>'顺丰快递',
'yuantong'=>'圆通快递',
'yunda'=>'韵达快递',
'huitong'=>'百世汇通快递',
'tiantian'=>'天天快递',
'zhongtong'=>'中通快递',
'zhaijisong'=>'宅急送快递',
'pingyou'=>'中国邮政',
'quanfeng'=>'全峰快递',
'guotong'=>'国通快递',
'jingdong'=>'京东快递',
'sure'=>'速尔快递',
'kuaijie'=>'快捷快递',
'ririshun'=>'日日顺物流',
'zhongtie'=>'中铁快运',
'yousu'=>'优速快递',
'longbang'=>'龙邦快递',
'debang'=>'德邦物流',
'rufeng'=>'如风达快递',
'lianhaotong'=>'联昊通快递',
'fedex'=>'国际Fedex',
'fedexcn'=>'Fedex国内',
'dhl'=>'DHL快递',
'xinfeng'=>'信丰快递',
'eyoubao'=>'E邮宝',
'zhongxinda'=>'忠信达快递',
'changtong'=>'长通物流',
'usps'=>'USPS快递',
'huaqi'=>'华企快递',
'zhima'=>'芝麻开门快递',
'gnxb'=>'邮政小包',
'nell'=>'尼尔快递',
'zengyi'=>'增益快递',
'yuxin'=>'宇鑫物流',
'xingchengzhaipei'=>'星程宅配快递',
'anneng'=>'安能物流',
'dada'=>'大达物流',
'tongzhishu'=>'高考录取通知书',
'aol'=>'AOL快递',
'dongjun'=>'成都东骏快递',
'suning'=>'苏宁快递',
'upu'=>'UPU-Universal Postal Union',
'quanyi'=>'全一快递',
'huayu'=>'华宇物流',
'quanritong'=>'全日通快递',
'fengcheng'=>'丰程物流',
'minhang'=>'民航快递',
'zhongyou'=>'中邮物流',
'wanjia'=>'万家物流',
'jiaji'=>'佳吉快运',
'wanxiang'=>'万象物流',
'beihai'=>'贝海国际快递',
'junfeng'=>'墨尔本骏丰快递',
'junda'=>'骏达快递',
'quanxintong'=>'全信通快递',
'ups'=>'UPS快递',
'tnt'=>'TNT快递',
'yibang'=>'一邦快递',
'shenghui'=>'盛辉物流',
'yafeng'=>'亚风快递',
'dsu'=>'D速快递',
'datian'=>'大田物流',
'jiayi'=>'佳怡物流',
'jiayunmei'=>'加运美快递',
'quanchen'=>'全晨快递',
'ocs'=>'OCS快递',
'shengfeng'=>'盛丰物流',
'xinbang'=>'新邦物流',
'chengguang'=>'程光快递',
'fengda'=>'丰达快递',
'feihang'=>'原飞航物流',
'jinyue'=>'晋越快递',
'yuefeng'=>'越丰快递',
'anjie'=>'安捷快递',
'aae'=>'AAE快递',
'yuntong'=>'运通中港快递',
'dpex'=>'DPEX快递',
'yuancheng'=>'远成物流',
'gdyz'=>'广东邮政物流',
'aramex'=>'Aramex国际快递',
'intmail'=>'国际邮政快递',
'ytfh'=>'北京一统飞鸿快递',
'lejiedi'=>'乐捷递快递',
'santai'=>'三态速递',
'chuanzhi'=>'传志快递',
'gongsuda'=>'共速达物流|快递',
'ees'=>'百福东方物流',
'scs'=>'伟邦(SCS)快递',
'pinganda'=>'平安达',
'yad'=>'源安达快递',
'disifang'=>'递四方速递',
'yinjie'=>'顺捷丰达快递',
'jldt'=>'嘉里大通物流',
'coe'=>'东方快递',
'chuanxi'=>'传喜快递',
'feibao'=>'飞豹快递',
'jingguang'=>'京广快递',
'feiyuan'=>'飞远物流',
'cszx'=>'城市之星',
'rpx'=>'RPX保时达',
'citylink'=>'CityLinkExpress',
'chengshi100'=>'城市100',
'lijisong'=>'成都立即送快递',
'balunzhi'=>'巴伦支',
'dayang'=>'大洋物流快递',
'diantong'=>'店通快递',
'fanyu'=>'凡宇快递',
'haosheng'=>'昊盛物流',
'hebeijianhua'=>'河北建华快递',
'jixianda'=>'急先达物流',
'suijia'=>'穗佳物流',
'shengan'=>'圣安物流',
'saiaodi'=>'赛澳递',
'haihong'=>'山东海红快递',
'weitepai'=>'微特派',
'chengji'=>'城际快递',
'fardar'=>'Fardar',
'henglu'=>'恒路物流',
'hwhq'=>'海外环球快递',
'jinda'=>'金大物流',
'kuayue'=>'跨越快递',
'kcs'=>'顺鑫(KCS)快递',
'mingliang'=>'明亮物流',
'minbang'=>'民邦快递',
'minsheng'=>'闽盛快递',
'xiyoute'=>'希优特快递',
'xianglong'=>'祥龙运通快递',
'yishunhang'=>'亿顺航快递',
'benteng'=>'成都奔腾国际快递',
'zhongtian'=>'济南中天万运',
'zhengzhoujianhua'=>'郑州建华快递',
'feite'=>'飞特物流',
'huahan'=>'华翰物流',
'baotongda'=>'宝通达',
'chukouyi'=>'出口易物流',
'yumeijie'=>'誉美捷快递',
'kuanrong'=>'宽容物流',
'nanbei'=>'南北快递',
'wanbo'=>'万博快递',
'suchengzhaipei'=>'速呈宅配',
'shengbang'=>'晟邦物流',
'baiqian'=>'百千诚国际物流',
'gaotie'=>'高铁快递',
'guanda'=>'冠达快递',
'haolaiyun'=>'好来运快递',
'hutong'=>'户通物流',
'huahang'=>'华航快递',
'huangmajia'=>'黄马甲快递',
'ucs'=>'合众速递',
'jiete'=>'捷特快递',
'jiuyi'=>'久易快递',
'kuaiyouda'=>'快优达速递',
'lanhu'=>'蓝弧快递',
'menduimen'=>'门对门快递',
'peixing'=>'陪行物流',
'riyu'=>'日昱物流',
'lindao'=>'上海林道货运',
'shiyun'=>'世运快递',
'aoshuo'=>'奥硕物流',
'nsf'=>'新顺丰（NSF）快递',
'dajin'=>'大金物流',
'coscon'=>'中国远洋运输(COSCON)',
'yuhong'=>'宇宏物流',
'jiayu'=>'佳宇物流',
'gangkuai'=>'港快速递',
'kuaitao'=>'快淘速递',
'sutong'=>'速通物流',
'anxun'=>'安迅物流',
'hkpost'=>'香港邮政',
'jppost'=>'日本邮政',
'singpost'=>'新加坡邮政(Sing Post)',
'ztwl'=>'中铁物流',
'ppbyb'=>'贝邮宝',
'yanwen'=>'燕文物流',
'feiyang'=>'飞洋快递',
'zuochuan'=>'佐川急便',
'hengyu'=>'恒宇运通',
'mengsu'=>'蒙速快递',
'wuhuan'=>'五环速递',
'simai'=>'思迈快递',
'jiahuier'=>'佳惠尔快递',
'ande'=>'安得物流',
'rongqing'=>'荣庆物流',
'dashun'=>'大顺物流',
'fangfangda'=>'方方达物流',
'huiwen'=>'汇文快递',
'sujie'=>'速捷快递',
'dhlde'=>'德国DHL快递',
'baiteng'=>'百腾物流',
'dcs'=>'DCS快递',
'dpd'=>'DPD快递',
'tengxunda'=>'腾迅达物流',
'pinjun'=>'品骏快递',
'bse'=>'蓝天快递',
'ueq'=>'UEQ快递',
'xru'=>'XRU快递',
'ycky'=>'远成快运',
'pocztex'=>'波兰邮政',
'fanjie'=>'泛捷国际快递',
'8dt'=>'八达通快递',
'yikeman'=>'易客满快递',
'fastgo'=>'速派快递',
'cnpex'=>'中邮快递',
'auexpress'=>'澳邮中国快运',
'pca'=>'PCA Express',
'a2u'=>'A2U快递',
'birdex'=>'笨鸟快递',
'ada'=>'明大快递',
'quantium'=>'Quantium',
'ontrac'=>'OnTrac快递',
'quantong'=>'全通快递',
'tntuk'=>'TNT UK',
'ajexpress'=>'捷记方舟快递',
'jcex'=>'佳成国际快递',
'gls'=>'GLS快递',
'gaticn'=>'GATI快递',
'gsm'=>'GSM快递',
'jc56'=>'锦程国际物流',
'tianfeng'=>'天峰国际物流',
'one-world'=>'One World 物流',
'yunexpress'=>'云途物流',
'sufengda'=>'速丰达快递',
'qexpress'=>'易达通快递',
'cfe'=>'CFE 超峰快递',
'yisu'=>'翼速物流',
'suyi'=>'速翼快递',
'suchi'=>'苏驰物流',
'shunda'=>'顺达快递',
'arkexpress'=>'方舟快递',
'changjiang'=>'长江国际速递',
'fox'=>'FOX快递',
'apeexpress'=>'美速达快递',
'zhaosuda'=>'兆速达物流',
'ushipshop'=>'优寄快递',
'yixiang'=>'亿翔快递',
'feiying'=>'飞鹰物流',
'ewe'=>'EWE快递',
'nengda'=>'能达快递',
'ruifeng'=>'瑞丰速递',
'suteng'=>'速腾快递',
'zongxing'=>'纵行物流',
'jingshi'=>'京世物流',
'huacheng'=>'华诚物流'
);
    //根据val返回键名
	$kd='';
	$kdarr=array_keys($kdarray,$str);
	$kd_name=$kdarr[0];
	return $kd_name;
}
public function ickd($kdx)
{
	
	$kdarr=explode('-',$kdx);
	$com1=$kdarr[0];
    $id='109593';//API KEY
	$key='3e81f9efd50f0e653104023d6252263f';
    $com=$this->getKname($com1);//快递公司
    $nu=trim($kdarr[1]);//快递单号
    $type='json';
	$type='html';
    $encode='utf8';
    $gateway=sprintf('http://api.ickd.cn/?id=%s&secret=%s&com=%s&nu=%s&encode=%s&type=%s',$id,$key,$com,$nu,$encode,$type);
  $ch=curl_init($gateway);
  curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
  curl_setopt($ch,CURLOPT_HEADER,false);
  $resp=curl_exec($ch);
  $errmsg=curl_error($ch);
  if($errmsg){
      exit($errmsg);
  }
  curl_close($ch);
  return $resp;
}


}

function qmkdapi($kdx)
{
	$qmkd=new Qmkuaidi();
	return $qmkd->ickd($kdx);
}
//user
/*
$kdx='顺丰快递-950009746761';
echo qmkdapi($kdx);

*/



function jxfcode($length)
{
	$hash = '';
	$chars = '0123456789';
	$max = strlen($chars) - 1;
	mt_srand((double)microtime() * 1000000);
	for($i = 0; $i < $length; $i++) 
	{
		$hash .= $chars[mt_rand(0, $max)];
	}
	return $hash;
}

/*缩略图文件名*/
function thumbname($name)
{
	$name=str_replace('.jpg','_thumb.jpg',$name);
	$name=str_replace('.png','_thumb.png',$name);
	$name=str_replace('.gif','_thumb.gif',$name);
	return $name;
} 
function img2thumb($srcFile,$toFile,$toW,$toH) 
{ 
	if($toFile==""){$toFile=$srcFile; } 
	$info = ""; 	
	$data= getimagesize('./'.$srcFile);	  
	$ot = strtolower(jfileextm($srcFile));
	switch ($ot) 
	{ 
		case 'gif': 
			if(!function_exists("imagecreatefromgif")){ return $srcFile;} 
			$im = ImageCreateFromGIF($srcFile); 
			$bgcolor=ImageColorAllocate($im,0,0,0); 
			$bgcolor = ImageColorTransparent($im,$bgcolor) ; 
			break; 
		case 'jpg': 
			if(!function_exists("imagecreatefromjpeg")){ return $srcFile;} 
			$im = ImageCreateFromJpeg($srcFile); 
			break; 
		case 'png': 
			$im = ImageCreateFromPNG($srcFile); 
			break; 
	} 
	$srcW=ImageSX($im); 
	$srcH=ImageSY($im); 
	if($srcW<=$toW && $srcH<=$toH) 
	{ 
		if($srcFile!=$toFile) { copy($srcFile,$toFile); }else{return $srcFile;} 
	} 
	$toWH=$toW/$toH; 
	$srcWH=$srcW/$srcH; 
	if($toWH<=$srcWH)
	{ 
		$ftoW=$toW; 
		$ftoH=$ftoW*($srcH/$srcW); 
	} 
	else
	{ 
		$ftoH=$toH; 
		$ftoW=$ftoH*($srcW/$srcH); 
	} 
	if($srcW>$toW||$srcH>$toH) 
	{ 
		if(function_exists("imagecreatetruecolor"))
		{ 
			@$ni = ImageCreateTrueColor($ftoW,$ftoH); 
			if($ni){ImageCopyResampled($ni,$im,0,0,0,0,$ftoW,$ftoH,$srcW,$srcH);}
			else{ $ni=ImageCreate($ftoW,$ftoH); ImageCopyResized($ni,$im,0,0,0,0,$ftoW,$ftoH,$srcW,$srcH);} 
		}
		else
		{ 
			$ni=ImageCreate($ftoW,$ftoH); 
			ImageCopyResized($ni,$im,0,0,0,0,$ftoW,$ftoH,$srcW,$srcH); 
		} 
		switch ($data[2]) 
		{ 
			case 1: 
			$bgcolor=ImageColorAllocate($ni,0,0,0); 
			$bgcolor = ImageColorTransparent($ni,$bgcolor) ; 
			ImageGif($ni,$toFile); 
			break; 
			case 2: 
			ImageJpeg($ni,$toFile); 
			break; 
			case 3: 
			ImagePNG($ni,$toFile); 
			break; 	
		} 
		ImageDestroy($ni); 
	} 
	ImageDestroy($im); 
	return $toFile;
}

function thumbs($src_file, $dst_file , $new_width , $new_height)
{
	if($new_width <1 || $new_height<1){return $src_file;}
	if(!file_exists($src_file)) {return $src_file;}
	$ot = strtolower(jfileextm($src_file));
	switch ($ot)
	{
		case "png":
			$src_img=imagecreatefrompng($src_file);
			break;
		case "gif":
			$src_img=imagecreatefromgif($src_file);
			break;
		default:
			$src_img=imagecreatefromjpeg($src_file);
			break;
	}
	$w=imagesx($src_img);
	$h=imagesy($src_img);
	$ratio_w=1.0 * $new_width / $w;
	$ratio_h=1.0 * $new_height / $h;
	$ratio=1.0;
	if( ($ratio_w < 1 && $ratio_h < 1) || ($ratio_w > 1 && $ratio_h > 1)) 
	{
		if($ratio_w < $ratio_h)
		{
			$ratio = $ratio_h ;
			$inter_h=(int) ($new_height / $ratio);
			$inter_w=$w;
		}
		else
		{
			$ratio = $ratio_w ;
			$inter_w=(int)($new_width / $ratio);
			$inter_h=$h;
		}


		$ydx=0;$ydy=0;
		if ($w!=$h)
		{
			if ($w>$h)
			{
				$ydx=($inter_w-$inter_h)/2;
			}	
			else
			{
				$ydy=($inter_h-$inter_w)/2;
			}
		}
		$inter_w=(int)($new_width / $ratio);
		$inter_h=(int) ($new_height / $ratio);
		$inter_img=imagecreatetruecolor($inter_w , $inter_h);
		imagecopy($inter_img,$src_img,0,0,$ydx,$ydy,$inter_w,$inter_h);	
		$new_img=imagecreatetruecolor($new_width,$new_height);	
		imagecopyresampled($new_img,$inter_img,0,0,0,0,$new_width,$new_height,$inter_w,$inter_h);
		switch ($ot)
		{
			case "png":
				imagepng($new_img,$dst_file);
				break;
			case "gif":
				imagegif($new_img,$dst_file);
				break;
			default:
				imagejpeg($new_img,$dst_file);
				break;
		}
	}
	else
	{
		$ratio=$ratio_h>$ratio_w? $ratio_h : $ratio_w;
		$inter_w=(int)($w * $ratio);
		$inter_h=(int) ($h * $ratio);
		$inter_img=imagecreatetruecolor($inter_w , $inter_h);
		imagecopyresampled($inter_img,$src_img,0,0,0,0,$inter_w,$inter_h,$w,$h);
		$new_img=imagecreatetruecolor($new_width,$new_height);
		imagecopy($new_img, $inter_img, 0,0,0,0,$new_width,$new_height);
		switch ($ot)
		{
			case "png":
				imagepng($new_img,$dst_file);
				break;
			case "gif":
				imagegif($new_img,$dst_file);
				break;
			default:
				imagejpeg($new_img,$dst_file);
				break;
		}
	}
	return $dst_file;
}

function jfileextm($file)
{
    return pathinfo($file, PATHINFO_EXTENSION);
} 
function fileextm($file)
{
    return pathinfo($file, PATHINFO_EXTENSION);
}
function GetIpLookup($ip = ''){
    if($ip =='')
    {
        $ip = GetIPx();
    }
    $res = @file_get_contents('http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js&ip=' . $ip);
    if(empty($res)){ return false; }
    $jsonMatches = array();
    preg_match('#\{.+?\}#', $res, $jsonMatches);
    if(!isset($jsonMatches[0])){ return false; }
    $json = json_decode($jsonMatches[0], true);
    if(isset($json['ret']) && $json['ret'] == 1){
        $json['ip'] = $ip;
        unset($json['ret']);
    }else{
        return false;
    }
    return $json;
}