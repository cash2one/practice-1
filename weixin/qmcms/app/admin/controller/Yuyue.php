<?php
namespace app\admin\controller;
use app\admin\controller\Comm;
use \think\Db;

class Yuyue extends Comm
{
    function _initialize() {
        parent::_initialize();
        error_reporting(E_ERROR | E_WARNING | E_PARSE);         
        $tbq=config('database.prefix');
        $this->assign('menu_flm',72);
        $this->assign('tbq',$tbq);
        qmcheck('yuyue');
    }
    
    public function index()
    {
        $arc=Db::name('order_yuyue');
        $request=\think\Request::instance();
        $order=cookie("yy_order");
        $assign=$this->assign; 
        $admin=$assign['admin'];
        if ($order=='' || $order=='undefined'){$order='id';}
        $desc=cookie("yy_desc");
        if ($desc=='' || $desc=='undefined'){$desc='desc';}
        $audit=(int)$request->get('audit');
        $keys=$request->get('key');
        $this->assign('order',$order);
        $this->assign('desc',$desc);
        $this->assign('audit',$audit);
        if ($keys!=''){$msql2.=" and (`truename` like '%".$keys."%' or `phone` like '%".$keys."%' or `cntitle` like '%".$keys."%' or `yy_teacher_name` like '%".$keys."%')";}
        $t1=cookie("yy_time1");
        $t2=cookie("yy_time2");
        $this->assign('time1',$t1);
        $this->assign('time2',$t2);
        if ($t1!=''){$ts1=$t1." 00:00:01";$msql2.=" and yytime>=".strtotime($ts1)."";}
        if ($t2!=''){$ts2=$t2." 23:59:59";$msql2.=" and yytime<=".strtotime($ts2)."";}
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
        $mtb1=Db::name('order_yuyue');
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
        $arc=Db::name('order_yuyue');       
        $assign=$this->assign;
        $vo=$arc->where(" id='$id'")->find();
        $vos['snum']=99;  
        if ($vo['orderid']!='')
        {
            $vos=M('order_goods')->where("id='".$vo['pid']."'")->find();
        }
        $num=$_POST['num'];        
        $bz=$_POST['bz'];
        if(is_null($num)){$num=1;}
        if(is_null($bz)){$bz='';}
        $data["bz"]  = $bz;
        $data["num"] = $num;
        $data["usetime"] = time();       
        if ($vo && $vo['num']<=$vos['snum'])
        {
            qmcheck('edit',3);
            $arc->where('id='.$id.'')->update($data); 
            $from=$_POST['from'];
            msg(1,"编辑成功",$from);
        }
        else
        {
            msg(1,"编辑失败,剩余预约次数最大为".$vos['snum']);
        }
    }
    
    public function doact()
    {
        $request=\think\Request::instance();
        $_POST=$request->post();
        $action=$_POST['action'];
        $info=M('order_yuyue');
        $mtb1=M('order_goods');
        $mtb2=M('order');
        $idstr=$request->post('idstr');
        $idarr=explode(",",$idstr);
        $nums=count($idarr);

        switch ($action)
        {
            case 's1':
                qmcheck('edit',1);
                $data['audit']=1;
                $data["usetime"] = time();
                for ($i=0;$i<$nums;$i++)
                {
                    $gid=$info->where(" id='".$idarr[$i]."' and audit!='-1'")->update($data);
                    /*获取本次消费次数  同时更细订单表和订单明细表的剩余使用次数*/
                    if ($gid>0)
                    {
                        $vo=$info->where(" id='".$idarr[$i]."' and audit!='-1'")->find();
                        if ($vo['orderid']!='')
                        {
                        $mtb1->where("orderid='".$vo['orderid']."' and pid='".$vo['pid']."'")->setDec('snum',$vo['num']);
                        $mtb2->where("orderid='".$vo['orderid']."'")->setDec('snum',$vo['num']);   
                        }
                    }

                }
                exit("已到店消费");               
                break;
            case 's2':
                qmcheck('audit',1);
                $data['audit']=-1;
                $data["usetime"] = time();     
                for ($i=0;$i<$nums;$i++)
                {
                    $info->where(" id='".$idarr[$i]."' and audit!='1'")->update($data);
                }
                exit("取消预约成功");               
                break;        
            case 'delall':
                qmcheck('del',1);
                $idstr=$request->post('idstr');
                $idarr=explode(",",$idstr);
                $nums=count($idarr);
                $data['del']=1;
                for ($i=0;$i<$nums;$i++)
                {
                    $info->where(" id='".$idarr[$i]."' and audit!='1'")->update($data);
                }
                exit("删除成功");   
                break;
        }
    }
 

}