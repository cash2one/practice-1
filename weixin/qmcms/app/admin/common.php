<?php



/*权限验证函数*/
function qmcheck($cid1,$ty=0)
{
    $adminid =session('admin_id');
    $m=\think\Db::name('admin');
    $admin=$m->where("username='$adminid'")->find();
    $mtb=\think\Db::name('admin_check');
    $mtb2=\think\Db::name('admin_role');
    if ($admin['Grade']!=9)
    {
        $vos=$mtb2->where("id='".$admin['role_id']."' and audit='1' and del='0'")->find();
        if (!$vos)
        {
            Gourl('/admin/index/doexit.qm');
            exit;
        }
        
        $flag1=$vos['flag1'];
        $flag2=$vos['flag2'];
        switch ($ty) {
            case 1:
                $mod=$mtb->where("id in($flag2) and flag='$cid1' and `type`='2'")->field('id')->find();
                if (!$mod)
                {
                    exit('没有此模块操作权限');
                }
                break;
            case 3:
                $mod=$mtb->where("id in($flag2) and flag='$cid1' and `type`='2'")->field('id')->find();
                if (!$mod)
                {
                    $json = array("status"=>'-1',"message"=>"没有此模块操作权限");
                    echo json_encode($json);
                    exit();
                }
                break;  
            case 2:
                $mod=$mtb->where("id in($flag2) and flag='$cid1' and `type`='2'")->field('id')->find();
                if (!$mod)
                {
                    return 0;
                }
                break;  
            case 4:
                $mod=$mtb->where("id in($flag1) and flag='$cid1' and `type`='1'")->field('id')->find();
                if (!$mod)
                {
                    return 0;
                }
                break;  
            default:
                $mod=$mtb->where("id in($flag1) and flag='$cid1' and `type`='1'")->field('id')->find();
                if (!$mod)
                {
                    $json = array("status"=>'-1',"message"=>"没有此模块操作权限");
                    echo json_encode($json);
                    exit();
                    exit('没有此模块权限');
                }
                break;
        }
    }
    return 1;
}

/*验证超级管理员权限*/
function qmadmin()
{
  $adminid =session('admin_id');
  $m=\think\Db::name('admin');
  $admin=$m->where("username='$adminid' and Grade='9'")->field('id')->find();
  if (!$admin)
  {
      exit('qm_10086'); 
  }     
}


/*分页条数选择*/
function selectpg($pgsize=10)
{
    return "　每页显示<select id='pgsize' onchange='selpgsize()'>
<option value='5'>5</option>
<option value='10'>10</option>
<option value='15'>15</option>
<option value='20'>20</option>
<option value='40'>40</option>
<option value='60'>60</option>
<!--<option value='80'>80</option>
<option value='100'>100</option>
<option value='200'>200</option>-->
</select>条
<script type='text/javascript'>$('#pgsize').val('$pgsize');</script>";
}


function getcoloroption($x)
{
    $m=\think\Db::name('color');
    $lmlist=$m->where("1=1")->order('id asc')->select();
    $str='';
    foreach($lmlist as $k=>$vo){
    $selstr=($vo['color']==$x)?" selected='selected'":"";
    $str.="<option value='{$vo['color']}' {$selstr} style='background:{$vo['color']};'>{$vo['color']}</option>";
    }
    return $str;
}
function getlmoption($nid=0,$id=0,$x=''){
    $adminid =session('admin_id');
    $m=\think\Db::name('admin');
    $admin=$m->where("username='$adminid'")->find();        
    $m=\think\Db::name('lm');;
    if ($admin['Grade']!=9 && $id==0)
    {
        $lmlist=$m->where("fid=".$id." and id<'5'")->order('sort asc')->select();
    }
    else
    {
        $lmlist=$m->where("fid=".$id)->order('sort asc')->select();
    }   
    $str='';
    if(is_array($lmlist)){  
        $x2=($id==0)?"":"└";
        foreach($lmlist as $k=>$vo){        
        $selstr=($vo['id']==$nid)?" selected='selected'":"";
        $str.="<option value='{$vo['id']}' {$selstr}>{$x}{$x2}{$vo['cntitle']}</option>
            ".getlmoption($nid,$vo['id'],$x.'　');
        }       
    }
    return $str;
}

