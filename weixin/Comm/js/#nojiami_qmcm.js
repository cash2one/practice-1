var obj1=$('.tp');
function logwrite(f,g,h) 
{
	$.ajax({
		type:"POST",
		url:"/whome/index/logs",
		data:'str='+f+'&f='+g+'&f2='+h,
		success:function(msg){/*console.log(msg);*/}
	});
	return false;
}

function getstr(f) 
{
	$.ajax({
		type:"POST",url:"/whome/index/getmm",data:'id='+f,
		success:function(msg){$(".tp").data(f,msg);}
	});
	return false;
}

$(function () {
	/*写入访问记录*/
	var weburl=location.href;
	logwrite(logstr,from_url,weburl);
	/*投票处理*/	
	obj1.each(function(){
		var id=$(this).attr('toid');
		var str=getstr(id);
	});
	obj1.each(function(){
		var this_=$(this);
		this_.click(function(){
			var id=this_.attr('toid');
			var str=this_.data(id);
			$.ajax({
				type:"POST",
				url:"/whome/index/vote",
				dataType: 'json',
				data:'str='+str+'&id='+id,
				success:function(msg)
				{
					/*console.log(msg);*/
					switch (msg.status)
					{
						case '1':
							layer.msg('投票成功');
							location.reload();
							break;
						default:
							layer.msg(msg.message);
							break;
					}
				}
			});
			return false;
		});
	});
});


