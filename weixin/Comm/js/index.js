window.onload=wah;
$(window).resize(wah);
function wah(){
	
	$('.banner_box .hd').css('margin-left','-'+$('.banner_box .hd').width()/2+'px');
	$('.all_calendar_box .lower_box .date_box ul li').height($('.all_calendar_box .lower_box .date_box ul li').width());
	$('.whdb_box .map_box').height($(window).height()-123);
}



$(window).ready(function(){
	
	
	$('.whdb_box .map_box').height($(window).height()-123);
	
	$(".mrys_box .box1 .pull-left").slide({titCell:".hd ul",mainCell:".bd ul",autoPage:true,effect:"topLoop",delayTime:1000,interTime:5000,autoPlay:true,mouseOverStop:false});
	
	
	
	$('.foot_menu .btns').click(function(){
		if($('.foot_menu .btns').attr('class') != 'btns cur'){
			$('.foot_menu .btns').addClass('cur');
			$('.foot_nav').addClass('cur');
		}else{
			$('.foot_menu .btns').removeClass('cur');
			$('.foot_nav').removeClass('cur');
		}
	})
	
	$('.my_zl_box .top_box h5 span').click(function(){
		$('.my_zl_box .lower_box').hide().eq($('.my_zl_box .top_box h5 span').index(this)).fadeIn();
	})
	
	$('.my_zl_box .lower_box .btn.fr').click(function(){
		$('.my_zl_box .lower_box').hide();
	})
	
});



/*更新购物车js*/
function qcmd_(id,num)
{
	$.ajax({
		type:"POST",dataType:"json",url:"/user/updatecart",data:'id='+id+'&num='+num,
		success:function(msg){
			console.log(msg);
		}
	});
}