function mflag($id)
{
    $m=\think\Db::name('info');
    $arc=$m->where("id=".$id)->field("flag,settop,vouch,audit,flag")->find();
    $flag=$arc['flag'];
    $temp='0';
    if ($arc['settop']==1){$temp.=',置顶';}
    if ($arc['vouch']==1){$temp.=',推荐';}
    if ($arc['audit']!=1){$temp.=',未审核';}
    if ($flag!=''){
        $lmlist=M('flag')->order('id asc')->select();
        $str='';
        foreach($lmlist as $k=>$vo){        
            if (strpos($flag,$vo['att'])>-1)
            {       
                $temp.=",".$vo['attname']."";
            }
        }
    }
    $temp=str_replace('0,','',$temp);
    $temp=str_replace('0','',$temp);
    if ($temp!=''){
        return '<span class="red">['.$temp.']</span>';
    }
}

function issimg($id)
{
    $m=\think\Db::name('info');
    $arc=$m->where("id=".$id)->field("img,simg")->find();
    if ($arc['img']!=''){return '<span pic="'.$arc['img'].'" style="color:#f00">[图]</span>';}
    //if ($arc['simg']!=''){return '<span pic="'.$arc['img'].'" style="color:#f00">[图]</span>';}
}

/*缩略图文件名*/
function thumbname($name)
{
    $name=str_replace('_th.jpg','.jpg',$name);
    $name=str_replace('_th.jpeg','.jpeg',$name);
    $name=str_replace('_th.png','.png',$name);
    $name=str_replace('_th.gif','.gif',$name);

    $name=str_replace('.jpg','_th.jpg',$name);
    $name=str_replace('.jpeg','_th.jpeg',$name);
    $name=str_replace('.png','_th.png',$name);
    $name=str_replace('.gif','_th.gif',$name);
    return $name;
} 

//生成缩略图 ty=0 默认生成等比例缩略图 12表示小缩略图 等比例缩小 上下居中裁剪图片
function thumbs($src_file,$dst_file,$toW=200,$toH=200,$ty=0)
{
    if (!is_file($src_file))
    {
        $src_file=substr($src_file,1,strlen($src_file)-1);
        $dst_file=substr($dst_file,1,strlen($dst_file)-1);
    }
    if (is_file($src_file))
    {
        $image = \think\Image::open($src_file);            
        $width  = $image->width();      
        $height = $image->height();
        switch ($ty) {
            case 1:
            case 2:
                if ($width>$height){$width=$height;}
                //先按原图根据最小宽度或高度处理成正方形 然后根据正方形等比例缩小生成小缩略图
                $image->thumb($width,$width,3)->save($dst_file);                
                $image = \think\Image::open($dst_file);
                $toW2=$toW;
                if ($toW<$toH){$toW2=$toH;}
                //根据缩略图的宽度高度取得最大值 生成压缩图
                $image->thumb($toW2,$toW2,1)->save($dst_file);
                $image = \think\Image::open($dst_file);
                //根据缩略图的宽度和高度进行裁剪
                $rs=$image->thumb($toW,$toH,3)->save($dst_file); 
                break;          
            default:
                if ($width<$toW){$toW=$width;}
                if ($height<$toH){$toH=$height;}
                if ($width>$toW || $height>$toH)
                {
                    $rs=$image->thumb($toW,$toH,1)->save($dst_file);
                }
                break;
        }
    }
    //1;//标识缩略图等比例缩放类型    
    //2;//标识缩略图缩放后填充类型    
    //3;//标识缩略图居中裁剪类型   
    //4; //标识缩略图左上角裁剪类型   
    //5;//常标识缩略图右下角裁剪类型    
    //6;//标识缩略图固定尺寸缩放类型
    if ($rs)
    {
        return $dst_file;
    }
    return $src_file;
}

//根据IP获取IP详情
function GetIpLookup($ip = ''){
    if($ip =='')
    {
        $ip = GetIPx();
    }
    $res = curl_get_contents('http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js&ip='.$ip);
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