<?php
namespace app\admin\controller;
use app\admin\controller\Comm;
use \think\Db;

class Youhuiquan extends Comm
{
    function _initialize() {
        parent::_initialize();
        error_reporting(E_ERROR | E_WARNING | E_PARSE);         
        $tbq=config('database.prefix');
        $this->assign('menu_flm',73);
        $this->assign('tbq',$tbq);
        qmcheck('youhuiquan');
    }
    
    public function index()
    {
        $arc=M('youhuiquan');
        $request=\think\Request::instance();
        $page=(int)$request->get('p');
        $order=cookie("yh_order");
        $assign=$this->assign; 
        $admin=$assign['admin'];                  
        if ($order=='' || $order=='undefined'){$order='id';}
        $desc=cookie("yh_desc");
        if ($desc==''){$desc='desc';}
        $audit=(int)$request->get('audit');
        $keys=$request->get('key');
        $this->assign('order',$order);
        $this->assign('desc',$desc);
        $this->assign('audit',$audit);
        if ($keys!=''){$msql2.=" and `cntitle` like '%".$keys."%'";}
        if ($audit>0){$msql2.=" and `audit`='1'";}
        $sql=" del='0'";     
        $count = $arc->where($sql.$msql2)->count();
        $pgsize=(int)cookie('T_pgsize');
        if ($pgsize==0){$pgsize=10;}
        $selectpg=selectpg($pgsize);
        $parameter='&audit='.$audit.'&keys='.$keys;
        $order="`$order` $desc,id desc";
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
        $tb2=$tbq."youhuiquan";   
        $id=(int)$request->get('id');
        if ($id==0){$act='add';}
        $lmoption =Soption($fid);
        $action='添加';
        $mtb1=M('youhuiquan');
        $vo=$mtb1->where(" id='$id'")->find();
        if ($vo)
        {
            qmcheck('edit',1);
            $action='修改';
            $act='edit';         
            $this->assign('vo',$vo); 
        }
        else
        {
            qmcheck('add',1);
            $vo['audit']=1;
            $vo['time_start']=strtotime(date('Y-m-d'));
            $vo['time_end']=$vo['time_start']+30*24*3600;
            $this->assign('vo',$vo); 
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
        $arc=M('youhuiquan');
        $assign=$this->assign;
        $admin=$assign['admin'];
        $vo=$arc->where(" id='$id'")->find();  
        $cntitle=$_POST['cntitle'];
        $maxmoney=$_POST['maxmoney'];
        $dkmoney=$_POST['dkmoney'];
        $time_start=$_POST['time_start'];
        $time_end=$_POST['time_end'];
        if ($cntitle==""){msg(-1,'请填写优惠券名称');}
        if ($maxmoney==0 || $dkmoney==0 || $time_start=='' || $time_end=='')
        {
            msg(-1,'请认真填写资料');
        }
        $time_start=strtotime($time_start);
        $time_end=strtotime($time_end);
        if ($time_start>$time_end)
        {
            msg(-1,'截止日期不能大于开始日期');
        }
        $data["cntitle"] = $cntitle;
        $data["maxmoney"] = $maxmoney;
        $data["dkmoney"] = $dkmoney;
        $data["time_start"] = $time_start;
        $data["time_end"] = $time_end;
        if ($vo)
        {
            qmcheck('edit',3);            
            $arc->where('id='.$id.'')->update($data); 
            $from=$_POST['from']; 
            msg(1,"编辑成功",$from);
        }
        else
        {
            qmcheck('add',3);
            $data['time']=time();
            $lastInsId = $arc->insertGetId($data); 
            $assign=$this->assign;
            $from=$assign['mname'].'.qm';
            msg(1,"添加成功",$from);
        }
    }

   
    public function doact()
    {
        $request=\think\Request::instance();
        $_POST=$request->post();
        $action=$request->post('action');
        $info=M('youhuiquan');
        $idstr=$request->post('idstr');
        $idarr=explode(",",$idstr);
        $nums=count($idarr);
        switch ($action)
        {
            case 's1':
                qmcheck('edit',1);                
                $data['audit']=1;
                for ($i=0;$i<$nums;$i++)
                {
                    $gid=$info->where(" id='".$idarr[$i]."'")->save($data);
                }
                exit("审核成功");               
                break;
            case 's2':
                qmcheck('edit',1);
                $data['audit']=0;
                for ($i=0;$i<$nums;$i++)
                {
                    $info->where(" id='".$idarr[$i]."'")->save($data);
                }
                exit("操作成功");               
                break;        
            case 'delall':
                qmcheck('del',1);
                $data['del']=1;
                for ($i=0;$i<$nums;$i++)
                {
                    $info->where(" id='".$idarr[$i]."'")->save($data);
                }
                exit("删除成功");   
                break;            
        }
    }
   

}