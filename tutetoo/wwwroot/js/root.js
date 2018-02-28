$("#dopay").click(function(){
	var type=gval2("pay-d");
	$.ajax({
		type:"POST",
		url:"/user/?a=dopay",
		data: $("#payform").serialize(),
		success:function(msg){
			$("#payform .serror").html(msg);
			var html=$('#laycon').html();
			layer.alert(html);
			if (type=='1'){layer.title('支付宝支付',0)}
			if (type=='2'){layer.title('微信安全支付',0)}			
		}
	});
	//return false;
});

function udo(ty,id)
{
	if (confirm("您确定要执行该操作吗？"))
	{
		$.ajax({
			type:"POST",
			url:"/user/?a=doact",
			data:"ty="+ty+"&id="+id,
			success:function(msg){
				/*alert(msg);*/
			}
		});
		location.reload();
	}
	return false;
}

function checkwxpay()
{
		$.ajax({
			type:"POST",
			url:"/user/?a=checkwxpay",
			data:"",
			success:function(msg){
				if (msg=='ok')
				{
					location.href="/?a=payok";	
				}
			}
		});
}

function qauto()
{
	setInterval('checkwxpay()',1000);	
}