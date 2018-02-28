<?php
namespace app\admin\controller;
use app\admin\controller\Comm;
use \think\Db;

class Admin extends Comm
{
    function _initialize() {
        parent::_initialize();
        error_reporting(E_ERROR | E_WARNING | E_PARSE);
        $this->assign('menu_flm',9); 
    }
    

    public function index()
    {
        $config=Db::name('config'); 
        $request=\think\Request::instance();
        $keys=$request->get('key');
        $adminid =session('admin_id');
        $pwd =session('admin_pwd');
        $mpwd =session('admin_cookie');
        $action="管理员管理";

        $m=\think\Db::name('admin');
        $order=cookie("admin_Order");
        if ($order==''){$order='id';}
        $desc=cookie("admin_desc");
        if ($desc==''){$desc='asc';}
        $assign=$this->assign;
        $admins=$assign['admin']; 
        $this->assign('order',$order);
        $this->assign('desc',$desc);
        $this->assign('keys',$keys);
        $this->assign('action',$action);  
        if ($admins['Grade']==9)
        {
            if ($keys!='')
            {
                $msql2="  and concat(trim(`username`),trim(`cityname`),trim(`truename`),trim(`address`),trim(`tel`)) like '%$keys%'";
            }   
            $list=$m->where("Grade='1' and del='0'$msql2")->select();
            $this->assign('lists',$list);
            return $this->fetch();
        }
        else
        {
            $vo=$m->where("username='$adminid'")->find();
            $this->assign('vo',$vo);            
            return $this->fetch('edit');
        }
    }
    
    
    
    public function add()
    {
        $request=\think\Request::instance();
        $assign=$this->assign;
        $admins=$assign['admin'];  
        if ($admins['Grade']!=9)
        {
            $this->edit();exit();
        }

        $id=(int)$request->get('id');
        $fid=(int)$request->get('fid');
        $this->assign('fid',$fid);
        if ($id==0){$act='add';}
        $this->assign('act',$act);
        $actionType='添加';
        $mtb=$m=\think\Db::name('admin');
        $vo=$mtb->where(" id='$id' and Grade='1'")->find();
        if ($vo)
        {
            $pwd=md5("wifi".'chengdu'.$vo['username']);          
            $actionType='修改';
        }
        else
        {
            $vo['Lock']=0;
        }
        $this->assign('vo',$vo); 
        $this->assign('actionType',$actionType); 
        $this->assign('id',$id); 
        return $this->fetch();
    }
    
    public function save()
    {
        $request=\think\Request::instance();
        $assign=$this->assign;
        $admins=$assign['admin'];  
        if ($admins['Grade']!=9)
        {
            $this->edit();exit();
        }
        $info=$m=\think\Db::name('admin');
        $id=(int)$request->post('id');
        $Lock=(int)$request->post('Lock');
        $user=$request->post('username');
        $pwd=$request->post('password');  
        $user=preg_replace("[^0-9a-zA-Z_@!\.-]",'',$user);
        $pwd=preg_replace("[^0-9a-zA-Z_@!\.-]",'',$pwd);
        $cityname=$request->post('cityname');
        $role_id=(int)$request->post('role_id');
        $truename=$request->post('truename');

/*        $flag1=$request->post('flag1/a');
        $flag2=$request->post('flag2/a');
        $flag1=implode(',',$flag1);
        $flag2=implode(',',$flag2);*/

        $tel=$request->post('tel');
        $address=$request->post('address');  
        if ($user=="" || $cityname=="")
        {
            msg(0,'用户名和城市必填');
        }
        $vo=$info->where(" id='$id' and Grade='1'")->find();    
        if (!$vo && $pwd=="")
        {
            msg(0,'请输入密码');
        }
        $isid=$info->where(" id!='$id' and username='$user'")->find();
        if ($isid)
        {
            msg(0,'账号重复');
        }       
        $data["username"] = $user;
        if ($pwd!='')
        {
            $pwds=md5("wifi".$pwd.$user);
            $data["password"] = $pwds;
        }
        $data["cityname"]= $cityname;
        $data["truename"]= $truename;
        $data["tel"]     = $tel;
        $data["address"] = $address;
        $data["Lock"]    = $Lock;
        $data["Grade"]   = 1;
/*        $data["flag1"]   = $flag1;
        $data["flag2"]   = $flag2;*/
        $data["role_id"] = $role_id;
        
        if ($vo)
        {
            $info->where('id='.$id.' and Grade=1')->update($data);
            msg(1,'修改成功',$assign['mname'].'.qm');
        }
        else
        {
            $lastInsId = $info->insertGetId($data);
            msg(1,'添加成功',$assign['mname'].'.qm');
        }
    }



