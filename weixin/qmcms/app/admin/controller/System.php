<?php
namespace app\admin\controller;
use app\admin\controller\Comm;


class System extends Comm
{
    function _initialize() {
        parent::_initialize();
        $this->assign('menu_flm',1);
        qmcheck('system');
    }
    
    public function index()
    {
        $config=\think\Db::name('config'); 
        $sys=$config->where("`audit`='0'")->order("sort asc,id asc")->select();
        $systemoption='';
        foreach ($sys as $rs)
        {
            $ty=2;
            if ($rs['info']!="head标签")
            {
                $ty=$rs['type'];
            }
            $systemoption.="<div class='form-group'><label for='title' class='col-md-2 control-label'>".$rs['info']."：</label>".$this->editconfig($rs['varname'],$ty,$rs['value'])."</div>";          
         }   
        $this->assign('systemoption',$systemoption);
        $html=$this->fetch();
        return $html;
    }

    
    public function save()
    {
        qmcheck('edit',3);
        $config=\think\Db::name('config'); 
        $sys=$config->where("`audit`='0'")->select();
        $request = \think\Request::instance();
        foreach ($sys as $ks)
        {

            $val=$ks['varname'];

            if ($val=='cfg_f8')
            {
                $value=$_POST['cfg_f8'];
                $value=implode(',',$value);   
                $val='cfg_f8';             
            }
            else
            {
                $value=$request->post($ks['varname']);
                if ($ks['varname']=='cfg_f6')
                {
                    $value=(int)$value;
                    if ($value>100)
                    {
                        $value=10;
                    }
                }
            }

            $val=str_replace("'","",$val);
            $val=str_replace('"','',$val);
            $where=" `varname`='$val'";
            $data['value']=$value;
            $config->where($where)->update($data);
        }     
        msg(1,'操作成功','reload');
    }
    public function editconfig($varname,$ty,$val)
    {   
        $val=str_replace('\"','"',$val);
        $val=str_replace("\'","'",$val);
        switch ($ty)
        {
            case 1:
            return '
                <div class="col-md-6">
                  <input type="text" class="form-control" id="'.$varname.'" name="'.$varname.'" value="'.$val.'">
                </div>      
            ';
            return "<td><input name='".$varname."' value='".$val."' class='input' /></td>";
            break;
        case 2:
            return '
                <div class="col-md-6">
                <textarea class="form-control" style="height:80px;" id="'.$varname.'" name="'.$varname.'">'.$val.'</textarea>
                </div>      
            ';
            break;
        case 3:
            return '
                <div class="col-md-9">
                <textarea class="form-control" style="height:180px;" id="'.$varname.'" name="'.$varname.'">'.$val.'</textarea>
                </div>      
            ';
            break;
        case 7:
            return '
                <div class="col-md-6">
                  <input title="多个请用英文 | 隔开" type="text" class="form-control" id="'.$varname.'" name="'.$varname.'" value="'.$val.'">　多个请用英文 | 隔开
                </div>      
            ';
            break;
        case 17:
            $arrs=explode(',',$val);
            $option='';
            //09:00-09:30|09:30-10:00|
            for ($f=16;$f<=40;$f++)
            {
                $selected='';
                $v=(int)($f/2);
                $mod=$f%2;
                $vs2=$v;
                $selected='';
                if (in_array($f,$arrs))
                {
                    $selected=' selected';
                }
                if ($vs2<10)
                {
                    $vs2='0'.$vs2;
                }
                if ($mod==0)
                {
                    $v3=$v;
                    if ($v3<10)
                    {
                        $v3='0'.$v3;
                    }
                    $v2=$vs2.':00到'.$v3.':30';
                }
                else
                {
                    $v3=$v+1;
                    if ($v3<10)
                    {
                        $v3='0'.$v3;
                    }
                    $v2=$vs2.':30到'.$v3.':00';
                }
                $option.="<option value='".$f."'$selected>".$v2."</option>";
            }
            return '
                <div class="col-md-6">
                    <select name="'.$varname.'[]" class="form-control wat selectpicker" multiple data-live-search="true">
                        '.$option.'
                    </select>
                </div>      
            ';
            break; 
        case 8:
            return '
                <div class="col-md-6">
                <textarea class="form-control" style="height:300px" id="'.$varname.'" name="'.$varname.'">'.$val.'</textarea>
                </div>      
            ';
            break;  
        case 9:
            return "<div class='col-md-6'><input name='".$varname."' value='".$val."' class='input' />　<a href='http://api.map.baidu.com/lbsapi/getpoint/index.html' target='_blank' class='red'>百度坐标</a>div>";
            break;  
        case 10:
            return '
                <div class="col-md-6">
                  <input title="多默认6条" type="text" class="form-control" id="'.$varname.'" name="'.$varname.'" value="'.$val.'">
                </div>      
                <div class="col-md-2" style="line-height:30px">
                    默认6条
                </div>
            ';
            break;  
        case 4:
            if ($val==1){$checked1=' checked="checked"';}
            if ($val==0){$checked2=' checked="checked"';}
        return "
            <div class='col-md-6'><input type='radio'$checked1 name='".$varname."' value='1' />启用
            <input type='radio'$checked2 name='".$varname."' value='0' />不启用</div>";
            break;
        }
    }

}
