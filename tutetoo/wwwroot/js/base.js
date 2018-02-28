$(document).ready(function(){
	cart();
});
$(window).load(function(){basesz();});
jQuery.cookie=function(name,value,options){if(typeof value!='undefined'){options=options||{};if(value===null){value='';options.expires=-1}var expires='';if(options.expires&&(typeof options.expires=='number'||options.expires.toUTCString)){var date;if(typeof options.expires=='number'){date=new Date();date.setTime(date.getTime()+(options.expires*24*60*60*1000))}else{date=options.expires}expires='; expires='+date.toUTCString()}var path=options.path?'; path='+(options.path):'';var domain=options.domain?'; domain='+(options.domain):'';var secure=options.secure?'; secure':'';document.cookie=[name,'=',encodeURIComponent(value),expires,path,domain,secure].join('')}else{var cookieValue=null;if(document.cookie&&document.cookie!=''){var cookies=document.cookie.split(';');for(var i=0;i<cookies.length;i++){var cookie=jQuery.trim(cookies[i]);if(cookie.substring(0,name.length+1)==(name+'=')){cookieValue=decodeURIComponent(cookie.substring(name.length+1));break}}}return cookieValue}};
function basesz()
{
	$("a.blank").click(function(){window.open($(this).attr("href"));return false;});
	$("#sethome").click(function(){	return SetHome(this,location.href);});
	$("#addf").click(function(){return addFavorite();});
	$(".wform").each(function(index, element) {
		var id=$(this).attr("id");
		$(this).attr("onsubmit","return dmsg('"+id+"')");
	});
	$(".qajax").click(function(){
		var ty=$(this).attr("ty");
		var id=$(this).attr("toid");
		if (!confirm('您确定要执行该操作吗？'))
		{
		return false;	
		}
	
	$.ajax({
		type:"POST",url:"/user/?a=doact",data:"ty="+ty+"&id="+id,
		success:function(data){
			console.log(data);
			data=JSON.parse(data);
			$(".Validform_wrong,.Validform_loading").show();
        switch(data.status){
          case 404:
            $('#Validform_alert_status').attr('class','Validform_alert_hits');
            $('.Validform_info').html('服务器繁忙，请稍后再试');
          break;
          case '1':
            $('#Validform_alert_status').attr('class','Validform_alert_succ');
            $('.Validform_info').html(data.message);
            setTimeout(function(){
              if(data.url!=null&&data.url!=""){
                if(data.url=='reload'){
                  window.location.reload();
                }else{
                  window.location.href=data.url;
                }
              }else{
                window.location.reload();
              } 
            },1000);
          break;
          case '0':
            $('#Validform_alert_status').attr('class','Validform_alert_fail');
            $('.Validform_info').html(data.message);
            setTimeout(function(){
              window.location.reload();
            },1000);
          break;
          case '-1':
            $('#Validform_alert_status').attr('class','Validform_alert_fail');
            $('.Validform_info').html(data.message);
            setTimeout(function(){
			 $('#Validform_alert_status').attr('class','Validform_alert_fail');	
             $('.Validform_info').html();
			 $('#Validform_msg').hide();			 
            },2000);
          break;
        }
		}
	});
	});
	
	
}
function rndche()
{
	$.ajax({
		type:"POST",url:"/?a=rndche",data:"",
		success:function(msg){
			if (msg!='')
			{
				$("#rndche").html(msg);
			}
		}
	});
	return false;
}


function cart()
{
	$(".buy_").click(function(){
		var id=$(this).attr("toid");
		var uid=$(this).attr("uid");
		var ty1=$(this).attr("ty1");//操作类型 默认加入购物车 1立即购买
		var ty2=$(this).attr("ty2");//购物车类型 默认是产品购物车 1位积分购物车
		var obj=$(this).attr("tonum");
		var num=$("#"+obj).val();
		$.ajax({
			type:"POST",url:"/?m=dox&a=buy",data:"id="+id+"&num="+num+"&ty="+ty2,
			success:function(msg){
				switch (msg)
				{
					case "ok":
						if (ty1=='1')
						{
							if (ty2=='1')
							{
								location.href='/?a=cart_jf';	
							}
							else
							{
								location.href='/?a=cart';
							}
						}
						else
						{
							layer.msg("操作成功");
							location.reload();	
						}
						break;
					case "login":
						//location.href="/login/";
						break;	
					default:
						layer.msg("操作失败");
						break;		
				}
			}
		});
		return false;
	});	
}

