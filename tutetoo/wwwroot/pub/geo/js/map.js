document.write('<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=A739765f9a84bee561d30fa0b537ccb9"></script>');

function ShowMap(objname,options){
	if(options){
		this._city = options.city ? options.city : ""; //³ÇÊÐ
		this._addr = options.addr ? options.addr : ""; //µØÖ·
		this._title = options.title ? options.title : ""; //ÐÅÏ¢´°¿Ú±êÌâ
		this._lawfirm = options.lawfirm ? options.lawfirm : ""; //ÂÉËù
		this._tel = options.tel ? options.tel : ""; //µç»°
		this._user = options.user ? options.user : ""; //Ö÷ÈÎ
		this._mapx = options.mapx ? options.mapx : ""; 
		this._pic = options.pic ? options.pic : ""; //Í¼Æ¬
		this._ismove = options.ismove ? options.ismove : "0"; //ÊÇ·ñÍÏ¶¯£¬1ÎªÍÏ¶¯ÎªÉèÖÃ±ê×¢£¬0ÎªÏÔÊ¾¡£Ä¬ÈÏ0
		this._piobj = options.piobj ? options.piobj : ""; //½ÓÊÕÍÏ¶¯×ø±êµÄ±íµ¥ID
		this._zoom = options.zoom ? options.zoom : "14"; //·Å´ó¼¶±ð£¬Ä¬ÈÏ14
	}
	var point=new BMap.Point(113.63156,34.83794);
	var zoom=this._zoom;

	var map = new BMap.Map(objname);
	map.enableScrollWheelZoom();
	map.centerAndZoom(point, zoom);

	var cr = new BMap.CopyrightControl({anchor: BMAP_ANCHOR_TOP_LEFT});
	map.addControl(cr); 
	var bs = map.getBounds(); 
	cr.addCopyright({id: 1, content: "<a href='http://www.quanmeicm.net' target='_blank' style='font-size:14px;color:#686868;'>powered by 全美传媒</a>", bounds: bs});
	var infotxt = "";
	if (this._mapx != ""){
		var mx=this._mapx.substr(0,this._mapx.indexOf(","));
		var my=this._mapx.substr(this._mapx.indexOf(",")+1);
		point=new BMap.Point(mx,my);
		map.centerAndZoom(point, zoom); 
	}
	else if (this._addr != ""){
		var myGeo = new BMap.Geocoder();    
		myGeo.getPoint(this._addr, function(poi){
			map.centerAndZoom(poi, zoom);
			marker.setPosition(poi); 
		}, this._city);
	}
	else if (this._city != ""){
		map.setCenter(this._city); 
		if (this._ismove=="0"){setTimeout(function(){map.clearOverlays();}, 1000);}
	}
	else{
		var myCity = new BMap.LocalCity();
		myCity.get(function(result){map.setCenter(result.name);});
		if (this._ismove=="0"){setTimeout(function(){map.clearOverlays();}, 1000);}
	}


	var marker = new BMap.Marker(point);
	map.addOverlay(marker); 
	

	if (this._ismove=="1"){
		marker.enableDragging();
		var label = new BMap.Label("拖动改变位置",{offset:new BMap.Size(20,-15)});
		label.setStyle({ display:"inline-block",border:"none", color:"#ff0000", fontSize : "12px" });
		marker.setLabel(label);

		var poj=this._piobj; 
	
		marker.addEventListener("dragend", function(e){
			try{document.getElementById(poj).value = e.point.lng + "," + e.point.lat;}catch (ex) {}
		});
		
		map.addEventListener("click", function(e){
			marker.setPosition(e.point);
			try{document.getElementById(poj).value = e.point.lng + "," + e.point.lat;}catch (ex) {}
		});
	}

	if (this._ismove=="0"){
		
		var opts = {width:250,height:110,title : "<font color=green size=3>" + this._title + "</font>"} 
		if (this._pic != ""){infotxt += "<img src='"+this._pic+"' id='picid' style='float:left;margin-right:5px;padding-top:8px;' width=50>";}
		infotxt += "</td><td><p style='font-size:12px;line-height:16px;padding-top:8px;'>";
		if (this._lawfirm !=""){infotxt += "<b>hh</b>" + this._lawfirm + "<br/>";};
		if (this._addr !=""){infotxt += "<b>ii</b>" + this._addr + "<br/>";};
		if (this._tel !=""){infotxt += "<b>hh</b>" + this._tel + "<br/>";};
		if (this._user !=""){infotxt += "<b>gg</b>" + this._user + "<br/>";};
		infotxt += "</p></td></tr></table>";
		
		var label2 = new BMap.Label(this._title,{offset:new BMap.Size(20,-15)});
		label2.setStyle({ backgroundColor:"red", color:"white", fontSize : "12px" });
		marker.setLabel(label2);

		var infoWindow = new BMap.InfoWindow(infotxt,opts);
		marker.addEventListener("mouseover", function(){
			this.openInfoWindow(infoWindow);
			document.getElementById('picid').onload = function (){infoWindow.redraw();}
		});
	}
}
function getBDAddress(callBackFun,spStr){
	if (!spStr){spStr="";} 
	var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			var point = new BMap.Point(r.point.lng,r.point.lat);
			var gc = new BMap.Geocoder();    
			gc.getLocation(point, function(rs){
				var addComp = rs.addressComponents;
				var addVal = addComp.province + spStr + addComp.city + spStr + addComp.district + spStr + addComp.street + spStr + addComp.streetNumber;
				callBackFun(addVal);
			});
		}
	},{enableHighAccuracy: true})
}