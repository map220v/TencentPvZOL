/*
 PAY Project By BOSSWeb Group.
 */
/**
 * 字符串占位符格式化
 * @param  {String} 需格式话字符串，其中包括占位符{\d}或{key}
 * @param  {String/Object} 填充占位符的字符串
 * @return {String}
 */
String.format = function() {
	var result = arguments[0];
	if (arguments.length > 1) {
		if (arguments.length == 2 && typeof (arguments[1]) == "object") {
			var args = arguments[1];
			for (var key in args) {
				if(args[key]!=undefined){
					var reg = new RegExp("({" + key + "})", "g");
					result = result.replace(reg, args[key]);
				}
			}
		}
		else {
			for (var i = 1; i < arguments.length; i++) {
				if (arguments[i] != undefined) {
					var reg = new RegExp("({[" + (i-1) + "]})", "g");
					result = result.replace(reg, arguments[i]);
				}
			}
		}
	}
	return result;
};
/**
 * 将日期格式字符串转化为日期对象
 * @param  {String} 日期字符串yyyy-MM-dd HH:mm:ss
 * @return {Date}
 */
Date.convertToDate = function(dateStr){
	var date = dateStr;
	if(typeof dateStr == "string"){
		date = new Date(Date.parse(dateStr));
	}
	return date;
};
/**
 * 将日期对象格式化为日期字符串
 * @param  {Date} 日期对象
 * @param  {String} 转化后的字符串格式(yyyy/MM/dd HH:mm:ss TT)
 * @return {String}
 */
