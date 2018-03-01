<?php
namespace app\admin\controller;
use think\Controller;
use think\Request;
class Base extends Controller
{
    var $sysifg;
    public function _initialize(){
        /*初始化配置文件*/
        $sysifg=$this->sysifg();
        $this->assign('sysfig',$sysifg);   
    }

    /*获取配置文件*/
    public function sysifg(){
        $link=\think\Db::name('config');
        $m=$link;
        $cm=$m->select();
        $config=array();
        foreach($cm as $vo){
            switch ($vo['varname']) {
                case 'cfg_head':
                case 'cfg_body':
                    $config[$vo['varname']]=StripSlashes($vo['value']);
                    break;  
                default:
                    $config[$vo['varname']]=StripSlashes($vo['value']);
                    break;
            }
        }
        return $config;

    }


}
