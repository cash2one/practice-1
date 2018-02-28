<?php
namespace app\admin\controller;
use app\admin\controller\Base;
use think\Request;

class Comm extends Base
{
    var $assign;
    var $sysfig;
    public function _initialize(){

        if(!session('admin_id') || !session('admin_pwd') || !session('admin_cookie')){
           Gourl('/qm.login'); 
        }
        $sysfig=$this->sysifg();
        $request=Request::instance();
        $modname='/'.$request->module();//模型
        $con=$request->controller();//控制器
        $action=$request->action();//行为action
        $mcname=$modname.'/'.$con;
        $name=$modname.'/'.$con.'/'.$action;
        $t_do=$mcname.'/doact.qm';
        $t_attr=$mcname.'/attr.qm';
        $menu_flm=0;
        $mtb=\think\Db::name('admin');
        $adminid =session('admin_id');
        $admin=$mtb->where("username='$adminid'")->find();  

        $webhost=$_SERVER['HTTP_HOST'];   
        $from=@$_SERVER["HTTP_REFERER"];//不适用@可能会出错
        $from2=authcode($from,1,'wlcmgg');

        $url=$name;
        $mname=$modname.'/'.$con;
        $assign['name']=$name;
        $assign['action']=$name;
        $assign['sysfig']=$sysfig;
        $assign['modname']=$modname;
        $assign['mname']=$mname;
        $assign['weburl']=$url;
        $assign['t_do']=$t_do;
        $assign['t_attr']=$t_attr;
        $assign['menu_flm']=$menu_flm;
        $assign['admin']=$admin;
        $assign['webhost']=$webhost;
        $assign['from']=$from;
        $assign['from2']=$from2;
        $this->assign($assign);
        $this->assign=$assign;
        $this->sysfig=$sysfig;
        $this->checklogin();/*验证用户登录*/
        //echo $name;
    }

    //验证管理员登录
    public function checklogin()
    {
        $adminid=session('admin_id');
        $pwd=session('admin_pwd');
        $cook=session('admin_cookie');
        $assign=$this->assign;
        $gourl=$assign['modname'].'/login.qm';
        //$gourl='/qm.login';
        if (!$adminid || !$pwd || !$cook)
        {
            $gourl.='?0';Gourl($gourl);exit;
        }
        $m=\think\Db::name('admin');
        $u=$m->where("username='$adminid' and del='0'")->find();
        $cookie=$u['cookie'];
        $password=$u['password'];        
        if ($cookie!=$cook)
        {
            $gourl.='?1';Gourl($gourl);exit;
        }
        if ($password!=$pwd)
        {
            $gourl.='?2';Gourl($gourl);exit;
        }
        if ($u['Lock']!=0)
        {
           $gourl.='?3';Gourl($gourl);exit;
        } 

    }

    //退出后台管理
    public function doexit()
    {
        $assign=$this->assign;
        $gourl=$assign['modname'].'/login';
        session('adminid',null);
        session('admin_id',null);
        session('admin_pwd',null);
        session('admin_cookie',null);
        Gourl($gourl);
    }







}
