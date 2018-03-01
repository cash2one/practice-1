function changeGeoP(obj)
{
	var p = $(obj).val();
	var city = $(obj).parent().find('select').eq(1);
	var town = $(obj).parent().find('select').eq(2);
	$.ajax({
		url:'/Plugin/Geo/changeP',
		type: 'post',
		data:{'p':p},
		dataType:'json',
		success:function(data){
			city.html(data.cs);
			town.html(data.ts);
		}
	});
}
function changeGeoC(obj){
	var p =  $(obj).parent().find('select').eq(0).val();
	var c = $(obj).val();
	var town = $(obj).parent().find('select').eq(2);
	$.ajax({
		url:'/Plugin/Geo/changeC',
		type: 'post',
		data:{'p':p,'c':c},
		dataType:'json',
		success:function(data){
			town.html(data.ts);
		}
	});
}
