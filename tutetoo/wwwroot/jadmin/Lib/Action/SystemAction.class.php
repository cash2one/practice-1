<?php
import('jadmin.Action.func');
class SystemAction extends Action {
    var $config;
	function _initialize() {
		$config=getconfig();
		$this->sysfig=$config;
		$this->menu_flm=1;
		checkadmin();qmadmin();
	}
	
  
	public function index()
	{
		$config = M("config");
		$sys=$config->where("`audit`='0'")->select();
		foreach ($sys as $rs)
		{
			$ty=2;
			if ($rs['info']!="head标签")
			{
				$ty=$rs['type'];
			}
			//$system.="<tr><td>　".$rs['info']."：</td>".$this->editconfig($rs['varname'],$ty,$rs['value'])."</tr>";
			$system.="<div class='form-group'><label for='title' class='col-md-2 control-label'>".$rs['info']."：</label>".$this->editconfig($rs['varname'],$ty,$rs['value'])."</div>";			
		 }   
		$this->systemoption=$system;
		$htm=$this->display();
	}
	
	public function save()
	{
		$config=M('config');
		$sys=$config->where("`audit`='0'")->select();
		foreach ($sys as $ks)
		{
			$value=$_POST[$ks['varname']];
			$val=$ks['varname'];
			$val=str_replace("'","",$val);
			$val=str_replace('"','',$val);
			$where=' `varname`=\''.$val.'\'';
			$data['value']=$value;
			$config->where($where)->save($data);
			//更新订单的折扣为当前的折扣
			if ($ks['varname']=='cfg_bl' && $val!=$this->sysfig['cfg_bl'])
			{
				if ((int)$value>99 || (int)$value<1)
				{
					$value=10;	
				}
				$mtb=M('order');
				$datax['hzk']=$value;
				$mtb->where("hzt='0' and paytime>'0' and del='0'")->save($datax);
				//$sql=$mtb->GetLastSql();
				//exit();
			}
		}
		
		$json = array("status"=>'1',"message"=>"操作成功","url"=>U('/?m=system&rs=ok'));
		echo json_encode($json);
		exit();
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
				<textarea class="form-control" style="height:100px;" id="'.$varname.'" name="'.$varname.'">'.$val.'</textarea>
				</div>		
			';
			break;
		case 3:
			return '
				<div class="col-md-9">
				<textarea class="form-control" style="height:100px;" id="'.$varname.'" name="'.$varname.'">'.$val.'</textarea>
				</div>		
			';
			break;
		case 21:
			return '
				<div class="col-md-9">
				<textarea class="form-control" style="height:100px;" id="'.$varname.'" name="'.$varname.'">'.$val.'</textarea><br>
				　说明[#user#]表示用户名
				</div>		
			';
			break;
		case 22:
			return '
				<div class="col-md-9">
				<textarea class="form-control" style="height:100px;" id="'.$varname.'" name="'.$varname.'">'.$val.'</textarea><br>
				　说明[#user#]表示用户名，[#订单号#]表示当前发货订单号，[#快递#]表示当前发货物流快递信息
				</div>		
			';
			break;

		case 23:
			return '
				<div class="col-md-9">
				<textarea class="form-control" style="height:80px;" id="'.$varname.'" name="'.$varname.'">'.$val.'</textarea><br>
				</div>		
			';
			break;
		    //
		case 7:
			return '
				<div class="col-md-6">
				  <input title="多个请用英文 | 隔开" type="text" class="form-control" id="'.$varname.'" name="'.$varname.'" value="'.$val.'">　多个请用英文 | 隔开
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
			return "<div class='col-md-6'><input name='".$varname."' value='".$val."' class='form-control' />　<a href='http://api.map.baidu.com/lbsapi/getpoint/index.html' target='_blank' class='red'>百度坐标</a></div>";
			break;	
		case 10:
			return "<div class='col-md-6'><input name='".$varname."' value='".$val."' class='form-control' />　百分比 默认10%</div>";
			break;	
		case 11:
			return "<div class='col-md-6'>
			<input id='".$varname."' name='".$varname."' value='".$val."' class='form-control b50' />
			<input class='btn btn-primary' type='button' onclick=\"oneup('".$varname."')\" value=\"上传\" />
			</div>";
			break;
		case 4:
			if ($val==1){$checked1=' checked="checked"';}
			if ($val==0){$checked2=' checked="checked"';}
		return "
			<td><input type='radio'$checked1 name='".$varname."' value='1' />打开
			<input type='radio'$checked2 name='".$varname."' value='0' />关闭</td>";
			break;
		}
	}
	
}