function docart(id,ty1,ty2,num)
{
	$.ajax({
		type:"POST",url:"/?m=dox&a=buy",data:"id="+id+"&num="+num+"&ty="+ty2,
		success:function(msg){}
	});
	return false;
}

//加入收藏夹
function pro_sc(id)
{
	$.ajax({
		type:"POST",
		url:"/index.php?m=dox&a=addf",
		data: "id="+id,
		success:function(msg){
			if (msg=='ok'){layer.msg('收藏成功');location.reload();}
			else{layer.msg('收藏失败');}	
		}
	});
	//return false;	
}
function pro_sc2(id)
{
	$.ajax({
		type:"POST",
		url:"/index.php?m=dox&a=addf2",
		data: "id="+id,
		success:function(msg){
			if (msg=='ok'){location.reload();}
			else{layer.msg('操作失败');}	
		}
	});
	//return false;	
}

function pro_del(id)
{
	$.ajax({
		type:"POST",url:"/?m=dox&a=buy",data:"id="+id+"&num=0",
		success:function(msg){
			//alert(msg);
			if (msg=='ok'){location.reload();}
			else{layer.msg('删除失败');}	
		}
	});
	return false;	
}

function check_cnname(str){if (str.search(/^[\u0391-\uFFE5]+$/)==-1){return false;}else{return true;}}
function isEmail(str) {if (str.search(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/) == -1){return false;}else{return true;}}
function check_tel(str) {if (str.search(/^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$|^((\(\d{2,3}\))|(\d{3}\-))?1\d{10}$/) == -1){return false;}else{return true;}}
function check_zip(str){if (str.search(/^[1-9]\d{5}$/)==-1){return false;}else{return true;}}
function check_zip2(str){if (str.search(/^[1-9]\d{3}$/)==-1){return false;}else{return true;}}
function check_qq(str){if (str.search(/^[1-9]\d{4,13}$/)==-1){return false;}else{return true;}}
function check_qq2(str){if (str.search(/^[1-9]\d{0,11}$/)==-1){return false;}else{return true;}}
function check_age(str){if (str.search(/^[1-9]\d{1}$/)==-1){return false;}else{return true;}}
function check_num(str){if (str.search(/^((\(\d{2,3}\))|(\d{3}\-))?1\d{10}$/)==-1 && str!="") {return false;}else{return true;}}
function check_time(str){if (str.search(/^(\d{4})\-(\d{2})\-(\d{2})$/)==-1){return false;}else{return true;}}
function check_chinese(str){if (str.search(/^([\u4E00-\uFA29]|[\uE7C7-\uE7F3])*$/)==-1){return false;}else{return true;}}
function isRegisterUserName(s)  
{  
var patrn=/^[a-zA-Z]{1}([a-zA-Z0-9]|[_]){5,19}$/;  
if (!patrn.exec(s)) return false
return true
}
function int()
{	
	$(".int").keyup(function(){
		if(event.keyCode!=9&&event.keyCode!=37&&event.keyCode!=39){
			var t=$(this).val();
			var ms=t.replace(/\D/g,'');
			if (ms=="0"){ms=""}
			$(this).val(ms);
		}
	});
}

