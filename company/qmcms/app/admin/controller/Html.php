<?php
namespace app\admin\controller;
use app\admin\controller\Comm;


class Html extends Comm
{
    function _initialize() {
        parent::_initialize();
        $this->assign('menu_flm',97);
        qmcheck('html');
    }
    
    public function index()
    {
        //\think\Log::clear();
        $this->deldir('pub/HTML');
        //$this->sitemap();
        //$this->sitemap2();
        $html=$this->fetch();
        return $html;
    }
    
    //生成html
    public function html()
    {
        set_time_limit(0);
        $runtime_start = microtime(true);

        $weburl='http://'.$_SERVER['HTTP_HOST'];
        $this->assign('weburl',$weburl);
        $array[]='/index.php';
        $mtb=M('lm');
        $mtb2=M('info');

        //遍历所有栏目的url
        $arr=$mtb->where("del='0'")->field('id')->select();
        $pgsize=12;//定义分页条数
        foreach ($arr as $ky)
        {
            $fid=$ky['id'];
            $burl=htmlname2($fid);
            $count=(int)$mtb2->where("concat(',',fidpath,',') like '%,$fid,%'")->count();
            if ($count<=$pgsize)
            {
                $array[]=$burl;
            }
            else
            {
                $all=ceil($count/$pgsize);
                for ($i=1;$i<=$all;$i++)
                {
                    $array[]=$burl.'page-'.$i.'.html';
                }
            }
        }

        //遍历所有文章的url
        $arr=$mtb2->where("del='0' and audit='1'")->field('id')->order("id desc")->select();
        foreach ($arr as $ky)
        {
            $id=$ky['id'];
            $array[]=idlname2($id);
        }

        $this->assign('array',$array);
        $this->assign('runtime_start',$runtime_start);
        $runtime_end = microtime(true);
        $time=$runtime_end-$runtime_start;        

        $mb='html';
        $html=$this->fetch($mb);
        return $html."<!--$time-->";
    }

    public function sitemap()
    {
        $mtb1=M('lm');
        $mtb2=M('info');
        $temp='';
        $arr1=$mtb1->where("fid='0' and id!='939'")->field("id,cntitle")->order("sort")->select();
        foreach ($arr1 as $key => $val) {
            $temp.="<li><a href='".htmlname($val['id'])."'>".$val['cntitle']."</a>";
            $arr2=$mtb1->where("fid='".$val['id']."' and fid!='995' and del='0'")->field("id,cntitle")->order("sort")->select();
            $temp2='';
            if ($arr2)
            {
                foreach ($arr2 as $ky) 
                {
                    $temp2.="<li><a href='".htmlname($ky['id'])."'>".$ky['cntitle']."</a></li>";
                }
                $temp.='<ul>'.$temp2.'</ul>';
            }
            $temp.='</li>';
        }
        $temp='<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
                <html xmlns="http://www.w3.org/1999/xhtml">
                <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <title>网站地图</title>
                <link href="/style/sitemap.css" rel="stylesheet" type="text/css" />
                </head>
                <body>
                '.$temp.'
                </body>
                </html>
                ';
        file_put_contents('sitemap.html',$temp);
        //echo '<a href="/sitemap.html" target="_blank">sitemap.html</a>';
    }

    public function sitemap2()
    {
        $mtb1=M('lm');
        $mtb2=M('info');
        $temp='';
        $arr1=$mtb1->where("fid='0' and id!='39' and del='0'")->field("id,cntitle")->order("sort")->select();
        foreach ($arr1 as $key => $val) {
            $temp.="
                    <url>
                    <loc>".htmlname($val['id'])."</loc>
                    <changefreq>daily</changefreq>
                    <priority>0.8</priority>
                    </url>";
            $arr2=$mtb1->where("fid='".$val['id']."' and fid!='5' and del='0'")->field("id,cntitle")->order("sort")->select();
            if ($arr2)
            {
                foreach ($arr2 as $ky) 
                {
                    $temp.="
                        <url>
                        <loc>".htmlname($val['id'])."</loc>
                        <changefreq>daily</changefreq>
                        <priority>0.6</priority>
                        </url>
                    ";
                }
            }
        }
        $arr3=$mtb1->where("id in(3,6)  and del='0'")->order("sort")->select();
        foreach ($arr3 as $key => $val) {
            $sql="concat(',',fidpath,',') like '%,".$val['id'].",%' and audit='1'";
            $arr2=$mtb2->where($sql)->field("id,addtime")->order("sort")->select();
            foreach ($arr2 as $ky) 
            {
                $temp.="
                <url>
                <loc>".idlname($ky['id'])."</loc>
                <lastmod>".date('Y-m-d',strtotime($ky['addtime']))."</lastmod>
                </url>
                ";
            }
        }

        $temp='<?xml version="1.0" encoding="UTF-8"?>
                <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
                '.$temp.'
                </urlset>';
        file_put_contents('sitemap.xml',$temp);
        //echo '<a href="/sitemap.xml" target="_blank">sitemap.xml</a>';
    }

    public function deldir($dir)
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
                  $this->deldir($fullpath);
                }
            }
        }
      closedir($dh);
    }

}