    /*角色管理 列表*/
    public function role_index()
    {
        $config=Db::name('config'); 
        $request=\think\Request::instance();
        $keys=$request->get('key');
        $adminid =session('admin_id');
        $pwd =session('admin_pwd');
        $mpwd =session('admin_cookie');
        $action="管理员角色管理";

        $m=\think\Db::name('admin_role');
        $order=cookie("role_order");
        if ($order==''){$order='id';}
        $desc=cookie("role_desc");
        if ($desc==''){$desc='asc';}
        $assign=$this->assign;
        $admins=$assign['admin'];
        $this->assign('order',$order);
        $this->assign('desc',$desc);
        $this->assign('keys',$keys);
        $this->assign('action',$action);  
        if ($admins['Grade']==9)
        {
            if ($keys!='')
            {
                $msql2="  and concat(trim(`title`)) like '%$keys%'";
            }   
            $list=$m->where("del='0'$msql2")->select();
            $this->assign('lists',$list);
            return $this->fetch();
        }
        else
        {
            exit;
        }
    }
    
    
    /*角色管理 添加或修改*/
    public function role_add()
    {
        $request=\think\Request::instance();
        $assign=$this->assign;
        $admins=$assign['admin'];  
        if ($admins['Grade']!=9)
        {
            $this->edit();exit();
        }
        $id=(int)$request->get('id');
        if ($id==0){$act='add';}
        $this->assign('act',$act);
        $actionType='添加';
        $mtb=$m=\think\Db::name('admin_role');
        $vo=$mtb->where(" id='$id' and del='0'")->find();
        if ($vo)
        {        
            $actionType='修改';
        }
        $this->assign('vo',$vo); 
        $this->assign('actionType',$actionType); 
        $this->assign('id',$id); 
        return $this->fetch();
    }
    
    /*角色管理 保存*/
    public function role_save()
    {
        $request=\think\Request::instance();
        $assign=$this->assign;
        $admins=$assign['admin'];  
        if ($admins['Grade']!=9)
        {
            $this->edit();exit();
        }
        $info=$m=\think\Db::name('admin_role');
        $id=(int)$request->post('id');
        $title=$request->post('title');
        $flag1=$request->post('flag1/a');//接收数组 /a /d数字
        $flag2=$request->post('flag2/a');
        $flag1=implode(',',$flag1);
        $flag2=implode(',',$flag2); 
        if ($flag1=="" || $flag2=="")
        {
            msg(0,'请选择模块权限和操作权限');
        }
        $vo=$info->where(" id='$id' and del='0'")->find();    
        $data["flag1"]=$flag1;
        $data["flag2"]=$flag2;
        $data["title"]=$title;
        if ($vo)
        {
            $info->where('id='.$id.' and del=0')->update($data);
            msg(1,'修改成功',$assign['mname'].'/role_index.qm');
        }
        else
        {
            $lastInsId = $info->insertGetId($data);
            msg(1,'添加成功',$assign['mname'].'./role_index.qm');
        }
    }

    
    
