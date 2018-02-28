<?php

function dosendsms($mobile,$msg,$needstatus=true)
{
$chuanglan_config['api_send_url'] = 'http://smssh1.253.com/msg/send/json';
$chuanglan_config['api_account']    = 'N1663145';
$chuanglan_config['api_password']   = 'GFvoTltid16202';
$postArr = array (
    'account'  =>  $chuanglan_config['api_account'],
    'password' => $chuanglan_config['api_password'],
    'msg' => urlencode($msg),
    'phone' => $mobile,
    'report' => $needstatus
);
$result = curlsPost($chuanglan_config['api_send_url'] , $postArr);
if(!is_null(json_decode($result)))
{
    $output=json_decode($result,true);
    if(isset($output['code']) && $output['code']=='0'){$result=1;}else{$result='-1'.$output['errorMsg'];}
}else{$result=0;}
return $result;
}

function curlsPost($url,$postFields){
    $postFields = json_encode($postFields);
    $ch = curl_init();
    curl_setopt($ch,CURLOPT_URL,$url); 
    curl_setopt($ch,CURLOPT_HTTPHEADER,array('Content-Type: application/json; charset=utf-8'));
    curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
    curl_setopt($ch,CURLOPT_POST,1);
    curl_setopt($ch,CURLOPT_POSTFIELDS,$postFields);
    curl_setopt($ch,CURLOPT_TIMEOUT,1);
    curl_setopt($ch,CURLOPT_SSL_VERIFYHOST,0);
    curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,0);
    $ret = curl_exec($ch);
    if (false == $ret) {$result = curl_error($ch);} 
    else{$rsp = curl_getinfo($ch,CURLINFO_HTTP_CODE);
    if (200 != $rsp) {$result = "请求状态 ". $rsp . " " . curl_error($ch);}else {$result = $ret;}}
    curl_close($ch);
    return $result;
}
    
/*查询额度*/
function queryBalance(){
$chuanglan_config['api_balance_query_url'] = 'http://smssh1.253.com/msg/balance/json';
$chuanglan_config['api_account']    = 'N1663145';
$chuanglan_config['api_password']   = 'GFvoTltid16202';
    $postArr = array ( 
        'account' => $chuanglan_config['api_account'],
        'password' => $chuanglan_config['api_password'],
    );
    $result = curlsPost($chuanglan_config['api_balance_query_url'], $postArr);
    return $result;
}


function srequest()
{
    $request=\think\Request::instance();
    return $request;
}

function lmfirst($id)
{
    $zid=M("lm")->where("fid='$id' and del='0'")->order("sort asc,id asc")->limit(1)->value("id");
    if ((int)$zid>0){return $zid;}
    return $id; 
}

function lmlist($fid=0,$t=9999,$f=0,$order='sort asc,id desc')
{                   
  $arr= M("lm")->where("fid='$fid' and del='0'")->order($order)->limit($f,$t)->select();
  return $arr;
}

function cntitle($lm)
{
    return info_ty(0,$lm,'cntitle');
}
function target($lm)
{
    $url=info_ty(0,$lm,'url');
    if ($url!=''){return " target='_balnk'";}
} 
function entitle($lm)
{
    return info_ty(0,$lm,'entitle');
}
function adf($id,$str)
{
    $m=M('ad');$m=$m->where("id='$id' and del='0'")->find();return $m[$str];
}
function adfs($id)
{
    $m=M('ad');return $m->where("id='$id' and del='0'")->find();
}
/*只提取数字*/
function findNum($str=''){
    $str=trim($str);if(empty($str)){return '0';}
    $temp=array('1','2','3','4','5','6','7','8','9','0');
    $result='0';
    for($i=0;$i<strlen($str);$i++){
    if(in_array($str[$i],$temp)){$result.=$str[$i];}
    }
    return $result;
}

//集成原来M函数
function M($tb,$tb2='')
{
    return \think\Db::name($tb);
}

/*获取中文字符长度*/
function utf8_strlens($string = null)
{
    preg_match_all("/./us", $string, $match);
    return count($match[0]);
}
//字符分割  比如中文等于张三 则返回张　三
function explodezw($str,$fg='　')
{
    preg_match_all("/./u",$str, $cnarr);
    $str=$cnarr[0][0].$fg.$cnarr[0][1]; 
}
// 应用公共文件
//生成二维码
//png($text,$outfile =false,$level=QR_ECLEVEL_L,$size = 3, $margin = 4,$saveandprint=false, $back_color = 0xFFFFFF, $fore_color = 0x000000)
function qrcode($url,$size=8){
    Vendor('Phpqrcode.phpqrcode');
    // 如果没有http 则添加
    if (strpos($url, 'http')===false) {
        $url='http://'.$url;
    }
    QRcode::png($url,false,QR_ECLEVEL_L,$size,2,false,0xFFFFFF,0x000000);
}

function qrcodes($url,$size=16){
    Vendor('Phpqrcode.phpqrcode');
    QRcode::png($url,false,QR_ECLEVEL_L,$size,2,false,0xFFFFFF,0x000000);
}

/*
无限极分类 根据不同的数据表
$nid 当前栏目id
$id  循环遍历id
$tb  数据表
*/
function Soption($nid=0,$id=0,$tb='lm',$x='')
{ 
    $m=M($tb);$str='';$arr=$m->where("fid='$id' and del='0'")->order('sort asc')->select();
    if(is_array($arr)){$x2=($id==0)?"":"└";foreach($arr as $k=>$vo){$selstr=($vo['id']==$nid)?" selected='selected'":"";$str.="<option value='{$vo['id']}' {$selstr}>{$x}{$x2}{$vo['cntitle']}</option>".Soption($nid,$vo['id'],$tb,$x.'　');}}
    return $str;
}


function Soptiong($nid=0,$id=0,$tb='lm',$x='')
{ 
    $m=M($tb);$str='';$arr=$m->where("fid='$id' and del='0'")->order('sort asc')->select();
    if(is_array($arr)){$x2=($id==0)?"":"└";foreach($arr as $k=>$vo){$selstr=($vo['id']==$nid)?" selected='selected'":"";
        $optionx=Soptiong($nid,$vo['id'],$tb,$x.'　');
        if ($optionx)
        {
            $str.="<optgroup label='{$x}{$x2}{$vo['cntitle']}' {$selstr}>{$x}{$x2}{$vo['cntitle']}$optionx</optgroup>";
        }
        else
        {
         $str.="<option value='{$vo['id']}' {$selstr}>{$x}{$x2}{$vo['cntitle']}</option>";   
        }
    }}
    return $str;
}

