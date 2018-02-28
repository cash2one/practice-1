(function () {
	
    function fixViewport(type, designWidth) {
        var metaEl = $("#viewport");
        //由于初始设置了viewport的width=device-width,所以此处docEl.clientWidth即是屏幕的设备宽度
        var clientWidth = $(window).width();
        var width, scale;

        switch (type) {
            case 'fixed':
                width = designWidth;
                scale = clientWidth / designWidth;
                break;
            case 'rem':
                var dpr = window.devicePixelRatio || 1;
                width = clientWidth * dpr;
                scale = 1 / dpr;
                document.documentElement.style.fontSize = (clientWidth/10) + "px";
                break;
        }
        
       
       
       
    }

    fixViewport('rem', 640);

}());

//$(window).load(function(){
	//var w=$("#body").width();
	//var w1 = w/10;
	//$("html").css("fontSize",w1);
//});