    public function edit()
    {
        $action="管理员修改";
        $this->assign('action',$action); 
        $adminid =session('admin_id');
        $pwd =session('admin_pwd');
        $mpwd =session('admin_cookie');
        $m=\think\Db::name('admin');
        $vo=$m->where("username='$adminid'")->find();
        $this->assign('vo',$vo); 
        return $this->fetch('edit');
    }
    public function doact()
    {
        $request=\think\Request::instance();
        $action=$request->post('action');
        $idstr=$request->post('idstr');
        if ($action=='')
        {
            $action=$request->get('action');
        }
        $assign=$this->assign;
        $admins=$assign['admin'];  
        $info=\think\Db::name('admin');
        switch ($action)
        {
            case 's1':                
                if ($admins['Grade']!=9)
                {
                    $this->edit();exit();
                }
                $idarr=explode(",",$idstr);
                $nums=count($idarr);
                $data['Lock']=0;
                for ($i=0;$i<$nums;$i++)
                {
                    $info->where(" id='".$idarr[$i]."'")->update($data);
                }
                exit("审核成功");               
                break;
            case 's2':
                if ($admins['Grade']!=9)
                {
                    $this->edit();exit();
                }
                $idarr=explode(",",$idstr);
                $nums=count($idarr);
                $data['Lock']=1;
                for ($i=0;$i<$nums;$i++)
                {
                    $info->where(" id='".$idarr[$i]."'")->update($data);
                }
                exit("操作成功");               
                break;
            case 'delall':
                if ($admins['Grade']!=9)
                {
                    $this->edit();exit();
                }
                $idarr=explode(",",$idstr);
                $nums=count($idarr);                
                $data['del']=1;
                for ($i=0;$i<$nums;$i++)
                {
                    $info->where(" id='".$idarr[$i]."'")->update($data);
                }
                exit("删除成功");   
                break;
            case 'edit':
                $m=$info;
                $adminid =session('admin_id');
                $user=$request->post('username');
                $pwd=$request->post('password');
                $oldpwd=$request->post('oldpwd');
                $pwd2=$request->post('pwd2');
                $user=preg_replace("[^0-9a-zA-Z_@!\.-]",'',$user);
                $pwd=preg_replace("[^0-9a-zA-Z_@!\.-]",'',$pwd);
                $oldpwd=preg_replace("[^0-9a-zA-Z_@!\.-]",'',$oldpwd);
                $oldpwd=md5("wifi".$oldpwd.$adminid);
                $pwd=md5("wifi".$pwd.$user);
                $where="username='$adminid'";
                $minfo=$m->where($where)->find();
                if ($minfo['password']!=$oldpwd)
                {
                    msg(0,'原始密码错误');
                }                       
                $data['username']=$user;
                $data['password']=$pwd;
                $m->where($where)->update($data);
                session('admin_id',$user);
                session('admin_pwd',$pwd);
                msg(1,'操作成功','reload');
                break;  
        }
    }


    public function role_doact()
    {
        $request=\think\Request::instance();
        $action=$request->post('action');
        $idstr=$request->post('idstr');
        if ($action=='')
        {
            $action=$request->get('action');
        }
        $assign=$this->assign;
        $admins=$assign['admin'];  
        $info=\think\Db::name('admin_role');
        switch ($action)
        {
            case 's1':                
                if ($admins['Grade']!=9)
                {
                    $this->edit();exit();
                }
                $idarr=explode(",",$idstr);
                $nums=count($idarr);
                $data['audit']=1;
                for ($i=0;$i<$nums;$i++)
                {
                    $info->where(" id='".$idarr[$i]."'")->update($data);
                }
                exit("审核成功");               
                break;
            case 's2':
                if ($admins['Grade']!=9)
                {
                    $this->edit();exit();
                }
                $idarr=explode(",",$idstr);
                $nums=count($idarr);
                $data['audit']=0;
                for ($i=0;$i<$nums;$i++)
                {
                    $info->where(" id='".$idarr[$i]."'")->update($data);
                }
                exit("操作成功");               
                break;
            case 'delall':
                if ($admins['Grade']!=9)
                {
                    $this->edit();exit();
                }
                $idarr=explode(",",$idstr);
                $nums=count($idarr);                
                $data['del']=1;
                for ($i=0;$i<$nums;$i++)
                {
                    $info->where(" id='".$idarr[$i]."'")->update($data);
                }
                exit("删除成功");   
                break;            
        }
    }
 
}