//生成单个html函数 参数网址 文件路径
function qmhtml($url,$file='')
{
    //获取内容如果不支持file_get_contents可以用curl_get_contents函数替换
    $content=file_get_contents($url);
    //首先获取url内容的原因 url有生成html功能 不需要生成对应文件夹和文件，或可能是伪静态
    if ($file==''){return 1;}
    //根据静态文件获取文件夹路径
    $str1=substr($file,0,1);
    if ($str1=='/'){$file=substr($file,1,strlen($file)-1);}
    $patharr=explode('/',$file);
    $pathn=$patharr[count($patharr)-1];
    $path=str_replace($pathn,'',$file);
    if(empty($path)){ return '路径不能为空'; }
    if(empty($file)){ return '文件名不能为空'; }
    if(!is_dir($path))
    {
        if (!mkdir(iconv("UTF-8", "GBK", $path),0777,true)){return "$path 创建失败";}
    }
    if(!is_dir($path)){return $path.' 目录不存在!';}
    file_put_contents($file,$content);
    if(!file_exists($file)) {return '更新失败';}
    return '1';
}

/*栏目链接*/
function htmlname($id)
{       
    $url=info_ty(0,$id,'url');
    if ($url!=''){return $url;}
    $url=M("lm")->where("id='$id'")->value("weburl");
    switch (APP_YY)
    {
        case 'en':
            return '/'.APP_YY.$url;
            break;
    }
    return $url;
    return "?lm=$id";   
}

/*内容链接*/
function idlname($id)
{   
    $url=info_ty($id,0,'url');
    if ($url!=''){return $url;}
    $url=M("info")->where("id='$id'")->value("weburl");
    switch (APP_YY)
    {
        case 'en':
            return '/'.APP_YY.$url;
            break;
    }
    return $url;
    return "?id=$id";
}

/*静态栏目链接*/
function htmlname2($id)
{       
    $url=M("lm")->where("id='$id'")->value("weburl");
    return $url; 
}

/*静态栏目链接*/
function idlname2($id)
{   
    $url=M("info")->where("id='$id'")->value("weburl");
    return $url;
}

function getflagoption($x=''){
    $m=M('flag');
    $lmlist=$m->where("1=1")->order('id asc')->select();
    $str='';
    foreach($lmlist as $k=>$vo)
    {        
    $selstr=(strpos($x,$vo['att'])>-1)?" checked='checked'":"";         
    $str.="<input name='Xflag' type='checkbox' value='{$vo['att']}' {$selstr}>{$vo['attname']}[{$vo['att']}]</option>";
    }
    return $str;
}
function getflagoption2($x=''){
    $m=M('flag');
    $lmlist=$m->where("1=1")->order('id asc')->select();
    $str='';
    foreach($lmlist as $k=>$vo)
    {        
    $selstr=(strpos($x,$vo['att'])>-1)?" checked='checked'":"";         
    $str.="<input name='flag[]' type='checkbox' value='{$vo['att']}' {$selstr}>{$vo['attname']}[{$vo['att']}]</option>";
    }
    return $str;
}

//show
function shows($sql){
    $rs=\think\Db::query($sql);
    foreach ($rs as $key => $value)
    {
        foreach ($value as $key2 => $value2)
        {
            return $value2;
        }
    }
    return '';
}

function arclist($fid,$limit='912',$field='id,cntitle,img',$ty=0,$order='settop_time desc,sort asc,id desc'){
    $m=M('info');$fid=getsonid($fid);
    $sql="fid in (".$fid.") and audit='1' and audit2='1' and del='0'";
    switch ($ty)
    {
        case 9:
            $sql.=" and img!=''";
            break;
        case 8:
            $order="hit desc,settop_time desc,sort asc";
            break; 
        case 5:
            $order='s5 desc,s6 desc,settop_time desc,sort asc';
            break;  
        case 6:
            $order='s6 desc,s5 desc,settop_time desc,sort asc';
            break;
        case 11:
            $sql.=" and img!='' and flag like '%1%'";
            break; 
        case 12:
            $sql.=" and img!='' and flag like '%2%'";
            break;
        case 13:
            $sql.=" and img!='' and flag like '%3%'";
            break;
        case 14:
            $sql.=" and img!='' and flag like '%4%'";
            break;
    }
    if ($field=='')
    {
        $arr=$m->where($sql)->order($order)->limit($limit)->select();
    }
    else
    {
        $arr=$m->where($sql)->field($field)->order($order)->limit($limit)->select();
    }
    return $arr;    
}
function getlmlist($id=0,$x='　'){
    $m=M('lm');
    $lmlist=$m->where(" fid='$id' and del='0'")->order('sort asc')->select();
    $rt='';
    if(is_array($lmlist))
    {
        $x2=($id==0)?"":"└";
        foreach($lmlist as $k=>$vo)
        {    
            $rt[]=array_merge($vo,array('x'=>$x,'x2'=>$x2));        
            $rt1=getlmlist($vo['id'],$x.'　');
            if(!empty($rt1)&&is_array($rt1))
            {
                foreach($rt1 as $k1=>$v1)
                {
                    $rt[]=$v1;
                }
            }
        }
    }
    return $rt;
}
function sellm($id,$col='cntitle'){
    $m=getlm($id);
    return $m[$col];
}

function getconfig($ty=0){
    $m=M('config');
    $cm=$m->select();
    $config=array();
    foreach($cm as $vo)
    {
        $config[$vo['varname']]=$vo['value'];
        if ($vo['varname']=='cfg_head' ||$vo['varname']=='cfg_body')
        {
            $config[$vo['varname']]=htmlspecialchars_decode(StripSlashes($vo['value']));
        }
    }
    return $config;
}

function lmupdates($lm){
    $vo=M('lm')->select();
    foreach($vo as $v){
        getlm($v['id'],1);
        getsonid($v['id'],1);
        gettopid($v['id'],1);
    }
}
function getsonid($fid=0,$sty=0){
    $m=\think\Db::name('lm');
    $v=array($fid);        
    $ar=$m->where("fid=".$fid)->order('sort asc')->select();
    if(is_array($ar)){
        foreach($ar as $vo)
        {
            $x=_getsonid($m,$vo['id']);
            if(!empty($x)){
                $v[]=$x;
            }else{
                $v[]=$vo['id'];
            }
        }
    }
    $str=join(',',$v);
    return $str;
}
function _getsonid($m,$fid=0){
    $v=array($fid);
    $ar=$m->where("fid='$fid' and del='0'")->order('sort asc')->select();
    if(is_array($ar))
    {
        foreach($ar as $vo)
        {
            $x=_getsonid($m,$vo['id']);
            if(!empty($x)){
                $v[]=$x;
            }else{
                $v[]=$vo['id'];
            }
        }
    }
    return join(',',$v);
}

