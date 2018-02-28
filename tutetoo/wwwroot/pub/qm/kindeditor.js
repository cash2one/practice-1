/*******************************************************************************
* KindEditor - WYSIWYG HTML Editor for Internet
* Copyright (C) 2006-2013 kindsoft.net
*
* @author Roddy <luolonghao@gmail.com>
* @website http://www.kindsoft.net/
* @licence http://www.kindsoft.net/license.php
* @version 4.1.10 (2013-11-23)
*******************************************************************************/
(function (window, undefined) {
	if (window.KindEditor) {
		return;
	}
if (!window.console) {
	window.console = {};
}
if (!console.log) {
	console.log = function () {};
}
var _VERSION = '4.1.10 (2013-11-23)',
	_ua = navigator.userAgent.toLowerCase(),
	_IE = _ua.indexOf('msie') > -1 && _ua.indexOf('opera') == -1,
	_NEWIE = _ua.indexOf('msie') == -1 && _ua.indexOf('trident') > -1,
	_GECKO = _ua.indexOf('gecko') > -1 && _ua.indexOf('khtml') == -1,
	_WEBKIT = _ua.indexOf('applewebkit') > -1,
	_OPERA = _ua.indexOf('opera') > -1,
	_MOBILE = _ua.indexOf('mobile') > -1,
	_IOS = /ipad|iphone|ipod/.test(_ua),
	_QUIRKS = document.compatMode != 'CSS1Compat',
	_IERANGE = !window.getSelection,
	_matches = /(?:msie|firefox|webkit|opera)[\/:\s](\d+)/.exec(_ua),
	_V = _matches ? _matches[1] : '0',
	_TIME = new Date().getTime();
function _isArray(val) {
	if (!val) {
		return false;
	}
	return Object.prototype.toString.call(val) === '[object Array]';
}
function _isFunction(val) {
	if (!val) {
		return false;
	}
	return Object.prototype.toString.call(val) === '[object Function]';
}
function _inArray(val, arr) {
	for (var i = 0, len = arr.length; i < len; i++) {
		if (val === arr[i]) {
			return i;
		}
	}
	return -1;
}
function _each(obj, fn) {
	if (_isArray(obj)) {
		for (var i = 0, len = obj.length; i < len; i++) {
			if (fn.call(obj[i], i, obj[i]) === false) {
				break;
			}
		}
	} else {
		for (var key in obj) {
			if (obj.hasOwnProperty(key)) {
				if (fn.call(obj[key], key, obj[key]) === false) {
					break;
				}
			}
		}
	}
}
function _trim(str) {
	return str.replace(/(?:^[ \t\n\r]+)|(?:[ \t\n\r]+$)/g, '');
}
function _inString(val, str, delimiter) {
	delimiter = delimiter === undefined ? ',' : delimiter;
	return (delimiter + str + delimiter).indexOf(delimiter + val + delimiter) >= 0;
}
function _addUnit(val, unit) {
	unit = unit || 'px';
	return val && /^\d+$/.test(val) ? val + unit : val;
}
function _removeUnit(val) {
	var match;
	return val && (match = /(\d+)/.exec(val)) ? parseInt(match[1], 10) : 0;
}
function _escape(val) {
	return val.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
}
function _unescape(val) {
	return val.replace(/&lt;/g, '<').replace(/&gt;/g, '>').replace(/&quot;/g, '"').replace(/&amp;/g, '&');
}
function _toCamel(str) {
	var arr = str.split('-');
	str = '';
	_each(arr, function(key, val) {
		str += (key > 0) ? val.charAt(0).toUpperCase() + val.substr(1) : val;
	});
	return str;
}
function _toHex(val) {
	function hex(d) {
		var s = parseInt(d, 10).toString(16).toUpperCase();
		return s.length > 1 ? s : '0' + s;
	}
	return val.replace(/rgb\s*\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)/ig,
		function($0, $1, $2, $3) {
			return '#' + hex($1) + hex($2) + hex($3);
		}
	);
}
function _toMap(val, delimiter) {
	delimiter = delimiter === undefined ? ',' : delimiter;
	var map = {}, arr = _isArray(val) ? val : val.split(delimiter), match;
	_each(arr, function(key, val) {
		if ((match = /^(\d+)\.\.(\d+)$/.exec(val))) {
			for (var i = parseInt(match[1], 10); i <= parseInt(match[2], 10); i++) {
				map[i.toString()] = true;
			}
		} else {
			map[val] = true;
		}
	});
	return map;
}
function _toArray(obj, offset) {
	return Array.prototype.slice.call(obj, offset || 0);
}
function _undef(val, defaultVal) {
	return val === undefined ? defaultVal : val;
}
function _invalidUrl(url) {
	return !url || /[<>"]/.test(url);
}
function _addParam(url, param) {
	return url.indexOf('?') >= 0 ? url + '&' + param : url + '?' + param;
}
function _extend(child, parent, proto) {
	if (!proto) {
		proto = parent;
		parent = null;
	}
	var childProto;
	if (parent) {
		var fn = function () {};
		fn.prototype = parent.prototype;
		childProto = new fn();
		_each(proto, function(key, val) {
			childProto[key] = val;
		});
	} else {
		childProto = proto;
	}
	childProto.constructor = child;
	child.prototype = childProto;
	child.parent = parent ? parent.prototype : null;
}
function _json(text) {
	var match;
	if ((match = /\{[\s\S]*\}|\[[\s\S]*\]/.exec(text))) {
		text = match[0];
	}
	var cx = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g;
	cx.lastIndex = 0;
	if (cx.test(text)) {
		text = text.replace(cx, function (a) {
			return '\\u' + ('0000' + a.charCodeAt(0).toString(16)).slice(-4);
		});
	}
	if (/^[\],:{}\s]*$/.
	test(text.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, '@').
	replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']').
	replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {
		return eval('(' + text + ')');
	}
	throw 'JSON parse error';
}
var _round = Math.round;
var K = {
	DEBUG : false,
	VERSION : _VERSION,
	IE : _IE,
	GECKO : _GECKO,
	WEBKIT : _WEBKIT,
	OPERA : _OPERA,
	V : _V,
	TIME : _TIME,
	each : _each,
	isArray : _isArray,
	isFunction : _isFunction,
	inArray : _inArray,
	inString : _inString,
	trim : _trim,
	addUnit : _addUnit,
	removeUnit : _removeUnit,
	escape : _escape,
	unescape : _unescape,
	toCamel : _toCamel,
	toHex : _toHex,
	toMap : _toMap,
	toArray : _toArray,
	undef : _undef,
	invalidUrl : _invalidUrl,
	addParam : _addParam,
	extend : _extend,
	json : _json
};
var _INLINE_TAG_MAP = _toMap('a,abbr,acronym,b,basefont,bdo,big,br,button,cite,code,del,dfn,em,font,i,img,input,ins,kbd,label,map,q,s,samp,select,small,span,strike,strong,sub,sup,textarea,tt,u,var'),
	_BLOCK_TAG_MAP = _toMap('address,applet,blockquote,body,center,dd,dir,div,dl,dt,fieldset,form,frameset,h1,h2,h3,h4,h5,h6,head,hr,html,iframe,ins,isindex,li,map,menu,meta,noframes,noscript,object,ol,p,pre,script,style,table,tbody,td,tfoot,th,thead,title,tr,ul'),
	_SINGLE_TAG_MAP = _toMap('area,base,basefont,br,col,frame,hr,img,input,isindex,link,meta,param,embed'),
	_STYLE_TAG_MAP = _toMap('b,basefont,big,del,em,font,i,s,small,span,strike,strong,sub,sup,u'),
	_CONTROL_TAG_MAP = _toMap('img,table,input,textarea,button'),
	_PRE_TAG_MAP = _toMap('pre,style,script'),
	_NOSPLIT_TAG_MAP = _toMap('html,head,body,td,tr,table,ol,ul,li'),
	_AUTOCLOSE_TAG_MAP = _toMap('colgroup,dd,dt,li,options,p,td,tfoot,th,thead,tr'),
	_FILL_ATTR_MAP = _toMap('checked,compact,declare,defer,disabled,ismap,multiple,nohref,noresize,noshade,nowrap,readonly,selected'),
	_VALUE_TAG_MAP = _toMap('input,button,textarea,select');
function _getBasePath() {
	var els = document.getElementsByTagName('script'), src;
	for (var i = 0, len = els.length; i < len; i++) {
		src = els[i].src || '';
		if (/kindeditor[\w\-\.]*\.js/.test(src)) {
			return src.substring(0, src.lastIndexOf('/') + 1);
		}
	}
	return '';
}
K.basePath = _getBasePath();
K.options = {
	designMode : true,
	fullscreenMode : false,
	filterMode : true,
	wellFormatMode : true,
	shadowMode : true,
	loadStyleMode : true,
	basePath : K.basePath,
	themesPath : K.basePath + 'themes/',
	langPath : K.basePath + 'lang/',
	pluginsPath : K.basePath + 'plugins/',
	themeType : 'default',
	langType : 'zh_CN',
	urlType : '',
	newlineTag : 'p',
	resizeType : 2,
	syncType : 'form',
	pasteType : 2,
	dialogAlignType : 'page',
	useContextmenu : true,
	fullscreenShortcut : false,
	bodyClass : 'ke-content',
	indentChar : '\t',
	cssPath : '',
	cssData : '',
	minWidth : 650,
	minHeight : 100,
	minChangeSize : 50,
	zIndex : 811213,
	items : [
		'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste',
		'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
		'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
		'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
		'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
		'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',
		'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
		'anchor', 'link', 'unlink', '|', 'about'
	],
	noDisableItems : ['source', 'fullscreen'],
	colorTable : [
		['#E53333', '#E56600', '#FF9900', '#64451D', '#DFC5A4', '#FFE500'],
		['#009900', '#006600', '#99BB00', '#B8D100', '#60D978', '#00D5FF'],
		['#337FE5', '#003399', '#4C33E5', '#9933E5', '#CC33E5', '#EE33EE'],
		['#FFFFFF', '#CCCCCC', '#999999', '#666666', '#333333', '#000000']
	],
	fontSizeTable : ['9px', '10px', '12px', '14px', '16px', '18px', '24px', '32px'],
	htmlTags : {
		font : ['id', 'class', 'color', 'size', 'face', '.background-color'],
		span : [
			'id', 'class', '.color', '.background-color', '.font-size', '.font-family', '.background',
			'.font-weight', '.font-style', '.text-decoration', '.vertical-align', '.line-height'
		],
		div : [
			'id', 'class', 'align', '.border', '.margin', '.padding', '.text-align', '.color',
			'.background-color', '.font-size', '.font-family', '.font-weight', '.background',
			'.font-style', '.text-decoration', '.vertical-align', '.margin-left'
		],
		table: [
			'id', 'class', 'border', 'cellspacing', 'cellpadding', 'width', 'height', 'align', 'bordercolor',
			'.padding', '.margin', '.border', 'bgcolor', '.text-align', '.color', '.background-color',
			'.font-size', '.font-family', '.font-weight', '.font-style', '.text-decoration', '.background',
			'.width', '.height', '.border-collapse'
		],
		'td,th': [
			'id', 'class', 'align', 'valign', 'width', 'height', 'colspan', 'rowspan', 'bgcolor',
			'.text-align', '.color', '.background-color', '.font-size', '.font-family', '.font-weight',
			'.font-style', '.text-decoration', '.vertical-align', '.background', '.border'
		],
		a : ['id', 'class', 'href', 'target', 'name'],
		embed : ['id', 'class', 'src', 'width', 'height', 'type', 'loop', 'autostart', 'quality', '.width', '.height', 'align', 'allowscriptaccess'],
		img : ['id', 'class', 'src', 'width', 'height', 'border', 'alt', 'title', 'align', '.width', '.height', '.border'],
		'p,ol,ul,li,blockquote,h1,h2,h3,h4,h5,h6' : [
			'id', 'class', 'align', '.text-align', '.color', '.background-color', '.font-size', '.font-family', '.background',
			'.font-weight', '.font-style', '.text-decoration', '.vertical-align', '.text-indent', '.margin-left'
		],
		pre : ['id', 'class'],
		hr : ['id', 'class', '.page-break-after'],
		'br,tbody,tr,strong,b,sub,sup,em,i,u,strike,s,del' : ['id', 'class'],
		iframe : ['id', 'class', 'src', 'frameborder', 'width', 'height', '.width', '.height']
	},
	layout : '<div class="container"><div class="toolbar"></div><div class="edit"></div><div class="statusbar"></div></div>'
};
var _useCapture = false;
var _INPUT_KEY_MAP = _toMap('8,9,13,32,46,48..57,59,61,65..90,106,109..111,188,190..192,219..222');
var _CURSORMOVE_KEY_MAP = _toMap('33..40');
var _CHANGE_KEY_MAP = {};
_each(_INPUT_KEY_MAP, function(key, val) {
	_CHANGE_KEY_MAP[key] = val;
});
_each(_CURSORMOVE_KEY_MAP, function(key, val) {
	_CHANGE_KEY_MAP[key] = val;
});
function _bindEvent(el, type, fn) {
	if (el.addEventListener){
		el.addEventListener(type, fn, _useCapture);
	} else if (el.attachEvent){
		el.attachEvent('on' + type, fn);
	}
}
function _unbindEvent(el, type, fn) {
	if (el.removeEventListener){
		el.removeEventListener(type, fn, _useCapture);
	} else if (el.detachEvent){
		el.detachEvent('on' + type, fn);
	}
}
var _EVENT_PROPS = ('altKey,attrChange,attrName,bubbles,button,cancelable,charCode,clientX,clientY,ctrlKey,currentTarget,' +
	'data,detail,eventPhase,fromElement,handler,keyCode,metaKey,newValue,offsetX,offsetY,originalTarget,pageX,' +
	'pageY,prevValue,relatedNode,relatedTarget,screenX,screenY,shiftKey,srcElement,target,toElement,view,wheelDelta,which').split(',');
function KEvent(el, event) {
	this.init(el, event);
}
_extend(KEvent, {
	init : function(el, event) {
		var self = this, doc = el.ownerDocument || el.document || el;
		self.event = event;
		_each(_EVENT_PROPS, function(key, val) {
			self[val] = event[val];
		});
		if (!self.target) {
			self.target = self.srcElement || doc;
		}
		if (self.target.nodeType === 3) {
			self.target = self.target.parentNode;
		}
		if (!self.relatedTarget && self.fromElement) {
			self.relatedTarget = self.fromElement === self.target ? self.toElement : self.fromElement;
		}
		if (self.pageX == null && self.clientX != null) {
			var d = doc.documentElement, body = doc.body;
			self.pageX = self.clientX + (d && d.scrollLeft || body && body.scrollLeft || 0) - (d && d.clientLeft || body && body.clientLeft || 0);
			self.pageY = self.clientY + (d && d.scrollTop  || body && body.scrollTop  || 0) - (d && d.clientTop  || body && body.clientTop  || 0);
		}
		if (!self.which && ((self.charCode || self.charCode === 0) ? self.charCode : self.keyCode)) {
			self.which = self.charCode || self.keyCode;
		}
		if (!self.metaKey && self.ctrlKey) {
			self.metaKey = self.ctrlKey;
		}
		if (!self.which && self.button !== undefined) {
			self.which = (self.button & 1 ? 1 : (self.button & 2 ? 3 : (self.button & 4 ? 2 : 0)));
		}
		switch (self.which) {
		case 186 :
			self.which = 59;
			break;
		case 187 :
		case 107 :
		case 43 :
			self.which = 61;
			break;
		case 189 :
		case 45 :
			self.which = 109;
			break;
		case 42 :
			self.which = 106;
			break;
		case 47 :
			self.which = 111;
			break;
		case 78 :
			self.which = 110;
			break;
		}
		if (self.which >= 96 && self.which <= 105) {
			self.which -= 48;
		}
	},
	preventDefault : function() {
		var ev = this.event;
		if (ev.preventDefault) {
			ev.preventDefault();
		} else {
			ev.returnValue = false;
		}
	},
	stopPropagation : function() {
		var ev = this.event;
		if (ev.stopPropagation) {
			ev.stopPropagation();
		} else {
			ev.cancelBubble = true;
		}
	},
	stop : function() {
		this.preventDefault();
		this.stopPropagation();
	}
});
var _eventExpendo = 'kindeditor_' + _TIME, _eventId = 0, _eventData = {};
function _getId(el) {
	return el[_eventExpendo] || null;
}
function _setId(el) {
	el[_eventExpendo] = ++_eventId;
	return _eventId;
}
function _removeId(el) {
	try {
		delete el[_eventExpendo];
	} catch(e) {
		if (el.removeAttribute) {
			el.removeAttribute(_eventExpendo);
		}
	}
}
function _bind(el, type, fn) {
	if (type.indexOf(',') >= 0) {
		_each(type.split(','), function() {
			_bind(el, this, fn);
		});
		return;
	}
	var id = _getId(el);
	if (!id) {
		id = _setId(el);
	}
	if (_eventData[id] === undefined) {
		_eventData[id] = {};
	}
	var events = _eventData[id][type];
	if (events && events.length > 0) {
		_unbindEvent(el, type, events[0]);
	} else {
		_eventData[id][type] = [];
		_eventData[id].el = el;
	}
	events = _eventData[id][type];
	if (events.length === 0) {
		events[0] = function(e) {
			var kevent = e ? new KEvent(el, e) : undefined;
			_each(events, function(i, event) {
				if (i > 0 && event) {
					event.call(el, kevent);
				}
			});
		};
	}
	if (_inArray(fn, events) < 0) {
		events.push(fn);
	}
	_bindEvent(el, type, events[0]);
}
function _unbind(el, type, fn) {
	if (type && type.indexOf(',') >= 0) {
		_each(type.split(','), function() {
			_unbind(el, this, fn);
		});
		return;
	}
	var id = _getId(el);
	if (!id) {
		return;
	}
	if (type === undefined) {
		if (id in _eventData) {
			_each(_eventData[id], function(key, events) {
				if (key != 'el' && events.length > 0) {
					_unbindEvent(el, key, events[0]);
				}
			});
			delete _eventData[id];
			_removeId(el);
		}
		return;
	}
	if (!_eventData[id]) {
		return;
	}
	var events = _eventData[id][type];
	if (events && events.length > 0) {
		if (fn === undefined) {
			_unbindEvent(el, type, events[0]);
			delete _eventData[id][type];
		} else {
			_each(events, function(i, event) {
				if (i > 0 && event === fn) {
					events.splice(i, 1);
				}
			});
			if (events.length == 1) {
				_unbindEvent(el, type, events[0]);
				delete _eventData[id][type];
			}
		}
		var count = 0;
		_each(_eventData[id], function() {
			count++;
		});
		if (count < 2) {
			delete _eventData[id];
			_removeId(el);
		}
	}
}
function _fire(el, type) {
	if (type.indexOf(',') >= 0) {
		_each(type.split(','), function() {
			_fire(el, this);
		});
		return;
	}
	var id = _getId(el);
	if (!id) {
		return;
	}
	var events = _eventData[id][type];
	if (_eventData[id] && events && events.length > 0) {
		events[0]();
	}
}
function _ctrl(el, key, fn) {
	var self = this;
	key = /^\d{2,}$/.test(key) ? key : key.toUpperCase().charCodeAt(0);
	_bind(el, 'keydown', function(e) {
		if (e.ctrlKey && e.which == key && !e.shiftKey && !e.altKey) {
			fn.call(el);
			e.stop();
		}
	});
}
var _readyFinished = false;
function _ready(fn) {
	if (_readyFinished) {
		fn(KindEditor);
		return;
	}
	var loaded = false;
	function readyFunc() {
		if (!loaded) {
			loaded = true;
			fn(KindEditor);
			_readyFinished = true;
		}
	}
	function ieReadyFunc() {
		if (!loaded) {
			try {
				document.documentElement.doScroll('left');
			} catch(e) {
				setTimeout(ieReadyFunc, 100);
				return;
			}
			readyFunc();
		}
	}
	function ieReadyStateFunc() {
		if (document.readyState === 'complete') {
			readyFunc();
		}
	}
	if (document.addEventListener) {
		_bind(document, 'DOMContentLoaded', readyFunc);
	} else if (document.attachEvent) {
		_bind(document, 'readystatechange', ieReadyStateFunc);
		var toplevel = false;
		try {
			toplevel = window.frameElement == null;
		} catch(e) {}
		if (document.documentElement.doScroll && toplevel) {
			ieReadyFunc();
		}
	}
	_bind(window, 'load', readyFunc);
}
if (_IE) {
	window.attachEvent('onunload', function() {
		_each(_eventData, function(key, events) {
			if (events.el) {
				_unbind(events.el);
			}
		});
	});
}
K.ctrl = _ctrl;
K.ready = _ready;
function _getCssList(css) {
	var list = {},
		reg = /\s*([\w\-]+)\s*:([^;]*)(;|$)/g,
		match;
	while ((match = reg.exec(css))) {
		var key = _trim(match[1].toLowerCase()),
			val = _trim(_toHex(match[2]));
		list[key] = val;
	}
	return list;
}
function _getAttrList(tag) {
	var list = {},
		reg = /\s+(?:([\w\-:]+)|(?:([\w\-:]+)=([^\s"'<>]+))|(?:([\w\-:"]+)="([^"]*)")|(?:([\w\-:"]+)='([^']*)'))(?=(?:\s|\/|>)+)/g,
		match;
	while ((match = reg.exec(tag))) {
		var key = (match[1] || match[2] || match[4] || match[6]).toLowerCase(),
			val = (match[2] ? match[3] : (match[4] ? match[5] : match[7])) || '';
		list[key] = val;
	}
	return list;
}
function _addClassToTag(tag, className) {
	if (/\s+class\s*=/.test(tag)) {
		tag = tag.replace(/(\s+class=["']?)([^"']*)(["']?[\s>])/, function($0, $1, $2, $3) {
			if ((' ' + $2 + ' ').indexOf(' ' + className + ' ') < 0) {
				return $2 === '' ? $1 + className + $3 : $1 + $2 + ' ' + className + $3;
			} else {
				return $0;
			}
		});
	} else {
		tag = tag.substr(0, tag.length - 1) + ' class="' + className + '">';
	}
	return tag;
}
function _formatCss(css) {
	var str = '';
	_each(_getCssList(css), function(key, val) {
		str += key + ':' + val + ';';
	});
	return str;
}
function _formatUrl(url, mode, host, pathname) {
	mode = _undef(mode, '').toLowerCase();
	if (url.substr(0, 5) != 'data:') {
		url = url.replace(/([^:])\/\//g, '$1/');
	}
	if (_inArray(mode, ['absolute', 'relative', 'domain']) < 0) {
		return url;
	}
	host = host || location.protocol + '//' + location.host;
	if (pathname === undefined) {
		var m = location.pathname.match(/^(\/.*)\//);
		pathname = m ? m[1] : '';
	}
	var match;
	if ((match = /^(\w+:\/\/[^\/]*)/.exec(url))) {
		if (match[1] !== host) {
			return url;
		}
	} else if (/^\w+:/.test(url)) {
		return url;
	}
	function getRealPath(path) {
		var parts = path.split('/'), paths = [];
		for (var i = 0, len = parts.length; i < len; i++) {
			var part = parts[i];
			if (part == '..') {
				if (paths.length > 0) {
					paths.pop();
				}
			} else if (part !== '' && part != '.') {
				paths.push(part);
			}
		}
		return '/' + paths.join('/');
	}
	if (/^\//.test(url)) {
		url = host + getRealPath(url.substr(1));
	} else if (!/^\w+:\/\//.test(url)) {
		url = host + getRealPath(pathname + '/' + url);
	}
	function getRelativePath(path, depth) {
		if (url.substr(0, path.length) === path) {
			var arr = [];
			for (var i = 0; i < depth; i++) {
				arr.push('..');
			}
			var prefix = '.';
			if (arr.length > 0) {
				prefix += '/' + arr.join('/');
			}
			if (pathname == '/') {
				prefix += '/';
			}
			return prefix + url.substr(path.length);
		} else {
			if ((match = /^(.*)\//.exec(path))) {
				return getRelativePath(match[1], ++depth);
			}
		}
	}
	if (mode === 'relative') {
		url = getRelativePath(host + pathname, 0).substr(2);
	} else if (mode === 'absolute') {
		if (url.substr(0, host.length) === host) {
			url = url.substr(host.length);
		}
	}
	return url;
}
function _formatHtml(html, htmlTags, urlType, wellFormatted, indentChar) {
	if (html == null) {
		html = '';
	}
	urlType = urlType || '';
	wellFormatted = _undef(wellFormatted, false);
	indentChar = _undef(indentChar, '\t');
	var fontSizeList = 'xx-small,x-small,small,medium,large,x-large,xx-large'.split(',');
	html = html.replace(/(<(?:pre|pre\s[^>]*)>)([\s\S]*?)(<\/pre>)/ig, function($0, $1, $2, $3) {
		return $1 + $2.replace(/<(?:br|br\s[^>]*)>/ig, '\n') + $3;
	});
	html = html.replace(/<(?:br|br\s[^>]*)\s*\/?>\s*<\/p>/ig, '</p>');
	html = html.replace(/(<(?:p|p\s[^>]*)>)\s*(<\/p>)/ig, '$1<br />$2');
	html = html.replace(/\u200B/g, '');
	html = html.replace(/\u00A9/g, '&copy;');
	html = html.replace(/\u00AE/g, '&reg;');
	html = html.replace(/<[^>]+/g, function($0) {
		return $0.replace(/\s+/g, ' ');
	});
	var htmlTagMap = {};
	if (htmlTags) {
		_each(htmlTags, function(key, val) {
			var arr = key.split(',');
			for (var i = 0, len = arr.length; i < len; i++) {
				htmlTagMap[arr[i]] = _toMap(val);
			}
		});
		if (!htmlTagMap.script) {
			html = html.replace(/(<(?:script|script\s[^>]*)>)([\s\S]*?)(<\/script>)/ig, '');
		}
		if (!htmlTagMap.style) {
			html = html.replace(/(<(?:style|style\s[^>]*)>)([\s\S]*?)(<\/style>)/ig, '');
		}
	}
	//var re = /(\s*)<(\/)?([\w\-:]+)((?:\s+|(?:\s+[\w\-:]+)|(?:\s+[\w\-:]+=[^\s"'<>]+)|(?:\s+[\w\-:"]+="[^"]*")|(?:\s+[\w\-:"]+='[^']*'))*)(\/)?>(\s*)/g;
	var re = /([ \f\n\r\t\v]*)<(\/)?([\w\-:]+)((?:\s+|(?:\s+[\w\-:]+)|(?:\s+[\w\-:]+=[^\s"'<>]+)|(?:\s+[\w\-:"]+="[^"]*")|(?:\s+[\w\-:"]+='[^']*'))*)(\/)?>([ \f\n\r\t\v]*)/g;
	var tagStack = [];
	html = html.replace(re, function($0, $1, $2, $3, $4, $5, $6) {
		var full = $0,
			startNewline = $1 || '',
			startSlash = $2 || '',
			tagName = $3.toLowerCase(),
			attr = $4 || '',
			endSlash = $5 ? ' ' + $5 : '',
			endNewline = $6 || '';
		if (htmlTags && !htmlTagMap[tagName]) {
			return '';
		}
		if (endSlash === '' && _SINGLE_TAG_MAP[tagName]) {
			endSlash = ' /';
		}
		if (_INLINE_TAG_MAP[tagName]) {
			if (startNewline) {
				startNewline = ' ';
			}
			if (endNewline) {
				endNewline = ' ';
			}
		}
		if (_PRE_TAG_MAP[tagName]) {
			if (startSlash) {
				endNewline = '\n';
			} else {
				startNewline = '\n';
			}
		}
		if (wellFormatted && tagName == 'br') {
			endNewline = '\n';
		}
		if (_BLOCK_TAG_MAP[tagName] && !_PRE_TAG_MAP[tagName]) {
			if (wellFormatted) {
				if (startSlash && tagStack.length > 0 && tagStack[tagStack.length - 1] === tagName) {
					tagStack.pop();
				} else {
					tagStack.push(tagName);
				}
				startNewline = '\n';
				endNewline = '\n';
				for (var i = 0, len = startSlash ? tagStack.length : tagStack.length - 1; i < len; i++) {
					startNewline += indentChar;
					if (!startSlash) {
						endNewline += indentChar;
					}
				}
				if (endSlash) {
					tagStack.pop();
				} else if (!startSlash) {
					endNewline += indentChar;
				}
			} else {
				startNewline = endNewline = '';
			}
		}
		if (attr !== '') {
			var attrMap = _getAttrList(full);
			if (tagName === 'font') {
				var fontStyleMap = {}, fontStyle = '';
				_each(attrMap, function(key, val) {
					if (key === 'color') {
						fontStyleMap.color = val;
						delete attrMap[key];
					}
					if (key === 'size') {
						fontStyleMap['font-size'] = fontSizeList[parseInt(val, 10) - 1] || '';
						delete attrMap[key];
					}
					if (key === 'face') {
						fontStyleMap['font-family'] = val;
						delete attrMap[key];
					}
					if (key === 'style') {
						fontStyle = val;
					}
				});
				if (fontStyle && !/;$/.test(fontStyle)) {
					fontStyle += ';';
				}
				_each(fontStyleMap, function(key, val) {
					if (val === '') {
						return;
					}
					if (/\s/.test(val)) {
						val = "'" + val + "'";
					}
					fontStyle += key + ':' + val + ';';
				});
				attrMap.style = fontStyle;
			}
			_each(attrMap, function(key, val) {
				if (_FILL_ATTR_MAP[key]) {
					attrMap[key] = key;
				}
				if (_inArray(key, ['src', 'href']) >= 0) {
					attrMap[key] = _formatUrl(val, urlType);
				}
				if (htmlTags && key !== 'style' && !htmlTagMap[tagName]['*'] && !htmlTagMap[tagName][key] ||
					tagName === 'body' && key === 'contenteditable' ||
					/^kindeditor_\d+$/.test(key)) {
					delete attrMap[key];
				}
				if (key === 'style' && val !== '') {
					var styleMap = _getCssList(val);
					_each(styleMap, function(k, v) {
						if (htmlTags && !htmlTagMap[tagName].style && !htmlTagMap[tagName]['.' + k]) {
							delete styleMap[k];
						}
					});
					var style = '';
					_each(styleMap, function(k, v) {
						style += k + ':' + v + ';';
					});
					attrMap.style = style;
				}
			});
			attr = '';
			_each(attrMap, function(key, val) {
				if (key === 'style' && val === '') {
					return;
				}
				val = val.replace(/"/g, '&quot;');
				attr += ' ' + key + '="' + val + '"';
			});
		}
		if (tagName === 'font') {
			tagName = 'span';
		}
		return startNewline + '<' + startSlash + tagName + attr + endSlash + '>' + endNewline;
	});
	html = html.replace(/(<(?:pre|pre\s[^>]*)>)([\s\S]*?)(<\/pre>)/ig, function($0, $1, $2, $3) {
		return $1 + $2.replace(/\n/g, '<span id="__kindeditor_pre_newline__">\n') + $3;
	});
	html = html.replace(/\n\s*\n/g, '\n');
	html = html.replace(/<span id="__kindeditor_pre_newline__">\n/g, '\n');
	return _trim(html);
}
function _clearMsWord(html, htmlTags) {
	html = html.replace(/<meta[\s\S]*?>/ig, '')
		.replace(/<![\s\S]*?>/ig, '')
		.replace(/<style[^>]*>[\s\S]*?<\/style>/ig, '')
		.replace(/<script[^>]*>[\s\S]*?<\/script>/ig, '')
		.replace(/<w:[^>]+>[\s\S]*?<\/w:[^>]+>/ig, '')
		.replace(/<o:[^>]+>[\s\S]*?<\/o:[^>]+>/ig, '')
		.replace(/<xml>[\s\S]*?<\/xml>/ig, '')
		.replace(/<(?:table|td)[^>]*>/ig, function(full) {
			return full.replace(/border-bottom:([#\w\s]+)/ig, 'border:$1');
		});
	return _formatHtml(html, htmlTags);
}
function _mediaType(src) {
	if (/\.(rm|rmvb)(\?|$)/i.test(src)) {
		return 'audio/x-pn-realaudio-plugin';
	}
	if (/\.(swf|flv)(\?|$)/i.test(src)) {
		return 'application/x-shockwave-flash';
	}
	return 'video/x-ms-asf-plugin';
}
function _mediaClass(type) {
	if (/realaudio/i.test(type)) {
		return 'ke-rm';
	}
	if (/flash/i.test(type)) {
		return 'ke-flash';
	}
	return 'ke-media';
}
function _mediaAttrs(srcTag) {
	return _getAttrList(unescape(srcTag));
}
function _mediaEmbed(attrs) {
	var html = '<embed ';
	_each(attrs, function(key, val) {
		html += key + '="' + val + '" ';
	});
	html += '/>';
	return html;
}
function _mediaImg(blankPath, attrs) {
	var width = attrs.width,
		height = attrs.height,
		type = attrs.type || _mediaType(attrs.src),
		srcTag = _mediaEmbed(attrs),
		style = '';
	if (/\D/.test(width)) {
		style += 'width:' + width + ';';
	} else if (width > 0) {
		style += 'width:' + width + 'px;';
	}
	if (/\D/.test(height)) {
		style += 'height:' + height + ';';
	} else if (height > 0) {
		style += 'height:' + height + 'px;';
	}
	var html = '<img class="' + _mediaClass(type) + '" src="' + blankPath + '" ';
	if (style !== '') {
		html += 'style="' + style + '" ';
	}
	html += 'data-ke-tag="' + escape(srcTag) + '" alt="" />';
	return html;
}
function _tmpl(str, data) {
	var fn = new Function("obj",
		"var p=[],print=function(){p.push.apply(p,arguments);};" +
		"with(obj){p.push('" +
		str.replace(/[\r\t\n]/g, " ")
			.split("<%").join("\t")
			.replace(/((^|%>)[^\t]*)'/g, "$1\r")
			.replace(/\t=(.*?)%>/g, "',$1,'")
			.split("\t").join("');")
			.split("%>").join("p.push('")
			.split("\r").join("\\'") + "');}return p.join('');");
	return data ? fn(data) : fn;
}
K.formatUrl = _formatUrl;
K.formatHtml = _formatHtml;
K.getCssList = _getCssList;
K.getAttrList = _getAttrList;
K.mediaType = _mediaType;
K.mediaAttrs = _mediaAttrs;
K.mediaEmbed = _mediaEmbed;
K.mediaImg = _mediaImg;
K.clearMsWord = _clearMsWord;
K.tmpl = _tmpl;
function _contains(nodeA, nodeB) {
	if (nodeA.nodeType == 9 && nodeB.nodeType != 9) {
		return true;
	}
	while ((nodeB = nodeB.parentNode)) {
		if (nodeB == nodeA) {
			return true;
		}
	}
	return false;
}
var _getSetAttrDiv = document.createElement('div');
_getSetAttrDiv.setAttribute('className', 't');
var _GET_SET_ATTRIBUTE = _getSetAttrDiv.className !== 't';
function _getAttr(el, key) {
	key = key.toLowerCase();
	var val = null;
	if (!_GET_SET_ATTRIBUTE && el.nodeName.toLowerCase() != 'script') {
		var div = el.ownerDocument.createElement('div');
		div.appendChild(el.cloneNode(false));
		var list = _getAttrList(_unescape(div.innerHTML));
		if (key in list) {
			val = list[key];
		}
	} else {
		try {
			val = el.getAttribute(key, 2);
		} catch(e) {
			val = el.getAttribute(key, 1);
		}
	}
	if (key === 'style' && val !== null) {
		val = _formatCss(val);
	}
	return val;
}
function _queryAll(expr, root) {
	var exprList = expr.split(',');
	if (exprList.length > 1) {
		var mergedResults = [];
		_each(exprList, function() {
			_each(_queryAll(this, root), function() {
				if (_inArray(this, mergedResults) < 0) {
					mergedResults.push(this);
				}
			});
		});
		return mergedResults;
	}
	root = root || document;
	function escape(str) {
		if (typeof str != 'string') {
			return str;
		}
		return str.replace(/([^\w\-])/g, '\\$1');
	}
	function stripslashes(str) {
		return str.replace(/\\/g, '');
	}
	function cmpTag(tagA, tagB) {
		return tagA === '*' || tagA.toLowerCase() === escape(tagB.toLowerCase());
	}
	function byId(id, tag, root) {
		var arr = [],
			doc = root.ownerDocument || root,
			el = doc.getElementById(stripslashes(id));
		if (el) {
			if (cmpTag(tag, el.nodeName) && _contains(root, el)) {
				arr.push(el);
			}
		}
		return arr;
	}
	function byClass(className, tag, root) {
		var doc = root.ownerDocument || root, arr = [], els, i, len, el;
		if (root.getElementsByClassName) {
			els = root.getElementsByClassName(stripslashes(className));
			for (i = 0, len = els.length; i < len; i++) {
				el = els[i];
				if (cmpTag(tag, el.nodeName)) {
					arr.push(el);
				}
			}
		} else if (doc.querySelectorAll) {
			els = doc.querySelectorAll((root.nodeName !== '#document' ? root.nodeName + ' ' : '') + tag + '.' + className);
			for (i = 0, len = els.length; i < len; i++) {
				el = els[i];
				if (_contains(root, el)) {
					arr.push(el);
				}
			}
		} else {
			els = root.getElementsByTagName(tag);
			className = ' ' + className + ' ';
			for (i = 0, len = els.length; i < len; i++) {
				el = els[i];
				if (el.nodeType == 1) {
					var cls = el.className;
					if (cls && (' ' + cls + ' ').indexOf(className) > -1) {
						arr.push(el);
					}
				}
			}
		}
		return arr;
	}
	function byName(name, tag, root) {
		var arr = [], doc = root.ownerDocument || root,
			els = doc.getElementsByName(stripslashes(name)), el;
		for (var i = 0, len = els.length; i < len; i++) {
			el = els[i];
			if (cmpTag(tag, el.nodeName) && _contains(root, el)) {
				if (el.getAttribute('name') !== null) {
					arr.push(el);
				}
			}
		}
		return arr;
	}
	function byAttr(key, val, tag, root) {
		var arr = [], els = root.getElementsByTagName(tag), el;
		for (var i = 0, len = els.length; i < len; i++) {
			el = els[i];
			if (el.nodeType == 1) {
				if (val === null) {
					if (_getAttr(el, key) !== null) {
						arr.push(el);
					}
				} else {
					if (val === escape(_getAttr(el, key))) {
						arr.push(el);
					}
				}
			}
		}
		return arr;
	}
	function select(expr, root) {
		var arr = [], matches;
		matches = /^((?:\\.|[^.#\s\[<>])+)/.exec(expr);
		var tag = matches ? matches[1] : '*';
		if ((matches = /#((?:[\w\-]|\\.)+)$/.exec(expr))) {
			arr = byId(matches[1], tag, root);
		} else if ((matches = /\.((?:[\w\-]|\\.)+)$/.exec(expr))) {
			arr = byClass(matches[1], tag, root);
		} else if ((matches = /\[((?:[\w\-]|\\.)+)\]/.exec(expr))) {
			arr = byAttr(matches[1].toLowerCase(), null, tag, root);
		} else if ((matches = /\[((?:[\w\-]|\\.)+)\s*=\s*['"]?((?:\\.|[^'"]+)+)['"]?\]/.exec(expr))) {
			var key = matches[1].toLowerCase(), val = matches[2];
			if (key === 'id') {
				arr = byId(val, tag, root);
			} else if (key === 'class') {
				arr = byClass(val, tag, root);
			} else if (key === 'name') {
				arr = byName(val, tag, root);
			} else {
				arr = byAttr(key, val, tag, root);
			}
		} else {
			var els = root.getElementsByTagName(tag), el;
			for (var i = 0, len = els.length; i < len; i++) {
				el = els[i];
				if (el.nodeType == 1) {
					arr.push(el);
				}
			}
		}
		return arr;
	}
	var parts = [], arr, re = /((?:\\.|[^\s>])+|[\s>])/g;
	while ((arr = re.exec(expr))) {
		if (arr[1] !== ' ') {
			parts.push(arr[1]);
		}
	}
	var results = [];
	if (parts.length == 1) {
		return select(parts[0], root);
	}
	var isChild = false, part, els, subResults, val, v, i, j, k, length, len, l;
	for (i = 0, lenth = parts.length; i < lenth; i++) {
		part = parts[i];
		if (part === '>') {
			isChild = true;
			continue;
		}
		if (i > 0) {
			els = [];
			for (j = 0, len = results.length; j < len; j++) {
				val = results[j];
				subResults = select(part, val);
				for (k = 0, l = subResults.length; k < l; k++) {
					v = subResults[k];
					if (isChild) {
						if (val === v.parentNode) {
							els.push(v);
						}
					} else {
						els.push(v);
					}
				}
			}
			results = els;
		} else {
			results = select(part, root);
		}
		if (results.length === 0) {
			return [];
		}
	}
	return results;
}
function _query(expr, root) {
	var arr = _queryAll(expr, root);
	return arr.length > 0 ? arr[0] : null;
}
K.query = _query;
K.queryAll = _queryAll;
function _get(val) {
	return K(val)[0];
}
function _getDoc(node) {
	if (!node) {
		return document;
	}
	return node.ownerDocument || node.document || node;
}
function _getWin(node) {
	if (!node) {
		return window;
	}
	var doc = _getDoc(node);
	return doc.parentWindow || doc.defaultView;
}
function _setHtml(el, html) {
	if (el.nodeType != 1) {
		return;
	}
	var doc = _getDoc(el);
	try {
		el.innerHTML = '<img id="__kindeditor_temp_tag__" width="0" height="0" style="display:none;" />' + html;
		var temp = doc.getElementById('__kindeditor_temp_tag__');
		temp.parentNode.removeChild(temp);
	} catch(e) {
		K(el).empty();
		K('@' + html, doc).each(function() {
			el.appendChild(this);
		});
	}
}
function _hasClass(el, cls) {
	return _inString(cls, el.className, ' ');
}
function _setAttr(el, key, val) {
	if (_IE && _V < 8 && key.toLowerCase() == 'class') {
		key = 'className';
	}
	el.setAttribute(key, '' + val);
}
function _removeAttr(el, key) {
	if (_IE && _V < 8 && key.toLowerCase() == 'class') {
		key = 'className';
	}
	_setAttr(el, key, '');
	el.removeAttribute(key);
}
function _getNodeName(node) {
	if (!node || !node.nodeName) {
		return '';
	}
	return node.nodeName.toLowerCase();
}
function _computedCss(el, key) {
	var self = this, win = _getWin(el), camelKey = _toCamel(key), val = '';
	if (win.getComputedStyle) {
		var style = win.getComputedStyle(el, null);
		val = style[camelKey] || style.getPropertyValue(key) || el.style[camelKey];
	} else if (el.currentStyle) {
		val = el.currentStyle[camelKey] || el.style[camelKey];
	}
	return val;
}
function _hasVal(node) {
	return !!_VALUE_TAG_MAP[_getNodeName(node)];
}
function _docElement(doc) {
	doc = doc || document;
	return _QUIRKS ? doc.body : doc.documentElement;
}
function _docHeight(doc) {
	var el = _docElement(doc);
	return Math.max(el.scrollHeight, el.clientHeight);
}
function _docWidth(doc) {
	var el = _docElement(doc);
	return Math.max(el.scrollWidth, el.clientWidth);
}
function _getScrollPos(doc) {
	doc = doc || document;
	var x, y;
	if (_IE || _NEWIE || _OPERA) {
		x = _docElement(doc).scrollLeft;
		y = _docElement(doc).scrollTop;
	} else {
		x = _getWin(doc).scrollX;
		y = _getWin(doc).scrollY;
	}
	return {x : x, y : y};
}
function KNode(node) {
	this.init(node);
}
_extend(KNode, {
	init : function(node) {
		var self = this;
		node = _isArray(node) ? node : [node];
		var length = 0;
		for (var i = 0, len = node.length; i < len; i++) {
			if (node[i]) {
				self[i] = node[i].constructor === KNode ? node[i][0] : node[i];
				length++;
			}
		}
		self.length = length;
		self.doc = _getDoc(self[0]);
		self.name = _getNodeName(self[0]);
		self.type = self.length > 0 ? self[0].nodeType : null;
		self.win = _getWin(self[0]);
	},
	each : function(fn) {
		var self = this;
		for (var i = 0; i < self.length; i++) {
			if (fn.call(self[i], i, self[i]) === false) {
				return self;
			}
		}
		return self;
	},
	bind : function(type, fn) {
		this.each(function() {
			_bind(this, type, fn);
		});
		return this;
	},
	unbind : function(type, fn) {
		this.each(function() {
			_unbind(this, type, fn);
		});
		return this;
	},
	fire : function(type) {
		if (this.length < 1) {
			return this;
		}
		_fire(this[0], type);
		return this;
	},
	hasAttr : function(key) {
		if (this.length < 1) {
			return false;
		}
		return !!_getAttr(this[0], key);
	},
	attr : function(key, val) {
		var self = this;
		if (key === undefined) {
			return _getAttrList(self.outer());
		}
		if (typeof key === 'object') {
			_each(key, function(k, v) {
				self.attr(k, v);
			});
			return self;
		}
		if (val === undefined) {
			val = self.length < 1 ? null : _getAttr(self[0], key);
			return val === null ? '' : val;
		}
		self.each(function() {
			_setAttr(this, key, val);
		});
		return self;
	},
	removeAttr : function(key) {
		this.each(function() {
			_removeAttr(this, key);
		});
		return this;
	},
	get : function(i) {
		if (this.length < 1) {
			return null;
		}
		return this[i || 0];
	},
	eq : function(i) {
		if (this.length < 1) {
			return null;
		}
		return this[i] ? new KNode(this[i]) : null;
	},
	hasClass : function(cls) {
		if (this.length < 1) {
			return false;
		}
		return _hasClass(this[0], cls);
	},
	addClass : function(cls) {
		this.each(function() {
			if (!_hasClass(this, cls)) {
				this.className = _trim(this.className + ' ' + cls);
			}
		});
		return this;
	},
	removeClass : function(cls) {
		this.each(function() {
			if (_hasClass(this, cls)) {
				this.className = _trim(this.className.replace(new RegExp('(^|\\s)' + cls + '(\\s|$)'), ' '));
			}
		});
		return this;
	},
	html : function(val) {
		var self = this;
		if (val === undefined) {
			if (self.length < 1 || self.type != 1) {
				return '';
			}
			return _formatHtml(self[0].innerHTML);
		}
		self.each(function() {
			_setHtml(this, val);
		});
		return self;
	},
	text : function() {
		var self = this;
		if (self.length < 1) {
			return '';
		}
		return _IE ? self[0].innerText : self[0].textContent;
	},
	hasVal : function() {
		if (this.length < 1) {
			return false;
		}
		return _hasVal(this[0]);
	},
	val : function(val) {
		var self = this;
		if (val === undefined) {
			if (self.length < 1) {
				return '';
			}
			return self.hasVal() ? self[0].value : self.attr('value');
		} else {
			self.each(function() {
				if (_hasVal(this)) {
					this.value = val;
				} else {
					_setAttr(this, 'value' , val);
				}
			});
			return self;
		}
	},
	css : function(key, val) {
		var self = this;
		if (key === undefined) {
			return _getCssList(self.attr('style'));
		}
		if (typeof key === 'object') {
			_each(key, function(k, v) {
				self.css(k, v);
			});
			return self;
		}
		if (val === undefined) {
			if (self.length < 1) {
				return '';
			}
			return self[0].style[_toCamel(key)] || _computedCss(self[0], key) || '';
		}
		self.each(function() {
			this.style[_toCamel(key)] = val;
		});
		return self;
	},
	width : function(val) {
		var self = this;
		if (val === undefined) {
			if (self.length < 1) {
				return 0;
			}
			return self[0].offsetWidth;
		}
		return self.css('width', _addUnit(val));
	},
	height : function(val) {
		var self = this;
		if (val === undefined) {
			if (self.length < 1) {
				return 0;
			}
			return self[0].offsetHeight;
		}
		return self.css('height', _addUnit(val));
	},
	opacity : function(val) {
		this.each(function() {
			if (this.style.opacity === undefined) {
				this.style.filter = val == 1 ? '' : 'alpha(opacity=' + (val * 100) + ')';
			} else {
				this.style.opacity = val == 1 ? '' : val;
			}
		});
		return this;
	},
	data : function(key, val) {
		var self = this;
		key = 'kindeditor_data_' + key;
		if (val === undefined) {
			if (self.length < 1) {
				return null;
			}
			return self[0][key];
		}
		this.each(function() {
			this[key] = val;
		});
		return self;
	},
	pos : function() {
		var self = this, node = self[0], x = 0, y = 0;
		if (node) {
			if (node.getBoundingClientRect) {
				var box = node.getBoundingClientRect(),
					pos = _getScrollPos(self.doc);
				x = box.left + pos.x;
				y = box.top + pos.y;
			} else {
				while (node) {
					x += node.offsetLeft;
					y += node.offsetTop;
					node = node.offsetParent;
				}
			}
		}
		return {x : _round(x), y : _round(y)};
	},
	clone : function(bool) {
		if (this.length < 1) {
			return new KNode([]);
		}
		return new KNode(this[0].cloneNode(bool));
	},
	append : function(expr) {
		this.each(function() {
			if (this.appendChild) {
				this.appendChild(_get(expr));
			}
		});
		return this;
	},
	appendTo : function(expr) {
		this.each(function() {
			_get(expr).appendChild(this);
		});
		return this;
	},
	before : function(expr) {
		this.each(function() {
			this.parentNode.insertBefore(_get(expr), this);
		});
		return this;
	},
	after : function(expr) {
		this.each(function() {
			if (this.nextSibling) {
				this.parentNode.insertBefore(_get(expr), this.nextSibling);
			} else {
				this.parentNode.appendChild(_get(expr));
			}
		});
		return this;
	},
	replaceWith : function(expr) {
		var nodes = [];
		this.each(function(i, node) {
			_unbind(node);
			var newNode = _get(expr);
			node.parentNode.replaceChild(newNode, node);
			nodes.push(newNode);
		});
		return K(nodes);
	},
	empty : function() {
		var self = this;
		self.each(function(i, node) {
			var child = node.firstChild;
			while (child) {
				if (!node.parentNode) {
					return;
				}
				var next = child.nextSibling;
				child.parentNode.removeChild(child);
				child = next;
			}
		});
		return self;
	},
	remove : function(keepChilds) {
		var self = this;
		self.each(function(i, node) {
			if (!node.parentNode) {
				return;
			}
			_unbind(node);
			if (keepChilds) {
				var child = node.firstChild;
				while (child) {
					var next = child.nextSibling;
					node.parentNode.insertBefore(child, node);
					child = next;
				}
			}
			node.parentNode.removeChild(node);
			delete self[i];
		});
		self.length = 0;
		return self;
	},
	show : function(val) {
		var self = this;
		if (val === undefined) {
			val = self._originDisplay || '';
		}
		if (self.css('display') != 'none') {
			return self;
		}
		return self.css('display', val);
	},
	hide : function() {
		var self = this;
		if (self.length < 1) {
			return self;
		}
		self._originDisplay = self[0].style.display;
		return self.css('display', 'none');
	},
	outer : function() {
		var self = this;
		if (self.length < 1) {
			return '';
		}
		var div = self.doc.createElement('div'), html;
		div.appendChild(self[0].cloneNode(true));
		html = _formatHtml(div.innerHTML);
		div = null;
		return html;
	},
	isSingle : function() {
		return !!_SINGLE_TAG_MAP[this.name];
	},
	isInline : function() {
		return !!_INLINE_TAG_MAP[this.name];
	},
	isBlock : function() {
		return !!_BLOCK_TAG_MAP[this.name];
	},
	isStyle : function() {
		return !!_STYLE_TAG_MAP[this.name];
	},
	isControl : function() {
		return !!_CONTROL_TAG_MAP[this.name];
	},
	contains : function(otherNode) {
		if (this.length < 1) {
			return false;
		}
		return _contains(this[0], _get(otherNode));
	},
	parent : function() {
		if (this.length < 1) {
			return null;
		}
		var node = this[0].parentNode;
		return node ? new KNode(node) : null;
	},
	children : function() {
		if (this.length < 1) {
			return new KNode([]);
		}
		var list = [], child = this[0].firstChild;
		while (child) {
			if (child.nodeType != 3 || _trim(child.nodeValue) !== '') {
				list.push(child);
			}
			child = child.nextSibling;
		}
		return new KNode(list);
	},
	first : function() {
		var list = this.children();
		return list.length > 0 ? list.eq(0) : null;
	},
	last : function() {
		var list = this.children();
		return list.length > 0 ? list.eq(list.length - 1) : null;
	},
	index : function() {
		if (this.length < 1) {
			return -1;
		}
		var i = -1, sibling = this[0];
		while (sibling) {
			i++;
			sibling = sibling.previousSibling;
		}
		return i;
	},
	prev : function() {
		if (this.length < 1) {
			return null;
		}
		var node = this[0].previousSibling;
		return node ? new KNode(node) : null;
	},
	next : function() {
		if (this.length < 1) {
			return null;
		}
		var node = this[0].nextSibling;
		return node ? new KNode(node) : null;
	},
	scan : function(fn, order) {
		if (this.length < 1) {
			return;
		}
		order = (order === undefined) ? true : order;
		function walk(node) {
			var n = order ? node.firstChild : node.lastChild;
			while (n) {
				var next = order ? n.nextSibling : n.previousSibling;
				if (fn(n) === false) {
					return false;
				}
				if (walk(n) === false) {
					return false;
				}
				n = next;
			}
		}
		walk(this[0]);
		return this;
	}
});
_each(('blur,focus,focusin,focusout,load,resize,scroll,unload,click,dblclick,' +
	'mousedown,mouseup,mousemove,mouseover,mouseout,mouseenter,mouseleave,' +
	'change,select,submit,keydown,keypress,keyup,error,contextmenu').split(','), function(i, type) {
	KNode.prototype[type] = function(fn) {
		return fn ? this.bind(type, fn) : this.fire(type);
	};
});
var _K = K;
K = function(expr, root) {
	if (expr === undefined || expr === null) {
		return;
	}
	function newNode(node) {
		if (!node[0]) {
			node = [];
		}
		return new KNode(node);
	}
	if (typeof expr === 'string') {
		if (root) {
			root = _get(root);
		}
		var length = expr.length;
		if (expr.charAt(0) === '@') {
			expr = expr.substr(1);
		}
		if (expr.length !== length || /<.+>/.test(expr)) {
			var doc = root ? root.ownerDocument || root : document,
				div = doc.createElement('div'), list = [];
			div.innerHTML = '<img id="__kindeditor_temp_tag__" width="0" height="0" style="display:none;" />' + expr;
			for (var i = 0, len = div.childNodes.length; i < len; i++) {
				var child = div.childNodes[i];
				if (child.id == '__kindeditor_temp_tag__') {
					continue;
				}
				list.push(child);
			}
			return newNode(list);
		}
		return newNode(_queryAll(expr, root));
	}
	if (expr && expr.constructor === KNode) {
		return expr;
	}
	if (expr.toArray) {
		expr = expr.toArray();
	}
	if (_isArray(expr)) {
		return newNode(expr);
	}
	return newNode(_toArray(arguments));
};
_each(_K, function(key, val) {
	K[key] = val;
});
K.NodeClass = KNode;
window.KindEditor = K;
var _START_TO_START = 0,
	_START_TO_END = 1,
	_END_TO_END = 2,
	_END_TO_START = 3,
	_BOOKMARK_ID = 0;
function _updateCollapsed(range) {
	range.collapsed = (range.startContainer === range.endContainer && range.startOffset === range.endOffset);
	return range;
}
function _copyAndDelete(range, isCopy, isDelete) {
	var doc = range.doc, nodeList = [];
	function splitTextNode(node, startOffset, endOffset) {
		var length = node.nodeValue.length, centerNode;
		if (isCopy) {
			var cloneNode = node.cloneNode(true);
			if (startOffset > 0) {
				centerNode = cloneNode.splitText(startOffset);
			} else {
				centerNode = cloneNode;
			}
			if (endOffset < length) {
				centerNode.splitText(endOffset - startOffset);
			}
		}
		if (isDelete) {
			var center = node;
			if (startOffset > 0) {
				center = node.splitText(startOffset);
				range.setStart(node, startOffset);
			}
			if (endOffset < length) {
				var right = center.splitText(endOffset - startOffset);
				range.setEnd(right, 0);
			}
			nodeList.push(center);
		}
		return centerNode;
	}
	function removeNodes() {
		if (isDelete) {
			range.up().collapse(true);
		}
		for (var i = 0, len = nodeList.length; i < len; i++) {
			var node = nodeList[i];
			if (node.parentNode) {
				node.parentNode.removeChild(node);
			}
		}
	}
	var copyRange = range.cloneRange().down();
	var start = -1, incStart = -1, incEnd = -1, end = -1,
		ancestor = range.commonAncestor(), frag = doc.createDocumentFragment();
	if (ancestor.nodeType == 3) {
		var textNode = splitTextNode(ancestor, range.startOffset, range.endOffset);
		if (isCopy) {
			frag.appendChild(textNode);
		}
		removeNodes();
		return isCopy ? frag : range;
	}
	function extractNodes(parent, frag) {
		var node = parent.firstChild, nextNode;
		while (node) {
			var testRange = new KRange(doc).selectNode(node);
			start = testRange.compareBoundaryPoints(_START_TO_END, range);
			if (start >= 0 && incStart <= 0) {
				incStart = testRange.compareBoundaryPoints(_START_TO_START, range);
			}
			if (incStart >= 0 && incEnd <= 0) {
				incEnd = testRange.compareBoundaryPoints(_END_TO_END, range);
			}
			if (incEnd >= 0 && end <= 0) {
				end = testRange.compareBoundaryPoints(_END_TO_START, range);
			}
			if (end >= 0) {
				return false;
			}
			nextNode = node.nextSibling;
			if (start > 0) {
				if (node.nodeType == 1) {
					if (incStart >= 0 && incEnd <= 0) {
						if (isCopy) {
							frag.appendChild(node.cloneNode(true));
						}
						if (isDelete) {
							nodeList.push(node);
						}
					} else {
						var childFlag;
						if (isCopy) {
							childFlag = node.cloneNode(false);
							frag.appendChild(childFlag);
						}
						if (extractNodes(node, childFlag) === false) {
							return false;
						}
					}
				} else if (node.nodeType == 3) {
					var textNode;
					if (node == copyRange.startContainer) {
						textNode = splitTextNode(node, copyRange.startOffset, node.nodeValue.length);
					} else if (node == copyRange.endContainer) {
						textNode = splitTextNode(node, 0, copyRange.endOffset);
					} else {
						textNode = splitTextNode(node, 0, node.nodeValue.length);
					}
					if (isCopy) {
						try {
							frag.appendChild(textNode);
						} catch(e) {}
					}
				}
			}
			node = nextNode;
		}
	}
	extractNodes(ancestor, frag);
	if (isDelete) {
		range.up().collapse(true);
	}
	for (var i = 0, len = nodeList.length; i < len; i++) {
		var node = nodeList[i];
		if (node.parentNode) {
			node.parentNode.removeChild(node);
		}
	}
	return isCopy ? frag : range;
}
function _moveToElementText(range, el) {
	var node = el;
	while (node) {
		var knode = K(node);
		if (knode.name == 'marquee' || knode.name == 'select') {
			return;
		}
		node = node.parentNode;
	}
	try {
		range.moveToElementText(el);
	} catch(e) {}
}
function _getStartEnd(rng, isStart) {
	var doc = rng.parentElement().ownerDocument,
		pointRange = rng.duplicate();
	pointRange.collapse(isStart);
	var parent = pointRange.parentElement(),
		nodes = parent.childNodes;
	if (nodes.length === 0) {
		return {node: parent.parentNode, offset: K(parent).index()};
	}
	var startNode = doc, startPos = 0, cmp = -1;
	var testRange = rng.duplicate();
	_moveToElementText(testRange, parent);
	for (var i = 0, len = nodes.length; i < len; i++) {
		var node = nodes[i];
		cmp = testRange.compareEndPoints('StartToStart', pointRange);
		if (cmp === 0) {
			return {node: node.parentNode, offset: i};
		}
		if (node.nodeType == 1) {
			var nodeRange = rng.duplicate(), dummy, knode = K(node), newNode = node;
			if (knode.isControl()) {
				dummy = doc.createElement('span');
				knode.after(dummy);
				newNode = dummy;
				startPos += knode.text().replace(/\r\n|\n|\r/g, '').length;
			}
			_moveToElementText(nodeRange, newNode);
			testRange.setEndPoint('StartToEnd', nodeRange);
			if (cmp > 0) {
				startPos += nodeRange.text.replace(/\r\n|\n|\r/g, '').length;
			} else {
				startPos = 0;
			}
			if (dummy) {
				K(dummy).remove();
			}
		} else if (node.nodeType == 3) {
			testRange.moveStart('character', node.nodeValue.length);
			startPos += node.nodeValue.length;
		}
		if (cmp < 0) {
			startNode = node;
		}
	}
	if (cmp < 0 && startNode.nodeType == 1) {
		return {node: parent, offset: K(parent.lastChild).index() + 1};
	}
	if (cmp > 0) {
		while (startNode.nextSibling && startNode.nodeType == 1) {
			startNode = startNode.nextSibling;
		}
	}
	testRange = rng.duplicate();
	_moveToElementText(testRange, parent);
	testRange.setEndPoint('StartToEnd', pointRange);
	startPos -= testRange.text.replace(/\r\n|\n|\r/g, '').length;
	if (cmp > 0 && startNode.nodeType == 3) {
		var prevNode = startNode.previousSibling;
		while (prevNode && prevNode.nodeType == 3) {
			startPos -= prevNode.nodeValue.length;
			prevNode = prevNode.previousSibling;
		}
	}
	return {node: startNode, offset: startPos};
}
function _getEndRange(node, offset) {
	var doc = node.ownerDocument || node,
		range = doc.body.createTextRange();
	if (doc == node) {
		range.collapse(true);
		return range;
	}
	if (node.nodeType == 1 && node.childNodes.length > 0) {
		var children = node.childNodes, isStart, child;
		if (offset === 0) {
			child = children[0];
			isStart = true;
		} else {
			child = children[offset - 1];
			isStart = false;
		}
		if (!child) {
			return range;
		}
		if (K(child).name === 'head') {
			if (offset === 1) {
				isStart = true;
			}
			if (offset === 2) {
				isStart = false;
			}
			range.collapse(isStart);
			return range;
		}
		if (child.nodeType == 1) {
			var kchild = K(child), span;
			if (kchild.isControl()) {
				span = doc.createElement('span');
				if (isStart) {
					kchild.before(span);
				} else {
					kchild.after(span);
				}
				child = span;
			}
			_moveToElementText(range, child);
			range.collapse(isStart);
			if (span) {
				K(span).remove();
			}
			return range;
		}
		node = child;
		offset = isStart ? 0 : child.nodeValue.length;
	}
	var dummy = doc.createElement('span');
	K(node).before(dummy);
	_moveToElementText(range, dummy);
	range.moveStart('character', offset);
	K(dummy).remove();
	return range;
}
function _toRange(rng) {
	var doc, range;
	function tr2td(start) {
		if (K(start.node).name == 'tr') {
			start.node = start.node.cells[start.offset];
			start.offset = 0;
		}
	}
	if (_IERANGE) {
		if (rng.item) {
			doc = _getDoc(rng.item(0));
			range = new KRange(doc);
			range.selectNode(rng.item(0));
			return range;
		}
		doc = rng.parentElement().ownerDocument;
		var start = _getStartEnd(rng, true),
			end = _getStartEnd(rng, false);
		tr2td(start);
		tr2td(end);
		range = new KRange(doc);
		range.setStart(start.node, start.offset);
		range.setEnd(end.node, end.offset);
		return range;
	}
	var startContainer = rng.startContainer;
	doc = startContainer.ownerDocument || startContainer;
	range = new KRange(doc);
	range.setStart(startContainer, rng.startOffset);
	range.setEnd(rng.endContainer, rng.endOffset);
	return range;
}
function KRange(doc) {
	this.init(doc);
}
_extend(KRange, {
	init : function(doc) {
		var self = this;
		self.startContainer = doc;
		self.startOffset = 0;
		self.endContainer = doc;
		self.endOffset = 0;
		self.collapsed = true;
		self.doc = doc;
	},
	commonAncestor : function() {
		function getParents(node) {
			var parents = [];
			while (node) {
				parents.push(node);
				node = node.parentNode;
			}
			return parents;
		}
		var parentsA = getParents(this.startContainer),
			parentsB = getParents(this.endContainer),
			i = 0, lenA = parentsA.length, lenB = parentsB.length, parentA, parentB;
		while (++i) {
			parentA = parentsA[lenA - i];
			parentB = parentsB[lenB - i];
			if (!parentA || !parentB || parentA !== parentB) {
				break;
			}
		}
		return parentsA[lenA - i + 1];
	},
	setStart : function(node, offset) {
		var self = this, doc = self.doc;
		self.startContainer = node;
		self.startOffset = offset;
		if (self.endContainer === doc) {
			self.endContainer = node;
			self.endOffset = offset;
		}
		return _updateCollapsed(this);
	},
	setEnd : function(node, offset) {
		var self = this, doc = self.doc;
		self.endContainer = node;
		self.endOffset = offset;
		if (self.startContainer === doc) {
			self.startContainer = node;
			self.startOffset = offset;
		}
		return _updateCollapsed(this);
	},
	setStartBefore : function(node) {
		return this.setStart(node.parentNode || this.doc, K(node).index());
	},
	setStartAfter : function(node) {
		return this.setStart(node.parentNode || this.doc, K(node).index() + 1);
	},
	setEndBefore : function(node) {
		return this.setEnd(node.parentNode || this.doc, K(node).index());
	},
	setEndAfter : function(node) {
		return this.setEnd(node.parentNode || this.doc, K(node).index() + 1);
	},
	selectNode : function(node) {
		return this.setStartBefore(node).setEndAfter(node);
	},
	selectNodeContents : function(node) {
		var knode = K(node);
		if (knode.type == 3 || knode.isSingle()) {
			return this.selectNode(node);
		}
		var children = knode.children();
		if (children.length > 0) {
			return this.setStartBefore(children[0]).setEndAfter(children[children.length - 1]);
		}
		return this.setStart(node, 0).setEnd(node, 0);
	},
	collapse : function(toStart) {
		if (toStart) {
			return this.setEnd(this.startContainer, this.startOffset);
		}
		return this.setStart(this.endContainer, this.endOffset);
	},
	compareBoundaryPoints : function(how, range) {
		var rangeA = this.get(), rangeB = range.get();
		if (_IERANGE) {
			var arr = {};
			arr[_START_TO_START] = 'StartToStart';
			arr[_START_TO_END] = 'EndToStart';
			arr[_END_TO_END] = 'EndToEnd';
			arr[_END_TO_START] = 'StartToEnd';
			var cmp = rangeA.compareEndPoints(arr[how], rangeB);
			if (cmp !== 0) {
				return cmp;
			}
			var nodeA, nodeB, nodeC, posA, posB;
			if (how === _START_TO_START || how === _END_TO_START) {
				nodeA = this.startContainer;
				posA = this.startOffset;
			}
			if (how === _START_TO_END || how === _END_TO_END) {
				nodeA = this.endContainer;
				posA = this.endOffset;
			}
			if (how === _START_TO_START || how === _START_TO_END) {
				nodeB = range.startContainer;
				posB = range.startOffset;
			}
			if (how === _END_TO_END || how === _END_TO_START) {
				nodeB = range.endContainer;
				posB = range.endOffset;
			}
			if (nodeA === nodeB) {
				var diff = posA - posB;
				return diff > 0 ? 1 : (diff < 0 ? -1 : 0);
			}
			nodeC = nodeB;
			while (nodeC && nodeC.parentNode !== nodeA) {
				nodeC = nodeC.parentNode;
			}
			if (nodeC) {
				return K(nodeC).index() >= posA ? -1 : 1;
			}
			nodeC = nodeA;
			while (nodeC && nodeC.parentNode !== nodeB) {
				nodeC = nodeC.parentNode;
			}
			if (nodeC) {
				return K(nodeC).index() >= posB ? 1 : -1;
			}
			nodeC = K(nodeB).next();
			if (nodeC && nodeC.contains(nodeA)) {
				return 1;
			}
			nodeC = K(nodeA).next();
			if (nodeC && nodeC.contains(nodeB)) {
				return -1;
			}
		} else {
			return rangeA.compareBoundaryPoints(how, rangeB);
		}
	},
	cloneRange : function() {
		return new KRange(this.doc).setStart(this.startContainer, this.startOffset).setEnd(this.endContainer, this.endOffset);
	},
	toString : function() {
		var rng = this.get(), str = _IERANGE ? rng.text : rng.toString();
		return str.replace(/\r\n|\n|\r/g, '');
	},
	cloneContents : function() {
		return _copyAndDelete(this, true, false);
	},
	deleteContents : function() {
		return _copyAndDelete(this, false, true);
	},
	extractContents : function() {
		return _copyAndDelete(this, true, true);
	},
	insertNode : function(node) {
		var self = this,
			sc = self.startContainer, so = self.startOffset,
			ec = self.endContainer, eo = self.endOffset,
			firstChild, lastChild, c, nodeCount = 1;
		if (node.nodeName.toLowerCase() === '#document-fragment') {
			firstChild = node.firstChild;
			lastChild = node.lastChild;
			nodeCount = node.childNodes.length;
		}
		if (sc.nodeType == 1) {
			c = sc.childNodes[so];
			if (c) {
				sc.insertBefore(node, c);
				if (sc === ec) {
					eo += nodeCount;
				}
			} else {
				sc.appendChild(node);
			}
		} else if (sc.nodeType == 3) {
			if (so === 0) {
				sc.parentNode.insertBefore(node, sc);
				if (sc.parentNode === ec) {
					eo += nodeCount;
				}
			} else if (so >= sc.nodeValue.length) {
				if (sc.nextSibling) {
					sc.parentNode.insertBefore(node, sc.nextSibling);
				} else {
					sc.parentNode.appendChild(node);
				}
			} else {
				if (so > 0) {
					c = sc.splitText(so);
				} else {
					c = sc;
				}
				sc.parentNode.insertBefore(node, c);
				if (sc === ec) {
					ec = c;
					eo -= so;
				}
			}
		}
		if (firstChild) {
			self.setStartBefore(firstChild).setEndAfter(lastChild);
		} else {
			self.selectNode(node);
		}
		if (self.compareBoundaryPoints(_END_TO_END, self.cloneRange().setEnd(ec, eo)) >= 1) {
			return self;
		}
		return self.setEnd(ec, eo);
	},
	surroundContents : function(node) {
		node.appendChild(this.extractContents());
		return this.insertNode(node).selectNode(node);
	},
	isControl : function() {
		var self = this,
			sc = self.startContainer, so = self.startOffset,
			ec = self.endContainer, eo = self.endOffset, rng;
		return sc.nodeType == 1 && sc === ec && so + 1 === eo && K(sc.childNodes[so]).isControl();
	},
	get : function(hasControlRange) {
		var self = this, doc = self.doc, node, rng;
		if (!_IERANGE) {
			rng = doc.createRange();
			try {
				rng.setStart(self.startContainer, self.startOffset);
				rng.setEnd(self.endContainer, self.endOffset);
			} catch (e) {}
			return rng;
		}
		if (hasControlRange && self.isControl()) {
			rng = doc.body.createControlRange();
			rng.addElement(self.startContainer.childNodes[self.startOffset]);
			return rng;
		}
		var range = self.cloneRange().down();
		rng = doc.body.createTextRange();
		rng.setEndPoint('StartToStart', _getEndRange(range.startContainer, range.startOffset));
		rng.setEndPoint('EndToStart', _getEndRange(range.endContainer, range.endOffset));
		return rng;
	},
	html : function() {
		return K(this.cloneContents()).outer();
	},
	down : function() {
		var self = this;
		function downPos(node, pos, isStart) {
			if (node.nodeType != 1) {
				return;
			}
			var children = K(node).children();
			if (children.length === 0) {
				return;
			}
			var left, right, child, offset;
			if (pos > 0) {
				left = children.eq(pos - 1);
			}
			if (pos < children.length) {
				right = children.eq(pos);
			}
			if (left && left.type == 3) {
				child = left[0];
				offset = child.nodeValue.length;
			}
			if (right && right.type == 3) {
				child = right[0];
				offset = 0;
			}
			if (!child) {
				return;
			}
			if (isStart) {
				self.setStart(child, offset);
			} else {
				self.setEnd(child, offset);
			}
		}
		downPos(self.startContainer, self.startOffset, true);
		downPos(self.endContainer, self.endOffset, false);
		return self;
	},
	up : function() {
		var self = this;
		function upPos(node, pos, isStart) {
			if (node.nodeType != 3) {
				return;
			}
			if (pos === 0) {
				if (isStart) {
					self.setStartBefore(node);
				} else {
					self.setEndBefore(node);
				}
			} else if (pos == node.nodeValue.length) {
				if (isStart) {
					self.setStartAfter(node);
				} else {
					self.setEndAfter(node);
				}
			}
		}
		upPos(self.startContainer, self.startOffset, true);
		upPos(self.endContainer, self.endOffset, false);
		return self;
	},
	enlarge : function(toBlock) {
		var self = this;
		self.up();
		function enlargePos(node, pos, isStart) {
			var knode = K(node), parent;
			if (knode.type == 3 || _NOSPLIT_TAG_MAP[knode.name] || !toBlock && knode.isBlock()) {
				return;
			}
			if (pos === 0) {
				while (!knode.prev()) {
					parent = knode.parent();
					if (!parent || _NOSPLIT_TAG_MAP[parent.name] || !toBlock && parent.isBlock()) {
						break;
					}
					knode = parent;
				}
				if (isStart) {
					self.setStartBefore(knode[0]);
				} else {
					self.setEndBefore(knode[0]);
				}
			} else if (pos == knode.children().length) {
				while (!knode.next()) {
					parent = knode.parent();
					if (!parent || _NOSPLIT_TAG_MAP[parent.name] || !toBlock && parent.isBlock()) {
						break;
					}
					knode = parent;
				}
				if (isStart) {
					self.setStartAfter(knode[0]);
				} else {
					self.setEndAfter(knode[0]);
				}
			}
		}
		enlargePos(self.startContainer, self.startOffset, true);
		enlargePos(self.endContainer, self.endOffset, false);
		return self;
	},
	shrink : function() {
		var self = this, child, collapsed = self.collapsed;
		while (self.startContainer.nodeType == 1 && (child = self.startContainer.childNodes[self.startOffset]) && child.nodeType == 1 && !K(child).isSingle()) {
			self.setStart(child, 0);
		}
		if (collapsed) {
			return self.collapse(collapsed);
		}
		while (self.endContainer.nodeType == 1 && self.endOffset > 0 && (child = self.endContainer.childNodes[self.endOffset - 1]) && child.nodeType == 1 && !K(child).isSingle()) {
			self.setEnd(child, child.childNodes.length);
		}
		return self;
	},
	createBookmark : function(serialize) {
		var self = this, doc = self.doc, endNode,
			startNode = K('<span style="display:none;"></span>', doc)[0];
		startNode.id = '__kindeditor_bookmark_start_' + (_BOOKMARK_ID++) + '__';
		if (!self.collapsed) {
			endNode = startNode.cloneNode(true);
			endNode.id = '__kindeditor_bookmark_end_' + (_BOOKMARK_ID++) + '__';
		}
		if (endNode) {
			self.cloneRange().collapse(false).insertNode(endNode).setEndBefore(endNode);
		}
		self.insertNode(startNode).setStartAfter(startNode);
		return {
			start : serialize ? '#' + startNode.id : startNode,
			end : endNode ? (serialize ? '#' + endNode.id : endNode) : null
		};
	},
	moveToBookmark : function(bookmark) {
		var self = this, doc = self.doc,
			start = K(bookmark.start, doc), end = bookmark.end ? K(bookmark.end, doc) : null;
		if (!start || start.length < 1) {
			return self;
		}
		self.setStartBefore(start[0]);
		start.remove();
		if (end && end.length > 0) {
			self.setEndBefore(end[0]);
			end.remove();
		} else {
			self.collapse(true);
		}
		return self;
	},
	dump : function() {
		console.log('--------------------');
		console.log(this.startContainer.nodeType == 3 ? this.startContainer.nodeValue : this.startContainer, this.startOffset);
		console.log(this.endContainer.nodeType == 3 ? this.endContainer.nodeValue : this.endContainer, this.endOffset);
	}
});
function _range(mixed) {
	if (!mixed.nodeName) {
		return mixed.constructor === KRange ? mixed : _toRange(mixed);
	}
	return new KRange(mixed);
}
K.RangeClass = KRange;
K.range = _range;
K.START_TO_START = _START_TO_START;
K.START_TO_END = _START_TO_END;
K.END_TO_END = _END_TO_END;
K.END_TO_START = _END_TO_START;
function _nativeCommand(doc, key, val) {
	try {
		doc.execCommand(key, false, val);
	} catch(e) {}
}
function _nativeCommandValue(doc, key) {
	var val = '';
