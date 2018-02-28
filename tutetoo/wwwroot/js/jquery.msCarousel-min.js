;
(function($) {
	var H = function(k, l) {
			var m = "1.9";
			var n = this;
			var o = $.extend({
				scrollSpeed: 1000,
				autoSlide: 0,
				defaultid: 0,
				width: 515,
				blockWidth: 'auto',
				height: 258,
				vertical: false,
				boxClass: '.set',
				messageClass: '.message',
				showMessage: false,
				messageOpacity: 0.8,
				loop: true,
				callback: ''
			}, l);
			var p = {
				id: 'msc'
			};
			var q = new Object();
			var r = $(k).attr("id");
			var s = r + "_mscchild";
			var t = r + "_mscss";
			var u = 0;
			q.moveToZero = 0;
			var v = false;
			var w = function() {
					x()
				};
			var x = function() {
					y()
				};
			var y = function() {
					$("#" + r).addClass("mscarousel");
					if (o.vertical === false) {
						if (o.boxClass != '.set') $("#" + r + " >" + o.boxClass).addClass("set")
					};
					$("#" + r + " >" + o.boxClass).addClass(t);
					var a = '<div class="child" id="' + s + '"></div>';
					$("#" + r).append(a);
					$("#" + r).css({
						width: o.width + 'px',
						height: o.height + 'px',
						overflow: 'hidden',
						position: 'relative'
					});
					$("#" + s).css({
						width: o.width + 'px'
					});
					if (o.showMessage === true) {
						$("#" + r + "  " + o.messageClass).css({
							display: 'none',
							width: o.width + 'px',
							opacity: o.messageOpacity
						})
					};
					$("#" + r + "  >." + t).appendTo($("#" + s));
					$("#" + s).append("<strong class='clear last'></strong>");
					var b = $("#" + s + " >." + t);
					q.allElements = b;
					var c = E();
					if (o.vertical === false) {
						$("#" + s).css({
							width: c.width + 'px'
						})
					};
					z();
					if (o.autoSlide > 0) {
						F();
						q.isPlaying = true
					};
					if (o.defaultid > 0) {
						o.defaultid = o.defaultid - 1;
						A()
					} else if (o.defaultid == 0) {
						o.defaultid = -1;
						A()
					}
				};
			var z = function() {
					var a = $("#" + s + "  >." + t);
					if (o.vertical === false) {
						if (o.boxclass != '.set') $("#" + s + "  " + o.boxclass).addClass("set")
					};
					for (var b = 0; b < a.length; b++) {
						$(a[b]).addClass(r + p.id + "_" + b)
					};
					a = $("#" + s + "  >." + t);
					q.allElements = a
				};
			var A = function(a) {
					if (a === undefined) {
						if (o.defaultid < q.allElements.length) {
							o.defaultid++
						};
						if ((o.defaultid == q.allElements.length || q.moveToZero >= 2) && o.loop == true) {
							o.defaultid = 0;
							q.moveToZero = 0
						} else if (o.loop == false && (o.defaultid == q.allElements.length)) {
							o.defaultid--
						}
					};
					if (a == 'fromGoto') {};
					if (o.defaultid < q.allElements.length) {
						if (q.currentItem !== undefined) {
							q.previousItem = q.currentItem
						};
						q.currentItem = s + " > ." + r + p.id + "_" + o.defaultid;
						var b = $("#" + q.currentItem).position();
						var c = $("#" + r).position().left + $("#" + q.currentItem).width();
						q.moveH = "-" + (b.left) + "px";
						var d = 0;
						var e = 0;
						if ($("#" + q.currentItem).css("padding-bottom") != 'auto') {
							d = parseInt($("#" + q.currentItem).css("padding-bottom"))
						};
						if ($("#" + q.currentItem).css("margin-bottom") != 'auto') {
							e = parseInt($("#" + q.currentItem).css("margin-bottom"))
						};
						var f = d + e;
						q.moveV = "-" + (b.top + f) + "px";
						q.currentID = o.defaultid;
						D();
						if (o.defaultid == q.allElements.length) {
							o.defaultid = 0
						}
					}
				};
			var B = function() {
					if (o.defaultid > 0) {
						q.moveToZero = 0;
						o.defaultid--;
						A("fromGoto")
					}
				};
			var C = function(a) {
					if ($("#" + q.currentItem + " " + o.messageClass).length > 0 && o.showMessage == true) {
						$("#" + q.currentItem + " " + o.messageClass).fadeIn("slow", function() {
							$(this).css({
								opacity: o.messageOpacity
							})
						})
					};
					if (o.callback != '') {
						eval(o.callback)(n)
					};
					var b = $("#" + s).css("left");
					var c = $(q.allElements[q.allElements.length - 1]).position();
					if ((c.left - Math.abs(b.substr(0, b.length - 2))) < o.width) {
						q.moveToZero++;
						if (q.moveToZero >= 2 || o.defaultid == q.allElements.length - 1) {
							q.moveToZero = 0
						}
					}
				};
			var D = function() {
					if (q.previousItem != undefined && o.showMessage == true) {
						$("#" + q.previousItem + " " + o.messageClass).fadeOut("slow")
					};
					if (o.vertical === false) {
						$("#" + s).animate({
							"left": q.moveH
						}, o.scrollSpeed, function(a) {
							C(a)
						})
					} else {
						$("#" + s).animate({
							"top": q.moveV
						}, o.scrollSpeed, function(a) {
							C(a)
						})
					}
				};
			var E = function() {
					var a = new Object();
					a.width = 0;
					a.height = 0;
					var b = $("#" + s + " >" + o.boxClass);
					if (o.vertical === false) {
						if (o.blockWidth == 'auto') {
							for (var c = 0; c < b.length; c++) {
								a.width += $(b[c]).width();
								a.height += $(b[c]).height()
							}
						} else {
							a.width = o.blockWidth * b.length;
							a.height = o.height * b.length
						};
						a.width += ($("#" + r).width() * 2)
					} else {
						a.width = o.width;
						a.height = o.height * b.length
					};
					return a
				};
			var F = function() {
					clearInterval(u);
					u = setInterval(function() {
						A()
					}, o.autoSlide);
					$("#" + r).bind("mouseover", function(a) {
						$("#" + r).unbind("mouseout");
						G();
						q.isPlaying = false
					});
					q.isPlaying = true
				};
			var G = function() {
					clearInterval(u);
					$("#" + r).unbind("mouseover");
					$("#" + r).bind("mouseout", function(a) {
						if (v == false) {
							F()
						}
					});
					q.isPlaying = false
				};
			this.forceScroll = function(b) {
				if (o.vertical === false) {
					$("#" + s).animate({
						"left": b
					}, o.scrollSpeed, function(a) {
						C(a)
					})
				} else {
					$("#" + s).animate({
						"top": b
					}, o.scrollSpeed, function(a) {
						C(a)
					})
				}
			};
			this.play = function(a) {
				if (typeof(a) != "undefined") {
					o.autoSlide = a
				};
				if (o.autoSlide > 0) {
					F()
				};
				v = false
			};
			this.isPlaying = function() {
				return q.isPlaying
			};
			this.pause = function() {
				if (o.autoSlide > 0) {
					G()
				};
				v = true
			};
			this.next = function(a) {
				if (o.defaultid == 0) {
					q.moveToZero = 0
				}
				if (o.autoSlide > 0) {
					if (typeof(a) == "undefined" || a === false) {
						G()
					}
				};
				A()
			};
			this.goto = function(a, b) {
				if (a == 0) {
					q.moveToZero = 0
				}
				if (a > q.allElements.length - 1) {} else {
					o.defaultid = a;
					A("fromGoto")
				}
			};
			this.previous = function() {
				if (o.defaultid == 0) {
					q.moveToZero = 0
				};
				if (o.autoSlide > 0) {
					G()
				};
				B()
			};
			this.getCurrentID = function() {
				return o.defaultid
			};
			this.getCurrentId = this.getCurrentID;
			this.item = function(i) {
				if (typeof(i) == "undefined") {
					return q.allElements
				} else {
					return q.allElements[i]
				}
			};
			this.items = this.item;
			this.getNumbers = function(a, b, c) {
				var d = this.item();
				var e = (typeof b == "undefined" || b.length == 0) ? "" : " class=" + b;
				var f = (a == true) ? "" : "<ul" + e + ">";
				var g = "";
				var h = (typeof c == "undefined" || c.length == 0) ? "" : " class=" + c;
				for (var i = 1; i <= d.length; i++) {
					g += "<li" + h + ">" + i + "</li>"
				};
				var j = (a == true) ? "" : "</ul>";
				f = f + g + j;
				return f
			};
			this.getVersion = function() {
				return m
			};
			w()
		};
	if (typeof($.fn.prop) == 'undefined') {
		$.fn.prop = function(w, v) {
			if (typeof v == "undefined") {
				return $(this).attr(w)
			};
			try {
				$(this).attr(w, v)
			} catch (e) {}
		}
	};
	$.fn.msCarousel = function(c) {
		return this.each(function() {
			var a = $(this);
			var b = new H(a, c);
			a.data("msCarousel", b)
		})
	}
})(jQuery);