/*返回栏目id行*/
function getlm($id=0,$ty=0){
    $m=\think\Db::name('lm');
    $cm=$m->select();
    $lm=array();
    foreach($cm as $vo){
        $lm[$vo['id']]=$vo;
    }
    if ($id==0)
    {
    return $lm;
    }else{
    return $lm[$id];
    }
}
/*返回顶级id*/
function gettopid($id=0,$sty=0){
    $str='';
    $m=\think\Db::name('lm');
    $ar=$m->find($id);
    if(is_array($ar)){
        if($ar['fid']==0){
            $str=$id;
        }else{
            $str=_gettopid($m,$ar['fid']);
        }
    }
    return $str;

}
function _gettopid($m,$id=0){
    $str='';
    $ar=$m->find($id);
    if(is_array($ar)){
        if($ar['fid']==0){
            $str=$id;
        }else{
            $str=_gettopid($m,$ar['fid']);
        }           
    }
    return $str;
}

function get_sons($fb_ids)
{
    //$fb_ids='1,2,3,5,6,8,9,17';
    $f_child_array=explode(",",$fb_ids);
    foreach ($f_child_array as $fb_id)
    {
        $ids[]             = $fb_id;
        $frame_child_array = get_son($fb_id);
        if ($frame_child_array) 
        {
            foreach ($frame_child_array as $frame_child)
            {
                $ids = array_merge($ids,get_sons($frame_child));
            }
        }
    }
    return $ids;
}   

function get_son($type){
    $array  = array();  
    $lm=\think\Db::name('lm');
    $result = $lm->where("fid ='$type' and del='0'")->field('id')->select();
    foreach ($result as $key => $value) {
        $array[]=$row['id'];
    }
    return rep_array($array);
}             

function get_fpath($type){
    $array  = array();  
    $array[]=$type;
    $lm=\think\Db::name('lm');
    $fid=(int)$lm->where("id ='$type'")->value('fid');
    if($fid>0){
        $array[]=$fid;
        $array = array_merge($array,get_fpath($fid));
    }
    return rep_array($array);
}
function inid($sql)
{
    $arr=\think\Db::query($sql);  
    $temp="0";
    foreach ($arr as $key => $Trs) {
         $temp=$temp.",".$Trs['id'];
    } 
    return $temp;
}

function show($sql)
{
    $arr=\think\Db::query($sql);
    return $arr[0];
}

function lmdid($lm=0,$str='')
{
  $m=\think\Db::name('info');
  $v=$m->where("fid='$lm' and audit='1' and del='0'")->value($str);
  return stripslashes($v);
}
function get_lmfid($id=0,$lm=0,$str='')
{
    return info_ty(0,fidt($lm,$id),"fid");
}
function fidt($lm=0,$id=0)
{
    if ($id>0)
    {
        $m=\think\Db::name('info');
        $m=$m->where("id='$id' and audit='1' and del='0'")->find();
        return (int)$m['fid'];
    }
    return (int)$lm;
}
function info_ty($id=0,$lmx=0,$str='id')
{
    if ($id>0)
    {
        $m=\think\Db::name('info');       
        $m=$m->where("id='$id' and audit='1' and audit2='1' and del='0'")->value($str);
        return $m;
    }
    $lm=\think\Db::name('lm');
    $m=$lm->where("id='$lmx' and del='0'")->value($str);
    return $m;
}


/**base64格式图片保存在指定目录**/
function save64pic()
{
    header('Content-type:text/html;charset=utf-8');
    $base64_image = $_POST['imgBase64']; 
    date_default_timezone_set('Asia/Chongqing');
    error_reporting(0);
    if (preg_match('/^(data:\s*image\/(\w+);base64,)/', $base64_image,$result))
    {
        $type = $result[2];
        /*指定目录*/
        $new_file = 'pub/qm/p/image/'.date('Ymd',time())."/";
        
        $new_file = date('Ymd',time())."/";
        if(!file_exists($new_file))
        {
        //检查是否有该文件夹，如果没有就创建，并给予最高权限
        mkdir($new_file, 0700);
        }
        $new_file = $new_file.time().".{$type}";
        if (file_put_contents($new_file, base64_decode(str_replace($result[1], '', $base64_image)))){
        //echo '新文件保存成功：', $new_file;
        return $new_file;
        }else{
        return '';
        }
    }
    else
    {
        return '';
    }
}

/* 
    $filename='bg_1.gif';$src='1.gif';$result=flip($filename,$src,90); 只返回成功或失败
    exit("<img src='$src' width='100%'>");
    //图片旋转函数
*/
function  flip($filename,$src,$degrees = 90)
{
    //读取图片
    $data = getimagesize($filename);
    if($data==false)return false;
    //读取旧图片
    switch ($data[2]){
        case 1:
            $src_f = imagecreatefromgif($filename);break;
        case 2:
            $src_f = imagecreatefromjpeg($filename);break;
        case 3:
            $src_f = imagecreatefrompng($filename);break;
    } 
    if($src_f==""){return false;}
    $rotate = imagerotate($src_f, $degrees,0);
    if(!imagejpeg($rotate,$src,100))return false;
    imagedestroy($rotate);
    return true;
}

/*获取远程文件内容*/
function curl_get_contents($url,$post_data=null,$timeout=5) { 
    if (function_exists('curl_init'))
    {
        $ch = curl_init ();
        curl_setopt ($ch,CURLOPT_URL,$url);
        if ($post_data)
        {
            curl_setopt ($ch,CURLOPT_POST,1);
            curl_setopt ($ch,CURLOPT_POSTFIELDS,$post_data );
        }        
        curl_setopt($ch,CURLOPT_HEADER,0);
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
        curl_setopt($ch,CURLOPT_TIMEOUT,$timeout);      
        $result=curl_exec($ch);
        curl_close($ch);
    }
    else
    {
        $result=file_get_contents($url);
    }
    return $result; 
} 

//获得手机归属地
function phonenumberinfo($phone){
  $list = array();
  $soap =  new SoapClient('http://webservice.webxml.com.cn/WebServices/MobileCodeWS.asmx?wsdl');
  $result =(array) $soap->getMobileCodeInfo(array(
    'mobileCode'=>$phone
  ));
  list($moblie,$location,$lbs) = explode(' ', $result['getMobileCodeInfoResult']);
  if($lbs){
   $type =  array('移动','电信','联通');
   foreach($type as $key=>$value){
    $ps = strpos($lbs, $value);
    if($ps){
     $procver = substr($lbs, 0,$ps);
     $list['province'] = $procver;
     $list['operator'] = $value;
     $list['city'] = $location;
     $list['type'] = $key;
     break;
    }
   }
   return $list;
  }
}

