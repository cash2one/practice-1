
$(document).ready(function(){
	order();
});
$(window).load(function(){

});

function order()
{
	$(".q_order").each(function(index, element) {
		var obj=$(this);
		obj.click(function(){
			var nowv=$.cookie("clist"+index);
			if (nowv=="1"){nowv="0";}else{nowv="1";}
			$.cookie("clist"+index,nowv);
			//location.reload();
		})
	});
	
	$(".q_order2").each(function(index, element) {
		var obj=$(this);
		obj.click(function(){
			var v=$(this).attr("toid");
			$.cookie("prv",v);
			location.reload();
		})
	});
	$("#kbaidu").click(function(){
		var s1=$("#number1").val();
		var s2=$("#number2").val();
		var flag=gval2('flag');
		$.cookie("s1",s1);
		$.cookie("s2",s2);
		$.cookie("flag",flag);
		location.reload();
	});
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
