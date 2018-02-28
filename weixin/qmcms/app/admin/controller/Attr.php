<?php
namespace app\admin\controller;
use app\admin\controller\Comm;
use \think\Db;

class Attr extends Comm
{
    function _initialize() {
        parent::_initialize();
        error_reporting(E_ERROR | E_WARNING | E_PARSE);
        $this->assign('menu_flm',11);        
        qmcheck('attr');
    }
    
    public function index()
    {
        $config=Db::name('config'); 
        $request=\think\Request::instance();
        $id=(int)$request->get('id');
        $lmlist=$this->lmlist($id,' ');
        $this->assign('id',$id);
        $this->assign('lmlist',$lmlist);
        $html=$this->fetch();
        return $html;
    }

    public function add()
    {
        $tbq=config('database.prefix');
        $request=\think\Request::instance();
        $_GET=$request->post();
        $tb1=$tbq."attr";  
        $id=(int)$request->get('id');
        $fid=(int)$request->get('fid');
        if ($id==0){$act='add';}
        $lmoption =Soption($fid,0,'attr');
        $action='添加';
        $mtb1=Db::name('attr');
        $vo=$mtb1->where(" id='$id'")->find();
        if ($vo)
        {
            qmcheck('edit',1);
            $action='修改';
            $this->assign('vo',$vo);           
            $lmoption =Soption($vo['fid'],0,'attr');
        }
        else
        {
            qmcheck('add',1);
            $vo['ty']=1;
            $vo['kdel']=0;
            $vo['isshow']=1;
            $vo['fid']=$fid;                                 
            $sorts=$mtb1->where("fid='$fid'")->order("id desc")->value("sort")+1;
            $vo['sort']=$sorts;
            $this->assign('vo',$vo); 
            
        }
        if ($id>0)
        {
            $nfid=$id;
        }
        else
        {
            $nfid=$fid;
        }
        $this->assign('id',$id);
        $this->assign('fid',$fid);
        $this->assign('act',$action);
        $fidpath_=$mtb1->where("id='$nfid'")->value('fidpath').','.$fid.',0';
        $fidarr=explode(',',$fidpath_);
        $this->assign('blm',$fidarr[2]);
        $this->assign('class',count($fidarr));
        $this->assign('action',$action);
        $this->assign('lmoption',$lmoption);
        $this->assign('ty',$vo['ty']);
        $html=$this->fetch();
        return $html;
    }
    
    public function save()
    {
        $request=\think\Request::instance();
        $_POST=$request->post();
        $id=(int)$request->post('id');
        $fid=(int)$request->post('fid');
        $lm=Db::name('attr');
        $vo=$lm->where("id='$id'")->find();
        $cntitle=$_POST['cntitle'];
        $kdel=(int)$_POST['kdel'];
        $sort=(int)$_POST['sort'];
        $isshow=(int)$_POST['isshow'];
        $ty=(int)$_POST['tys'];
        $img=$_POST['img'];
        $entitle=$_POST['entitle'];          
        if ($cntitle=="")
        {
            msg(-1,'没有填写标题');
        }     
        if ($fid>0 && $id==$fid)
        {
            msg(-1,'父栏目错误');
        }   
        $lminfo=$lm->where(" id='".$fid."'")->find();
        $fidpath=$lminfo['fidpath'].",".$fid."";
        $data["fid"]  = $fid;
        $data["sort"] = $sort;
        $data["kdel"] = $kdel;
        $data["fidpath"] = $fidpath;
        $data["isshow"]  = $isshow;
        $data["ty"]      = $ty;     
        $data["img"]     = $img;
        $data["cntitle"] = $cntitle;
        $data["entitle"] = $entitle;
        $assign=$this->assign;
        $appname=$assign['mname'].'.qm';
        $tbq=config('database.prefix');
        //图片处理函数 比如banner图片应该限制最大宽度1980 比如栏目图可能要限制更小
        if (1==2)
        {
            $img2=substr($img,1,strlen($img)-1);
            $toW=1980;$toH=2800;
            thumbs($img2,$img2,$toW,$toH);//详细参考生成缩略图函数            
        }
        if ($vo)
        {
            qmcheck('edit',3);
            $data["id"] = $id;
            $lm->where('id='.$id.'')->update($data);
            msg(1,'编辑成功',$appname.'?id='.$fid);
        }
        else
        {
            qmcheck('add',3);
            $lastInsId = $lm->insertGetId($data);
            msg(1,'添加成功',$appname.'?id='.$fid);
        }
    }
    
    
    public function doact()
    {
        $request=\think\Request::instance();
        $_POST=$request->post();
        $lm=Db::name('attr');
        $action=$request->post('action');
        switch ($action)
        {
            case 'del':
                qmcheck('del',1);
                $id=(int)$request->post('id');
                $lminfo=$lm->where(" fid='".$id."'")->field("id")->find();
                if ($lminfo)
                {
                    exit("删除失败,请先删除该栏目的子栏目");
                }                
                $data['del']=1;
                $lm->where(" id='".$id."' and kdel='0'")->update($data);
                exit("删除成功");
                break;
            case 'sort':
                qmcheck('edit',3);  
                $idstr=$request->post('idstr');
                $sortstr=$request->post('sortstr');
                $idarr=explode(",",$idstr);
                $nums=count($idarr);
                $sortarr=explode(",",$sortstr);
                for ($i=0;$i<$nums;$i++)
                {
                    $data['sort']=$sortarr[$i];
                    $lm->where(" id='".$idarr[$i]."'")->update($data);  
                }               
                msg(1,'更新成功','reload');
        }
    }