// $string： 明文 或 密文  
// $operation：DECODE表示解密,其它表示加密  
// $key： 密匙  
// $expiry：密文有效期  
function authcode($string, $operation = 'DECODE', $key = '', $expiry = 72000) {   
    $ckey_length = 4;
    $key = md5($key ? $key : config('AU_KEY'));$keya = md5(substr($key, 0, 16));$keyb = md5(substr($key, 16, 16));
    $keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length): substr(md5(microtime()), -$ckey_length)) : '';  
    $cryptkey = $keya.md5($keya.$keyc);  $key_length = strlen($cryptkey);   
    $string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$string;  
    $string_length = strlen($string);$result = '';$box = range(0, 255);$rndkey = array();  
    for($i = 0; $i <= 255; $i++) {$rndkey[$i] = ord($cryptkey[$i % $key_length]);  }  
    for($j = $i = 0; $i < 256; $i++) {  
        $j = ($j + $box[$i] + $rndkey[$i]) % 256;$tmp = $box[$i];  $box[$i] = $box[$j];  $box[$j] = $tmp;  
    }  
    for($a = $j = $i = 0; $i < $string_length; $i++) {  
        $a = ($a + 1) % 256;$j = ($j + $box[$a]) % 256;$tmp = $box[$a];  
        $box[$a] = $box[$j];$box[$j] = $tmp;  
        $result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));  
    }
    if($operation == 'DECODE') {  
        if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16)) { return substr($result, 26);} else {return '';}  
    } else{return $keyc.str_replace('=', '', base64_encode($result));  }  
}

function qmjcode($string, $operation = 'DECODE', $key = '', $expiry = 72000) {   
    return authcode($string,$operation,$key,$expiry);
}


//隐藏固话-手机号中间四位数
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

function Spost($data, $target) {
    $url_info = parse_url($target);
    $httpheader = "POST " . $url_info['path'] . " HTTP/1.0\r\n";
    $httpheader .= "Host:" . $url_info['host'] . "\r\n";
    $httpheader .= "Content-Type:application/x-www-form-urlencoded\r\n";
    $httpheader .= "Content-Length:" . strlen($data) . "\r\n";
    $httpheader .= "Connection:close\r\n\r\n";
    //$httpheader .= "Connection:Keep-Alive\r\n\r\n";
    $httpheader .= $data;
    $fd = fsockopen($url_info['host'], 80);
    fwrite($fd, $httpheader);
    $gets = "";
    while(!feof($fd)) {
        $gets .= fread($fd, 128);
    }
    fclose($fd);
    if($gets != ''){
        $start = strpos($gets, '<?xml ');
        if($start> 0) {
            $gets = substr($gets, $start);
        }        
    }
    return $gets;
}


/*发送短信接口*/
function xtsms($tel,$content)
{   
    return dosendsms($tel,$content);
    $time=date('Y-m-d H:i:s');
    $strs=urlencode($content);
    $url='http://www.duanxin10086.com/sms.aspx?action=send';
    $url=$url."&userid=x3&account=abcdefg&password=156&content=$strs&mobile=$tel&sendtime=&taskName=getpwd&checkcontent=1&mobilenumber=1&countnumber=1&telephonenumber=1"; 
    $result = file_get_contents($url); 
    $results2=0;
    if ($result!=str_replace('<returnstatus>Success</returnstatus>','',$result))
    {
        if ($result!=str_replace('<message>ok</message>','',$result))
        {
            $results2="1";
        }
    }
    return $results2;
}

/*获取大小*/
function BigEndian2Int($byte_word, $signed = false) {
 
        $int_value = 0;
        $byte_wordlen = strlen($byte_word); 
        for ($i = 0; $i < $byte_wordlen; $i++) {
            $int_value += ord($byte_word{$i}) * pow(256, ($byte_wordlen - 1 - $i));
        }
         if ($signed) {
            $sign_mask_bit = 0x80 << (8 * ($byte_wordlen - 1));
            if ($int_value & $sign_mask_bit) {
                $int_value = 0 - ($int_value & ($sign_mask_bit - 1));
            }
        }
         return $int_value;
}
 
//转化为0：03：56的时间格式
function fn($time){
    $num = $time;
    $sec = intval($num/1000);
    $h = intval($sec/3600);
    $m = intval(($sec%3600)/60);
    $s = intval(($sec%60));
    $tm = $h.':'.$m.':'.$s;
    return $tm;
}


/*导出xls表格函数*/
function exportExcel($expTitle,$expCellName,$expTableData){
    $xlsTitle = iconv('utf-8', 'gb2312', $expTitle);//文件名称
    $fileName = $xlsTitle;//or $xlsTitle 文件名称可根据自己情况设定
    $cellNum = count($expCellName);
    $dataNum = count($expTableData);
    vendor("PHPExcel.PHPExcel");            
    $objPHPExcel = new PHPExcel();
    $cellName = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','AA','AB','AC','AD','AE','AF','AG','AH','AI','AJ','AK','AL','AM','AN','AO','AP','AQ','AR','AS','AT','AU','AV','AW','AX','AY','AZ');
    $objPHPExcel->getActiveSheet(0)->mergeCells('A1:'.$cellName[$cellNum-1].'1');
    for($i=0;$i<$cellNum;$i++){
        $objPHPExcel->setActiveSheetIndex(0)->setCellValue($cellName[$i].'2', $expCellName[$i][1]);
    }
    for($i=0;$i<$dataNum;$i++){
        for($j=0;$j<$cellNum;$j++){
            $objPHPExcel->getActiveSheet(0)->setCellValue($cellName[$j].($i+3), $expTableData[$i][$expCellName[$j][0]]);
        }
    }
    header('pragma:public');
    header('Content-type:application/vnd.ms-excel;charset=utf-8;name="'.$xlsTitle.'.xls"');
    header("Content-Disposition:attachment;filename=$fileName.xls");
    $objWriter=PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
    $objWriter->save('php://output');
    exit;
}

/*导出表格demo*/
function export()
{
    $arc=M("user");
    $list = $arc->where($sql)->order($order)->limit(9999)->select();  
    $xlsCell  = array(
    array('x1','序号'),
    array('x2','会员账号'),
    array('x3','姓名'),
    array('x4','注册时间'),
    );
    $num=0;
    foreach ($list as  $row)   
    {   
        $i++;           
        $z1=$row["user_name"];
        $z2=$row["truename"];          
        $z3=date('Y-m-d H:i:s',$row["time"]);
        if ($row['state']==0){$mk="[未审核]";}else{$mk="";}             
        $list[$num]['x1']=$i;
        $list[$num]['x2']=$z1.$mk;
        $list[$num]['x3']=$z2;
        $list[$num]['x4']=$z3;
        $num++;
    }   
    $filename ='user-'.date('Ymd');        
    exportExcel($filename,$xlsCell,$list);
}

