$(function(){
	$(".topNavUl li:last").css({"background":"none"});
	/*
	$(".service_list li:even").css({"background":"#ffaa1b"});
	$(".service_list li:odd").css({"background":"#f38831","border-right":"none"});
	
	var li_height=($(".in_service .img").height()+2)/2
	$(".service_list li").css({"height":li_height})
	
	$(window).resize(function(){
		var li_height=($(".in_service .img").height()+2)/2
		$(".service_list li").css({"height":li_height})
	})
	*/
	$(".nav_top .more").click(function(){
		$(".pro_sidebar").toggle("slow")
	})
	
	
	$(".sidebar .li.on .sidebar_list").show(200);
	$(".sidebar .li dl").click(function(){
		$(this).siblings(".sidebar_list").show(200);
		$(this).parents(".li").addClass("on");
		$(this).parents(".li").siblings(".li").children(".sidebar_list").hide(200);
		$(this).parents(".li").siblings(".li").removeClass("on");
	})
	

})