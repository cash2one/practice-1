<?php
namespace app\admin\controller;
use app\admin\controller\Comm;
use \think\Db;

class Msg2 extends Comm
{
    function _initialize() {
        parent::_initialize();
        error_reporting(E_ERROR | E_WARNING | E_PARSE);//屏蔽变量未定义的问题
         
        $tbq=config('database.prefix');
        $this->assign('menu_flm',15);
        $this->assign('tbq',$tbq);
        qmcheck('msg2');
    }
    
    public function index()
    {
        $arc=Db::name('msg2');
        $request=\think\Request::instance();
        $order=cookie("msg2_order");
        $assign=$this->assign; 
        $admin=$assign['admin'];
        if ($order=='' || $order=='undefined'){$order='id';}
        $desc=cookie("msg2_desc");
        if ($desc=='' || $desc=='undefined'){$desc='asc';}
        $audit=(int)$request->get('audit');
        $keys=$request->get('key');
        $this->assign('order',$order);
        $this->assign('desc',$desc);
        $this->assign('audit',$audit);
        if ($keys!=''){$msql2.=" and `z1` like '%".$keys."%'";}
        $sql="del='0'";     
        $count = $arc->where($sql.$msql2)->count();
        $pgsize=(int)cookie('T_pgsize');
        if ($pgsize==0){$pgsize=10;}
        $selectpg=selectpg($pgsize);
        $order="`$order` $desc,id asc";
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

    public function view()
    {
        $request=\think\Request::instance(); 
        $id=(int)$request->get('id');
        if ($id==0){$act='add';}
        $action='添加';
        $mtb1=Db::name('msg2');
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
            exit;
            qmcheck('add',1);            
            $vo['audit']=1; 
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
        qmcheck('edit',1);
        $id=(int)$_POST['id'];
        $arc=Db::name('msg2');       
        $assign=$this->assign;
        $vo=$arc->where(" id='$id'")->find();  
        $z1=$_POST['z1'];
        $z2=$_POST['z2'];
        $z3=$_POST['z3'];
        $z4=$_POST['z4'];
        $z5=$_POST['z5'];
        $z6=$_POST['z6'];
        $Qcontent=$_POST['Qcontent'];          
        if(is_null($z1)){$z1='';}
        if(is_null($z2)){$z2='';}
        if(is_null($z3)){$z3='';}
        if(is_null($z4)){$z4='';}
        if(is_null($z5)){$z5='';}
        if(is_null($z6)){$z6='';}
        if(is_null($Qcontent)){$Qcontent='';}

        if ($Qcontent=="")
        {
            msg(-1,'信息错误');
        }       
        $data["Qcontent"] = $Qcontent;
        $data["Qtime"]    = date("Y-m-d H:i:s");       
        if ($vo)
        {
            qmcheck('edit',3);
            $arc->where('id='.$id.'')->update($data); 
            $from=$_POST['from'];
            msg(1,"编辑成功",$from);
        }
    }
    
    public function doact()
    {
        $request=\think\Request::instance();
        $_POST=$request->post();
        $action=$_POST['action'];
        $info=M('msg2');
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
                    $gid=$info->where(" id='".$idarr[$i]."'")->update($data);
                }
                exit("审核成功");               
                break;
            case 's2':
                qmcheck('edit',1);
                $data['state']=0;
                for ($i=0;$i<$nums;$i++)
                {
                    $info->where(" id='".$idarr[$i]."'")->update($data);
                }
                exit("操作成功");               
                break;        
            case 'delall':
                qmcheck('del',1);
                $idstr=$request->post('idstr');
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