/*验证手机号 身份证号 邮箱*/
function isPhone($num) {
    if (!$num) {return false;}
    return preg_match('#^13[\d]{9}$|14^[0-9]\d{8}|^16[0-9]\d{8}$|^15[0-9]\d{8}$|^19[0-9]\d{8}$|^17[0-9]\d{8}$|^18[0-9]\d{8}$#', $num) ? true : false;
}

/*验证身份证号*/
function isIdCard($number) {
    $wi = array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
    $ai = array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
    for ($i = 0;$i < 17;$i++) {
        $b = (int) $number{$i}; 
        $w = $wi[$i];
        $sigma += $b * $w; 
    }
    $snumber = $sigma % 11; 
    $check_number = $ai[$snumber];     
    if ($number{17} == $check_number) {
        return true;
    } else {
        return false;
    }
}
/*验证邮箱*/
function isEmail($email)
{
    $pattern = "/^([0-9A-Za-z\\-_\\.]+)@([0-9a-z]+\\.[a-z]{2,3}(\\.[a-z]{2})?)$/i";
    if (!preg_match($pattern,$email))
    {
        return false;
    }
}

/*根据当前网址获取参数*/
function get_prar($cs)
{
    $url=$_SERVER['REQUEST_URI'];
    $prars=explode('?',$url);
    $p_str=$prars[1];
    $p_arr=explode('&',$p_str);
    foreach ($p_arr as $ky)
    {
        $c_arr=explode('=',$ky);
        $cs=$c_arr[0];
        $v=$c_arr[1];
        if ($cs==$cs)
        {
            return $v;
        }
    }
}

/*获取内容中的图片数组*/
function getImgs($content,$order='ALL'){
        $pattern="/<img.*?src=[\'|\"](.*?(?:[\.gif|\.jpg]))[\'|\"].*?[\/]?>/";
        preg_match_all($pattern,$content,$match);
        if(isset($match[1])&&!empty($match[1])){
            if($order==='ALL'){
                return $match[1];
            }
            if(is_numeric($order)&&isset($match[1][$order])){
                return $match[1][$order];
            }
        }
        return '';
}

//数字转中文
function number2Chinese($num, $m = 1) {
    switch($m) {
        case 0:
            $CNum = array(
                array('零','壹','贰','叁','肆','伍','陆','柒','捌','玖'),
                array('','拾','佰','仟'),
                array('','萬','億','萬億')
            );
        break;
        default:
            $CNum = array(
                array('零','一','二','三','四','五','六','七','八','九'),
                array('','十','百','千'),
                array('','万','亿','万亿')
            );
        break;
    }
    if (!is_numeric($num)) {return false;}
    $flt = '';
    if (is_integer($num)) {
        $num = strval($num);
    }else if(is_numeric($num)){
        $num = strval($num);
        $rs = explode('.',$num,2);
        $num = $rs[0];
        $flt = $rs[1];
    }
    $len = strlen($num);
    $num = strrev($num);
    $chinese = '';    
    for($i = 0,$k=0;$i < $len; $i+=4,$k++){
        $tmp_str = '';
        $str = strrev(substr($num , $i,4));
        $str = str_pad($str,4,'0',STR_PAD_LEFT);
        for ($j = 0; $j < 4; $j++) { 
            if($str{$j} !== '0'){
                $tmp_str .= $CNum[0][$str{$j}] . $CNum[1][4-1-$j];
            }
        }
        $tmp_str .= $CNum[2][$k];
        $chinese = $tmp_str . $chinese;
        unset($str);
    }
    if($flt !== ''){
        $str = '';
        for ($i=0; $i < strlen($flt); $i++) { 
            $str .= $CNum[0][$flt{$i}];
        }
        $chinese .= "点{$str}";
    }
    return $chinese;
}

/*获取文件后缀*/
function fileext($filename)
{
    return substr(strrchr($filename, '.'), 1);
}

//清除用户输入的js css link style 注释代码
function CHtml($content) {  
    $preg = "/<script[\s\S]*?<\/script>/i";
    $content = preg_replace($preg,"",$content); 
    $preg = "/<link[\s\S]*?>/i";
    $content = preg_replace($preg,"",$content);
    $preg = "/<style[\s\S]*?<\/style>/i";
    $content = preg_replace($preg,"",$content);
    return $content;
}

/*获取文件大小*/
function gfilesize($file)
{
    $host=$_SERVER['HTTP_HOST'];
    $file=qmcode($file,'DECODE');
    /*判断文件是否存在*/
    $str1=substr($file,0,1);
    if ($str1=='/')
    {
        $file=substr($file,1,strlen($file)-1);
    }
    if (!file_exists($file))
    {
        return  0;
    }
    $file="http://".$host."/".$file;
    $rs=get_headers($file,1);
    $filesize=$rs['Content-Length'];
    return HumanReadableFilesize($filesize);
}

function HumanReadableFilesize($size) {
    $mod = 1024; 
    $units = explode(' ','B KB MB GB TB PB');
    for ($i = 0; $size > $mod; $i++) {
        $size /= $mod;
    }
    return round($size, 2) . ' ' . $units[$i];
}

/*文件下载*/
function downfile($fileurl,$wjm)
{
    ob_start(); 
    $filename=$fileurl;
    $arr=explode('.',$filename);
    $hz=$arr[count($arr)-1];
    $date=date("Ymdims");
    if ($wjm!='')
    {
        $date=$wjm;
    }
    $str1=substr($filename,0,1);
    if ($str1=='/')
    {
        $filename=substr($filename,1,strlen($filename)-1);
    }
    header( "Content-type:application/octet-stream "); 
    header( "Accept-Ranges:bytes "); 
    header( "Content-Disposition:attachment;filename= {$date}.".$hz); 
    $size=readfile($filename); 
    header( "Accept-Length: " .$size);
}


//json 返回提示
function msg($stu=-1,$text='',$url='reload')
{
    if($url=='')
    {
      echo json_encode(array("status"=>''.$stu.'',"message"=>"".$text.""));
      exit;
    }
    echo json_encode(array("status"=>''.$stu.'',"message"=>"".$text."","url"=>''.$url.''));
    exit;
}


/*删除文件*/
function file_del($file)
{
    if (is_file($file))
    {
        unlink($file);
    }
}