Date.format = function (date,formatStr){
	date = Date.convertToDate(date);
	var zeroize = function (value, length){
		if (!length){
			length = 2;
		}
		value = new String(value);
		for (var i = 0, zeros = ''; i < (length - value.length); i++){
			zeros += '0';
		}
		return zeros + value;
	};
	return formatStr.replace(/"[^"]*"|'[^']*'|\b(?:d{1,4}|M{1,4}|yy(?:yy)?|([hHmstT])\1?|[lLZ])\b/g, function($0){
		switch ($0)
		{
			case 'd': return date.getDate();
			case 'dd': return zeroize(date.getDate());
			case 'ddd': return ['Sun', 'Mon', 'Tue', 'Wed', 'Thr', 'Fri', 'Sat'][date.getDay()];
			case 'dddd': return ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'][date.getDay()];
			case 'M': return date.getMonth() + 1;
			case 'MM': return zeroize(date.getMonth() + 1);
			case 'MMM': return ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'][date.getMonth()];
			case 'MMMM': return ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'][date.getMonth()];
			case 'yy': return new String(date.getFullYear()).substr(2);
			case 'yyyy': return date.getFullYear();
			case 'h': return date.getHours() % 12 || 12;
			case 'hh': return zeroize(date.getHours() % 12 || 12);
			case 'H': return date.getHours();
			case 'HH': return zeroize(date.getHours());
			case 'm': return date.getMinutes();
			case 'mm': return zeroize(date.getMinutes());
			case 's': return date.getSeconds();
			case 'ss': return zeroize(date.getSeconds());
			case 'l': return date.getMilliseconds();
			case 'll': return zeroize(date.getMilliseconds());
			case 'tt': return date.getHours() < 12 ? 'am' : 'pm';
			case 'TT': return date.getHours() < 12 ? 'AM' : 'PM';
		}
	});
};
var LIB = LIB || {};
LIB.err = function() {
	window.console && console.error && Function.prototype.apply.call(console.error, console, Array.prototype.slice.call(arguments, 0));
};
var LIB = LIB || {};
LIB.cookie = {
	get : function(name) {
		var ret = document.cookie.match(new RegExp("(?:^|;\\s)" + name + "=(.*?)(?:;\\s|$)"));
		return ret ? ret[1] : "";
	},
	set : function(key, value, opt) {
		var _date = new Date(), _domain = opt.domain || "pay.qq.com", _path = opt.path || "/", _time_gap = opt.time || 10 * 365 * 24 * 3600 * 1000;
		_date.setTime(_date.getTime() + _time_gap);
		document.cookie = key + "=" + value + "; path=" + _path + "; domain=" + _domain + "; expires=" + _date.toUTCString();
	},
	del : function(key, opt) {
		opt = opt || {};
		opt.time = -new Date();
		LIB.cookie.set(key, '', opt);
	}
}
var LIB = LIB || {};
LIB.each = function(obj, callback) {
	if ( obj instanceof Array) {
		for (var i = 0, ll = obj.length; i < ll; i++) {
			callback(i, obj[i]);
		}
	} else if ( obj instanceof Object) {
		for (var i in obj) {
			callback(i, obj[i]);
		}
	}
}
var LIB = LIB || {};
LIB.$ = function(id) {
	return document.getElementById(id);
}
var LIB = LIB || {};
LIB.endecode = function(str, isdecode) {
	var ar = ['&', '&amp;', '<', '&lt;', '>', '&gt;', ' ', '&nbsp;', '"', '&quot;', "'", '&#39;', '\\r', '<br>', '\\n', '<br>'];
	if (isdecode)
		ar.reverse();
	for (var i = 0, r = str; i < ar.length; i += 2)
		r = r.replace(new RegExp(ar[i], 'g'), ar[1 + i]);
	return r;
}
var LIB = LIB || {};
LIB.template = function(id, d, isTable) {
	var s = LIB.template.cache[id] || ( isTable ? LIB.$(id + "_table").value : LIB.$(id).innerHTML);
	LIB.template.cache[id] = s;
	if (!s) {
		return '';
	}
	var aST = LIB.template.parsing(LIB.template.separate(s));

	var process = function(d2) {
		if (d2) {
			d = d2;
		}
		return arguments.callee;
	};
	process.toString = function() {
		return (new Function(aST[0], aST[1]))(d);
	};
	return process;
};
LIB.template.cache = {};
LIB.template.separate = function(s) {
	var r = /\\'/g;
	s = s.replace(/%7B%/g, "{%").replace(/%%7D/g, "%}");
	var sRet = s.replace(/[\r\n\t]/g, '');
	sRet = sRet.replace(/'/g, '\\\'');
	sRet = sRet.replace(/{%\/#([^%]*?)%}/g, '{|}-$1{|}');
	sRet = sRet.replace(/{%#(if|elseif)\s?(\(.*?\)[^%]*?)%}/g, '{|}+$1 $2{|}');
	sRet = sRet.replace(/{%#(([^\s]*?)[^%]*?)%}/g, '{|}+$1{|}');
	return sRet;
};
LIB.template.parsing = function(s) {
	var mName = "data", vName = "data", sTmp, aTmp, sFL, sEl, aList, aStm = ['var aRet = [];'];
	aList = s.split(/\{\|\}/);
	while (aList.length) {
		sTmp = aList.shift();
		if (!sTmp) {
			continue;
		}
		sFL = sTmp.charAt(0);
		if (sFL !== '+' && sFL !== '-') {
			sTmp = '\'' + sTmp + '\'';
			aStm.push('aRet.push(' + sTmp.replace(/{%([^%]*?)%}/g, function(a, b) {
				return '\'+(' + b.replace(/\\'/g, '\'') + ')+\'';
			}) + ');');
			continue;
		}
		aTmp = sTmp.split(/\s/);
		switch(aTmp[0]) {
			case'+tmp':
				mName = aTmp[1];
				vName = aTmp[2];
				aStm.push('aRet.push("<!--' + mName + ' start--\>");');
				break;
			case'-tmp':
				aStm.push('aRet.push("<!--' + mName + ' end--\>");');
				break;
			case'+if':
				aTmp.splice(0, 1);
				aStm.push('if' + aTmp.join(' ') + '{');
				break;
			case'+elseif':
				aTmp.splice(0, 1);
				aStm.push('}else if' + aTmp.join(' ') + '{');
				break;
			case'-if':
				aStm.push('}');
				break;
			case'+else':
				aStm.push('}else{');
				break;
			case'+list':
				aStm.push('if(' + aTmp[1] + '.constructor === Array){var l=' + aTmp[1] + '.length,list_idx=0,' + aTmp[3] + ';for(var i=l;i--;){list_idx=(l-i-1);' + aTmp[3] + '=' + aTmp[1] + '[list_idx];');
				break;
			case'-list':
				aStm.push('}}');
				break;
			default:
				break;
		}
	}
	aStm.push('return aRet.join("")');
	return [vName, aStm.join('')];
};
var LIB = LIB || {};
(function() {
	var k = LIB.JSON = {};
	var H = /[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g, n = {
		"\b" : "\\b",
		"\t" : "\\t",
		"\n" : "\\n",
		"\f" : "\\f",
		"\r" : "\\r",
		'"' : '\\"',
		"\\" : "\\\\"
	}, aY = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g;
	function z(a4, a2, a3) {
		a2 = a2 || 2;
		a3 = a3 || "0";
		var a1 = [];
		a1[a2] = a4;
		return a1.join(a3).slice(-a2)
	}

	function g(a1) {
		a1 += "";
		return a1.substr(0, 1).toUpperCase() + a1.substr(1).toLowerCase()
	}

	function aX(a2) {
		var a1 = Object.prototype.toString.call(a2);
		if (a2 === null || a2 instanceof String || a2 instanceof Number || a2 instanceof Boolean || a2 instanceof Date || ({"[object String]":1,"[object Number]":1,"[object Boolean]":1,"[object Date]":1})[a1]) {
			return a2
		}
		if (a2 ===
			void 0) {
			return
			void 0
		}
		if (a2 === window) {
			return "[object DOMWindow]"
		}
		if (a2 === document) {
			return "[object HTMLDocument]"
		}
		if ( typeof a2.constructor !== "function") {
			return a2 && typeof a2.tagName === "string" ? "[object HTML" + g(a2.tagName) + "Element]" :
				void 0
		}
		if (!({"[object Object]":1,"[object Array]":1})[a1]) {
			return a1
		}
		return a2
	}

	function aN(a1) {
		H.lastIndex = 0;
		return '"' + (H.test(a1) ? a1.replace(H, function(a2) {
				var a3 = n[a2];
				return typeof a3 === "string" ? a3 : ("\\u" + z(a2.charCodeAt(0).toString(16), 4))
			}) : a1) + '"'
	}

	function ag(a8) {
		a8 = aX(a8);
		var a4 = Object.prototype.toString.call(a8);
		if (a8 ===
			void 0) {
			return
			void 0
		} else if (a8 === null || a8 instanceof Boolean || a4 === "[object Boolean]") {
			return String(a8)
		} else if ( a8 instanceof String || a4 === "[object String]") {
			return aN(a8)
		} else if ( a8 instanceof Number || a4 === "[object Number]") {
			return isFinite(a8) ? String(a8) : "null"
		} else if ( a8 instanceof Date || a4 === "[object Date]") {
			return isFinite(a8.valueOf()) ? aN(a8.getUTCFullYear() + "-" + z(a8.getUTCMonth() + 1) + "-" + z(a8.getUTCDate()) + "T" + z(a8.getUTCHours()) + ":" + z(a8.getUTCMinutes()) + ":" + z(a8.getUTCSeconds()) + "." + z(a8.getUTCMilliseconds(), 3) + "Z") : "null"
		} else if ( a8 instanceof Array || a4 === "[object Array]") {
			var a6 = [];
			for (var a5 = 0, a1 = a8.length; a5 < a1; a5++) {
				a6[a5] = ag(a8[a5]) || "null"
			}
			return "[" + a6.join(",") + "]"
		} else if (!a8) {
			return "null"
		} else {
			var a7, a6 = [], a3 = Object.hasOwnProperty;
			for (var a2 in a8) {
				a3.call(a8, a2) && ( a7 = ag(a8[a2])) && a6.push(aN(a2) + ":" + a7)
			}
			return "{" + a6.join(",") + "}"
		}
	}


	k.stringify = function(a1) {
		var a2 = ag(a1);
		return a2
	};
	k.parse = function(a2) {
		a2 = String(a2);
		if (a2) {
			aY.lastIndex = 0;
			aY.test(a2) && ( a2 = a2.replace(aY, function(a3) {
				return "\\u" + z(a3.charCodeAt(0).toString(16), 4)
			}));
			if (/^[\],:{}\s]*$/.test(a2.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, "@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, "]").replace(/(?:^|:|,)(?:\s*\[)+/g, ""))) {
				try {
					return new Function("return "+a2)()
				} catch(a1) {
					return eval("(" + a2 + ")")
				}
			}
		}
		throw new SyntaxError("JSON.parse")
	};
})();
var LIB = LIB || {};
LIB.ajax = {
	request : function(data) {
		new LIB._Ajax()._request(data);
	},
	get : function(url, success, error) {
		var data = {};
		data["url"] = url;
		data["success"] = success;
		data["error"] = error;
		new LIB._Ajax()._request(data);
	},
	post : function(url, params, success, error) {
		var data = {};
		data["url"] = url;
		data["params"] = params;
		data["success"] = success;
		data["error"] = error;
		data["type"] = "POST";
		new LIB._Ajax()._request(data);
	},
	getJSON : function(url, success, error) {
		var data = {};
		data["url"] = url;
		data["success"] = success;
		data["error"] = error;
		data["format"] = "json";
		new LIB._Ajax()._request(data);
	},
	postJSON : function(url, params, success, error) {
		var data = {};
		data["url"] = url;
		data["params"] = params;
		data["type"] = "POST";
		data["success"] = success;
		data["error"] = error;
		data["format"] = "json";
		new LIB._Ajax()._request(data);
	},
	getXML : function(url, success) {
		var data = {};
		data["url"] = url;
		data["success"] = success;
		data["error"] = error;
		data["format"] = "xml";
		new LIB._Ajax()._request(data);
	},
	postXML : function(url, params, success) {
		var data = {};
		data["url"] = url;
		data["params"] = params;
		data["type"] = "POST";
		data["success"] = success;
		data["error"] = error;
		data["format"] = "xml";
		new LIB._Ajax()._request(data);
	},
	sync : function(url, success, error) {
		var data = {};
		data["url"] = url;
		data["success"] = success;
		data["error"] = error;
		data["sync"] = true;
		new LIB._Ajax()._request(data);
	},
	load : function(url, id) {
		if (!document.getElementById(id)) {
			return false;
		}
		var data = {};
		var callBack = function(text) {
			document.getElementById(id).innerHTML = text;
		}
		data["url"] = url;
		data["success"] = callBack;
		new LIB._Ajax()._request(data);
	}
};
LIB._Ajax = function() {
	_self = this;
}
LIB._Ajax.prototype = {
	_record : function(id) {
		var msg = {
			"-4" : "url类型错误",
			"-3" : "无法获取dom元素",
			"-2" : "开始创建HttpRequest",
			"-1" : "创建HttpRequest结束",
			"0" : "open还没有调用",
			"1" : "open已经调用，send还没有调用",
			"2" : "send已经调用，但服务器还没响应",
			"3" : "正在从服务器接受数据",
			"4" : "服务器响应完成",
			"200" : "HTTP状态码200，请求成功",
			"404" : "HTTP状态码404，资源未发现"
		}
		var info = (msg[id] ? msg[id] : "未定义错误");
		LIB.err(info);
	},
	_checkURI : function(url) {
		if ( typeof url !== "string") {
			return false;
		} else {
			return true;
		}
	},
	_create : function() {
		try {
			var factories = [
				function() {
					return new ActiveXObject("Microsoft.XMLHTTP");
				},
				function() {
					return new XMLHttpRequest();
				},
				function() {
					return new ActiveXObject("Msxml2.XMLHTTP");
				}];
			for (var i = 0; i < factories.length; i++) {
				try {
					if (factories[i]()) {
						return factories[i];
					}
				} catch(e) {
					continue;
				}
			}
			return factory[0];
		} catch(e) {
			LIB.err("创建http请求异常：" + e);
		}
	}(),
	_request : function(data) {
		try {
			if (this._checkURI(data["url"]) == false)
				return;
			var url = typeof data["url"] == "string" ? data["url"] : false;
			var type = typeof data["type"] == "string" ? data["type"].toUpperCase() : "GET";
			var params = typeof data["params"] == "string" ? data["params"] : null;
			var success = typeof data["success"] == "function" ? data["success"] : this._success;
			var error = typeof data["error"] == "function" ? data["error"] : this._error;
			var format = typeof data["format"] == "string" ? data["format"] : "text";
			var req = this._create();
			var state = 0;
			var check = setTimeout(function() {
				if (state != 4) {
					req.abort();
					error("Time out!");
				}
			}, 6000);
			req.onreadystatechange = function() {
				try {
					state = req.readyState;
					if (state == 4) {
						clearTimeout(check);
						var status = req.status;
						if (status == 200 || status == 302) {
							var result;
							switch(format) {
								case"json":
									result = LIB.JSON.parse(req.responseText.replace(/[\x00-\x1F\x7F\x80-\x9F]/gi, '?'));
									break;
								case"xml":
									result = req.responseXML;
									break;
								default:
									result = req.responseText;
							}
							success(result);
						} else {
							error(status);
						}
					}
				} catch(e) {
					LIB.err("回调函数异常：" + e);
				}
			};
			req.open(type, url, data["sync"] ? false : true);
			req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			req.send(params);
		} catch(e) {
			LIB.err("异步请求异常：" + e);
		}
	},
	_success : function() {
		_self._record("200");
	},
	_error : function(status) {
		_self._record(status);
	}
}
var LIB = LIB || {};
LIB.loader = function(src, fn) {
	try {
		src = ( src instanceof Array) ? src : [src];
		var filePool = [], codePool = [], _createScript = function(src, code, hdl) {
			var _script = src, _code = code, head = document.getElementsByTagName("head")[0], script = document.createElement("script");
			script.type = "text/javascript";
			script.charset = "utf-8";
			_script ? script.src = _script : 0;
			_code ? script.text = _code : 0;
			if (hdl) {
				var IEback = function() {
					if (script.readyState == "complete" || script.readyState == "loaded") {
						hdl();
						script.onload = script.onreadystatechange = new Function();
						clearTimeout(timeHDL);
					}
				};
				var FFback = function() {
					script.readyState = "complete";
					IEback();
				}, error = function() {
					FFback();
					head.removeChild(script);
				}, timeHDL = setTimeout(function() {
					if (script.readyState != "complete") {
						error();
					}
				}, 5000);
				script.onreadystatechange = IEback;
				script.onload = FFback;
			}
			head.appendChild(script);
		}, _fn_file = function() {--_fn_file.length;
			if (_fn_file.length < 1) {
				(_fn_code.length < 1) ? ( fn ? fn() : 0) : LIB.each(codePool, function(i, code) {
					_createScript(null, code, _fn_code);
				});
			}
		}, _fn_code = function() {--_fn_code.length;
			if (_fn_code.length < 1) {
				fn ? fn() : 0;
			}
		};
		LIB.each(src, function(i, src) {
			if ( typeof src == "string") {
				(src.match(/script/i)) ? codePool.push(src.match(/<script[^>]*>(.*)?<\/script>/i)[1]) : filePool.push(src);
			} else {
				throw "Input parameter src invalid!";
			}
		});
		_fn_file.length = filePool.length;
		_fn_code.length = codePool.length;
		LIB.each(filePool, function(i, file) {
			_createScript(file, null, _fn_file);
		});
	} catch(e) {
		LIB.err("Exception in loadJS:" + e);
	}
};
var LIB = LIB || {};
LIB.log = (function() {
	var fix = [];
	return function(url) {
		var image = new Image();
		fix.push(image);
		image.onload = image.onerror = image.onabort = function() {
			image = image.onload = image.onerror = image.onabort = null;
			for (var i = 0, l = fix.length; i < l; ++i) {
				(fix[i] === image) && fix.splice(i, 1);
			}
		}
		image.src = url;
	}
})();
var LIB = LIB || {};
LIB.gray = function(str, cb) {
	var _uin = LIB.cookie.get('uin');
	try {
		if (str.indexOf(_uin.substr(_uin.length - 2, 1)) > -1) {
			('function' == typeof cb.succ) && cb.succ();
		} else {
			('function' == typeof cb.err) && cb.err();
		}
	} catch(e) {
		window.console && console.log(e);
	}
};
var hexcase = 0;
var b64pad = "";
var chrsz = 8;
function hex_md5(s) {
	return binl2hex(core_md5(str2binl(s), s.length * chrsz));
}

function b64_md5(s) {
	return binl2b64(core_md5(str2binl(s), s.length * chrsz));
}

function hex_hmac_md5(key, data) {
	return binl2hex(core_hmac_md5(key, data));
}

function b64_hmac_md5(key, data) {
	return binl2b64(core_hmac_md5(key, data));
}

function calcMD5(s) {
	return binl2hex(core_md5(str2binl(s), s.length * chrsz));
}

function md5_vm_test() {
	return hex_md5("abc") == "900150983cd24fb0d6963f7d28e17f72";
}

function core_md5(x, len) {
	x[len >> 5] |= 0x80 << ((len) % 32);
	x[(((len + 64) >>> 9) << 4) + 14] = len;
	var a = 1732584193;
	var b = -271733879;
	var c = -1732584194;
	var d = 271733878;
	for (var i = 0; i < x.length; i += 16) {
		var olda = a;
		var oldb = b;
		var oldc = c;
		var oldd = d;
		a = md5_ff(a, b, c, d, x[i + 0], 7, -680876936);
		d = md5_ff(d, a, b, c, x[i + 1], 12, -389564586);
		c = md5_ff(c, d, a, b, x[i + 2], 17, 606105819);
		b = md5_ff(b, c, d, a, x[i + 3], 22, -1044525330);
		a = md5_ff(a, b, c, d, x[i + 4], 7, -176418897);
		d = md5_ff(d, a, b, c, x[i + 5], 12, 1200080426);
		c = md5_ff(c, d, a, b, x[i + 6], 17, -1473231341);
		b = md5_ff(b, c, d, a, x[i + 7], 22, -45705983);
		a = md5_ff(a, b, c, d, x[i + 8], 7, 1770035416);
		d = md5_ff(d, a, b, c, x[i + 9], 12, -1958414417);
		c = md5_ff(c, d, a, b, x[i + 10], 17, -42063);
		b = md5_ff(b, c, d, a, x[i + 11], 22, -1990404162);
		a = md5_ff(a, b, c, d, x[i + 12], 7, 1804603682);
		d = md5_ff(d, a, b, c, x[i + 13], 12, -40341101);
		c = md5_ff(c, d, a, b, x[i + 14], 17, -1502002290);
		b = md5_ff(b, c, d, a, x[i + 15], 22, 1236535329);
		a = md5_gg(a, b, c, d, x[i + 1], 5, -165796510);
		d = md5_gg(d, a, b, c, x[i + 6], 9, -1069501632);
		c = md5_gg(c, d, a, b, x[i + 11], 14, 643717713);
		b = md5_gg(b, c, d, a, x[i + 0], 20, -373897302);
		a = md5_gg(a, b, c, d, x[i + 5], 5, -701558691);
		d = md5_gg(d, a, b, c, x[i + 10], 9, 38016083);
		c = md5_gg(c, d, a, b, x[i + 15], 14, -660478335);
		b = md5_gg(b, c, d, a, x[i + 4], 20, -405537848);
		a = md5_gg(a, b, c, d, x[i + 9], 5, 568446438);
		d = md5_gg(d, a, b, c, x[i + 14], 9, -1019803690);
		c = md5_gg(c, d, a, b, x[i + 3], 14, -187363961);
		b = md5_gg(b, c, d, a, x[i + 8], 20, 1163531501);
		a = md5_gg(a, b, c, d, x[i + 13], 5, -1444681467);
		d = md5_gg(d, a, b, c, x[i + 2], 9, -51403784);
		c = md5_gg(c, d, a, b, x[i + 7], 14, 1735328473);
		b = md5_gg(b, c, d, a, x[i + 12], 20, -1926607734);
		a = md5_hh(a, b, c, d, x[i + 5], 4, -378558);
		d = md5_hh(d, a, b, c, x[i + 8], 11, -2022574463);
		c = md5_hh(c, d, a, b, x[i + 11], 16, 1839030562);
		b = md5_hh(b, c, d, a, x[i + 14], 23, -35309556);
		a = md5_hh(a, b, c, d, x[i + 1], 4, -1530992060);
		d = md5_hh(d, a, b, c, x[i + 4], 11, 1272893353);
		c = md5_hh(c, d, a, b, x[i + 7], 16, -155497632);
		b = md5_hh(b, c, d, a, x[i + 10], 23, -1094730640);
		a = md5_hh(a, b, c, d, x[i + 13], 4, 681279174);
		d = md5_hh(d, a, b, c, x[i + 0], 11, -358537222);
		c = md5_hh(c, d, a, b, x[i + 3], 16, -722521979);
		b = md5_hh(b, c, d, a, x[i + 6], 23, 76029189);
		a = md5_hh(a, b, c, d, x[i + 9], 4, -640364487);
		d = md5_hh(d, a, b, c, x[i + 12], 11, -421815835);
		c = md5_hh(c, d, a, b, x[i + 15], 16, 530742520);
		b = md5_hh(b, c, d, a, x[i + 2], 23, -995338651);
		a = md5_ii(a, b, c, d, x[i + 0], 6, -198630844);
		d = md5_ii(d, a, b, c, x[i + 7], 10, 1126891415);
		c = md5_ii(c, d, a, b, x[i + 14], 15, -1416354905);
		b = md5_ii(b, c, d, a, x[i + 5], 21, -57434055);
		a = md5_ii(a, b, c, d, x[i + 12], 6, 1700485571);
		d = md5_ii(d, a, b, c, x[i + 3], 10, -1894986606);
		c = md5_ii(c, d, a, b, x[i + 10], 15, -1051523);
		b = md5_ii(b, c, d, a, x[i + 1], 21, -2054922799);
		a = md5_ii(a, b, c, d, x[i + 8], 6, 1873313359);
		d = md5_ii(d, a, b, c, x[i + 15], 10, -30611744);
		c = md5_ii(c, d, a, b, x[i + 6], 15, -1560198380);
		b = md5_ii(b, c, d, a, x[i + 13], 21, 1309151649);
		a = md5_ii(a, b, c, d, x[i + 4], 6, -145523070);
		d = md5_ii(d, a, b, c, x[i + 11], 10, -1120210379);
		c = md5_ii(c, d, a, b, x[i + 2], 15, 718787259);
		b = md5_ii(b, c, d, a, x[i + 9], 21, -343485551);
		a = safe_add(a, olda);
		b = safe_add(b, oldb);
		c = safe_add(c, oldc);
		d = safe_add(d, oldd);
	}
	return Array(a, b, c, d);
}

function md5_cmn(q, a, b, x, s, t) {
	return safe_add(bit_rol(safe_add(safe_add(a, q), safe_add(x, t)), s), b);
}

function md5_ff(a, b, c, d, x, s, t) {
	return md5_cmn((b & c) | ((~b) & d), a, b, x, s, t);
}

function md5_gg(a, b, c, d, x, s, t) {
	return md5_cmn((b & d) | (c & (~d)), a, b, x, s, t);
}

function md5_hh(a, b, c, d, x, s, t) {
	return md5_cmn(b ^ c ^ d, a, b, x, s, t);
}

function md5_ii(a, b, c, d, x, s, t) {
	return md5_cmn(c ^ (b | (~d)), a, b, x, s, t);
}

function core_hmac_md5(key, data) {
	var bkey = str2binl(key);
	if (bkey.length > 16)
		bkey = core_md5(bkey, key.length * chrsz);
	var ipad = Array(16), opad = Array(16);
	for (var i = 0; i < 16; i++) {
		ipad[i] = bkey[i] ^ 0x36363636;
		opad[i] = bkey[i] ^ 0x5C5C5C5C;
	}
	var hash = core_md5(ipad.concat(str2binl(data)), 512 + data.length * chrsz);
	return core_md5(opad.concat(hash), 512 + 128);
}

function safe_add(x, y) {
	var lsw = (x & 0xFFFF) + (y & 0xFFFF);
	var msw = (x >> 16) + (y >> 16) + (lsw >> 16);
	return (msw << 16) | (lsw & 0xFFFF);
}

function bit_rol(num, cnt) {
	return (num << cnt) | (num >>> (32 - cnt));
}

function str2binl(str) {
	var bin = Array();
	var mask = (1 << chrsz) - 1;
	for (var i = 0; i < str.length * chrsz; i += chrsz)
		bin[i >> 5] |= (str.charCodeAt(i / chrsz) & mask) << (i % 32);
	return bin;
}

function binl2hex(binarray) {
	var hex_tab = hexcase ? "0123456789ABCDEF" : "0123456789abcdef";
	var str = "";
	for (var i = 0; i < binarray.length * 4; i++) {
		str += hex_tab.charAt((binarray[i >> 2] >> ((i % 4) * 8 + 4)) & 0xF) + hex_tab.charAt((binarray[i >> 2] >> ((i % 4) * 8)) & 0xF);
	}
	return str;
}

function binl2b64(binarray) {
	var tab = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
	var str = "";
	for (var i = 0; i < binarray.length * 4; i += 3) {
		var triplet = (((binarray[i >> 2] >> 8 * (i % 4)) & 0xFF) << 16) | (((binarray[i + 1 >> 2] >> 8 * ((i + 1) % 4)) & 0xFF) << 8) | ((binarray[i + 2 >> 2] >> 8 * ((i + 2) % 4)) & 0xFF);
		for (var j = 0; j < 4; j++) {
			if (i * 8 + j * 6 > binarray.length * 32)
				str += b64pad;
			else
				str += tab.charAt((triplet >> 6 * (3 - j)) & 0x3F);
		}
	}
	return str;
}

var FRIEND_LIST;
(function() {
	var $ = function(id) {
		return document.getElementById(id);
	}, htmlcode = function(str, isdecode) {
		var ar = ['&', '&amp;', '<', '&lt;', '>', '&gt;', ' ', '&nbsp;', '"', '&quot;', "'", '&#39;', '\\r', '<br>', '\\n', '<br>'];
		if (isdecode)
			ar.reverse();
		for (var i = 0, r = str; i < ar.length; i += 2)
			r = r.replace(new RegExp(ar[i], 'g'), ar[1 + i]);
		return r;
	}, create = function() {
		var xhr;
		if (window.XMLHttpRequest) {
			xhr = new XMLHttpRequest();
		} else {
			try {
				xhr = new ActiveXObject("Msxml2.XMLHttp")
			} catch(e) {
				xhr = new ActiveXObject("Microsoft.XMLHttp")
			}
		}
		return xhr;
	}, hdl = function(result) {
		var list = ['<div class="f_list">'], content = result.split("&")[0].split("=")[1], div = document.createElement("div"), groups = content.split(",");
		FRIEND_LIST.value = content;
		if (uin) {
			var _myTitle = '自己(' + uin + ')';
			list.push('<ul style="float: none;" id="group_self"><li qq="' + uin + '" name="自己" title="' + _myTitle + '"><a href="javascript:void(0);" onclick="FRIEND_LIST.friend(this.parentNode);">' + _myTitle + '</a></li></ul>');
		}
		for (var i = 0; i < groups.length; i++) {
			if (groups[i].length == 0)
				continue;
			var group_arr = groups[i].split("|"), groupName = htmlcode(decodeURIComponent(group_arr[0].replace(/\n|\r/g, ''))) || "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";

			list.push("<div class='f_group_close' index='" + i + "'><a href='javascript:void(0);' onclick='FRIEND_LIST.group(this.parentNode);'>" + groupName + "</a></div>");
			list.push("<ul style='display:none;float:none' id='group_" + i + "'>");
			try {
				var friendInGroup = group_arr[1].split("+");
				if (friendInGroup.length > 1) {
					for (var j = 0; j < friendInGroup.length; j += 2) {
						var friendName = htmlcode(decodeURIComponent(friendInGroup[j + 1]).replace(/\n|\r/g, '')) || "&nbsp;&nbsp;&nbsp;&nbsp;";
						var friendQQ = friendInGroup[j];
						list.push("<li qq='" + friendQQ + "' name='" + friendName + "' title='" + friendName + "(" + friendQQ + ")" + "'><a href='javascript:void(0);' onclick='FRIEND_LIST.friend(this.parentNode);'>" + friendName + "(" + friendQQ + ")</a></li>");
					}
				}
			} catch(e) {
			}
			list.push("</ul>");
		}
		list.push("</div>");
		wrap.innerHTML = list.join("");
		addEvent(ipt, "keyup", FRIEND_LIST.search);
		addEvent(ipt, "keydown", function(e) {
			if (search.style.display != "none" && e.keyCode == 13) {
				e.preventDefault && e.preventDefault();
				e.returnValue = false;
			}
		});
		if (typeof FRIEND_LIST.onLoaded === 'function') {
			try {
				FRIEND_LIST.onLoaded(content);
			} catch(e) {

			}
		}
	}, ipt, wrap, search, uin;
	FRIEND_LIST = function(_ipt, _wrap, _search, _uin) {
		uin = _uin;
		ipt = $(_ipt);
		wrap = $(_wrap);
		search = $(_search);
		xhr = create();
		xhr.onreadystatechange = function(text) {
			if (xhr.readyState == 4) {
				hdl(xhr.responseText)
			}
		};
		xhr.open("GET", "/cgi-bin/personal/get_user_friends.cgi?sck="+hex_md5(LIB.cookie.get('skey'))+"&t=" + Math.random(), true);
		xhr.send(null);
	};
	FRIEND_LIST.onLoaded = function() {};
	FRIEND_LIST.group = function(elem) {
		var i = elem.getAttribute("index"), group = $("group_" + i), a = ["f_group_close", "f_group_open"], b = ["none", ""]
		j = elem.className == "f_group_close" ? 1 : 0;
		elem.className = a[j];
		group.style.display = b[j];
	};
	FRIEND_LIST.friend = function(elem) {
		ipt.value = elem.getAttribute("qq");
		ipt.onchoose && ipt.onchoose();
		wrap.style.display = "none";
		search.style.display = "none";
	};
	var index, count, setSearchIndex = function(ind) {
		for (var i = 0; i < count; i++) {
			var elem = $("li_qq" + (i + 1));
			if (elem && i + 1 == ind) {
				elem.className = "f_search_cur_li"
			} else {
				elem.className = ""
			};
		}
	};
	FRIEND_LIST.search = function(e) {
		var e = e || window.event;
		switch(e.keyCode) {
			case 38:
				index--;
				if (index < 1) {
					index += count;
				}
				setSearchIndex(index);
				e.preventDefault && e.preventDefault();
				e.returnValue = false;
				return;
			case 40:
				index++;
				if (index > count) {
					index -= count;
				}
				setSearchIndex(index);
				e.preventDefault && e.preventDefault();
				e.returnValue = false;
				return;
			case 13:
				if (search.style.display != "none") {
					var elem = $("li_qq" + index);
					FRIEND_LIST.friend(elem);
					e.preventDefault && e.preventDefault();
					e.returnValue = false;
				}
				return;
		}
		wrap.style.display = "none";
		var val = ipt.value;
		if (val.length < 1) {
			wrap.style.display = '';
			search.style.display = 'none';
			search.innerHTML = "";
			return;
		}
		var li = wrap.getElementsByTagName("li"), len = li.length, list = ['<div class="f_list f_search"><ul style="float:none">'];
		count = 0, index = 1;
		var regQuote = function(str) {
			return str.replace(/([\.\\\+\*\?\[\^\]\$\(\)\{\}\=\!\<\>\|\:\-])/g, "\\$1");
		}
		for (var i = 0; i < len; i++) {
			var qq = li[i].getAttribute("qq"), regqq = new RegExp("^" + regQuote(val) + "\\d*"), name = li[i].getAttribute("name"), regname = new RegExp(regQuote(val));
			if ((qq && qq.match(regqq)) || (name && name.match(regname))) {
				count++;
				list.push("<li qq='" + qq + "' id='li_qq" + (count) + "'>" + li[i].innerHTML + "</li>");
			}
			if (count > 4) {
				break;
			}
		}

		list.push("</ul></div>");
		search.innerHTML = list.join("");
		if (count > 0) {
			setSearchIndex(1);
			search.style.display = "";
		} else {
			search.style.display = "none";
		}
	};
	var addEvent = function(elem, type, func) {
		if (elem.addEventListener) {
			elem.addEventListener(type, func, false);
		} else {
			elem.attachEvent("on" + type, func);
		}
	};
})();
var LIB = LIB || {};
LIB.loginJump = function(url, type, isNewWin, returnUrl) {
	type = type || 'ptlogin';
	isNewWin = isNewWin || true;
	var jumpUrl = type === "ptlogin" ? "http://ptlogin2.qq.com/jump?clientuin=" + LIB.cookie.get("uin").substring(1) + "&skey=" + LIB.cookie.get("skey") + "&u1=" + encodeURIComponent(url) : "https://www.tenpay.com/cgi-bin/v1.0/communitylogin.cgi?p_uin=" + LIB.cookie.get("uin") + "&skey=" + LIB.cookie.get("skey") + "&u1=" + encodeURIComponent(url);
	if (returnUrl) {
		return jumpUrl;
	}
	isNewWin ? window.open(jumpUrl) : (window.location.href = jumpUrl);
};
var LIB = LIB || {};
LIB.ua = (function() {
	var _ua = {}, _agent = navigator.userAgent, _nv = navigator.appVersion, _r, _m;
	if (window.ActiveXObject) {
		_ua.ie = 6;
		(window.XMLHttpRequest || (_agent.indexOf('MSIE 7.0') > -1)) && (_ua.ie = 7);
		(window.XDomainRequest || (_agent.indexOf('Trident/4.0') > -1)) && (_ua.ie = 8);
		(_agent.indexOf('Trident/5.0') > -1) && (_ua.ie = 9);
		(_agent.indexOf('Trident/6.0') > -1) && (_ua.ie = 10);
		_ua.isBeta = (navigator.appMinorVersion && navigator.appMinorVersion.toLowerCase().indexOf('beta') > -1);
	} else if (document.getBoxObjectFor || 'undefined' != typeof window.mozInnerScreenX) {
		_r = /(?:Firefox|GranParadiso|Iceweasel|Minefield).(\d+\.\d+)/i;
		_ua.firefox = parseFloat((_r.exec(_agent)||_r.exec('Firefox/3.3'))[1], 10);
	} else if (!navigator.taintEnabled) {
		_m = /AppleWebKit.(\d+\.\d+)/i.exec(_agent);
		_ua.webkit = _m ? parseFloat(_m[1], 10) : (document.evaluate ? (document.querySelector ? 525 : 420) : 419);
		if (( _m = /Chrome.(\d+\.\d+)/i.exec(_agent)) || window.chrome) {
			_ua.chrome = _m ? parseFloat(_m[1], 10) : '2.0';
		} else if (( _m = /Version.(\d+\.\d+)/i.exec(_agent)) || window.safariHandler) {
			_ua.safari = _m ? parseFloat(_m[1], 10) : '3.3';
		}
		_ua.air = (_agent.indexOf('AdobeAIR') > -1 ? 1 : 0);
		_ua.isiPod = (_agent.indexOf('iPod') > -1);
		_ua.isiPad = (_agent.indexOf('iPad') > -1);
		_ua.isiPhone = (_agent.indexOf('iPhone') > -1);
	} else if (window.opera) {
		_ua.opera = parseFloat(window.opera.version(), 10);
	} else {
		_ua.ie = 6;
	}
	if (!(_ua.macs = _agent.indexOf('Mac OS X') > -1)) {
		_ua.windows = (( _m = /Windows.+?(\d+\.\d+)/i.exec(_agent)), _m && parseFloat(_m[1], 10));
		_ua.linux = (_agent.indexOf('Linux') > -1);
		_ua.android = (_agent.indexOf('Android') > -1);
	}
	_ua.iOS = (_agent.indexOf('iPhone OS') > -1);
	return _ua;
})();
var LIB = LIB || {};
LIB.getUrlParam = function(name, _src) {
	var src = _src || ((LIB.ua.ie==6||LIB.ua.ie==7)?document.URL:window.location.href);
	if (name && src) {
		var r = new RegExp("(\\?|#|&)" + name + "=([^&^#]*)(#|&|$)");
		var m = src.match(r);
		return !m ? "" : m[2];
	}
	return "";
};
var LIB = LIB || {};
LIB.pv = function(p) {
	if ( typeof p.type === "undefined" || typeof p.service_code === "undefined") {
		return;
	}
	var _conf_channel = {
		'qd' : 170029,
		'qb' : 170029,
		'cft' : 170030,
		'cftCB' : 170030,
		'bank' : 170031,
		'kj' : 170031,
		'qqcard' : 170032,
		'scard' : 170033,
		'creditcard' : 170034,
		'charge' : 170035,
		'qdqb_minipay' : 170099,
		'qd_aid' : 170100,
		'qb_aid' : 170100,
		'cft_aid' : 170101,
		'bank_aid' : 170102
	}, _conf_service = {
		'pay.qzone' : 16,
		'other.aid' : 99,
		'act.czhmckensey' : 11,
		'act.czh' : 12,
		'act.czhgame' : 13,
		'zone.tbarshuang' : 14,
		'toucanl.zsite.new' : 15,
		'cft' : 11,
		'bank' : 12,
		'qqcard' : 13,
		'cft_minipay' : 14,
		'bank_minipay' : 15,
		'qqcard_minipay' : 16,
		'qqpacket' : 11,
		'ltmclub' : 12,
		'xxjzgw' : 13,
		'xxqgame' : 14,
		'xxqqf' : 15,
		'xxzxyy' : 16,
		'dnfhz' : 17,
		'qqfczz' : 18,
		'petvip' : 19,
		'qqxwzz' : 20,
		'xxvip' : 21,
		'cfclub' : 22,
		'qqr2by' : 23,
		'xxqqt' : 24,
		'qqbookby' : 25,
		'xxsqqm' : 26,
		'avavip' : 27,
		'mzyff' : 28,
		'mhvip' : 29,
		'xyvip' : 30,
		'nbavip' : 31,
		'qsbyqz' : 32,
		'xxzxgp' : 33,
		'txsp' : 34,
		'dsyqby' : 35,
		'xsby' : 36,
		'xxjzghh' : 37,
		'czjrby' : 38
	}, _param = {
		flag1 : _conf_channel[p.type],
		flag2 : 1,
		flag3 : _conf_service[p.service_code] || 99,
		flag4 : LIB.cookie.get('uin').substring(1) * 1,
		1 : 1,
		2 : 1
	}, _arr = ['http://isdspeed.qq.com/cgi-bin/v.cgi?rr=' + Math.random()];
	for (var i in _param) {
		_arr.push(i + '=' + _param[i]);
	}
	p.timeout ? setTimeout(function() {
		parent.LIB.log(_arr.join('&'));
	}, p.timeout) : parent.LIB.log(_arr.join('&'));
};
LIB.stat = function() {
};
LIB.uuid = function(len, radix){
	var CHARS = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".split('');
	var chars = CHARS, uuid = [], i;
	radix = radix || chars.length;

	if (len) {
		for ( i = 0; i < len; i++)
			uuid[i] = chars[0 | Math.random() * radix];
	} else {
		var r;

		uuid[8] = uuid[13] = uuid[18] = uuid[23] = '-';
		uuid[14] = '4';

		for ( i = 0; i < 36; i++) {
			if (!uuid[i]) {
				r = 0 | Math.random() * 16;
				uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r];
			}
		}
	}
	return uuid.join('');
};

//TODO: to invoke cgi from unipay
LIB._aes = function(args, params,isSandbox){
	//算aes加密
	var aesMsg = [], _aeskey = isSandbox?'0269bd8009164afc':'2Wozy2aksie1puXU';
	for(var i= 0,l=params.length;i<l;++i){
		for(var k in args){
			if (k==params[i]){
				aesMsg.push(k + '=' + encodeURIComponent(args[k] || ''));
			}
		}
	}
	aesMsg = aesMsg.join('&');
	var encrypted = CryptoJS.AES.encrypt(CryptoJS.enc.Latin1.parse(aesMsg), CryptoJS.enc.Latin1.parse(_aeskey), {
		padding : CryptoJS.pad.ZeroPadding,
		iv : CryptoJS.enc.Latin1.parse(_aeskey),
		mode : CryptoJS.mode.ECB
	}).ciphertext.toString(CryptoJS.enc.Hex);
	return {
		encrypt_msg : encrypted,
		msg_len : aesMsg.length
	}
};

LIB._getSessionParam = function(_callback_name){
	return {
		aid4open:LIB.getUrlParam('aid')||'',
		pf: 'vip_m-pay_html5-html5',
		pfkey: 'pfkey',
		from_h5: 1,
		from_https : 1,
		session_token: '',
		r: Math.random(),
		openid : IPAY.uin,//ipay
		openkey : LIB.cookie.get('skey'),
		session_id : 'uin',
		session_type : 'skey',
		format:'jsonp_'+_callback_name
	};
};

LIB._params = function(params){
	params = params || {};
	var gets = [];
	for(var k in params){
		gets.push(k+'='+encodeURIComponent(params[k]));
	}
	return gets.join('&');
};

LIB._cgi = {
	wechat_query : function(opts, cb){
		opts = opts || {};

		var _params = {}, _name = '_wechat_query',env="";

        if (opts.sandbox == 1) {
            env = "sandbox."
        }
        else if (opts.sandbox == 2) {
            env = "dev."
        }
        else if (opts.sandbox == 3) {
            env = "testing."
        }

		$.extend(_params, LIB._getSessionParam(_name));

		window[_name] = function(results){
			'function' === typeof cb && cb(results);
		};

		$.extend(_params, opts);

		$.extend(_params, LIB._aes(_params, ['openid', 'openkey', 'session_id', 'session_type']));

		IPAY.getScript(location.protocol+'//'+(env)+'api.unipay.qq.com/v1/r/'+LIB.appid+'/wechat_query?'+ LIB._params(_params));//ipay
	},
	mobile_get_token : function(opts, cb){
		opts = opts || {};
		var methodName = '_mobileGetToken',env="", param = {
			format: 'jsonp_' + methodName
		};

        if (opts.sandbox == 1) {
            env = "sandbox."
        }
        else if (opts.sandbox == 2) {
            env = "dev."
        }
        else if (opts.sandbox == 3) {
            env = "testing."
        }
		window[methodName] = function(results){
			if (results.ret == 1018||results.ret == 1002) {
				IPAY.login();
			} else {
				'function' === typeof cb && cb(results);
			}
		};

		$.extend(param, LIB._getSessionParam(methodName));

		$.extend(param, opts);

		$.extend(param, LIB._aes(param, ['openid', 'openkey', 'session_id', 'session_type'],opts.sandbox));

		IPAY.getScript(location.protocol+'//'+(env)+'api.unipay.qq.com/v1/r/'+LIB.appid+'/mobile_get_token?'+ LIB._params(param));//ipay
	},
	mobile_save : function(opts, cb){
		opts = opts || {};
		var methodName = '_mobileSave',env="", param = {
			format: 'jsonp_' + methodName
		};

        if (opts.sandbox == 1) {
            env = "sandbox."
        }
        else if (opts.sandbox == 2) {
            env = "dev."
        }
        else if (opts.sandbox == 3) {
            env = "testing."
        }
		window[methodName] = function(results){
			//TODO: to hack results for uniform_pay's format

			results.result = results.ret;
			results.next_hop = (results.ret == 0)?results.info.cfturl:'';
			results.error_code_list = results.err_code;
			results.result_info = results.msg||'';

			'function' === typeof cb && cb(results);
		};

		$.extend(param, LIB._getSessionParam(methodName));
		$.extend(param, opts);
		$.extend(param, LIB._aes(param, ['token_id', 'openid', 'openkey', 'session_id', 'session_type', 'zoneid', 'pay_method', 'buy_quantity', 'mb_pwd', 'pay_id', 'auth_key', 'card_value', 'accounttype'],opts.sandbox));

		IPAY.getScript(location.protocol+'//'+(env)+'api.unipay.qq.com/v1/r/'+LIB.appid+'/mobile_save?'+ LIB._params(param));//ipay
	}
};