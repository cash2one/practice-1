$(document).ready(function(){
	$(".yzm").click(function(){
		var img=$(this).attr("toid");
		$('#'+img).attr('src','/qm/gcode/?'+Math.random()+'');
	});
});
$(window).load(function(){

});

dourl="/qmdo.php?m=dox&a=";
var objsms;
/*发送验证码*/
var zms=60;
var zmsm=zms;
$(".dosmsg").click(function(){
	var objs=$(this);
	objsms=objs;
	var tots=objs.attr("tots");
	var totel=objs.attr("yzid");
	var obj1=$("#"+tots);
	var obj2=$("#"+totel);
	var u=obj2.val();
	var ty=objs.attr("ty");
	var u2=u.substr(0,3)+"****"+u.substr(7);
	var objsms2=$("#ycode");
	var yzm=$("#ycode").val();
	if (u==""){obj2.focus();return false;}	
	if (check_tel(u)==false){obj1.html("手机号错误");obj2.focus();return false;}
	if (zms!=zmsm){return false;}
	if (yzm=='')
	{
		$("#ycode").focus();
		return false;
	}

	$.ajax({
		type:"POST",
		url:dourl+"sms2&tel="+u+"&ty="+ty+"&yzm="+yzm,
		data: "",
		success:function(msg){
			console.log(msg);
			switch (msg)
			{
				case "1":
				obj1.show().html("验证码已发送至："+u2+"");
				objs.val("发送成功");
				objs.addClass("btn-disable");
				if (zms==zmsm){zdsmsx(objs);}return false;
					break;	
				case "gg":
						layer.tips('验证码错误',objsms2, {
						  tips: [ty, '#41A53A'], time: 2000
						});
					obj1.show().html("<span style='color:#f00'>验证码错误！</span>");	
					break;
				case "bb":
						layer.tips('手机号不存在！',objsms, {
						  tips: [ty, '#41A53A'], time: 2000
						});
					obj1.show().html("<span style='color:#f00'>手机号不存在！</span>");	
					break;
				case "手机号已存在":	
				case "cc":
						layer.tips('该号码已注册！',objsms, {
						  tips: [ty, '#41A53A'], time: 2000
						});
					obj1.show().html("<span style='color:#f00'>该号码已注册！</span>");	
					break;
				default:
						layer.tips(msg,objsms, {
						  tips: [ty, '#41A53A'], time: 2000
						});
					obj1.show().html("<span style='color:#f00'>发送失败</span>");
					break;	
			}
		}
	});	
	return false;
});
function zdsmsx(obj)
{
	obj.val(zms+"秒后重新发送");
	if (zms==0){obj.removeClass("btn-disable");obj.val("重新获取");zms=zmsm;clearInterval(miaozd);}
	miaozd=setInterval("zsmsx()",1000);
}

function zsmsx()
{
	zms--;var obj2=objsms;
	obj2.val(zms+"秒后重新发送");
	if (zms==0){clearInterval(miaozd);obj2.removeClass("btn-disable");obj2.val("重新获取");zms=zmsm;}
}

function getScrollTop() { 
var scrollTop = 0; 
if (document.documentElement && document.documentElement.scrollTop) { 
scrollTop = document.documentElement.scrollTop; 
} 
else if (document.body) { 
scrollTop = document.body.scrollTop; 
} 
return scrollTop; 
}  
function getClientHeight() { 
var clientHeight = 0; 
if (document.body.clientHeight && document.documentElement.clientHeight) { 
clientHeight = Math.min(document.body.clientHeight, document.documentElement.clientHeight); 
} 
else { 
clientHeight = Math.max(document.body.clientHeight, document.documentElement.clientHeight); 
} 
return clientHeight; 
} 
 
function getScrollHeight() { 
return Math.max(document.body.scrollHeight, document.documentElement.scrollHeight); 
}

window.onscroll = function (){ 
var Theight=$(".ad1920x80").height()+160;
if (getScrollTop()>Theight)
{
	$(".ad1920x80").hide();
} 
} 