//ping 验证是否有网络
function ping_f($host,$port)
{
    $time_s = mt_f();
    $ip = gethostbyname($host);
    $fp = @fsockopen($host,$port);
    if(!$fp)
    return '0';
    $get = "GET / HTTP/1.1\r\nHost:".$host."\r\nConnect:".$port."Close\r\n";
    fputs($fp,$get);
    fclose($fp);
    $time_e = mt_f();
    $time = $time_e - $time_s;
    $time = ceil($time * 1000);
    return 'reply from '.$ip.':'.$port.' time = '.$time.'ms<br />';
}
/*模拟ping测试*/
function ping_demo()
{
    $host = 'www.quanmeicm.net';
    $port = '80';
    $num = 3; //Ping次数  
    echo 'ping to '.$host.' ['.gethostbyname($host).'] with port:'.$port.' of data:<br />';
    for($i = 0;$i < $num;$i++){
    echo ping_f($host,$port);
    //每次运行中间间隔1S
    sleep(1);
    //刷新输出缓存
    ob_flush();
    flush();
    }   
}
/*去除默认广告语*/
function deladw($con)
{
    $arr=array('国家级','世界级','最高级','最佳','最大','第一','唯一','首个','首选','最好','最大','精确','顶级','最高','最低','最','最具','最便宜','最新','最先进','最大程度','最新技术','最先进科学','国家级产品','填补国内空白','绝对','独家','首家','最新','最先进','第一品牌','金牌','名牌','优秀','最先','顶级','独家','全网销量第一','全球首发','全国首家','全网首发','世界领先','顶级工艺','最新科学','最新技术','最先进加工工艺','最时尚','极品','顶级','顶尖','终极','最受欢迎','王牌','销量冠军','第一','NO.1','Top1','极致','永久','王牌','掌门人','领袖品牌','独一无二','独家','绝无仅有','前无古人','史无前例','万能');
    foreach ($arr as $ky)
    {
        $con=str_replace($ky,'',$con);  
    }
    return $con;
}
/*已发布时间*/
function jtime($time)
{
    $month=getMonthNum($time,time());
    $time=time()-$time; 
    $yourday = (int)($time/(3600*24));
    $yourhour = (int)(($time%(3600*24))/(3600));
    $yourmin = (int)($time%(3600)/60);
    if ($month>12)
    {
        $year=(int)($month/12);
        return $year.'年前';
    }
    if ($month>0 && $yourday>29)
    {
        return $month.'月前';
    }
    if ($yourday>0){return $yourday.'天前';}
    if ($yourday>0){return $yourday.'天前';}
    if ($yourhour>0){return $yourhour.'小时前';}
    if ($yourmin==0){$yourmin=1;}
    $xyourmin=$yourmin.'分钟前';
    return $xyourmin;
}

function getMonthNum($date1,$date2){
    $date1_stamp=$date1;
    $date2_stamp=$date2;
    list($date_1['y'],$date_1['m'])=explode("-",date('Y-m',$date1_stamp));
    list($date_2['y'],$date_2['m'])=explode("-",date('Y-m',$date2_stamp));
    return abs(($date_2['y']-$date_1['y'])*12 +$date_2['m']-$date_1['m']);
}

/*生成随机数*/
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
function random($length)
{
    $hash = '';
    $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    $max = strlen($chars) - 1;
    mt_srand((double)microtime() * 1000000);
    for($i = 0; $i < $length; $i++) 
    {
        $hash .= $chars[mt_rand(0, $max)];
    }
    return $hash;
}

/*判断移动端*/
function isMOB()
{ 
    if ( strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false ) {return true;}    
    if (isset ($_SERVER['HTTP_X_WAP_PROFILE'])){return true;} 
    if (isset ($_SERVER['HTTP_VIA'])){return stristr($_SERVER['HTTP_VIA'], "wap") ? true : false;} 
    if (isset ($_SERVER['HTTP_USER_AGENT']))
    {
        $clientkeywords = array ('nokia','sony','ericsson','mot','samsung','htc','sgh','lg','sharp','sie-','philips','panasonic','alcatel','lenovo','iphone','ipod','blackberry','meizu','android','netfront','symbian','ucweb','windowsce','palm','operamini','operamobi','openwave','nexusone','cldc','midp','wap','mobile'); 
        if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT'])))
        {
            return true;
        } 
    } 
    if (isset ($_SERVER['HTTP_ACCEPT']))
    { 
        if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html'))))
        {
            return true;
        } 
    } 
    return false;
} 

