<?php
namespace app\admin\controller;
use app\admin\controller\Comm;
use \think\Db;

class Content extends Comm
{
    public $fid;
    function _initialize() {
        parent::_initialize();
        error_reporting(E_ERROR | E_WARNING | E_PARSE);  
        $tbq=config('database.prefix');
        $this->assign('menu_flm',3);
        $this->assign('tbq',$tbq);
        $this->assign('fid',8);
        $this->fid=8;
        qmcheck('lists');
    }
    
    public function index()
    {
        $arc=M('content');
        $request=\think\Request::instance();
        $page=(int)$request->get('p');
        $pid=(int)$request->get('pid');
        $order=cookie("add_order");
        $assign=$this->assign; 
        $admin=$assign['admin'];            
        if ($order=='' || $order=='undefined'){$order='sort';}
        $desc=cookie("add_desc");
        if ($desc==''){$desc='asc';}       
        $keys=$request->get('key');
        $this->assign('pid',$pid);
        $this->assign('order',$order);
        $this->assign('desc',$desc);
        if ($keys!=''){$msql2.=" and `cntitle` like '%".$keys."%'";}
        $fid=$this->fid;    
        $sql=" pid='$pid' and del='0'";  
        $count = $arc->where($sql.$msql2)->count();
        $pgsize=(int)cookie('T_pgsize');
        if ($pgsize==0){$pgsize=10;}
        $selectpg=selectpg($pgsize);
        $parameter='&keys='.$keys;
        $order="`$order` $desc,sort asc,id desc";
        $prar=['query' => $request->param()];
        $list = $arc->where($sql.$msql2)->order($order)->paginate($pgsize,false,$prar);
        $pagestr=$list->render();
        $pagestr=str_replace('</ul>','',$pagestr);
        $plist=$pagestr."<li>".$selectpg."</li></ul>";
        $this->assign('lists',$list);
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
        $id=(int)$request->get('id');
        $pid=(int)$request->get('pid');
        $act='edit';
        if ($id==0){$act='add';}
        $this->assign('act',$act);
        $this->assign('pid',$pid);
        $actionType='添加';
        $vo=M('content')->where(" id='$id'")->find();
        if ($vo)
        {
            qmcheck('edit',1);
            $actionType='修改';
            $this->assign('vo',$vo);
            $this->assign('act',$act);
        }
        else
        {
            qmcheck('add',1);
            $vo['time']=time();
            $vo['audit']=1;
            $vo['sort']=1;
            $vo['pid']=$pid;
            $this->assign('vo',$vo);
        }
        $this->assign('id',$id);
        $this->assign('actionType',$actionType);        
        $html=$this->fetch();
        return $html;
    }

    public function save()
    {
        $id=(int)$_POST['id'];
        $pid=(int)$_POST['pid'];
        $s1=(int)$_POST['s1'];
        $m=M('content');
        $arc=M('content');
        $lm=M('lm');  
        $assign=$this->assign;
        $admin=$assign['admin'];
        $vo=$arc->where(" id='$id'")->find();
        $cntitle=$_POST['cntitle'];
        $bz1=$_POST['bz1'];
        $bz2=$_POST['bz2'];
        $bz3=$_POST['bz3'];
        $bz4=$_POST['bz4'];
        $bz5=$_POST['bz5'];
        $img=$_POST['img'];
        $content=$_POST['content'];
        $sort=(int)$_POST['sort'];
        $audit=(int)$_POST['audit'];            
        if(is_null($bz1)){$bz1='';}
        if(is_null($bz2)){$bz2='';}
        if(is_null($bz3)){$bz3='';}
        if(is_null($bz4)){$bz4='';}
        if(is_null($bz5)){$bz5='';}
        if(is_null($img)){$img='';}
        if ($cntitle=="")
        {
            $json = array("status"=>'-1',"message"=>"没有填写标题");
            echo json_encode($json);
            exit();
        }       
        if ($pid==0)
        {
            $json = array("status"=>'-1',"message"=>"信息错误");
            echo json_encode($json);
            exit();
        }       
        $time=strtotime($_POST['Time']);
        if (!isset($time) || $time==""){$time=time();}        
        $data["cntitle"] = $cntitle;
        $data["sort"] = $sort;
        $data["pid"]  = $pid;
        $data["time"] = $time;
        $data["audit"]= $audit;
        $data["bz1"]  = $bz1;
        $data["bz2"]  = $bz2;
        $data["bz3"]  = $bz3;
        $data["bz4"]  = $bz4;
        $data["bz5"]  = $bz5;
        $data["img"]  = $img;
        $data["s1"]   = $s1;
        $data["content"] = stripslashes($content);
        $addtime2=date("Y-m-d H:i:s");
        if ($sort!=$vo['sort'])
        {
            $tbq=config('database.prefix');
            $tb1=$tbq."lm";
            $tb2=$tbq."content";
            $fid=$this->fid;
            $sql="update $tb2 set sort=sort+1 where fid='$fid' and pid='$pid' and sort>='$sort'";
            Db::query($sql);
        }
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
            $lastInsId = $arc->insertGetId($data);
            $assign=$this->assign;
            $from=$assign['mname'].'.qm?pid='.$pid;
            msg(1,"添加成功",$from);
        }
    }
    
    public function doact()
    {
        $request=\think\Request::instance();
        $_POST=$request->post();
        $lm=M('lm');
        $action=$request->post('action');
        $info=M('content');
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
            case 'sort':
                qmcheck('edit',1);
                $sortstr=$_REQUEST["sortstr"];
                $sortarr=explode(",",$sortstr);
                $nums=count($sortarr);
                for ($i=0;$i<$nums;$i++)
                {
                    $data['sort']=$sortarr[$i];
                    $info->where(" id='".$idarr[$i]."'")->update($data);  
                }
                exit("更新成功");   
                break; 
        }
    }

}