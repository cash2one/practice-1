function changeAreaC(obj)
{
	var c = $(obj).val();
	var town = $(obj).parent().find('select').eq(1);
	var streat = $(obj).parent().find('select').eq(2);
	$.ajax({
		url:'/Plugin/Area/changeC',
		type: 'post',
		data:{'c':c},
		dataType:'json',
		success:function(data){
			town.html(data.ts);
		    streat.html(data.ss);
		}
	});
}
function changeAreaT(obj){
	var c = $(obj).parent().find('select').eq(0).val();
	var t = $(obj).val();
	var streat = $(obj).parent().find('select').eq(2);
	$.ajax({
		url:'/Plugin/Area/changeT',
		type: 'post',
		data:{'c':c,'t':t},
		dataType:'json',
		success:function(data){
			streat.html(data.ss);
		}
	});
}
