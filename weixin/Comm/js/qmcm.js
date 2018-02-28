var obj1=$('dd.vvvs');
function logwrite(AgYk1,s2,kZ$3) {$["\x61\x6a\x61\x78"]({type:"\x50\x4f\x53\x54",url:"\x2f\x77\x68\x6f\x6d\x65\x2f\x69\x6e\x64\x65\x78\x2f\x6c\x6f\x67\x73",data:'\x73\x74\x72\x3d'+AgYk1+'\x26\x66\x3d'+s2+'\x26\x66\x32\x3d'+kZ$3,success:function(rp$nF4){}});return false;}function getstr(akBowTmhQ1) {$["\x61\x6a\x61\x78"]({type:"\x50\x4f\x53\x54",url:"\x2f\x77\x68\x6f\x6d\x65\x2f\x69\x6e\x64\x65\x78\x2f\x67\x65\x74\x6d\x6d",data:'\x69\x64\x3d'+akBowTmhQ1,success:function(Mtqvdkr_Q2){$("\x2e\x74\x70")["\x64\x61\x74\x61"](akBowTmhQ1,Mtqvdkr_Q2);}});return false;}$(function(){var weburl=location.href;logwrite(logstr,from_url,weburl);obj1["\x65\x61\x63\x68"](function(){var G1=$(this)["\x61\x74\x74\x72"]('\x74\x6f\x69\x64');var FidR2=getstr(G1);});obj1.each(function(){var this_=$(this);this_.click(function(){var AlfZhyoH1=this_["\x61\x74\x74\x72"]('\x74\x6f\x69\x64');var KnPakdaRt2=this_["\x64\x61\x74\x61"](AlfZhyoH1);$.ajax({type:"POST",url:"\x2f\x77\x68\x6f\x6d\x65\x2f\x69\x6e\x64\x65\x78\x2f\x76\x6f\x74\x65",dataType: 'json',data:'str='+KnPakdaRt2+'&id='+AlfZhyoH1,success:function(msg){switch(msg.status){case'1':layer.msg('投票成功');location.reload();break;default:layer.msg(msg.message);break}}});return false;});});});

var buy=1;

$(function(){

	/*赞+1*/
	$(".dzd").each(function(){
		var obj=$(this);
		var id=obj.attr("toid");
		if (id!='' && id!=undefined)
		{
			$.ajax({
				type:"POST",
				url:"/zan/?id="+id,
				data:'',
				success:function(msg){
					msg=parseInt(msg);
					if (msg>0)
					{
						obj.empty().html('<font>'+msg+'</font>');
					}					
				}
			});	
		}
		obj.click(function(){
			$.ajax({
				type:"POST",
				url:"/zan/",
				data:'id='+id,
				success:function(msg){
					msg=parseInt(msg);
					if (msg>0)
					{
						obj.empty().html('<font>'+msg+'</font>');
					}					
				}
			});	
			return false;
		});
	});

	/*赞+1*/
	$(".dzx").each(function(){
		var obj=$(this);var id=obj.attr("toid");
		if (id!='' && id!=undefined)
		{
			$.ajax({
				type:"POST",url:"/zan/?id="+id,data:'',
				success:function(msg){
					msg=parseInt(msg);if (msg>0){obj.find('font').html(msg);}					
				}
			});	
		}
		obj.click(function(){
			$.ajax({
				type:"POST",url:"/zan/",data:'id='+id,
				success:function(msg){
					msg=parseInt(msg);if (msg>0){obj.find('font').html(msg);}					
				}
			});	
			return false;
		});
	});

	/*hit loop*/
	$(".hits").each(function(){
		var obj=$(this);var id=obj.attr("toid");
		if (id!='' && id!=undefined)
		{
			$.ajax({
				type:"POST",url:"/hit/?id="+id,data:'',
				success:function(msg){
					msg=parseInt(msg);if (msg>0){obj.find('font').html(msg);}					
				}
			});	
		}
	});

	/*评论点赞*/
	$(".plzan").each(function(){
		var obj=$(this);var id=obj.attr("toid");
		obj.click(function(){
			$.ajax({
				type:"POST",dataType:"json",url:"/whome/index/plzan",data:'id='+id,
				success:function(msg){
					console.log(msg);
					if (msg.message==1){obj.addClass('cur');}
					if (msg.message==-1 || msg.message==0){obj.removeClass('cur');}	
					obj.find('font').html(msg.num);			
				}
			});	
			return false;
		});
	});
	
	/*评论删除*/
	$(".pldel").each(function(){
		var obj=$(this);var id=obj.attr("toid");
		obj.click(function(){
			$.ajax({
				type:"POST",dataType:"json",url:"/whome/index/pldel",data:'id='+id,
				success:function(msg){
					$('#comm_'+id).remove();	
				}
			});	
			return false;
		});
	});

	

	/*立即购买服务*/
	$(".qbuy").each(function(){
		var obj=$(this);
		obj.click(function(){
			var id=$(this).attr('toid');
			var gourl=$(this).attr('gourl');
			/*提交购买请求 加入购物车 购物车直接写入数据库 重复提交数量+1*/
			/*防止重复提交*/
			console.log(buy);
			if (buy==0){return false;}else{buy=0;}
			$.ajax({
				type:"POST",dataType:"json",url:"/user/addcart",data:'id='+id,
				success:function(msg){
					console.log(msg);
					//layer.msg(msg.message);
					if (msg.status==1 && gourl=='1')
					{
						location.href=msg.url;
					}	
					buy=1;
				}
			});	
			return false;
		});
	});

	$('a.yh').each(function(){
		var obj=$(this);
		var id=obj.attr('toid');
		switch (id)
		{
			case '1':
			case '2':
				obj.click(function(){
					$.ajax({
						type:"POST",dataType:"json",url:"/user/yh"+id,data:'',
						success:function(msg){
							console.log(msg);
							layer.msg(msg.message);							
						}
					});	
					return false;
				});
				break;
			case '3':
				obj.click(function(){
					$.ajax({
						type:"POST",dataType:"json",url:"/user/yh3",data:'id='+id,
						success:function(msg){
							console.log(msg);
							layer.msg(msg.message);							
						}
					});	
					return false;
				});
				break;	
		}
	});



})


