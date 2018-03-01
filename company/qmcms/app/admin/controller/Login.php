<?php
namespace app\admin\controller;
use app\admin\controller\Base;
use think\Session;


class Login extends Base
{
    public function index()
    {
        if(session('admin_id') && session('admin_pwd') && session('admin_cookie')){
           Gourl('/admin/index.qm');exit;
        }
        $url=$_SERVER['REQUEST_URI'];
        if ($url==str_replace('qm.login','',$url))
        {
            //Gourl('/');exit;
        }
        $act=\think\Request::instance()->get('act');
        if ($act=='login')
        {
            $this->login();
            exit;
        }
        $html=$this->fetch();
        return $html;
    }

    public function login()
    {
        $request = \think\Request::instance();
        $ip=$request->ip();
        $user=$request ->post('username');
        $pwd =$request ->post('upassword');
        $user=preg_replace("[^0-9a-zA-Z_@!\.-]",'',$user);
        $pwd=preg_replace("[^0-9a-zA-Z_@!\.-]",'',$pwd);
        $pwd2=$pwd;
        $captcha=$request ->post('ucode');
        if(!captcha_check($captcha)){
            //msg(-1,'验证码错误');
        };
        
        if ($user=='' || $pwd=='')
        {
            msg(0,'请输入用户名和密码！');
        }
        $sql=" username='".$user."' and del='0' and `Lock`='0'";
        $mtb=\think\Db::name('admin');
        $uinfo=$mtb->where($sql)->find();
        $sql=$mtb->GetLastSql();
        if (!$uinfo)
        {
            msg(0,'用户名或密码错误');
        }
        $uid=$uinfo['id'];
        $pwds=$uinfo['password'];
        $pwd=md5("wifi".$pwd.$user);
        $mpwd=md5($pwd."cook".$user);       
        if ($pwd!=$pwds)
        {
            msg(0,'用户名或密码错误');
        }        
        $data['cookie']=$mpwd;
        $data['LastTime']=date('Y-m-d H:i:s');
        $data['LastIP']=$ip;
        $data['logins']=$uinfo['logins']+1;
        $mtb->where(" username='".$user."'")->update($data);        
        Session::set('adminid',md5($uid));
        Session::set('admin_id',$user);
        Session::set('admin_pwd',$pwd);
        Session::set('admin_cookie',$mpwd);   

        $title=$ip."登录后台".$_SERVER['HTTP_HOST'];
        //sendMail('2737081464@qq.com', $title, $title);        
        $gourl='/admin/index.qm?index';
        msg(1,'恭喜您登录成功',$gourl);
    }



}