    private function lmlist($id,$str)
    {
        $tbq=config('database.prefix');
        $cid=$id;
        $tb1=$tbq."attr";
        $sqlc="SELECT a.id,a.cntitle,a.fid,a.`sort`,a.isshow,a.ty,a.kdel,(select count(b.id) from $tb1 as b where b.fid=a.id) as";
        $sqlc=$sqlc." CNum,entitle,fidpath FROM $tb1 as a where a.fid=".$id." and a.del='0' order by a.`sort` asc";
        $arr=Db::query($sqlc);
        $fhtm='';
        $mtb1=Db::name('attr');
        $sid=$mtb1->where("id='$cid'")->value("fid");
        $assign=$this->assign;
        $appname=$assign['mname'].'/';
        foreach ($arr as $rsc)
        {
            $id=$rsc['id'];
            $cntitle=$rsc['cntitle'];
            $fid=$rsc['fid'];
            $sorts=$rsc['sort'];
            $isshow=$rsc['isshow'];
            if ($isshow==0){$cntitle.="<span class='red'>[隐藏]</span>";}
            $ty=$rsc['ty'];
            $kdel=$rsc['kdel'];
            $entitle=$rsc['entitle'];
            $ftree=$rsc['fidpath'].','.$id;         
            $blm=$ftree[1];
            if ($fid==0){$blm=$id;}
            $bg1='';$bg2='';$do1='';$do2='';            
            $fidpath_=$mtb1->where("id='$id'")->value('fidpath').','.$fid;
            $fidarr=explode(',',$fidpath_);
            $blm=$fidarr[2];
            $zs=count($fidarr);
            $do1='';$do3='';$do0='';$do2='';
/*            if ($fid==0 || $zs<5)
            { 
                $do1='<a href="'.$appname.'add.qm?fid='.$id.'">添加子类</a> |';
                $do3='<a href="'.$appname.'.qm?id='.$id.'">下级分类('.$rsc["CNum"].')</a> |';
            } 
            if ($fid>0){$do0='<a href="'.$appname.'.qm?id='.$sid.'">上级</a> |';}
            */
            if ($kdel==0){$do2='| <a href="javascript:void(0)" onclick="del(\'del\','.$id.')">删除</a>';}
            $fhtm.='<tr'.$bg1.'><td'.$bg2.'><input type="hidden" name="sid" value="'.$id.'" />
                        <span class="fright">'.$do0.'
                        '.$do3.'
                            '.$do1.'<a href="'.$appname.'add.qm?id='.$id.'">修改</a>
                            '.$do2.'|</span>'.$str.'├
                        <a href="'.$appname.'add.qm?id='.$id.'">'.$cntitle.' '.$entitle.'  [ID:'.$id.']</a>
                        </td>
                        <td align="center"'.$bg2.'>
                        <input name="sort" value="'.$sorts.'" class="w30 center form-control" />
                        </td>
                    </tr>';
        }
        return $fhtm;
    }

}