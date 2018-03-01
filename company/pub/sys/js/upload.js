document.writeln("<script src=\'/pub/sys/qmupload/simpleUpload.min.js\'></script>");
document.writeln("<script src=\'/pub/sys/qmupload/layer_mobile/layer.js\'></script>");
var urls="/pub/qm/php/uploadqm.php";
var urls2=urls;
function shows_(str){layer.open({content: str,skin: 'msg'});}
function show_(str){layer.open({content: str,skin: 'msg',time: 3 });}
function qmup(ty,obj,selects)
{
	switch (ty)
	{
		case 1:
		case '1':
			qmup1('file',obj,selects);
			break;
		case 2:
		case '2':
			qmup2('file',obj,selects);
			break;
		case 22:
		case '22':
			qmup22('file',obj,selects);
			break;
		case 3:
		case '3':
			qmup3('file',obj,selects);
			break;
		case 4:
		case '4':
			qmup4('file',obj,selects);
			break;
		case 5:
		case '5':
			qmup5('file',obj,selects);
			break;
		case 6:
		case '6':
			qmup6('file',obj,selects);
			break;
		case 24:
		case '24':
			qmup24('file',obj,selects);
			break;
	}
}
function qmup1(name,obj,selects)
{
	urls+='?name='+name;
	$(obj).find('input[type=file]').change(function(){
		$(this).simpleUpload(urls, {
			allowedExts: ["jpg", "jpeg", "jpe", "jif", "jfif", "jfi", "png", "gif"],
			allowedTypes: ["image/pjpeg", "image/jpeg", "image/png", "image/x-png", "image/gif", "image/x-gif"],
			maxFileSize: 50000000,
			start: function(file){
				shows_('图片上传中...');
			},
			progress: function(progress){
				progress=Math.ceil(progress);
				show_('上传'+progress + '%');
			},
			success: function(data){		
				console.log(data);
				if (data.success) {
					$(obj).find(selects).val(data.Result);
					show_('上传成功');
				} else {
					show_('上传失败：'+data.message);
				}
			},
			error: function(error){
				console.log(error);
				show_('上传失败：'+error.message);
			}
		});
	});
}
function qmup2(name,obj,selects)
{
	urls+='?name='+name;
	$(obj).find('input[type=file]').change(function(){
		$(this).simpleUpload(urls, {
			allowedExts: ["jpg", "jpeg", "jpe", "jif", "jfif", "jfi", "png", "gif"],
			allowedTypes: ["image/pjpeg","image/jpeg","image/png","image/x-png","image/gif", "image/x-gif"],
			maxFileSize: 50000000,
			start: function(file){shows_('图片上传中...');},
			progress: function(progress){progress=Math.ceil(progress);show_('上传'+progress + '%');},
			success: function(data){
				//console.log(data);
				if (data.success) {
					var fileurl = data.Result;
					var objx=$(obj).attr("toid");
					var nh=$('#'+objx).html();
					nh=nh+'<li><img src="'+fileurl+'" /><div><a href="#no" class="rt">删除</a></div></li>';
					$('#'+objx).html(nh);show_('上传成功');
				} else {show_('上传失败：'+data.message);}
			},error: function(error){show_('上传失败：'+error.message);}
		});
	});
}


function qmup22(name,obj,selects)
{
	urls+='?name='+name;
	$(obj).find('input[type=file]').change(function(){
		$(this).simpleUpload(urls, {
			allowedExts: ["jpg", "jpeg", "jpe", "jif", "jfif", "jfi", "png", "gif"],
			allowedTypes: ["image/pjpeg","image/jpeg","image/png","image/x-png","image/gif","image/x-gif"],
			maxFileSize: 50000000,
			start: function(file){shows_('图片上传中...');},
			progress: function(progress){
				progress=Math.ceil(progress);show_('上传'+progress + '%');
			},
			success: function(data){
				//console.log(data);
				if (data.success) {
					var fileurl = data.Result;
					var objx=$(obj).attr("toid");
					var nh=$('#'+objx).html();
					nh=nh+'<li><img src="'+fileurl+'" /><div><a href="#no" class="rt">删除</a></div><input type="hidden" name="'+selects+'[]" value="'+fileurl+'"></li>';
					$('#'+objx).html(nh);show_('上传成功');
				} else {show_('上传失败：'+data.message);}
			},
			error: function(error){show_('上传失败：'+error.message);}
		});
	});
}


function qmup3(name,obj,selects)
{
	urls+='?name='+name;
	$(obj).find('input[type=file]').change(function(){
		$(this).simpleUpload(urls, {
			allowedExts: ["jpg", "jpeg", "jpe", "jif", "jfif", "jfi", "png", "gif"],
			allowedTypes: ["image/pjpeg", "image/jpeg", "image/png", "image/x-png", "image/gif", "image/x-gif"],
			maxFileSize: 50000000,
			start: function(file){shows_('图片上传中...');},
			progress: function(progress){progress=Math.ceil(progress);show_('上传'+progress+'%');},
			success: function(data){
				console.log(data);
				if (data.success) {
					var fileurl = data.Result;
					var Rstr="<input type='hidden' name='"+selects+"' value='"+data.Result+"'>";
					Rstr="<p><input type='text' name='"+selects+"' value='"+data.Result+"'></p>";
					$(obj).append(Rstr);show_('上传成功');
				}else{show_('上传失败：'+data.message);}
			},error: function(error){show_('上传失败：'+error.message);}
		});
	});
}