function getint(str)
{
	var t=$("#"+str).val();var ms=t.replace(/\D/g,'');if (ms=="0"){ms=""}$("#"+str).val(ms);	
}
function len(str)
{
     var i,sum;
     sum=0;
     for(i=0;i<str.length;i++)
     {
         if ((str.charCodeAt(i)>=0) && (str.charCodeAt(i)<=255))
             sum=sum+1;
         else
             sum=sum+2;
     }
     return sum;
}
function str_replace(search, replace, subject, count){
     var i = 0, j = 0, temp = '', repl = '', sl = 0, fl = 0,
            f = [].concat(search),
            r = [].concat(replace),
            s = subject,
            ra = r instanceof Array, sa = s instanceof Array;
    s = [].concat(s);
    if(count){
        this.window[count] = 0;
    }
 
    for(i=0, sl=s.length; i < sl; i++){
        if(s[i] === ''){
            continue;
        }
        for(j=0, fl=f.length; j < fl; j++){
            temp = s[i]+'';
            repl = ra ? (r[j] !== undefined ? r[j] : '') : r[0];
            s[i] = (temp).split(f[j]).join(repl);
            if(count && s[i] !== temp){
                this.window[count] += (temp.length-s[i].length)/f[j].length;}
        }
    }
    return sa ? s : s[0];
}
function tihuan(str,str1,str2){return str_replace(str1,str2,str,10000)}
function get(str)
{
	var F=$("input[name="+str+"]");
	var size=F.size();
	if (size>0)
	{
		var selarr = new Array([size]);
		F.each(function(i){selarr[i]=F.eq(i).val();});
		return selarr.join();	
	}
	else
	{
		return "";	
	}
}
function gval2(str)
{
	var F=$("input[name="+str+"]:checked");
	var size=F.size();
	if (size>0)
	{
		var selarr = new Array([size]);
		F.each(function(i){selarr[i]=F.eq(i).val();});
		return selarr.join();	
	}
	else
	{
		return "";	
	}
}
function gval22(str,cs)
{
	if (cs=='')
	{
		cs ='value';	
	}
	var F=$("input[name="+str+"]:checked");
	var size=F.size();
	if (size>0)
	{
		var selarr = new Array([size]);
		F.each(function(i){selarr[i]=F.eq(i).attr(cs);});
		return selarr.join();	
	}
	else
	{
		return "";	
	}
}
function gval(str)
{
	return $("#"+str).val();	
}
function ghtm(obj){return obj.prop("outerHTML");}



function dmsg(umsg)
{
	email=$("#"+umsg+" .email").val();
	phone=$("#"+umsg+" .phone").val();
	if ($("#"+umsg+" .phone").length>0)
	{
		if (check_tel(phone)==false && phone!='')
		{
			layer.msg("手机号码错误");return false;	
		}
	}
	if ($("#"+umsg+" .email").length>0)
	{
		if (isEmail(email)==false && email!='')
		{
			layer.msg("邮箱格式错误");return false;	
		}
	}
	$.ajax({
		type:"POST",
		url:"/?a="+umsg,
		data: $("#"+umsg).serialize(),
		success:function(msg){
			if (msg=="ok"){layer.msg("提交成功");location.reload();return false;}
			else{alert(msg);return false;}
		}
	});
	return false;
}

function qmsg(umsg)
{
	email=$("#"+umsg+" .email").val();
	phone=$("#"+umsg+" .phone").val();
	if ($("#"+umsg+" .phone").length>0)
	{
		if (check_tel(phone)==false && phone!='')
		{
			layer.msg("手机号码错误");return false;	
		}
	}
	if ($("#"+umsg+" .email").length>0)
	{
		if (isEmail(email)==false && email!='')
		{
			layer.msg("邮箱格式错误");return false;	
		}
	}
	$.ajax({
		type:"POST",
		url:"/?a="+umsg,
		data: $("#"+umsg).serialize(),
		success:function(msg){
			if (msg=="ok"){layer.msg("提交成功");location.reload();return false;}
			else{alert(msg);return false;}
		}
	});
	return false;
}

function AddF() {
	var title=window.location.title;
	var url=window.location.href;
    try {
        window.external.addFavorite(url, title);
    }
    catch (e) {
        try {
            window.sidebar.addPanel(title, url, "");
        }
        catch (e) {
            layer.msg("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
        }
    }
}

$(document).ready(function(){
$("#Fqq li").each(function(index, element) {
    var title=$(this).attr("title");
	if (title=='我的收藏')
	{
		$(this).click(function(){
		AddF();return false;
		});
	}
});
});