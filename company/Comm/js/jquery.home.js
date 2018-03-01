$(function(){
	$('#lanPos').css('top',$('.onsss').position().top);
		$('.sidenavul li').hover(function(){
			$('#lanPos').css('top',$(this).position().top);
			},function(){
				$('#lanPos').css('top',$('.onsss').position().top);
				})
		
		//$('.sidenavul li').click(function(){
		//		for(var i=0;i<$('.sidenavul li').size();i++){
		//				if(this==$('.sidenavul li').get(i)){
		//					$('.sidenavul li').eq(i).children('a').addClass('on');
		//					}else{
		//						$('.sidenavul li').eq(i).children('a').removeClass('on');
		//						}
		//			}
		//	})
		// offset() position()
		
	var newbox = document.getElementById("newbox_new");
    var newboxTop = 260;
    document.onscroll = function() {
        var docTop = document.body.scrollTop | document.documentElement.scrollTop;
        if (newboxTop < (docTop)) {
			var scrollHeight = $(document).height();
			var scrollTop = $(window).scrollTop();
			var $footerHeight = $('.footer').outerHeight(true);
			var $newboxHeight = $('#newbox_new').outerHeight(true);
			var $windowHeight = $(window).innerHeight();	
			if( $newboxHeight + 60 < scrollHeight - scrollTop - $footerHeight ){
				newbox.setAttribute("style", "position:fixed; top: 10px; z-index:200;");
			}else{
				var nowheight=$windowHeight + scrollTop + $footerHeight + 60 - scrollHeight
				newbox.setAttribute("style", "position:absolute; top: auto; z-index:200; bottom:30px;");
			}
        } else {
            newbox.setAttribute("style", "");
        }
    }
				
	})