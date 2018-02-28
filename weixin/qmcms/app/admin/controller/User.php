<?php
namespace app\admin\controller;
use app\admin\controller\Comm;
use \think\Db;

class User extends Comm
{
    function _initialize() {
        parent::_initialize();
        error_reporting(E_ERROR | E_WARNING | E_PARSE);     
        $tbq=config('database.prefix');
        $this->assign('menu_flm',33);
        $this->assign('tbq',$tbq);
        qmcheck('user');
    }
    
    public function index()
    {
        $arc=M('member');
        $request=\think\Request::instance();
        $page=(int)$request->get('p');
        $order=cookie("user_order");
        if ($order=='' || $order=='undefined'){$order='user_id';}
        $desc=cookie("user_desc");
        if ($desc==''){$desc='desc';}

        $assign=$this->assign; 
        $admin=$assign['admin'];
        $audit=(int)$request->get('audit');
        $keys=$request->get('key');
        $this->assign('order',$order);
        $this->assign('desc',$desc);
        $this->assign('audit',$audit);
        if ($keys!=''){$msql2.=" and (`user_name` like '%".$keys."%' or `truename` like '%".$keys."%' or `phone` like '%".$keys."%')";}
        if ($audit>0){$msql2.=" and `state`='1'";}
        $t1=cookie("user_time1");
        $t2=cookie("user_time2");
        $this->assign('time1',$t1);
        $this->assign('time2',$t2);
        if ($t1!=''){$ts1=$t1." 00:00:01";$msql2.=" and time>=".strtotime($ts1)."";}
        if ($t2!=''){$ts2=$t2." 23:59:59";$msql2.=" and time<=".strtotime($ts2)."";}

        $sql=" del='0'";     
        $count = $arc->where($sql.$msql2)->count();
        $pgsize=(int)cookie('T_pgsize');
        if ($pgsize==0){$pgsize=10;}
        $selectpg=selectpg($pgsize);
        $parameter='&audit='.$audit.'&keys='.$keys;
        $order="`$order` $desc,user_id desc";
        $prar=['query' => $request->param()];
        $list = $arc->where($sql.$msql2)->order($order)->paginate($pgsize,false,$prar);
        $pagestr=$list->render();
        $pagestr=str_replace('</ul>','',$pagestr);
        $plist=$pagestr."<li>".$selectpg."</li></ul>";
        $this->assign('list',$list);
        $this->assign('page',$plist);
        $html=$this->fetch();
        return $html;
    }

    public function add()
    {
        $tbq=config('database.prefix');
        $request=\think\Request::instance();
        $assign=$this->assign;
        $sysfig=$assign['sysfig'];
        $_GET=$request->post();
        $id=(int)$request->get('id');
        $mtb1=M('member');
        $vo=$mtb1->where(" user_id='$id'")->find();
        if ($vo)
        {
            qmcheck('edit',1);
            $action='修改';
            $act='edit';
            $this->assign('vo',$vo);   
        }
        else
        {
            exit('002');
        }     
        $this->assign('id',$id);
        $this->assign('act',$act);      
        $this->assign('action',$action);
        $html=$this->fetch();
        return $html;
    }

    public function save()
    {
        $id=(int)$_POST['id'];        
        $arc=M('member');      
        $assign=$this->assign;
        $admin=$assign['admin'];
        $vo=$arc->where(" user_id='$id'")->find();  

        $nc=$_POST['nc'];             
        if(is_null($nc)){$nc='';}
        $truename=$_POST['truename'];             
        if(is_null($truename)){$truename='';}
        $phone=$_POST['phone'];             
        if(is_null($phone)){$phone='';}
        $birthday=$_POST['birthday'];             
        if(is_null($birthday)){$birthday='';}
        $address=$_POST['address'];             
        if(is_null($address)){$address='';}  
        $class=(int)$_POST['class'];             
        $bz=$_POST['about'];
        $data["nc"] = $nc;
        $data["truename"] = $truename;
        $data["phone"] = $phone;
        $data["birthday"] = $birthday;
        $data["address"] = $address;
        $data["class"] = $class;
        $data["about"] = $bz;
        /*检查手机号是否重复*/
        if ($vo['user_name']=='' && $phone!='')
        {
            $data['isbind']=1;
            $data['isbind_time']=time();
            $where="(phone='$phone' || user_name='$phone') and user_id!='$id' and del='0'";
            $vod=$arc->where($where)->field('user_id')->find();
            if ($vod)
            {
                msg(-1,'手机号已注册，请更换');
            }
        }
        
        $from=$_POST['from']; 
        if ($vo)
        {
            qmcheck('edit',3);           
            $arc->where('user_id='.$id.'')->save($data);            
            msg(1,"编辑成功",$from);
        }
        else
        {
            msg(1,"编辑成功",$from);
        }
    }
    
    public function doact()
    {
        $request=\think\Request::instance();
        $_POST=$request->post();
        $action=$request->post('action');
        $info=M('member');
        $idstr=$request->post('idstr');
        $idarr=explode(",",$idstr);
        $nums=count($idarr);
        switch ($action)
        {
            case 's1':
                qmcheck('edit',1);                
                $data['state']=1;
                for ($i=0;$i<$nums;$i++)
                {
                    $gid=$info->where(" user_id='".$idarr[$i]."'")->save($data);
                }
                exit("审核成功");               
                break;
            case 's2':
                qmcheck('edit',1);
                $data['state']=0;
                for ($i=0;$i<$nums;$i++)
                {
                    $info->where(" user_id='".$idarr[$i]."'")->save($data);
                }
                exit("操作成功");               
                break;   
            case 's3':
                qmcheck('edit',1);                
                $data['saomiao']=1;
                for ($i=0;$i<$nums;$i++)
                {
                    $gid=$info->where(" user_id='".$idarr[$i]."'")->save($data);
                }
                exit("设置成功");               
                break;
            case 's4':
                qmcheck('edit',1);
                $data['saomiao']=0;
                for ($i=0;$i<$nums;$i++)
                {
                    $info->where(" user_id='".$idarr[$i]."'")->save($data);
                }
                exit("操作成功");               
                break;  
            case 'movedoc':
                qmcheck('edit',1);
                $fid=(int)$_REQUEST['fid'];                
                $data['class']=$fid;
                $info->where("user_id in(".$idstr.")")->update($data);
                exit("设置成功");   
                break;  

            case 'delall':
                qmcheck('del',1);
                $data['del']=1;
                for ($i=0;$i<$nums;$i++)
                {
                    $uname=$info->where(" user_id='".$idarr[$i]."'")->value('user_name');
                    $data['user_name']='del_'.$uname;
                    $info->where(" user_id='".$idarr[$i]."'")->save($data);
                }
                exit("删除成功");   
                break;           
        }
    }
  

    public function attr()
    {
        qmcheck('edit',1);
        $lmoption =Soption(0);
        $this->assign('lmoption',$lmoption);
        $request=\think\Request::instance();
        $_POST=$request->post();
        $_GET =$request->get();
        $idstr=$_REQUEST["idstr"];
        $id=(int)$_REQUEST["id"];
        $this->assign('idstr',$idstr);
        $ty=(int)$_GET['ty'];
        $info=M('member');
        switch ($ty)
        {
            case 2:
                $vo=$info->where(" user_id='$id'")->find();
                if (!vo)
                {
                    exit(); 
                }               
                $this->assign('vo',$vo);
                return $this->fetch('attr_2');
                break;
        }
    }
}