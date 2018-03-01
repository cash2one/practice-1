<?php
namespace app\admin\controller;
use app\admin\controller\Comm;
use \think\Db;

class Ad extends Comm
{
    function _initialize() {
        parent::_initialize();
        error_reporting(E_ERROR | E_WARNING | E_PARSE);//屏蔽变量未定义的问题
         
        $tbq=config('database.prefix');
        $this->assign('menu_flm',6);
        $this->assign('tbq',$tbq);
        qmcheck('ad');
    }
    
    public function index()
    {
        $arc=Db::name('ad');
        $request=\think\Request::instance();
        $order=cookie("ad_order");
        $assign=$this->assign; 
        $admin=$assign['admin'];
        if ($order=='' || $order=='undefined'){$order='id';}
        $desc=cookie("ad_desc");
        if ($desc=='' || $desc=='undefined'){$desc='asc';}
        $audit=(int)$request->get('audit');
        $keys=$request->get('key');
        $this->assign('order',$order);
        $this->assign('desc',$desc);
        $this->assign('audit',$audit);
        if ($keys!=''){$msql2.=" and `cntitle` like '%".$keys."%'";}
        if ($audit>0){$msql2.=" and `audit`='1'";}
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

    public function add()
    {
        qmcheck('edit',1);
        $tbq=config('database.prefix');
        $request=\think\Request::instance();
        $assign=$this->assign;
        $sysfig=$assign['sysfig'];  
        $id=(int)$request->get('id');
        if ($id==0){$act='add';}
        $action='添加';
        $mtb1=Db::name('ad');
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
            $vo['sort']=1;
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
        $arc=Db::name('ad');       
        $assign=$this->assign;
        $admin=$assign['admin'];
        $vo=$arc->where(" id='$id'")->find();  
        $cntitle=$_POST['cntitle'];
        $img=$_POST['img'];
        $width=$_POST['width'];
        $height=$_POST['height'];
        $url=$_POST['url'];
        $ids_bz1=$_POST['ids_bz1'];           
        if(is_null($img)){$img='';}
        if(is_null($width)){$width='';}
        if(is_null($height)){$height='';}
        if(is_null($url)){$url='';}
        if(is_null($ids_bz1)){$ids_bz1='';}
        if(is_null($cntitle)){$cntitle='';}
        if ($cntitle=="")
        {
            msg(-1,'没有填写标题');
        }       
        if ($img=='')
        {
            msg(-1,'没选上传广告图');
        }        
        $data["cntitle"] = $cntitle;
        $data["img"] = $img;
        $data["width"] = $width;
        $data["height"] = $height;
        $data["url"] = $url;
        $data["ids_bz1"] = $ids_bz1; 
       
        $toW=1980;$toH=1980;//图片压缩尺寸限制
        if ($img!='')
        {
            $img2=substr($img,1,strlen($img)-1);
            thumbs($img2,$img2,$toW,$toH);
        }
        /**********图片压缩处理结束********/
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
            $from=$assign['mname'];
            msg(1,"添加成功",$from);
        }
    }
    
    public function doact()
    {
        $request=\think\Request::instance();
        $_POST=$request->post();
        $action=$_POST['action'];
        $info=Db::name('ad');
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
                $idstr=$request->post('idstr');
                $idarr=explode(",",$idstr);
                $nums=count($idarr);
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