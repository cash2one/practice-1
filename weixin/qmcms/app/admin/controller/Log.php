<?php
namespace app\admin\controller;
use app\admin\controller\Comm;
use \think\Db;

class Log extends Comm
{
    function _initialize() {
        parent::_initialize();
        error_reporting(E_ERROR | E_WARNING | E_PARSE);         
        $tbq=config('database.prefix');
        $this->assign('menu_flm',53);
        $this->assign('tbq',$tbq);
        //qmcheck('msg');
    }
    public function index()
    {
        $arc=Db::name('log');
        $request=\think\Request::instance();
        $order=cookie("log_order");
        $assign=$this->assign; 
        $admin=$assign['admin'];
/*        if ($order=='' || $order=='undefined'){$order='id';}
        $desc=cookie("log_desc");
        if ($desc=='' || $desc=='undefined'){$desc='asc';}
        $audit=(int)$request->get('audit');
        $keys=$request->get('key');
        $this->assign('order',$order);
        $this->assign('desc',$desc);
        $this->assign('audit',$audit);
        if ($keys!=''){$msql2.=" and (`ip` like '%".$keys."%' or url like '%$keys%')";}*/

        $t1=cookie("log_time1");
        $t2=cookie("log_time2");
        $this->assign('time1',$t1);
        $this->assign('time2',$t2);
/*        if ($t1!=''){$ts1=$t1." 00:00:01";$msql2.=" and time>=".strtotime($ts1)."";}
        if ($t2!=''){$ts2=$t2." 23:59:59";$msql2.=" and time<=".strtotime($ts2)."";}


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
        $this->assign('page',$plist);*/
        $html=$this->fetch();
        return $html;
    }
     
    public function data()
    {
        $arc=Db::name('log');
        $request=\think\Request::instance();
        $order=cookie("log_order");
        $assign=$this->assign; 
        $admin=$assign['admin'];
        if ($order=='' || $order=='undefined'){$order='id';}
        $desc=cookie("log_desc");
        if ($desc=='' || $desc=='undefined'){$desc='asc';}
        $audit=(int)$request->get('audit');
        $keys=$request->get('key');
        $this->assign('order',$order);
        $this->assign('desc',$desc);
        $this->assign('audit',$audit);
        if ($keys!=''){$msql2.=" and (`ip` like '%".$keys."%' or url like '%$keys%')";}

        $t1=cookie("log_time1");
        $t2=cookie("log_time2");
        $this->assign('time1',$t1);
        $this->assign('time2',$t2);
        if ($t1!=''){$ts1=$t1." 00:00:01";$msql2.=" and time>=".strtotime($ts1)."";}
        if ($t2!=''){$ts2=$t2." 23:59:59";$msql2.=" and time<=".strtotime($ts2)."";}


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

   
    
    public function doact()
    {
        $request=\think\Request::instance();
        $_POST=$request->post();
        $action=$_POST['action'];
        $info=M('log');
        $idstr=$request->post('idstr');
        $idarr=explode(",",$idstr);
        $nums=count($idarr);
        switch ($action)
        {
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