function qmup4(name,obj,selects)
{
	urls2+='?s1=4';
	$(obj).find('input[type=file]').change(function(){
		$(this).simpleUpload(urls2, {
			allowedExts: ["mp4"],
			allowedTypes: ["video/mp4"],
			maxFileSize: 1024*1024*524,
			start: function(file){shows_('视频上传中...');},
			progress: function(progress){progress=Math.ceil(progress);show_('上传'+progress+ '%');},
			success: function(data){		
				console.log(data);
				if (data.success) {$(obj).find(selects).val(data.Result);show_('上传成功');
				} else {show_('上传失败'+data.message);}
			},error: function(error){console.log(error);show_('上传失败-'+error.message);
			}
		});
	});
}


function qmup24(name,obj,selects)
{
	urls2+='?s1=24';
	$(obj).find('input[type=file]').change(function(){
		$(this).simpleUpload(urls2, {
			allowedExts: ["mp3"],
			allowedTypes: ["audio/mp3"],
			maxFileSize: 1024*1024*524,
			start: function(file){shows_('音频上传中...');},
			progress: function(progress){progress=Math.ceil(progress);show_('上传'+progress+ '%');},
			success: function(data){		
				console.log(data);
				if (data.success) {$(obj).find(selects).val(data.Result);show_('上传成功');
				} else {show_('上传失败'+data.message);}
			},error: function(error){console.log(error);show_('上传失败-'+error.message);
			}
		});
	});
}

var auto;
function qmup5(name,obj,selects,theFunc)
{
	urls2+='?s1=5';
	maxsize=1024*1024*1024;/*1024M*/
	$(obj).find('input[type=file]').change(function(){
		$(this).simpleUpload(urls2, {
			allowedExts: ["gzip", "tar", "pdf", "docx", "7z", "rar", "zip", "doc", "xls", "psd",'ppt'],
			maxFileSize: maxsize,
			start: function(file){shows_('文件上传中...');},
			progress: function(progress){
                progress=Math.ceil(progress);
                auto=setTimeout(function(){shows_('上传'+progress + '%');},3000)
			},
			success: function(data){	
			clearInterval(auto);	
				console.log(data);
				if (data.success) {
					$(obj).find(selects).val(data.Result);show_('上传成功');
					if(typeof(theFunc)=="function"){theFunc();};
				} else {show_('上传失败'+data.message);}
			},
			error: function(error){
				clearInterval(auto);
				console.log(error);
				if (error.message=='文件格式错误'){show_('请上传压缩包文件！');}
				else{show_('上传失败!'+error.message);}
			}
		});
	});
}


function qmup6(name,obj,selects,theFunc)
{
	urls2+='?s1=6';
	var urls2='/pub/qm/php/uploadqm3.php?s1=6';
	maxsize=1024*1024*1024*1024;/*200M*/
	$(obj).find('input[type=file]').change(function(){
		$(this).simpleUpload(urls2, {
			allowedExts: ["mp4"],
			allowedTypes: ["video/mp4"],
			maxFileSize: maxsize,
			start: function(file){shows_('视频上传中...');},
			progress: function(progress){
                progress=Math.ceil(progress);
                auto=setTimeout(function(){shows_('上传'+progress + '%');},3000)
			},
			success: function(data){	
				console.log(data);
				if (data.success) {
					$(obj).find(selects).val(data.Result);									
					var objx=$(obj).attr("toid");
					var uid=$(obj).attr("uid");
					var nh=$('#'+objx).html();
					var fileurl = data.Result;
					var picurl = data.Result2;
					nh=nh+'<li><input name="'+name+'[]" type="hidden" value="'+fileurl+'"><input name="'+name+'_p[]" type="hidden" value="'+picurl+'"><input type="text" class="text" name="vtitle[]" placeholder="请输入标题..."><div><img src="'+picurl+'" alt=""></div><a onclick="delpic(this,\''+fileurl+'\');delpic(this,\''+picurl+'\')" href="#no">删除</a></li>';	
					$('#'+objx).html(nh);
					show_('上传成功');
					if(typeof(theFunc)=="function"){theFunc();};	
				} else {
					show_('上传失败-'+data.message);
				}
			},
			error: function(error){
				console.log(error);
				show_('上传失败.'+error.message);return false;
			}
		});
	});
}

function isWeiXin(){
    var ua = window.navigator.userAgent.toLowerCase();
    if(ua.match(/MicroMessenger/i) == 'micromessenger'){
        return true;
    }else{
        return false;
    }
}
if (isWeiXin())
{
	$('input[type=file]').attr("capture","camera");
}
$(document).ready(function(){

$(".fileupqm").each(function(){
	var ty=$(this).attr("ty");
	var obj=$(this).attr("obj");
	var selects=$(this).attr("selects");
	qmup(ty,obj,selects);
});

});