// 字符串截取，支持中文和其他编码
function msubstr($str, $start=0, $length, $charset="utf-8", $suffix=true)
{
    $str=strip_tags($str);
    $str=preg_replace("/<\s*img\s+[^>]*?src\s*=\s*(\'|\")(.*?)\\1[^>]*?\/?\s*>/i", " ", $str);
    $str=preg_replace("/\s+/", " ", $str); 
    $str=preg_replace("/<[ ]+/si","<",$str);
    $str=preg_replace("/<\!--.*?-->/si","",$str);
    $str=preg_replace("/<(\!.*?)>/si","",$str);
    $str=preg_replace("/<(\/?html.*?)>/si","",$str);
    $str=preg_replace("/<(\/?head.*?)>/si","",$str); 
    $str=preg_replace("/<(\/?meta.*?)>/si","",$str); 
    $str=preg_replace("/<(\/?body.*?)>/si","",$str);
    $str=preg_replace("/<(\/?link.*?)>/si","",$str);
    $str=preg_replace("/<(\/?form.*?)>/si","",$str); 
    $str=preg_replace("/cookie/si","COOKIE",$str); 
    $str=preg_replace("/<(applet.*?)>(.*?)<(\/applet.*?)>/si","",$str);
    $str=preg_replace("/<(\/?applet.*?)>/si","",$str); 
    $str=preg_replace("/<(style.*?)>(.*?)<(\/style.*?)>/si","",$str);
    $str=preg_replace("/<(\/?style.*?)>/si","",$str);
    $str=preg_replace("/<(title.*?)>(.*?)<(\/title.*?)>/si","",$str);
    $str=preg_replace("/<(\/?title.*?)>/si","",$str);  
    $str=preg_replace("/<(object.*?)>(.*?)<(\/object.*?)>/si","",$str);
    $str=preg_replace("/<(\/?objec.*?)>/si","",$str); 
    $str=preg_replace("/<(noframes.*?)>(.*?)<(\/noframes.*?)>/si","",$str);
    $str=preg_replace("/<(\/?noframes.*?)>/si","",$str); 
    $str=preg_replace("/<(i?frame.*?)>(.*?)<(\/i?frame.*?)>/si","",$str);
    $str=preg_replace("/<(\/?i?frame.*?)>/si","",$str); 
    $str=preg_replace("/<(script.*?)>(.*?)<(\/script.*?)>/si","",$str);
    $str=preg_replace("/<(\/?script.*?)>/si","",$str); 
    $str=preg_replace("/javascript/si","Javascript",$str); 
    $str=preg_replace("/vbscript/si","Vbscript",$str);
    $str=preg_replace("/on([a-z]+)\s*=/si","On\\1=",$str); 
    $str=preg_replace("/&#/si","&＃",$str);
    if(function_exists("mb_substr"))
        $slice = mb_substr($str, $start, $length, $charset);
    elseif(function_exists('iconv_substr')) {
        $slice = iconv_substr($str,$start,$length,$charset);
        if(false === $slice) {$slice = '';}
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

/*压缩html*/
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
//只保留字符串首尾字符，隐藏中间用*代替（两个字符时只显示第一个）
function substr_cut($user_name){
    $user_name=$user_name.'#';
    $strlen     = mb_strlen($user_name, 'utf-8');
    $firstStr     = mb_substr($user_name, 0, 2, 'utf-8');
    $lastStr     = mb_substr($user_name, -1, 1, 'utf-8');
    $str= $strlen == 2 ? $firstStr . str_repeat('*', mb_strlen($user_name, 'utf-8') - 2) : $firstStr . str_repeat("*", $strlen - 2) . $lastStr;
    return str_replace('#','',$str);
}
//删除目录下的文件：
function del_dir($dir)
{
    $dh=opendir($dir);
    while ($file=readdir($dh))
    {
        if($file!="." && $file!="..")
        {
            $fullpath=$dir."/".$file;
            if(!is_dir($fullpath))
            {
              unlink($fullpath);
            }
            else
            {
              deldir($fullpath);
            }
        }
    }
  closedir($dh);
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

//页面跳转
function Gourl($url)
{
    header('Content-type:text/html;charset=utf-8');
    $gohtml='
    <html>
    <head>
    <meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
    <meta http-equiv="refresh" content="0;url='.$url.'">
    <title>加载中...</title>
    </head>
    <body></body>
    </html>
    ';
    echo $gohtml;   
}

/*非常规字符过滤*/
function injCheck($sql_str)
{
    $rstr='/select|insert|update|delete|\'|\/\*|\*|\.\.\/|\.\/|union|into|load_file|outfile/';  
    $check = preg_match($rstr, $sql_str); 
    if ($check)
    { 
        echo '非法字符！！'; exit; 
    } 
    else
    { 
        return $sql_str; 
    } 
} 

//获得当前的脚本网址 
function GetCurUrl() 
{ 
    if(!empty($_SERVER["REQUEST_URI"])) 
    { 
        $scriptName = $_SERVER["REQUEST_URI"]; 
        $nowurl = $scriptName; 
    } 
    else 
    { 
        $scriptName = $_SERVER["PHP_SELF"]; 
    if(empty($_SERVER["QUERY_STRING"])) 
    { 
        $nowurl = $scriptName; 
    } 
    else 
    { 
        $nowurl = $scriptName."?".$_SERVER["QUERY_STRING"]; 
    } 
    } 
    return $nowurl; 
} 

function sget($str)
{
    $str = preg_replace( "@<script(.*?)</script>@is", "", $str ); 
    $str = preg_replace( "@<iframe(.*?)</iframe>@is", "", $str ); 
    $str = preg_replace( "@<style(.*?)</style>@is", "", $str ); 
    $str = preg_replace( "@<(.*?)>@is", "", $str ); 
    return $str;
}

/* 将URL中的某参数设为某值*/
function url_set_value($url,$key,$value) 
{ 
    $a=explode('?',$url); 
    $url_f=$a[0]; 
    $query=$a[1]; 
    parse_str($query,$arr); 
    $arr[$key]=$value; 
    return query;
    //return $url_f.'?'.http_build_query($arr); 
} 

function escape($str)   
{     
    preg_match_all("/[\x80-\xff].|[\x01-\x7f]+/",$str,$r);     
    $ar   =   $r[0];     
    foreach($ar   as   $k=>$v){     
    if(ord($v[0])   <   128)     
      $ar[$k]   =   rawurlencode($v);     
    else     
      $ar[$k]   =   "%u".bin2hex(iconv("GBK","UCS-2",$v));   
    }     
    return   join("",$ar);     
 }     
      
function unescape($str)
{
    $ret = '';
    $len = strlen($str);
    for ($i=0;$i<$len; $i++)
    {
        if ($str[$i] == '%' && $str[$i+1] == 'u')
        {
            $val = hexdec(substr($str, $i+2, 4));
            if ($val < 0x7f) $ret .= chr($val);
            else if($val < 0x800) $ret .= chr(0xc0|($val>>6)).chr(0x80|($val&0x3f));
            else $ret .= chr(0xe0|($val>>12)).chr(0x80|(($val>>6)&0x3f)).chr(0x80|($val&0x3f));
            $i += 5;
        }else if ($str[$i] == '%'){
            $ret .= urldecode(substr($str, $i, 3));
            $i += 2;
        }else $ret .= $str[$i];
    }
    return $ret;
}

function request($str)
{
    $cs=$_REQUEST[$str];
    return unescape($cs);
}

//获取IP
function GetIP()
{
    if(!empty($_SERVER["HTTP_CLIENT_IP"]))
    {
        $cip = $_SERVER["HTTP_CLIENT_IP"];
    }
    else if(!empty($_SERVER["HTTP_X_FORWARDED_FOR"]))
    {
        $cip = $_SERVER["HTTP_X_FORWARDED_FOR"];
    }
    else if(!empty($_SERVER["REMOTE_ADDR"]))
    {
        $cip = $_SERVER["REMOTE_ADDR"];
    }
    else
    {
        $cip = '';
    }
    preg_match("/[\d\.]{7,15}/", $cip, $cips);
    $cip = isset($cips[0]) ? $cips[0] : 'unknown';
    unset($cips);
    return $cip;
}


/*闭合html标签*/
function closetags($html) {
    preg_match_all('#<([a-z]+)(?: .*)?(?<![/|/ ])>#iU',$html,$result);  
    $openedtags = $result[1];
    preg_match_all('#</([a-z]+)>#iU',$html,$result);
    $closedtags = $result[1];
    $len_opened = count($openedtags);
    if (count($closedtags) == $len_opened) {    return $html;  }
    $openedtags = array_reverse($openedtags);
    for ($i=0; $i < $len_opened; $i++) {
        if (!in_array($openedtags[$i], $closedtags)){
            $html .= '</'.$openedtags[$i].'>';          
        } else {
        unset($closedtags[array_search($openedtags[$i], $closedtags)]);
        }
    }
  return $html;
}
function content_page($content='',$maxpage=1000){//内容分页 按照html标签
    if($content=='') return $content;
    $html = array('div','p','ul','table','dl');
    $ar_content = explode('<', $content);
    $data = array();
    $i = $show_time = 0;
    $tag='';
    if(is_array($ar_content)){
        foreach($ar_content as $y => $c){
            if($y == 0){
                $data[$i] = $c;
                if(strlen(strip_tags($c))>=$maxpage){
                    $i++;
                }
                continue;
            }
            $data[$i] .= '<'.$c;
            if($tag=='' && $show_time==0)
            {
                foreach($html as $h)
                {
                    if(strpos($c, $h)===0){
                        $tag = $h;
                        $show_time++;
                        break;
                    }
                }
            }
            elseif($show_time && $tag){
                if(strpos($c, $tag)===0){
                    $show_time++;
                }
                if(strpos($c, '/'.$tag)===0){
                    $show_time--;
                    if($show_time==0) $tag = '';
                }
            }
            if(strlen(strip_tags($data[$i]))>=$maxpage && $show_time==0){
                $i++;
            }
        }
    }
    return $data;
}

/*投票排名*/
function phb($id)
{
    $mtb1=M('content');
    $vo=$mtb1->where("id='$id'")->field('pid,s1')->find();
    if ($vo)
    {
        $where="pid='".$vo['pid']."' and s1>'".$vo['s1']."' and audit='1' and del='0'";
        $count=(int)$mtb1->where($where)->count();
        return $count+1;
    }
    return '';

}


/*评论被赞的次数*/
function plzan($id)
{
    $mtb=M('zan_comment');
    $where="pid='$id' and audit='1' and del='0'";
    $rs=$mtb->where($where)->count();
    return (int)$rs;
}

/*获取当天活动的个数*/
function hdnum($date)
{
    $ftime=strtotime($date);
    $xqj=(int)date('w',$ftime);
    if ($xqj==0){$xqj=7;}
    $week1=date('Y-m-d',$ftime-($xqj-1)*24*3600);
    $week1time=strtotime($week1);
    $week2time= $week1time+7*24*3600;
    $tbq=config('database');
    $tbq=$tbq['prefix'];
    $tb1=$tbq.'info';                                
    $ftime1=$ftime+24*3600;
    $sql=" CONCAT(',', fidpath, ',') like '%,1,%' and g.audit='1' and g.audit2='1' and g.del='0'";
    $sql.=" and B.time3<'$ftime1' and  B.time4>'$ftime'";
    $arc=M('info g');
    $count=$arc->join($tbq.'active_time B','g.id=B.pid')->where($sql)->count(); 
    //echo    $arc->GetLastSql().'##';
    return (int)$count;
}

/*获取星期几*/
function dateday($ty=0,$time=0)
{
    if ($time==0){$time=time();}
    $time++;
    $day = date("w",$time);
    switch ($day) {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
            $ty2=$day-1;
            break;
        case 0:
            $day=7;
            $ty2=6;
            break;
        default:
            return 0;
            break;
    }
    switch ($ty) {
        case 1:
            return $ty2;
            break;
        
        default:
            return $day;
            break;
    }
}

/*统计文档评论次数*/
function qcomment($id)
{
    $mtb=M('comment');
    $where="pid='$id' and audit='1' and del='0'";
    $v=$mtb->where($where)->count();
    return (int)$v;
}

/*每页截取内容字数*/
function cbody($body){
    $rt=contentpage($body,300);
    return $rt[0];
}

//数组去除重复
function rep_array($array)
{
   $out = array();
   foreach ($array as $key=>$value) {
   if (!in_array($value, $out))
    {
           $out[$key] = $value;
       }
   }
   return $out;
} 

/*获取内容第一张图片*/
function first_img($obj)
{ 
    $obj="".$obj;
    $obj=str_replace("\\","",$obj);
    $temp="";
    if ( preg_match( '/img.*?src=.*?"(.*?)"/si', $obj, $regs ) )
    { 
        $temp = $regs[1] ; 
        $temp=str_replace("\\","",$temp);
    }
    return $temp;
}

//创建文件夹
function CreateFolder($path)
{
    $path="/".$path."/";
    $path=str_replace("//","",$path);
    $path=str_replace("/../","../",$path);
   if (!file_exists($path))
   {
    CreateFolder2(dirname($path));
    mkdir($path, 0777);
   }
}

function CreateFolder2($path)
{
   if (!file_exists($path))
   {
    CreateFolder2(dirname($path));
    mkdir($path, 0777);
   }
}

/*获取本地文件内容*/
function GetContent($file)
{
    if(file_exists($file)){$content = file_get_contents($file);}
    return $content;
}

/*验证手机号码*/
function isMobile($num) {
    if (!$num) {return false;}
    return preg_match('#^13[\d]{9}$|14^[0-9]\d{8}|19^[0-9]\d{8}|17^[0-9]\d{8}|16^[0-9]\d{8}|^15[0-9]\d{8}$|^18[0-9]\d{8}$#', $num) ? true : false;
}

//防止外部提交
function checkrefer()
{
    if(!preg_match("/^http:\/\/".$_SERVER["SERVER_NAME"]."\/.*/i",$_SERVER['HTTP_REFERER']))
    {
        echo "<script>location.href='/?e'</script>";exit;
    }
}
function checkrefer2()
{
    if(!preg_match("/^http:\/\/".$_SERVER["SERVER_NAME"]."\/.*/i",$_SERVER['HTTP_REFERER']))
    {
        return 1;
    }
}


 
/*发送邮件*/
function sendMail($to, $title, $content,$attch=NULL,$type=1)
{
    Vendor('PHPMailer.PHPMailerAutoload');
    $mail = new PHPMailer();
    $mail->IsSMTP();
    $mail->Host='smtp.163.com';
    $mail->SMTPAuth = TRUE;
    $mail->Username = 'candy_domail@163.com';
    $mail->Password = '5969754';
    $mail->From = 'candy_domail@163.com';
    $mail->FromName = '全美网络';
    $mail->AddAddress($to,"尊敬的客户");
    $mail->WordWrap = 50;
    $mail->IsHTML(TRUE);
    $mail->CharSet='utf-8';
    $mail->Subject =$title;
    $mail->Body = $content;
    if ($attch)
    {
        foreach ($attch as $ky)
        {
            $mail->AddAttachment($ky['file'],$ky['name']);   
        }
    }
    $mail->AltBody ="text/html"; 
    $rs=$mail->Send();
    if(!$rs)    
    {    
        return -1;
        /*echo "邮件错误信息: " . $rs->ErrorInfo; */  
    }
    return($rs);
}