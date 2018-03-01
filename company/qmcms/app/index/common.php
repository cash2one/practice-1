<?php

function siteseo($lm=0,$id=0)
{
    if ($lm>0)
    {
        $lmm=M('lm');
        $lmseo=$lmm->where("id=$lm")->select();
        $lmseo=$lmseo[0];
        $title=$lmseo['title'];
        $keywords=$lmseo['keywords'];
        $description=$lmseo['description'];
        $mtitle=$lmseo['cntitle'];  
    }
    if ($id>0)
    {
        $info=M('info');    
        $info=$info->where("id=$id")->select();
        $info=$info[0];
        $title=$info['title'];
        $keywords=$info['keywords'];
        $description=$info['description'];
        $mtitle=$info['cntitle'];   
    }
    $config=getconfig();
    if ($lm==0 && $id==0)
    {
        $seo[0]=$config['cfg_webname'];
        $seo[1]=$config['cfg_keywords'];
        $seo[2]=$config['cfg_description'];
    }
    else
    {
        if ($title==''){$seo[0]=$mtitle."_".$config['cfg_name'];}else{$seo[0]=$title;}
        if ($keywords==''){$seo[1]=$mtitle;}else{$seo[1]=$keywords;}
        if ($description==''){$seo[2]=$mtitle;}else{$seo[2]=$description;}
    }
    return $seo;
}

function lmfirst($id)
{
    $zid=M("lm")->where("fid='$id' and del='0' and isshow='1'")->order("sort asc,id asc")->limit(1)->value("id");
    if ((int)$zid>0){return $zid;}
    return $id; 
}
function lmlist($fid=0,$t=9999,$f=0,$order='sort asc,id desc')
{                   
  $arr= M("lm")->where("fid='$fid' and del='0' and isshow='1'")->order($order)->limit($f,$t)->select();
  return $arr;
}
function sxpage($m,$arc,$ty)
{
    $id=$arc['id'];$tsort=$arc['sort'];
    $where='fid in ('.$arc['fid'].') and id!='.$id.' and audit=1 and audit2=1 and del=0 ';
    if ($ty==1)
    {
    $new=$m->where($where.'and sort<='.$tsort.'')->order('sort desc,id desc')->find();
    $new2=$m->where($where.'and id>'.$id.'')->order('id asc')->find();  
    }
    else
    {       
    $new=$m->where($where.'and sort>='.$tsort.'')->order('sort asc,id asc')->find();
    $new2=$m->where($where.'and id<'.$id.'')->order('id desc')->find();
    }
    if ((int)$new['id']>0)
    {
        if ($new['sort']==$tsort){return $new2;}return $new;
    }
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