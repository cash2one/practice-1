//关于我们侧边UI
$(document).ready(
	function(){


		$("#pick-choose-title li").click(
			function(){
				$(this).addClass("active").siblings().removeClass("active");
				var n=$("#pick-choose-title li").index(this)+1;
				$("#pick-choose-content .form-horizontal").hide();
				$("#rent-form"+n).fadeIn();
			});
	}
	);