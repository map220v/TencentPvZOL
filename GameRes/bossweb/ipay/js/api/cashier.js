(function () {
    var apiName = 'cashier',
        thisAPI = window[apiName] = {},

        INFO = thisAPI.INFO = {isp: ''},
        VER = INFO.ver = {
            dialog: 1,
            api: 1
        };

    /***********************************LIB***********************************/
    var LIB = thisAPI.LIB = {};
    LIB.ua = (function () {
        var aY = {},
            aZ = navigator.userAgent,
            aX = navigator.appVersion,
            aW;
        if (window.ActiveXObject) {
            aY.ie = 6;
            (window.XMLHttpRequest || (aZ.indexOf("MSIE 7.0") >= 0)) && (aY.ie = 7);
            (window.XDomainRequest || (aZ.indexOf("Trident/4.0") >= 0)) && (aY.ie = 8);
            (aZ.indexOf("Trident/5.0") >= 0) && (aY.ie = 9);
            (aZ.indexOf("Trident/6.0") >= 0) && (aY.ie = 10)
        } else if (document.getBoxObjectFor || typeof(window.mozInnerScreenX) != "undefined") {
            aW = /(?:Firefox|GranParadiso|Iceweasel|Minefield).(\d+\.\d+)/i.exec(aZ);
            aY.firefox = aW ? parseFloat(aW[1], 10) : 3.3
        } else if (!navigator.taintEnabled) {
            aW = /AppleWebKit.(\d+\.\d+)/i.exec(aZ);
            aY.webkit = aW ? parseFloat(aW[1], 10) : (document.evaluate ? (document.querySelector ? 525 : 420) : 419);
            if ((aW = /Chrome.(\d+\.\d+)/i.exec(aZ)) || window.chrome) {
                aY.chrome = aW ? parseFloat(aW[1], 10) : 2
            } else if ((aW = /Version.(\d+\.\d+)/i.exec(aZ)) || window.safariHandler) {
                aY.safari = aW ? parseFloat(aW[1], 10) : 3.3
            }
        } else if (window.opera) {
            aY.opera = parseFloat(window.opera.version(), 10)
        }
        aW = /CPU.+?OS (\d+(?:_\d+)?).+?like Mac OS X/i.exec(aZ);
        if (aZ.indexOf("iPod") >= 0) {
            aY.iPod = aW ? parseFloat(aW[1].replace(/_/g, "."), 10) : 1
        } else if (aZ.indexOf("iPhone") >= 0) {
            aY.iPhone = aW ? parseFloat(aW[1].replace(/_/g, "."), 10) : 1
        } else if (aZ.indexOf("iPad") >= 0) {
            aY.iPad = aW ? parseFloat(aW[1].replace(/_/g, "."), 10) : 1
        } else if (aZ.indexOf("Macintosh") >= 0 || aZ.indexOf("OS X") >= 0) {
            aW = /(?:Mac )?OS X (\d+(?:_\d+)?)/i.exec(aZ);
            aY.mac = aW ? parseFloat(aW[1].replace(/_/g, "."), 10) : 1
        } else if (aZ.indexOf("Window") >= 0) {
            aW = /Windows NT (\d+(?:\.\d+)?)/i.exec(aZ);
            aY.windows = aW ? parseFloat(aW[1], 10) : 1
        } else if (aZ.indexOf("Android") >= 0) {
            aW = /Android (\d+(?:\.\d+)?)/i.exec(aZ);
            aY.android = aW ? parseFloat(aW[1], 10) : 1
        } else if (aZ.indexOf("Linux") >= 0) {
            aY.linux = 1
        }
        return aY
    })();

    LIB.fontFamily = LIB.ua.mac ? '"Helvetica Neue",Helvetica,"Hiragino Sans GB",Arial,sans-serif' : LIB.ua.windows && LIB.ua.windows >= 6 ? '"Microsoft Yahei",Tohama' : "Tahoma";

    LIB.err = function () {
        // window.console && console.error && Function.prototype.apply.call(console.error, console, Array.prototype.slice.call(arguments, 0));
        // typeof arguments[0] == "string" && alert(arguments[0])
    };

    LIB.warn = function () {
        // window.console && console.warn && Function.prototype.apply.call(console.warn, console, Array.prototype.slice.call(arguments, 0))
    };

    LIB.log = function () {
        // window.console && console.log && Function.prototype.apply.call(console.log, console, Array.prototype.slice.call(arguments, 0))
    };

    LIB.getIntRandom = function () {
        return Math.round(Math.random() * new Date().getTime()) % 9000000000 + 1000000000
    };

    LIB.setTimeout = function (callback, timeout, context, args) {
        return setTimeout(function () {
            callback.apply(context, args || [])
        }, timeout)
    };

    LIB.clearTimeout = function (aW) {
        clearTimeout(aW)
    };

    LIB.cookie = {
        get: function (name) {
            var ret = document.cookie.match(new RegExp("(?:^|;\\s)" + name + "=(.*?)(?:;\\s|$)"));
            return ret ? ret[1] : "";
        },
        set: function (key, value, opt) {
            var _date = new Date(),
                _domain = opt.domain || "pay.qq.com",
                _path = opt.path || "/",
                _time_gap = opt.time || 10 * 365 * 24 * 3600 * 1000;
            _date.setTime(_date.getTime() + _time_gap);
            document.cookie = key + "=" + value + "; path=" + _path + "; domain=" + _domain + "; expires=" + _date.toUTCString();
        },
        del: function (key, opt) {
            var _opt = opt || {};
            _opt.time = -new Date();
            LIB.cookie.set(key, '', _opt);
        }
    };

    LIB.each = function (obj, callback) {
        if (obj instanceof Array) {
            for (var i = 0, ll = obj.length; i < ll; i++) {
                callback(i, obj[i]);
            }
        } else if (obj instanceof Object) {
            for (var i in obj) {
                callback(i, obj[i]);
            }
        }
    };
    LIB.logData = function(_opts){
        if (typeof _opts !== 'object')return;
        var _optsArray = [],val='';
        try {
            for (var _k in _opts) {
                if (_opts.hasOwnProperty(_k)) {
                    val = _opts[_k];
                    if (typeof val == 'object') {
                        var names = [];
                        for (var _t in val) {
                            if (val.hasOwnProperty(_t)) {
                                names.push(_t + "=" + (typeof val[_t] !== 'function' ? val[_t] : ''));
                            }
                        }
                        val = names.join("&");
                    }
                    _optsArray.push(_k + '=' + encodeURIComponent(val));
                }
            }
            LIB.report('//api.unipay.qq.com/v1/900/15499/log_data?num=1&record0=' + _optsArray.join('|') + '&_rr' + Math.random());
        }catch(e){

        }
    };
    LIB.report = (function () {
        var fix = [];
        return function (url) {
            var image = new Image();
            fix.push(image);
            image.onload = image.onerror = image.onabort = function () {
                image = image.onload = image.onerror = image.onabort = null;
                for (var i = 0, l = fix.length; i < l; ++i) {
                    (fix[i] === image) && fix.splice(i, 1);
                }
            };
            image.src = url;
        }
    })();

    var eventQueue = [];
    LIB.attachEvent = function (a0, aZ, aY, aW) {
        if (!a0 || !aZ || typeof aY != "function") {
            return
        }
        aW = aW || {};
        aW.win = aW.win || window;
        var aX = function (a1) {
            aY.apply(aW.self, [a1 || win.event].concat(aW.args || []))
        };
        eventQueue.push({
            el: a0,
            type: aZ,
            cfn: aX,
            fn: aY
        });
        a0.attachEvent ? a0.attachEvent("on" + aZ, aX) : a0.addEventListener && a0.addEventListener(aZ, aX, false)
    };

    LIB.attachCrossEvent = function (a1, a0, aZ, a2, aX) {
        if (!a1 || !a0 || typeof aZ != "function" || !a2) {
            return
        }
        if (a2 == window) {
            return LIB.attachEvent(a1, a0, aZ, aX)
        }
        aX = aX || {};
        var aW = LIB.getIntRandom();
        while (e[aW]) {
            aW = LIB.getIntRandom()
        }
        e[aW] = {
            fn: aZ,
            opt: aX
        };
        a2["_CASH_CROSS_EVENT_HANDLER_" + aW] = window;
        a2["_CASH_CROSS_EVENT_TARGET_" + aW] = a1;
        var aY = new a2.Function("evt", "var win=window._CASH_CROSS_EVENT_HANDLER_" + aW + ",ret=false,el=window._CASH_CROSS_EVENT_TARGET_" + aW + ";if(win&&win.parent&&win.parent!=win&&win.cash){try{ret=win.cash.LIB.fireCrossEvent(evt||window.event," + aW + ");}catch(_){}}if(!ret){el&&(el.removeEventListener?el.removeEventListener('" + a0 + "',arguments.callee,false):el.detachEvent&&el.detachEvent('on" + a0 + "',arguments.callee));try{delete window._CASH_CROSS_EVENT_HANDLER_" + aW + ";delete window._CASH_CROSS_EVENT_TARGET_" + aW + ";}catch(_){window._CASH_CROSS_EVENT_HANDLER_" + aW + "=void 0;window._CASH_CROSS_EVENT_TARGET_" + aW + "=void 0;}}");
        eventQueue.push({
            el: a1,
            type: a0,
            cfn: aY,
            fn: aZ,
            win: a2,
            id: aW
        });
        a1.attachEvent ? a1.attachEvent("on" + a0, aY) : a1.addEventListener && a1.addEventListener(a0, aY, false)
    };

    LIB.detachEvent = function (a1, a0, aZ) {
        var a2 = [];
        for (var aY = 0,
                 aX; aX = eventQueue[aY]; aY++) {
            if ((a1 && aX.el != a1) || (a0 && aX.type != a0) || (typeof aZ == "function" && aX.fn != aZ)) {
                a2.push(aX);
                continue
            }
            aX.el.detachEvent ? aX.el.detachEvent("on" + aX.type, aX.cfn) : aX.el.removeEventListener && aX.el.removeEventListener(aX.type, aX.cfn, false);
            if (aX.win && aX.id) {
                try {
                    delete aX.win["_CASH_CROSS_EVENT_HANDLER_" + aX.id];
                    delete aX.win["_CASH_CROSS_EVENT_TARGET_" + aX.id]
                } catch (aW) {
                    aX.win["_CASH_CROSS_EVENT_HANDLER_" + aX.id] = void 0;
                    aX.win["_CASH_CROSS_EVENT_TARGET_" + aX.id] = void 0
                }
            }
        }
        eventQueue = a2
    };

    LIB.getClientWidth = function (aY) {
        var aZ = aY || document,
            aW = aZ.documentElement,
            aX = aZ.body;
        return aZ.compatMode != "BackCompat" ? aW.clientWidth : LIB.ua.ie ? Math.min(aX.clientWidth, aW.clientWidth) || aX.clientWidth : aX.clientWidth
    };

    LIB.getClientHeight = function (aY) {
        var aZ = aY || document,
            aW = aZ.documentElement,
            aX = aZ.body;
        return aZ.compatMode != "BackCompat" ? aW.clientHeight : LIB.ua.ie ? Math.min(aX.clientHeight, aW.clientHeight) || aX.clientHeight : aX.clientHeight
    };

    LIB.getScrollWidth = function (aY) {
        var aZ = aY || document,
            aW = aZ.documentElement,
            aX = aZ.body;
        return aZ.compatMode != "BackCompat" ? Math.min(aX.scrollWidth, aW.scrollWidth) : LIB.ua.ie ? aX.scrollWidth : aW.scrollWidth
    };

    LIB.getScrollHeight = function (aY) {
        var aZ = aY || document,
            aW = aZ.documentElement,
            aX = aZ.body;
        return aZ.compatMode != "BackCompat" ? Math.min(aX.scrollHeight, aW.scrollHeight) : LIB.ua.ie ? aX.scrollHeight : aW.scrollHeight
    };

    LIB.getScrollLeft = function (aY) {
        var a0 = aY || document,
            aW = a0.documentElement,
            aX = a0.body,
            aZ = a0.defaultView;
        return aZ && ("pageXOffset" in aZ) ? aZ.pageXOffset : (aW.scrollLeft || aX.scrollLeft)
    };

    LIB.getScrollTop = function (aY) {
        var a0 = aY || document,
            aW = a0.documentElement,
            aX = a0.body,
            aZ = a0.defaultView;
        return aZ && ("pageXOffset" in aZ) ? aZ.pageYOffset : (aW.scrollTop || aX.scrollTop)
    };

    LIB.setScrollLeft = function (aY, aZ) {
        var a0 = aZ || document,
            aW = a0.documentElement,
            aX = a0.body;
        (a0.compatMode == "CSS1Compat" && !LIB.ua.webkit ? aW : aX).scrollLeft = +aY || 0
    };

    LIB.setScrollTop = function (aY, aZ) {
        var a0 = aZ || document,
            aW = a0.documentElement,
            aX = a0.body;
        (a0.compatMode == "CSS1Compat" && !LIB.ua.webkit ? aW : aX).scrollTop = +aY || 0
    };

    /***********************************Observer***********************************/
    var Observer = LIB.Observer = function (aW, aX) {
        this._sender = aW;
        this._timeout = +aX || 0;
        this._subscriber = [];
        this._timer = 0
    };

    Observer.prototype.subscribe = function (a1, aX, a0) {
        if (typeof a1 !== "function") {
            return false
        }
        var aW = this._subscriber;
        for (var aZ = 0,
                 aY; aY = aW[aZ]; aZ++) {
            if (aY.fn == a1) {
                return false
            }
        }
        aW.push({
            fn: a1,
            self: aX,
            context: a0
        });
        return true
    };

    Observer.prototype.unsubscribe = function (a0) {
        if (typeof a0 !== "function") {
            return false
        }
        var aX = this._subscriber,
            aW = false;
        for (var aZ = 0,
                 aY; aY = aX[aZ]; aZ++) {
            if (aY.fn == a0) {
                aW = true;
                aX = aX.slice(0, aZ).concat(aX.slice(aZ + 1));
                break
            }
        }
        if (!aW) {
            return false
        }
        this._subscriber = aX;
        return true
    };

    Observer.prototype.notify = function (aW) {
        function aX() {
            this._timer = 0;
            var aY = this._subscriber;
            for (var a0 = 0,
                     aZ; aZ = aY[a0]; a0++) {
                aZ.fn.call(aZ.self, aW, this._sender, aZ.context)
            }
        }

        if (this._timeout) {
            this._timer && LIB.clearTimeout(this._timer);
            this._timer = LIB.setTimeout(aX, this._timeout, this)
        } else {
            aX.call(this)
        }
    };

    /***********************************LIB.unload***********************************/
    LIB.unload = new Observer();
    LIB.unload.subscribe(function () {
        LIB.detachEvent()
    });

    var unloadEventName = LIB.ua.chrome || LIB.ua.opera ? "beforeunload" : "unload";

    function onUnloaded() {
        LIB.unload.notify()
    }

    window.attachEvent ? window.attachEvent("on" + unloadEventName, onUnloaded) : window.addEventListener && window.addEventListener(unloadEventName, onUnloaded, false);
    LIB.unload.subscribe(function () {
        if (window[apiName]) {
            try {
                delete window[apiName];
            } catch (aW) {
                window[apiName] = void 0;
            }
        }
        window.detachEvent ? window.detachEvent("on" + unloadEventName, onUnloaded) : window.removeEventListener && window.removeEventListener(unloadEventName, onUnloaded, false)
    });

    /***********************************ReadyCall***********************************/
    var ReadyCall = LIB.ReadyCall = function () {
        this.isReady = false;
        this._onReady = new Observer(this);
        this._first = true;
        this._onFirst = new Observer(this)
    };

    ReadyCall.prototype.onReady = function (aW) {
        this.isReady ? aW() : this._onReady.subscribe(aW);
        if (this._first) {
            this._onFirst.notify();
            this._first = false
        }
    };

    ReadyCall.prototype.ready = function () {
        if (!this.isReady) {
            this.isReady = true;
            this._onReady.notify()
        }
    };

    ReadyCall.prototype.onFirst = function (aW) {
        this._onFirst.subscribe(aW)
    };

    /***********************************Stat&Report***********************************/
    LIB.timeBasedRate = function () {
    };
    LIB.valueStat = function () {
    };
    LIB.reportException = function () {
    };
    LIB.encodeURI = function (aW) {
        return aW ? (aW + "").replace(/\%/g, "%25").replace(/\+/g, "%2B").replace(/ /g, "%20").replace(/\?/g, "%3F").replace(/#/g, "%23").replace(/&/g, "%26").replace(/=/g, "%3D").replace(/"/g, "%22") : ""
    };

    /***********************************LIB.domReady***********************************/
    var clientIndex = LIB.getIntRandom(),
        readyClients = {};
    LIB.domReady = function (a3, a0) {
        a0 = a0 || window;
        var aW = a0.document, aX, aY;
        if (aW.readyState == "complete" || aW.readyState == "interactive") {
            aW.body ? typeof a3 == "function" && a3() : LIB.setTimeout(LIB.domReady, 0, LIB, [a3, a0]);
            return
        }
        !(aX = aW["_CASH_DOM_READY_CLIENT_" + clientIndex]) && (aX = aW["_CASH_DOM_READY_CLIENT_" + clientIndex] = LIB.getIntRandom());
        if (!(aY = readyClients[aX])) {
            aY = readyClients[aX] = new ReadyCall();
            function aZ() {
                (aW.readyState == "complete" || aW.readyState == "interactive") && (aW.body ? aY.ready() : LIB.setTimeout(aZ, 0))
            }

            if (aW.attachEvent) {
                aW.attachEvent("onreadystatechange", aZ);
                a0.attachEvent("onload", aZ);
                var a2 = function () {
                    aW.detachEvent("onreadystatechange", aZ);
                    a0.detachEvent("onload", aZ)
                };
                aY.onReady(a2);
                LIB.unload.subscribe(a2);
                var a4 = false;
                try {
                    a4 = a0.frameElement == null
                } catch (a1) {
                }
                aW.documentElement.doScroll && a4 && (function () {
                    if (aY.isReady) {
                        return
                    }
                    try {
                        aW.documentElement.doScroll("left")
                    } catch (a5) {
                        LIB.setTimeout(arguments.callee, 0);
                        return
                    }
                    aZ()
                })()
            } else if (aW.addEventListener) {
                aW.addEventListener("DOMContentLoaded", aZ, false);
                a0.addEventListener("load", aZ, false);
                var a2 = function () {
                    aW.removeEventListener("DOMContentLoaded", aZ, false);
                    a0.removeEventListener("load", aZ, false)
                };
                aY.onReady(a2);
                LIB.unload.subscribe(a2)
            }
            aY.onReady(function () {
                delete readyClients[aX];
                try {
                    delete aW["_CASH_DOM_READY_CLIENT_" + clientIndex]
                } catch (a5) {
                    aW["_CASH_DOM_READY_CLIENT_" + clientIndex] = void 0
                }
            })
        }
        aY.onReady(a3)
    };

    /***********************************LIB.CAV***********************************/
    var CAV = LIB.CAV = {};
    CAV._dom = [];
    CAV._pos = [];
    CAV._hasTop = false;
    CAV._onPropertyChanged = new Observer(CAV);
    var hasInitCAV = false;
    CAV._handle = function (aX, aW, aY) {
        if (aW == 0) {
            LIB.domReady(function () {
                !aY && CAV._onPropertyChanged.notify()
            })
        } else if (CAV._dom[aW]) {
            var aZ = CAV._dom[aW].win;
            LIB.domReady(function () {
                    var a6,
                        a4 = aZ.document,
                        a1 = (function () {
                            try {
                                a6 = a4.getElementById("QZ_Toolbar_Container");
                                if (a6) {
                                    return a6.offsetHeight
                                }
                            } catch (a5) {
                            }
                            try {
                                a6 = a4.getElementById("page3rdApp");
                                if (a6) {
                                    return a6.offsetTop
                                }
                            } catch (a5) {
                            }
                            return 0
                        })();
                    var a0 = CAV._pos[aW] = a4.documentElement.style.overflow == "hidden" ? {
                        sl: 0,
                        st: 0,
                        sw: LIB.getClientWidth(a4),
                        sh: LIB.getClientHeight(a4) - a1,
                        cw: LIB.getClientWidth(a4),
                        ch: LIB.getClientHeight(a4) - a1
                    } : {
                        sl: LIB.getScrollLeft(a4),
                        st: LIB.getScrollTop(a4),
                        sw: LIB.getScrollWidth(a4),
                        sh: LIB.getScrollHeight(a4) - a1,
                        cw: LIB.getClientWidth(a4),
                        ch: LIB.getClientHeight(a4) - a1
                    };
                    try {
                        if (CAV._dom[aW].frame) {
                            var a3 = CAV._dom[aW].frame.getBoundingClientRect();
                            a0.l = a3.left;
                            a0.t = a3.top - a1;
                            a0.r = a3.right;
                            a0.b = a3.bottom - a1
                        }
                    } catch (a2) {
                    }
                    !aY && CAV._onPropertyChanged.notify()
                },
                aZ)
        }
    };
    CAV._init = function (aY) {
        if (hasInitCAV) {
            return
        }
        hasInitCAV = true;
        var a0, a4, aW = 0,
            aX, a5 = aY || window,
            aZ, a6;
        try {
            while (a5) {
                a0 = false;
                try {
                    a5.document && a5.document.domain == document.domain && (a0 = true)
                } catch (a7) {
                }
                CAV._dom[aW] = a4 = {
                    win: a5
                };
                CAV._pos[aW] = void 0;
                if (a0) {
                    LIB.attachCrossEvent(a5, "scroll", CAV._handle, a5, {
                        args: [aW]
                    });
                    LIB.attachCrossEvent(a5, "resize", CAV._handle, a5, {
                        args: [aW]
                    });
                    a5 == top && (CAV._hasTop = true);
                    if (aW > 0 && (aX = CAV._dom[aW - 1])) {
                        try {
                            aZ = Array.prototype.slice.call(a5.document.getElementsByTagName("iframe"), 0).concat(Array.prototype.slice.call(a5.document.getElementsByTagName("frame"), 0))
                        } catch (a7) {
                            aZ = [];
                            var a3 = a5.document.getElementsByTagName("iframe");
                            for (var a1 = 0,
                                     a2; a2 = a3[a1]; a1++) {
                                aZ.push(a2)
                            }
                            a3 = a5.document.getElementsByTagName("frame");
                            for (var a1 = 0,
                                     a2; a2 = a3[a1]; a1++) {
                                aZ.push(a2)
                            }
                        }
                        a6 = aZ.length;
                        for (var a1 = 0; a1 < a6; a1++) {
                            if (aZ[a1].contentWindow == aX.win) {
                                a4.frame = aZ[a1];
                                break
                            }
                        }
                        CAV._handle(null, aW, true)
                    }
                }
                if (a5 == top) {
                    break
                }
                aW++;
                a5 = a5.parent
            }
        } catch (a7) {
        }
        CAV._onPropertyChanged.notify()
    };
    CAV._ready = new ReadyCall();
    CAV._xReady = false;
    CAV._onClientRectChanged = new Observer();
    CAV._onClientRectChanged.subscribe(function (aW) {
        LIB.log("Client Rectangle: Left=" + aW.left + ", Top=" + aW.top + ", Right=" + aW.right + ", Bottom=" + aW.bottom)
    });
    var clientRectCache = null;
    CAV._getClientRect = function () {
        if (!clientRectCache) {
            var aX = LIB.getScrollLeft();
            var aZ = LIB.getScrollTop();
            var aW = Math.max(LIB.getScrollWidth(), LIB.getClientWidth());
            var aY = Math.max(LIB.getScrollHeight(), LIB.getClientHeight());
            return {
                left: aX,
                top: aZ,
                right: aW + aX,
                bottom: aY + aZ,
                clientLeft: 0,
                clientTop: 0,
                clientRight: aW,
                clientBottom: aY
            }
        }
        return clientRectCache
    };
    LIB.domReady(function () {
        if (!clientRectCache) {
            var aW = window == top;
            var aZ = LIB.getScrollLeft();
            var a0 = LIB.getScrollTop();
            var aY = LIB.getClientWidth();
            var aX = LIB.getClientHeight();
            clientRectCache = {
                left: aZ,
                top: a0,
                right: Math.min(aY, !aW ? screen.availWidth - 30 : Infinity) + aZ,
                bottom: Math.min(aX, !aW ? screen.availHeight - 100 : Infinity) + a0,
                clientLeft: 0,
                clientTop: 0,
                clientRight: Math.min(aY, !aW ? screen.availWidth - 30 : Infinity),
                clientBottom: Math.min(aX, !aW ? screen.availHeight - 100 : Infinity)
            }
        }
    });
    CAV._updatePos = function (aZ, aX) {
        var aW = aZ.pos;
        for (var a0 = 1,
                 aY = aW.length; a0 < aY; a0++) {
            aW[a0] && ((CAV._pos[a0] = aW[a0]).x = true)
        }
        CAV._hasTop = CAV._hasTop || aZ.hasTop;
        CAV._xReady = true;
        CAV._onPropertyChanged.notify()
    };
    //var aL = document.domain == (aP.INFO.platform == "pengyou" ? "pengyou.com": "qq.com");
    var isCrossDomain = true;
    CAV._onPropertyChanged.subscribe(function () {
        if (!CAV._xReady && !isCrossDomain) {
            return
        }
        LIB.domReady(function () {
            var aX = LIB.getScrollLeft();
            var aW = LIB.getScrollTop();
            var a7 = LIB.getClientWidth();
            var a1 = LIB.getClientHeight();
            var a2 = CAV._hasTop,
                a3 = CAV._pos.length,
                a0, a6 = CAV._pos[a3 - 1] || {
                        cw: Math.min(a7, !a2 ? screen.availWidth - 30 : Infinity),
                        ch: Math.min(a1, !a2 ? screen.availHeight - 100 : Infinity)
                    };
            a0 = {
                left: 0,
                top: 0,
                right: a6.cw,
                bottom: a6.ch
            };
            if (a3 > 0) {
                var a4 = {
                    l: a0.left,
                    t: a0.top,
                    r: a0.right,
                    b: a0.bottom
                };
                for (var aY = a3 - 1,
                         aZ; aY > 0; aY--) {
                    aZ = CAV._pos[aY] || {};
                    !("l" in aZ) && (aZ.l = 0);
                    !("t" in aZ) && (aZ.t = 20);
                    !("r" in aZ) && (aZ.r = a4.r);
                    !("onMessage" in aZ) && (aZ.b = a4.b - 20);
                    a0.left -= aZ.l;
                    a0.top -= aZ.t;
                    a0.right -= aZ.l;
                    a0.bottom -= aZ.t;
                    a4.l = Math.max(a4.l, aZ.l) - aZ.l;
                    a4.t = Math.max(a4.t, aZ.t) - aZ.t;
                    a4.r = Math.min(a4.r, aZ.r) - aZ.l;
                    a4.b = Math.min(a4.b, aZ.b) - aZ.t
                }
                a0.left = Math.max(a4.l, a0.left);
                a0.top = Math.max(a4.t, a0.top);
                a0.right = Math.min(a4.r, a0.right, a0.left + a7);
                a0.bottom = Math.min(a4.b, a0.bottom, a0.top + a1)
            }
            a0.clientLeft = a0.left;
            a0.clientTop = a0.top;
            a0.clientRight = a0.right;
            a0.clientBottom = a0.bottom;
            a0.left += aX;
            a0.top += aW;
            a0.right += aX;
            a0.bottom += aW;
            if (clientRectCache) {
                for (var a5 in a0) {
                    if (a0[a5] != clientRectCache[a5]) {
                        clientRectCache = a0;
                        CAV._onClientRectChanged.notify(a0);
                        break
                    }
                }
            } else {
                clientRectCache = a0;
                CAV._onClientRectChanged.notify(a0)
            }
            CAV._ready.ready()
        })
    });
    CAV._setScroll = function (aX, aW) {
        if (!aX) {
            return
        }
        CAV._ready.onReady(function () {
            var bc = NaN,
                ba = NaN;
            if ("left" in aX) {
                bc = +aX.left || 0;
                if (bc < 0) {
                    bc = 0
                }
            }
            if ("top" in aX) {
                ba = +aX.top || 0;
                if (ba < 0) {
                    ba = 0
                }
            }
            var be = CAV._pos.length;
            if (isNaN(bc) && isNaN(ba)) {
                return
            }
            var a2 = LIB.getScrollWidth();
            var a0 = LIB.getScrollHeight();
            var a6 = LIB.getClientWidth();
            var a5 = LIB.getClientHeight();
            if (be == 0) {
                !isNaN(bc) && LIB.setScrollLeft(Math.min(a2 - a6, bc));
                !isNaN(ba) && LIB.setScrollTop(Math.min(a0 - a5, ba));
                return
            }
            var bd = 0,
                a7 = 0,
                a8, aZ;
            var a4 = LIB.getScrollLeft();
            var a3 = LIB.getScrollTop();
            var a1 = [],
                aY;
            for (var bb = 0,
                     a9; bb < be; bb++) {
                a9 = bb == 0 ? {
                    l: -a4,
                    t: -a3,
                    sl: a4,
                    st: a3,
                    sw: a2,
                    sh: a0,
                    cw: a6,
                    ch: a5
                } : CAV._pos[bb];
                if (!a9) {
                    continue
                }
                bd -= a9.l;
                if ((a8 = Math.min(a9.sl, bd - bc)) > 0 || (a8 = Math.max(a9.sl + a9.cw - a9.sw, bd - bc)) < 0) {
                    if (bb == 0 || !CAV._pos[bb].x) {
                        try {
                            aY = CAV._dom[bb].win.document;
                            LIB.setScrollLeft(LIB.getScrollLeft(aY) - a8, aY)
                        } catch (bf) {
                        }
                    } else {
                        a1.push({
                            i: bb,
                            l: a8
                        })
                    }
                    bd -= a8
                }
                a7 -= a9.t;
                if ((aZ = Math.min(a9.st, a7 - ba)) > 0 || (aZ = Math.max(a9.st + a9.ch - a9.sh, a7 - ba)) < 0) {
                    if (bb == 0 || !CAV._pos[bb].x) {
                        try {
                            aY = CAV._dom[bb].win.document;
                            LIB.setScrollTop(LIB.getScrollTop(aY) - aZ, aY)
                        } catch (bf) {
                        }
                    } else {
                        a1.push({
                            i: bb,
                            t: aZ
                        })
                    }
                    a7 -= aZ
                }
            }
            a1.length && Y.call("canvas.setScroll", {
                args: {
                    xdm: a1
                },
                monitor: aW
            })
        })
    };
    isCrossDomain && CAV._init();

    /***********************************LIB.DLG***********************************/
    var DLG = LIB.DLG = {};
    var dlgHandles = {},
        dlgCount = 1;
    DLG._handle = function (a0, aX) {
        var aW = aX.idx,
            aY, aZ = aX.key;
        if (!aX.key && (aY = dlgHandles[aW])) {
            aY.platform.consume();
            delete dlgHandles[aW];
            return false
        }
        a0.send({
            idx: aW
        });
        return true
    };
    DLG._call = function (a2, a0, aY) {
        aY = aY || {};
        var aW = aY.timestamp = aY.timestamp || new Date().getTime();
        var aX = dlgCount++;
        var a1 = 0;
        var aZ = dlgHandles[aX] = {
            timestamp: aW,
            platform: new OnceCall(10000, {
                    onConsume: function () {
                        LIB.valueStat(350303, 1, 20, {
                            duration: new Date().getTime() - aW,
                            rate: LIB.timeBasedRate()
                        });
                        if (!a1) {
                            var a3 = new Date().getTime();
                            a1 = setTimeout(function () {
                                    a1 = 0;
                                    LIB.valueStat(350400, 1, 23, {
                                        rate: 50
                                    })
                                },
                                300000)
                        }
                    },
                    onTimeout: function () {
                        !a2.closed && LIB.valueStat(350303, 2, 19, {
                            duration: new Date().getTime() - aW
                        })
                    }
                },
                true)
        };
        a2.send({
            key: a0,
            args: aY,
            idx: aX
        })
    };

    /***********************************DLG Style***********************************/
    LIB.insertStyle = function (aY, aX) {
        aX = aX || document;
        var aW = aX.createElement("style");
        aW.type = "text/css";
        aX.getElementsByTagName("head")[0].appendChild(aW);
        if (aW.styleSheet) {
            aW.styleSheet.cssText = aY
        } else {
            aW.appendChild(aX.createTextNode(aY))
        }
    };

    var CSSManager = {},
        isCompatMode = LIB.ua.ie && document.compatMode == "BackCompat",
        dialogAllCSS = [];
    dialogAllCSS.push(".cash_dialog_mask{position:absolute;z-index:4000;-moz-opacity:1;opacity:1;filter:alpha(opacity=1);-o-transition:left .6s ease-out,top .6s ease-out,width .6s ease-out,height .6s ease-out;-ms-transition:left .6s ease-out,top .6s ease-out,width .6s ease-out,height .6s ease-out;-moz-transition:left .6s ease-out,top .6s ease-out,width .6s ease-out,height .6s ease-out;-webkit-transition:left .6s ease-out,top .6s ease-out,width .6s ease-out,height .6s ease-out;transition:left .6s ease-out,top .6s ease-out,width .6s ease-out,height .6s ease-out;}");
    dialogAllCSS.push(".cash_dialog_wrap{position:absolute;-moz-border-radius:5px;border-radius:5px;font-size:12px;font-family:", LIB.fontFamily, ";-o-transition:left .6s ease-out,top .6s ease-out,width .6s ease-out;-ms-transition:left .6s ease-out,top .6s ease-out,width .6s ease-out;-moz-transition:left .6s ease-out,top .6s ease-out,width .6s ease-out;-webkit-transition:left .6s ease-out,top .6s ease-out,width .6s ease-out;transition:left .6s ease-out,top .6s ease-out,width .6s ease-out;}");
    dialogAllCSS.push(".cash_dialog_border{position:absolute;z-index:1;top:0;left:0;-moz-border-radius:5px;border-radius:5px;background:rgba(187,187,187,0.9);filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0 startColorstr=#5abbbbbb,endColorstr=#5abbbbbb);-o-transition:left .6s ease-out,top .6s ease-out,width .6s ease-out;-ms-transition:left .6s ease-out,top .6s ease-out,width .6s ease-out;-moz-transition:left .6s ease-out,top .6s ease-out,width .6s ease-out;-webkit-transition:left .6s ease-out,top .6s ease-out,width .6s ease-out;transition:left .6s ease-out,top .6s ease-out,width .6s ease-out;}");
    dialogAllCSS.push(".cash_dialog_wrap_no_border .cash_dialog_border{display:none}");
    dialogAllCSS.push(".cash_dialog_wrap_no_border_no_position .cash_dialog_border{display:none}");
    dialogAllCSS.push(".cash_dialog_wrap_no_border_noani .cash_dialog_border{display:none}");
    dialogAllCSS.push(".cash_dialog_wrap_no_border{position:absolute;background-color:transparent;font-size:12px;font-family:", LIB.fontFamily, ";-o-transition:left .6s ease-out,top .6s ease-out,width .6s ease-out;-ms-transition:left .6s ease-out,top .6s ease-out,width .6s ease-out;-moz-transition:left .6s ease-out,top .6s ease-out,width .6s ease-out;-webkit-transition:left .6s ease-out,top .6s ease-out,width .6s ease-out;transition:left .6s ease-out,top .6s ease-out,width .6s ease-out;}");
    dialogAllCSS.push(".cash_dialog_wrap_no_border_no_position{position:relative;background-color:#fff;font-size:12px;font-family:", LIB.fontFamily, ";-o-transition:left .6s ease-out,top .6s ease-out,width .6s ease-out;-ms-transition:left .6s ease-out,top .6s ease-out,width .6s ease-out;-moz-transition:left .6s ease-out,top .6s ease-out,width .6s ease-out;-webkit-transition:left .6s ease-out,top .6s ease-out,width .6s ease-out;transition:left .6s ease-out,top .6s ease-out,width .6s ease-out;}");
    dialogAllCSS.push(".cash_dialog_mask_noani{position:absolute;z-index:4000;-moz-opacity:1;opacity:1;filter:alpha(opacity=1);-o-transition:width .6s ease-out,height .6s ease-out;-ms-transition:width .6s ease-out,height .6s ease-out;-moz-transition:width .6s ease-out,height .6s ease-out;-webkit-transition:width .6s ease-out,height .6s ease-out;transition:width .6s ease-out,height .6s ease-out;}");
    dialogAllCSS.push(".cash_dialog_wrap_noani{position:absolute;-moz-border-radius:5px;border-radius:5px;font-size:12px;font-family:", LIB.fontFamily, ";-o-transition:width .6s ease-out;-ms-transition:width .6s ease-out;-moz-transition:width .6s ease-out;-webkit-transition:width .6s ease-out;transition:width .6s ease-out;}");
    dialogAllCSS.push(".cash_dialog_wrap_no_border_noani{position:absolute;background-color:#fff;font-size:12px;font-family:", LIB.fontFamily, ";-o-transition:width .6s ease-out;-ms-transition:width .6s ease-out;-moz-transition:width .6s ease-out;-webkit-transition:width .6s ease-out;transition:width .6s ease-out;}");
    dialogAllCSS.push(".cash_dialog_header{margin-top:10px;margin-left:10px;margin-right:10px;height:28px;position:relative;z-index:2;border-bottom:1px solid #d8d8d8;background:#fafafa;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fafafa',endColorstr='#ededed',GradientType=0);background:-o-linear-gradient(top,#fafafa 0%,#ededed 100%);background:-moz-linear-gradient(top,#fafafa 0%,#ededed 100%);background:-webkit-gradient(linear,left top,left bottom,color-stop(0%,#fafafa),color-stop(100%,#ededed));background:-webkit-linear-gradient(top,#fafafa 0%,#ededed 100%);background:linear-gradient(top,#fafafa 0%,#ededed 100%);}");
    dialogAllCSS.push(".cash_dialog_header h3{float:left;height:28px;color:#4c4c4c;font-size:13px;line-height:28px;overflow:hidden;margin:0;padding-left:10px;font-weight:bold;}");
    dialogAllCSS.push(".cash_dialog_header button{background-color:transparent;background-image:url('//", INFO.isp, "qzonestyle.gtimg.cn/open/fusion/img/sprite.png?max_age=31104000&v=3');background-repeat:no-repeat;background-position:10px 10px;float:right;width:29px;height:28px;margin-right:5px;line-height:100px;border:0 none;cursor:pointer;font-size:0;}");
    dialogAllCSS.push(".cash_dialog_header button:hover{background-position:-11px 10px;}");
    dialogAllCSS.push(".cash_dialog_content{margin-bottom:10px;margin-left:10px;margin-right:10px;color:#5f5f5f;background-color:transparent;overflow:hidden;position:relative;z-index:2;-o-transition:height .6s ease-out;-ms-transition:height .6s ease-out;-moz-transition:height .6s ease-out;-webkit-transition:height .6s ease-out;transition:height .6s ease-out;}");
    dialogAllCSS.push(".cash_dialog_wrap_no_border .cash_dialog_content{margin:0;}");
    dialogAllCSS.push(".cash_dialog_wrap_no_border_no_position .cash_dialog_content{margin:0;}");
    dialogAllCSS.push(".cash_dialog_wrap_no_border .cash_dialog_header{margin:0;}");
    dialogAllCSS.push(".cash_dialog_wrap_no_border_no_position .cash_dialog_header{margin:0;}");
    dialogAllCSS.push(".cash_dialog_wrap_no_border_noani .cash_dialog_content{margin:0;}");
    dialogAllCSS.push(".cash_dialog_wrap_no_border_noani .cash_dialog_header{margin:0;}");
    dialogAllCSS.push(".cash_dialog_content_mask{position:absolute;width:100%;height:100%;left:0;top:0;background:#fff;filter:alpha(opacity=0);opacity:0;}");
    dialogAllCSS.push(".cash_dialog_content a:link,.cash_dialog_content a:visited{color:#5181b4;text-decoration:none;}");
    dialogAllCSS.push(".cash_dialog_content a:hover{text-decoration:underline;}");
    dialogAllCSS.push(".cash_dialog_frame{-o-transition:width .6s ease-out,height .6s ease-out;-ms-transition:width .6s ease-out,height .6s ease-out;-moz-transition:width .6s ease-out,height .6s ease-out;-webkit-transition:width .6s ease-out,height .6s ease-out;transition:width .6s ease-out,height .6s ease-out;}");
    dialogAllCSS.push(".cash_dialog_footer{background-color:#f3f3f3;text-align:right;clear:both;padding:6px 6px 0 0;height:", isCompatMode ? 35 : 29, "px;}");
    dialogAllCSS.push(".cash_dialog_button_normal:link,.cash_dialog_button_submit:link,.cash_dialog_button_submit_disabled:link,.cash_dialog_button_disabled:link,.cash_dialog_button_normal:visited,.cash_dialog_button_submit:visited,.cash_dialog_button_submit_disabled:visited,.cash_dialog_button_disabled:visited,.cash_dialog_button_normal:hover,.cash_dialog_button_submit:hover,.cash_dialog_button_submit_disabled:hover,.cash_dialog_button_disabled:hover,.cash_dialog_button_normal:active,.cash_dialog_button_submit:active,.cash_dialog_button_submit_disabled:active,.cash_dialog_button_disabled:active{border-radius:3px;color:#333;line-height:22px;height:22px;display:inline-block;margin-left:4px;padding:0 10px;text-decoration:none;font-size:12px;}");
    dialogAllCSS.push(".cash_dialog_button_normal:link,.cash_dialog_button_normal:visited,.cash_dialog_button_normal:hover,.cash_dialog_button_normal:active{border:1px solid #b4b4b4;background:#f4f3f4;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f4f3f4',endColorstr='#dfdede',GradientType=0);background:-o-linear-gradient(top,#f4f3f4 0%,#dfdede 100%);background:-moz-linear-gradient(top,#f4f3f4 0%,#dfdede 100%);background:-webkit-gradient(linear,left top,left bottom,color-stop(0%,#f4f3f4),color-stop(100%,#dfdede));background:-webkit-linear-gradient(top,#f4f3f4 0%,#dfdede 100%);background:linear-gradient(top,#f4f3f4 0%,#dfdede 100%);}");
    dialogAllCSS.push(".cash_dialog_button_normal:hover,.cash_dialog_button_normal:active{background:#fafafa;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fafafa',endColorstr='#dfdede',GradientType=0);background:-o-linear-gradient(top,#fafafa 0%,#dfdede 100%);background:-moz-linear-gradient(top,#fafafa 0%,#dfdede 100%);background:-webkit-gradient(linear,left top,left bottom,color-stop(0%,#fafafa),color-stop(100%,#dfdede));background:-webkit-linear-gradient(top,#fafafa 0%,#dfdede 100%);background:linear-gradient(top,#fafafa 0%,#dfdede 100%);}");
    dialogAllCSS.push(".cash_dialog_button_submit:link,.cash_dialog_button_submit:visited,.cash_dialog_button_submit:hover,.cash_dialog_button_submit:active{color:#fff;border:1px solid #4c92c8;background:#56bdf4;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#56bdf4',endColorstr='#46a3d7',GradientType=0);background:-o-linear-gradient(top,#56bdf4 0%,#46a3d7 100%);background:-moz-linear-gradient(top,#56bdf4 0%,#46a3d7 100%);background:-webkit-gradient(linear,left top,left bottom,color-stop(0%,#56bdf4),color-stop(100%,#46a3d7));background:-webkit-linear-gradient(top,#56bdf4 0%,#46a3d7 100%);background:linear-gradient(top,#56bdf4 0%,#46a3d7 100%);}");
    dialogAllCSS.push(".cash_dialog_button_submit:hover,.cash_dialog_button_submit:active{background:#56bdf4;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#56bdf4',endColorstr='#57addd',GradientType=0);background:-o-linear-gradient(top,#56bdf4 0%,#57addd 100%);background:-moz-linear-gradient(top,#56bdf4 0%,#57addd 100%);background:-webkit-gradient(linear,left top,left bottom,color-stop(0%,#56bdf4),color-stop(100%,#57addd));background:-webkit-linear-gradient(top,#56bdf4 0%,#57addd 100%);background:linear-gradient(top,#56bdf4 0%,#57addd 100%);}");
    dialogAllCSS.push(".cash_dialog_button_disabled:link,.cash_dialog_button_disabled:visited,.cash_dialog_button_disabled:hover,.cash_dialog_button_disabled:active{color:#bbb;background-color:#f9f9f9;border:1px solid #dcdcdc;cursor:no-drop;}");
    dialogAllCSS.push(".cash_dialog_button_submit_disabled:link,.cash_dialog_button_submit_disabled:visited,.cash_dialog_button_submit_disabled:hover,.cash_dialog_button_submit_disabled:active{color:#fff;border:1px solid #60a7dd;background:#9cd7f7;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#9cd7f7',endColorstr='#83bede',GradientType=0);background:-o-linear-gradient(top,#9cd7f7 0%,#83bede 100%);background:-moz-linear-gradient(top,#9cd7f7 0%,#83bede 100%);background:-webkit-gradient(linear,left top,left bottom,color-stop(0%,#9cd7f7),color-stop(100%,#83bede));background:-webkit-linear-gradient(top,#9cd7f7 0%,#83bede 100%);background:linear-gradient(top,#9cd7f7 0%,#83bede 100%);cursor:no-drop;}");
    dialogAllCSS.push(".cash_dialog_confirm_content{margin:40px auto;position:relative;width:260px;}");
    dialogAllCSS.push(".cash_dialog_confirm_content h3{padding-left:35px;font-size:14px;margin:0 0 10px 0;line-height:130%;font-weight:bold;}");
    dialogAllCSS.push(".cash_dialog_confirm_content_p{padding-left:35px;margin-bottom:6px;line-height:130%;font-size:12px;}");
    dialogAllCSS.push(".cash_dialog_confirm_icon{background-image:url('//", INFO.isp, "qzonestyle.gtimg.cn/open/fusion/img/sprite.png?max_age=31104000&v=3');background-repeat:no-repeat;width:25px;height:24px;font-size:0;line-height:100px;overflow:hidden;left:0;top:-2px;position:absolute;}");
    dialogAllCSS.push(".cash_dialog_confirm_icon_request{background-position:left -260px;}");
    dialogAllCSS.push(".cash_dialog_confirm_icon_error{background-position:left -284px;}");
    dialogAllCSS.push(".cash_dialog_confirm_icon_warn{background-position:left -308px;}");
    dialogAllCSS.push(".cash_dialog_confirm_icon_ok{background-position:left -332px;}");
    dialogAllCSS.push(".cash_dialog_confirm_icon_alt{width:18px;height:10px;font-size:0;line-height:0;position:relative;display:inline-block;*display:inline;*zoom:1;}");
    dialogAllCSS.push(".cash_dialog_confirm_icon_alt i{background-image:url('//", INFO.isp, "qzonestyle.gtimg.cn/open/fusion/img/sprite.png?max_age=31104000&v=3');background-repeat:no-repeat;width:15px;height:15px;display:block;position:absolute;}");
    dialogAllCSS.push(".cash_dialog_confirm_icon_alt_error i{background-position:left -356px;}");
    dialogAllCSS.push(".cash_dialog_confirm_icon_alt_warn i{background-position:left -371px;}");
    dialogAllCSS.push(".cash_dialog_confirm_icon_alt_ok i{background-position:-15px -356px;}");
    dialogAllCSS.push(".cash_dialog_confirm_icon_alt_none{display:none;}");
    CSSManager.DIALOG = dialogAllCSS.join("");
    CSSManager.insertDialog = function () {
        LIB.insertStyle(CSSManager.DIALOG);
        CSSManager.insertDialog = function () {
        }
    };

    /***********************************JSON***********************************/
    var JSON = thisAPI.JSON = {},
        ae = {},
        D = /[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
        m = {
            "\b": "\\b",
            "\t": "\\t",
            "\n": "\\n",
            "\f": "\\f",
            "\r": "\\r",
            '"': '\\"',
            "\\": "\\\\"
        },
        aS = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g;

    function strFormat(src, outputLength, completion) {
        outputLength = outputLength || 2;
        completion = completion || "0";
        var aW = [];
        aW[outputLength] = src;
        return aW.join(completion).slice(-outputLength)
    }

    function capitalize(words) {
        words += "";
        return words.substr(0, 1).toUpperCase() + words.substr(1).toLowerCase()
    }

    function aR(aX) {
        var aW = Object.prototype.toString.call(aX);
        if (aX === null || aX instanceof String || aX instanceof Number || aX instanceof Boolean || aX instanceof Date || ({
                "[object String]": 1,
                "[object Number]": 1,
                "[object Boolean]": 1,
                "[object Date]": 1
            })[aW]) {
            return aX
        }
        if (aX === void 0) {
            return void 0
        }
        if (aX === window) {
            return "[object DOMWindow]"
        }
        if (aX === document) {
            return "[object HTMLDocument]"
        }
        if (typeof aX.constructor !== "function") {
            return aX && typeof aX.tagName === "string" ? "[object HTML" + capitalize(aX.tagName) + "Element]" : void 0
        }
        if (!({
                "[object Object]": 1,
                "[object Array]": 1
            })[aW]) {
            return aW
        }
        if (ae[aX.__CASH_JSON_HASH] === aX) {
            return void 0
        }
        var aY = LIB.getIntRandom();
        while (ae[aY]) {
            aY = LIB.getIntRandom()
        }
        ae[aX.__CASH_JSON_HASH = aY] = aX;
        return aX
    }

    function aI(aW) {
        D.lastIndex = 0;
        return '"' + (D.test(aW) ? aW.replace(D,
                function (aX) {
                    var aY = m[aX];
                    return typeof aY === "string" ? aY : ("\\u" + strFormat(aX.charCodeAt(0).toString(16), 4))
                }) : aW) + '"'
    }

    function ac(a3) {
        a3 = aR(a3);
        var aZ = Object.prototype.toString.call(a3);
        if (a3 === void 0) {
            return void 0
        } else if (a3 === null || a3 instanceof Boolean || aZ === "[object Boolean]") {
            return String(a3)
        } else if (a3 instanceof String || aZ === "[object String]") {
            return aI(a3)
        } else if (a3 instanceof Number || aZ === "[object Number]") {
            return isFinite(a3) ? String(a3) : "null"
        } else if (a3 instanceof Date || aZ === "[object Date]") {
            return isFinite(a3.valueOf()) ? aI(a3.getUTCFullYear() + "-" + strFormat(a3.getUTCMonth() + 1) + "-" + strFormat(a3.getUTCDate()) + "Observer" + strFormat(a3.getUTCHours()) + ":" + strFormat(a3.getUTCMinutes()) + ":" + strFormat(a3.getUTCSeconds()) + "." + strFormat(a3.getUTCMilliseconds(), 3) + "Z") : "null"
        } else if (a3 instanceof Array || aZ === "[object Array]") {
            var a1 = [];
            for (var a0 = 0,
                     aW = a3.length; a0 < aW; a0++) {
                a1[a0] = ac(a3[a0]) || "null"
            }
            delete ae[a3.__CASH_JSON_HASH];
            delete a3.__CASH_JSON_HASH;
            return "[" + a1.join(",") + "]"
        } else if (!a3) {
            return "null"
        } else {
            var a2, a1 = [],
                aY = Object.hasOwnProperty;
            for (var aX in a3) {
                aX != "__CASH_JSON_HASH" && aY.call(a3, aX) && (a2 = ac(a3[aX])) && a1.push(aI(aX) + ":" + a2)
            }
            delete ae[a3.__CASH_JSON_HASH];
            delete a3.__CASH_JSON_HASH;
            return "{" + a1.join(",") + "}"
        }
    }

    JSON.stringify = function (aW) {
        var aX = ac(aW);
        return aX
    };

    JSON.parse = function (aX) {
        aX = String(aX);
        if (aX) {
            aS.lastIndex = 0;
            aS.test(aX) && (aX = aX.replace(aS,
                function (aY) {
                    return "\\u" + strFormat(aY.charCodeAt(0).toString(16), 4)
                }));
            if (/^[\],:{}\s]*$/.test(aX.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, "@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, "]").replace(/(?:^|:|,)(?:\s*\[)+/g, ""))) {
                try {
                    return new Function("return " + aX)()
                } catch (aW) {
                    return eval("(" + aX + ")")
                }
            }
        }
        throw new SyntaxError("JSON.parse")
    };

    // 设置document.domain
    /*if (/(?:^|\.)qq\.com$/.test(location.hostname)) {
     document.domain != "qq.com" && (document.domain = "qq.com")
     } else if (/(?:^|\.)pengyou\.com$/.test(location.hostname)) {
     document.domain != "pengyou.com" && (document.domain = "pengyou.com")
     }*/

    /***********************************监听当前页面消息***********************************/
    var messageHandles = {},
        msgChannelID = "__CashXStream_",
        supportPostMessage = (function () {
            if (window.postMessage) {
                try {
                    if (window.postMessage.toString().indexOf("[native code]") >= 0) {
                        return true
                    } else {
                        LIB.err('The native "postMessage" function of browsers seems to have been overridden, DO NOT override it, or this API will not work properly!')
                    }
                } catch (e) {
                    return true
                }
            }
            return false
        })();

    function onMessage(aZ, aY) {
        if (typeof aZ !== "string" || aZ.indexOf(msgChannelID) != 0) {
            return
        }
        aZ = aZ.substring(msgChannelID.length);
        var a0 = JSON.parse(aZ);
        var aW = a0.port,
            aX;
        if (!(aX = messageHandles[aW])) {
            return
        }
        aX._handle(a0, aY, aZ)
    }

    if (supportPostMessage) {
        LIB.attachEvent(window, "message",
            function (aW) {
                onMessage(aW.data, aW.source)
            })
    }

    /***********************************XStream***********************************/
    var XStream = LIB.XStream = function (aY, aX, aZ) {
        var aW;
        if (aW = messageHandles[aX]) {
            return aW
        }
        messageHandles[aX] = this;
        this.handler = aY;
        this.targetPort = aX;
        this.target = aZ;
        this.closed = false;
        this.onInit = new Observer(this);
        this._pool = [];
        !supportPostMessage && !navigator[msgChannelID + XStream.channel + XStream.localPort] && (navigator[msgChannelID + XStream.channel + XStream.localPort] = onMessage)
    };
    XStream.channel = 0;
    XStream.localPort = "";
    XStream.prototype._sendRaw = function (aX) {
        try {
            if (supportPostMessage) {
                this.target.postMessage(aX, "*")
            } else {
                var aY = navigator[msgChannelID + XStream.channel + this.targetPort];
                typeof aY == "function" && aY(aX, window)
            }
        } catch (aW) {
            LIB.warn("XStream sending error: ", aW)
        }
    };
    XStream.prototype._handle = function (aX, aW, aY) {
        if (aX.init) {
            this.target = aW;
            this.closed = false;
            this.onInit.notify();
            while (this._pool.length) {
                this._sendRaw(this._pool.shift())
            }
        } else if (!this.closed) {
            typeof this.handler == "function" && this.handler.call(this, aX.data, this.targetPort)
        }
    };
    XStream.prototype.init = function () {
        if (!this.target) {
            return
        }
        var aW = {
                port: XStream.localPort,
                init: 1
            },
            aX = JSON.stringify(aW);
        LIB.log("XStream initializing from [" + location.hostname + "][" + location.pathname + "]: " + aX, aW);
        aX = msgChannelID + aX;
        this._sendRaw(aX);
        this.onInit.notify()
    };
    XStream.prototype.send = function (aY) {
        if (this.closed || !aY) {
            return
        }
        var aW = {
                port: XStream.localPort,
                data: aY
            },
            aX = JSON.stringify(aW);
        LIB.log("XStream sent from [" + location.hostname + "][" + location.pathname + "]: " + aX, aW);
        aX = msgChannelID + aX;
        !this.target ? this._pool.push(aX) : this._sendRaw(aX)
    };
    XStream.prototype.close = function () {
        this.closed = true;
        delete messageHandles[this.targetPort]
    };
    XStream.channel = LIB.getIntRandom();
    XStream.localPort = "lib";

    /***********************************OnceCall***********************************/
    var OnceCall = LIB.OnceCall = function (timeout, options, autoStart) {
        this._timeout = timeout;
        this._timer = 0;
        options = options || {};
        this.onConsume = options.onConsume;
        this.onReject = options.onReject;
        this.onTimeout = options.onTimeout;
        this.hasCalled = false;
        autoStart && this.start()
    };
    OnceCall.prototype._call = function (func) {
        if (!this.hasCalled) {
            this.hasCalled = true;
            this._timer && LIB.clearTimeout(this._timer);
            this._timer = 0;
            typeof func == "function" && func.call(this)
        }
    };
    OnceCall.prototype.start = function () {
        if (this._timeout >= 0) {
            this._timer = LIB.setTimeout(this.timeout, this._timeout, this)
        }
    };
    OnceCall.prototype.consume = function () {
        this._call(this.onConsume)
    };
    OnceCall.prototype.reject = function () {
        this._call(this.onReject)
    };
    OnceCall.prototype.timeout = function () {
        this._timer = 0;
        this._call(this.onTimeout)
    };


    /***********************************Dialog***********************************/
    var _dialogInstance = {},
        dialogIndex = 1,
        dialogZIndex = 5000,
        dialogQueue = [];

    var Dialog = LIB.Dialog = function (options) {
        this.opt = options = options || {};
        this.timestamp = options.timestamp || new Date().getTime();

        var dialogID = this.id = "dialog_" + (dialogIndex++);
        _dialogInstance[dialogID] = this;
        dialogQueue.unshift(this);

        var type = this.type = options.confirm ? "confirm" : options.src ? "frame" : "normal",
            size = this.size = options.size || {};
        size.w = size.w || (this.type == "confirm" ? 300 : 400);
        size.h = size.h || (this.type == "confirm" ? 140 : 300);

        this.sizeDialog = Dialog.getDialogSizeByContentSize(size, options);
        this.pos = options.pos || {};

        this._submitted = false;
        this._context = options.context;

        var dialogBody = this.dialogBody = document.createElement("div"),
            targetNode = this.targetNode = options.targetNode,
            quiet = this.quiet = !!options.quiet;
        dialogBody.className = options.hideBorder
            ? quiet ? "cash_dialog_wrap_no_border_noani" : (targetNode ? "cash_dialog_wrap_no_border_no_position" : "cash_dialog_wrap_no_border")
            : quiet ? "cash_dialog_wrap_noani" : "cash_dialog_wrap";

        this.zIndex = options.zIndex || dialogZIndex++;
        LIB.attachEvent(dialogBody, "mousedown", this.setForeground, {
            self: this
        });

        if (!options.hideHeader) {
            var dialogHeader = this.dialogHeader = document.createElement("div");
            dialogHeader.className = "cash_dialog_header";
            if (!options.preventDragging) {
                dialogHeader.style.cursor = "move";
                this._dragInfo = null;
                LIB.attachEvent(dialogHeader, "mousedown", this._dragStart, {
                    self: this
                })
            }

            if (options.targetNode) {
                dialogHeader.style.width = size.w + "px";
            }

            var dialogController = dialogHeader;
            if (document.compatMode == "BackCompat" && LIB.ua.ie <= 8) {
                var bg = document.createElement("div");
                bg.style.cssText = "position:absolute;width:100%;height:100%;left:0;top:0;";
                dialogHeader.appendChild(bg);
                dialogController = bg
            }
            var dialogTitle = this.dialogTitle = document.createElement("h3");
            dialogTitle.innerHTML = options.title || "";
            dialogController.appendChild(dialogTitle);
            if (!options.hideCloseButton) {
                var dialogCloseButton = this.dialogCloseButton = document.createElement("button");
                dialogCloseButton.title = "关闭";
                dialogController.appendChild(dialogCloseButton);
                LIB.attachEvent(dialogCloseButton, "click",
                    function () {
                        this.close()
                    },
                    {
                        self: this
                    }
                )
            }
            dialogBody.appendChild(dialogHeader)
        }

        var dialogContent = this.dialogContent = document.createElement("div");
        dialogContent.className = "cash_dialog_content";
        dialogContent.style.height = size.h + "px";

        if (type == "confirm") {
            var confirmOptions = options.confirm;
            dialogContent.innerHTML = ['<div class="cash_dialog_confirm_content"><i class="cash_dialog_confirm_icon ', ({
                1: "cash_dialog_confirm_icon_request",
                2: "cash_dialog_confirm_icon_error",
                3: "cash_dialog_confirm_icon_warn",
                4: "cash_dialog_confirm_icon_ok"
            })[confirmOptions.icon] || "cash_dialog_confirm_icon_request", '"></i><h3>', confirmOptions.content || "", '</h3><div class="cash_dialog_confirm_content_p">', confirmOptions.desc || "", '</div><div class="cash_dialog_confirm_content_p"><i class="cash_dialog_confirm_icon_alt ', ({
                1: "cash_dialog_confirm_icon_alt_error",
                2: "cash_dialog_confirm_icon_alt_warn",
                3: "cash_dialog_confirm_icon_alt_ok"
            })[confirmOptions.iconAlt] || "cash_dialog_confirm_icon_alt_none", '"><i></i></i>', confirmOptions.contentAlt || "", "</div></div>"].join("")
        } else if (type == "frame") {
            var bodyWrapper = options.wrapper || '',
                urlExtParams = ["v=", VER.dialog, "&_fd_id=", dialogID, "&_fd_c=", XStream.channel, "&_fd_size=", size.w, "|", size.h, "&_fd_w=", bodyWrapper];
            quiet && urlExtParams.push("&quiet=1");
            if (options.methods) {
                var methods = this.methods = options.methods;
                var methodNameList = [],
                    method;
                for (var methodName in methods) {
                    if (methodName in this) {
                        continue
                    }
                    method = methods[methodName];
                    if (!method || typeof method == "function") {
                        method = methods[methodName] = {
                            method: method
                        }
                    }
                    methodNameList.push(methodName);
                    this[methodName] = (function (bt, bs) {
                        return function (bu) {
                            typeof bs.method == "function" && bs.method.call(this, bu);
                            this._send(bt, bu);
                            var bv = bs.ret;
                            bv && this._flag && LIB.valueStat(this._flag, bv >= 0 ? 1 : 2, Math.abs(bv), {
                                rate: LIB.timeBasedRate(bs.rate || 0)
                            })
                        }
                    })(methodName, method)
                }
                urlExtParams.push("&_fd_ms=", methodNameList.join("|"))
            }

            var dialogSrc = options.src;

            dialogSrc = [
                dialogSrc,
                (dialogSrc.indexOf("?") >= 0 ? "&" : "?"),
                "cash_param=",
                encodeURIComponent(urlExtParams.join(""))
            ].join("");

            var dialogFrame = this.dialogFrame = document.createElement("iframe");
            dialogFrame.className = "cash_dialog_frame";
            dialogFrame.style.cssText = ["width:", size.w, "px;height:", size.h, "px;", "background:transparent;", "overflow-x:hidden;"].join("");
            dialogFrame.frameBorder = "no";
            dialogFrame.scrolling = "auto";
            dialogFrame.allowTransparency = "true";
            dialogFrame.src = dialogSrc;
            dialogContent.appendChild(dialogFrame);
            this._stream = new XStream(_dialogHandler, dialogID)
        } else {
            dialogContent.innerHTML = options.content || ""
        }

        dialogBody.appendChild(dialogContent);
        this.dialogBorder = document.createElement("div");
        this.dialogBorder.className = "cash_dialog_border";
        dialogBody.appendChild(this.dialogBorder);

        var bb = this.dialogMask = document.createElement("iframe");
        bb.className = quiet ? "cash_dialog_mask_noani" : "cash_dialog_mask";
        bb.frameBorder = "no";
        bb.scrolling = "no";
        bb.src = "about:blank";

        this._render()
    };

    Dialog.construct = function (userOptions, options, dialogID) {
        userOptions = userOptions || {};
        var allowOptionList = "timestamp,pos,size,zIndex,quiet,context,onLoad,onFrameLoad,onShown,onSubmit,onNotify,onSuccess,onError,onCancel,onClose".split(",");
        for (var idx = 0, name; name = allowOptionList[idx]; idx++) {
            options[name] = userOptions[name] || options[name]
        }
        return new Dialog(options, dialogID)
    };

    Dialog.ICON_TYPE = {
        REQUEST: 1,
        ERROR: 2,
        WARN: 3,
        OK: 4
    };

    Dialog.ICON_ALT_TYPE = {
        ERROR: 1,
        WARN: 2,
        OK: 3
    };

    Dialog.getDialogSizeByContentSize = function (size, options) {
        size = size || {};
        options = options || {};
        return {
            w: size.w + (options.hideBorder ? 0 : 20),
            h: size.h + (options.hideBorder ? 0 : 20) + (options.hideHeader ? 0 : 29)
        }
    };

    Dialog.fitPos = function (pos, size, isNotCenter) {
        var clientRect = CAV._getClientRect();
        !pos.x && (pos.x = Math.round((clientRect.right + clientRect.left - size.w) / 2));
        !pos.y && (pos.y = Math.round((clientRect.bottom + clientRect.top - size.h) / 2));

        if (!isNotCenter) {
            pos.x = Math.min(clientRect.right - size.w - 5, Math.max(clientRect.left - size.w + 60, pos.x)) + 4;
            pos.y = Math.max(clientRect.top + 5, Math.min(clientRect.bottom - 30, pos.y)) - 5;
        }
    };

    Dialog.prototype._render = function () {
        var _this = this;
        CAV._ready.onReady(function () {
            setTimeout(function () {
                CSSManager.insertDialog();
                var pos = _this.pos,
                    sizeDialog = _this.sizeDialog,
                    dialogBody = _this.dialogBody,
                    dialogMask = _this.dialogMask,
                    dialogBorder = _this.dialogBorder,
                    targetNode = _this.targetNode;

                if (typeof pos.x === 'undefined' && typeof pos.y === 'undefined') {
                    Dialog.fitPos(pos, sizeDialog);
                }

                if (sizeDialog.w == 575 && sizeDialog.h == 400) {//绿钻客户端使用
                    pos.x = pos.y = 0
                }

                if (_this.quiet) {
                    dialogBody.style.cssText = ["visibility:hidden;left:-1000px;top:-1000px;width:", sizeDialog.w, "px;z-index:", _this.zIndex, ";"].join("");
                    dialogMask.style.cssText = ["visibility:hidden;left:-1000px;top:-1000px;width:", sizeDialog.w, "px;height:", sizeDialog.h, "px;"].join("");
                    dialogBorder.style.cssText = ["visibility:hidden;left:0px;top:0px;width:", sizeDialog.w, "px;height:", sizeDialog.h, "px;"].join("");
                } else {
                    dialogBody.style.cssText = (targetNode) ? "" : ["left:", pos.x, "px;top:", pos.y, "px;width:", sizeDialog.w, "px;z-index:", _this.zIndex, ";"].join("");
                    dialogMask.style.cssText = (targetNode) ? "display:none;" : ["left:", pos.x, "px;top:", pos.y, "px;width:", sizeDialog.w, "px;height:", sizeDialog.h, "px;"].join("");
                    dialogBorder.style.cssText = ["left:0", "px;top:0", "px;width:", sizeDialog.w, "px;height:", sizeDialog.h, "px;"].join("");
                }

                if (targetNode) {
                    targetNode.insertBefore(dialogBody, targetNode.firstChild);
                    targetNode.insertBefore(dialogMask, dialogBody);
                } else {
                    document.body.insertBefore(dialogBody, document.body.firstChild);
                    document.body.insertBefore(dialogMask, dialogBody);
                }

                try {
                    typeof _this.opt.onLoad == "function" && _this.opt.onLoad.call(_this, {context: _this.opt.context})
                } catch (e) {
                }
            }, 0)

        })
    };

    Dialog.prototype.resize = function (rect, isNotCenter) {
        if (!rect) {
            return
        }

        rect.w = +rect.w;
        rect.h = +rect.h;
        rect.x = +rect.x;
        rect.y = +rect.y;
        var size = this.size,
            pos = this.pos;
        pos.x = rect.x ? rect.x : rect.w ? (pos.x + Math.round((size.w - rect.w) / 2)) : pos.x;
        pos.y = rect.y ? rect.y : rect.h ? (pos.y + Math.round((size.h - rect.h) / 2)) : pos.y;
        size.w = rect.w || size.w;
        size.h = rect.h || size.h;
        var sizeDialog = this.sizeDialog = Dialog.getDialogSizeByContentSize(size, this.opt);
        Dialog.fitPos(pos, sizeDialog, isNotCenter);
        var dialogBody = this.dialogBody,
            dialogMask = this.dialogMask,
            targetNode = this.targetNode;

        dialogBody.style.left = targetNode ? 0 : pos.x + "px";
        dialogBody.style.top = targetNode ? 0 : pos.y + "px";

        if (!targetNode) {
            dialogBody.style.width = sizeDialog.w + "px";
        }

        this.dialogContent && (this.dialogContent.style.height = size.h + "px");
        if (this.dialogFrame) {
            this.dialogFrame.style.cssText = ["width:", size.w, "px;height:", size.h, "px;"].join("");
        }
        dialogMask.style.left = pos.x + "px";
        dialogMask.style.top = pos.y + "px";
        dialogMask.style.width = sizeDialog.w + "px";
        dialogMask.style.height = sizeDialog.h + "px"
    };

    Dialog.prototype.enableSubmit = function () {

    };

    Dialog.prototype.disableSubmit = function () {

    };

    Dialog.prototype.submit = function () {
        if (!this.quiet) {
            this.disableSubmit();
            if (typeof this.opt.onSubmit == "function") {
                var aX;
                try {
                    aX = this.opt.onSubmit.call(this, {
                        context: this.opt.context
                    })
                } catch (aW) {
                }
                aX !== false && (this.type == "frame" ? this._send("submit") : this.succeed())
            } else {
                this.type == "frame" ? this._send("submit") : this.succeed()
            }
        }
    };

    Dialog.prototype.succeed = function (aY) {
        aY = aY || {};
        var aW = aY.timestamp ? new Date().getTime() - aY.timestamp : 0;
        aY.context = this.opt.context;
        this._submitted = true;
        try {
            typeof this.opt.onSuccess == "function" && this.opt.onSuccess.call(this, aY)
        } catch (aX) {
        }
        this.quiet ? this.quit() : this.type == "confirm" ? this.close() : this.enableSubmit();
        this._flag && LIB.valueStat(this._flag, 1, 21, {
            rate: LIB.timeBasedRate(this._rates.succeed || 0),
            duration: aW
        })
    };

    Dialog.prototype.show = function (aY) {
        aY = aY || {};
        var aW = aY.timestamp ? new Date().getTime() - aY.timestamp : 0;
        if (this.quiet) {
            this.resize(aY);

            var dialogBody = this.dialogBody,
                dialogMask = this.dialogMask,
                hideBorder = this.opt.hideBorder;

            dialogBody.style.visibility = "visible";
            dialogMask.style.visibility = "visible";
            LIB.setTimeout(function () {
                    dialogBody.className = hideBorder ? "cash_dialog_wrap_no_border" : "cash_dialog_wrap";
                    dialogMask.className = "cash_dialog_mask"
                },
                0, this);
            this.quiet = false;
            try {
                typeof this.opt.onShown == "function" && this.opt.onShown.call(this, {
                    context: this.opt.context
                })
            } catch (aX) {
            }
        }
        this._flag && LIB.valueStat(this._flag, 1, 23, {
            rate: LIB.timeBasedRate(this._rates.show || 0),
            duration: aW
        })
    };

    Dialog.prototype.error = function (aY) {
        aY = aY || {};
        var aW = aY.timestamp ? new Date().getTime() - aY.timestamp : 0;
        aY.context = this.opt.context;
        if (this.quiet) {
            try {
                typeof this.opt.onError == "function" ? this.opt.onError.call(this, aY) : aY.msg && aw.show(3, aY.msg, 3000)
            } catch (aX) {
            }
            this.quit()
        } else {
            this.enableSubmit();
            try {
                typeof this.opt.onError == "function" && this.opt.onError.call(this, aY)
            } catch (aX) {
            }
        }
        this._flag && LIB.valueStat(this._flag, 2, 22, {
            rate: LIB.timeBasedRate(this._rates.error || 0),
            duration: aW
        })
    };

    Dialog.prototype.close = function (aY) {
        !aY && this._send("close");
        aY = aY || {};
        var aW = aY.timestamp ? new Date().getTime() - aY.timestamp : 0;
        aY.context = this.opt.context;
        if (this.quiet) {
            this.quit()
        } else {
            try {
                !this._submitted && typeof this.opt.onCancel == "function" && this.opt.onCancel.call(this, aY)
            } catch (aX) {
            }
            try {
                typeof this.opt.onClose == "function" && this.opt.onClose.call(this, aY)
            } catch (aX) {
            }
            this.quit()
        }
        this._flag && LIB.valueStat(this._flag, 1, 24, {
            rate: LIB.timeBasedRate(this._rates.close || 0),
            duration: aW
        })
    };

    Dialog.prototype.setForeground = function () {
        if (dialogQueue[0] == this || !_dialogInstance[this.id]) {
            return
        }
        var aY = [this];
        for (var aX = 0,
                 aW; aW = dialogQueue[aX]; aX++) {
            aW != this && aY.push(aW)
        }
        dialogQueue = aY;
        if (dialogZIndex >= 8000) {
            dialogZIndex = 5000;
            for (var aX = dialogQueue.length - 1; aX >= 0; aX--) {
                dialogQueue[aX].zIndex = dialogZIndex++;
                dialogQueue[aX].dialogBody.style.zIndex = dialogQueue[aX].zIndex
            }
        } else {
            this.zIndex = dialogZIndex++;
            this.dialogBody.style.zIndex = this.zIndex
        }
    };

    Dialog.prototype.quit = function () {
        LIB.detachEvent(this.dialogBody, "click");
        this.dialogHeader && LIB.detachEvent(this.dialogHeader, "mousedown");
        this.dialogCloseButton && LIB.detachEvent(this.dialogCloseButton, "click");
        this.dialogFooter && LIB.detachEvent(this.dialogFooter, "click");
        this.dialogBody.className = this.opt.hideBorder ? "cash_dialog_wrap_no_border_noani" : "cash_dialog_wrap_noani";
        this.dialogBody.style.visibility = "hidden";
        this.dialogBody.style.left = "-1000px";
        this.dialogBody.style.top = "-1000px";

        this.dialogMask.parentNode.removeChild(this.dialogMask);

        var queue = [];
        for (var aX = 0,
                 aW; aW = dialogQueue[aX]; aX++) {
            aW != this && queue.push(aW)
        }
        dialogQueue = queue;
        if (queue.length == 0) {
            dialogZIndex = 5000
        }
        delete _dialogInstance[this.id];
        this._stream && this._stream.close();
        LIB.setTimeout(function () {
                this.dialogContent.innerHTML = "";
                this.dialogContent = null;
                this.dialogBody.parentNode.removeChild(this.dialogBody);
            },
            2000, this)
    };

    Dialog.prototype._dragStart = function (aW) {
        var srcElement = aW.target || aW.srcElement;
        if (srcElement == this.dialogCloseButton) {
            return
        }
        if (this._dragInfo) {
            return
        }
        this.dialogBody.className = this.opt.hideBorder ? "cash_dialog_wrap_no_border_noani" : "cash_dialog_wrap_noani";
        this.dialogMask.className = "cash_dialog_mask_noani";
        var aX = document.createElement("div");
        this.dialogContent && this.dialogContent.appendChild(aX);
        aX.className = "cash_dialog_content_mask";
        this._dragInfo = {
            x: this.pos.x - aW.clientX,
            y: this.pos.y - aW.clientY,
            mask: aX
        };
        this.dialogHeader && this.dialogHeader.setCapture ? this.dialogHeader.setCapture() : window.captureEvents && window.captureEvents(Event.MOUSEMOVE | Event.MOUSEUP);
        LIB.attachEvent(document.documentElement, "mousemove", this._drag, {
            self: this
        });
        LIB.attachEvent(document.documentElement, "mouseup", this._dragEnd, {
            self: this
        });
        aW.preventDefault ? aW.preventDefault() : (aW.returnValue = false)
    };

    Dialog.prototype._drag = function (aW) {
        if (!this._dragInfo) {
            return
        }
        var aX = CAV._getClientRect(),
            aY = LIB.getScrollLeft(),
            aZ = LIB.getScrollTop();
        this.resize({
                x: this._dragInfo.x + Math.min(aX.right - aY, Math.max(aX.left - aY, aW.clientX)),
                y: this._dragInfo.y + Math.min(aX.bottom - aZ, Math.max(aX.top - aZ, aW.clientY))
            },
            true);
        aW.preventDefault ? aW.preventDefault() : (aW.returnValue = false)
    };

    Dialog.prototype._dragEnd = function (aW) {
        if (!this._dragInfo) {
            return
        }
        LIB.detachEvent(document.documentElement, "mousemove", this._drag);
        LIB.detachEvent(document.documentElement, "mouseup", this._dragEnd);
        this.dialogHeader && this.dialogHeader.releaseCapture ? this.dialogHeader.releaseCapture() : window.releaseEvents && window.releaseEvents(Event.MOUSEMOVE | Event.MOUSEUP);
        this.dialogContent && this.dialogContent.removeChild(this._dragInfo.mask);
        this._dragInfo = null;
        this.dialogBody.className = this.opt.hideBorder ? "cash_dialog_wrap_no_border" : "cash_dialog_wrap";
        this.dialogMask.className = "cash_dialog_mask";
        aW.preventDefault ? aW.preventDefault() : (aW.returnValue = false)
    };

    Dialog.prototype._send = function (aX, aW) {
        if (!this._stream) {
            return
        }
        DLG._call(this._stream, aX, aW)
    };

    Dialog.prototype._handleRemote = function (key, args) {
        args = args || {};
        var _ts = args.timestamp ? new Date().getTime() - args.timestamp : 0,
            _opt = this.opt,
            _method,
            _ret;
        switch (key) {
            case "load":
                if (args) {
                    this.quiet = args.quiet
                }
                try {
                    typeof _opt.onFrameLoad == "function" && _opt.onFrameLoad.call(this, {
                        context: _opt.context
                    })
                } catch (aX) {
                }
                break;
            case "notify":
                try {
                    typeof _opt.onNotify == "function" && _opt.onNotify.call(this, args)
                } catch (aX) {
                }
                break;
            case "succeed":
            case "error":
            case "show":
            case "close":
            case "resize":
            case "enableSubmit":
            case "disableSubmit":
            case "setForeground":
                this[key].call(this, args);
                break;
            default:
                if (_opt.methods && (_method = _opt.methods[key])) {
                    typeof _method.method == "function" && _method.method.call(this, args);
                    (_ret = _method.ret) && this._flag && LIB.valueStat(this._flag, _ret >= 0 ? 1 : 2, Math.abs(_ret), {
                        rate: LIB.timeBasedRate(_method.rate || 0),
                        duration: _ts
                    })
                } else {
                    LIB.warn("Invalid method from Remote: " + key)
                }
                return
        }
    };

    function _dialogHandler(args, port) {
        var _instance = _dialogInstance[port];
        _instance && DLG._handle(_instance._stream, args) && _instance._handleRemote(args.key, args.args)
    }

    /************************************Dialog APIs***********************************/
    thisAPI.dialog = {};

    var _map = {
        pay: 'index',
        minipay: 'mini',
        frame: 'iframe',
        app: 'mini',
        recharge: 'Q币充值',
        service: '包月开通',
        game: '游戏充值'
    };
    //将点券切换到webpay版本的白名单
    var _webpayWhiteList = {
        game:["cfdq","hltjcz","loldq","dnfdq","jldq","tymyddh","fifaot","qqxw2","nbakdq","nfsolcz","ylztjdb","jfzrdq","xxxy","ffowy","qqsgpay","avad","qqxxyb","qqkdc","fhzg","ylzt","wcbydq","qcdd","qqxy","qqjx","ttds","tt2dq","qqclqb",
        "dzsdq","jjxfdq","ydzwym","qqshdq","dj2dy","slyx","lszt","qxzb","xwdq"]
    },_webpayGrayNumber = {
        //"hltjcz":" 46"
    },
    _webpaySupported = function(opts){
        var supported = false;
        var whiteList = _webpayWhiteList[opts.type];
        LIB.each(whiteList,function(index,code){
            if(opts.codes ==  code){
                supported = true;
                return false;
            }
        });
        if(_webpayGrayNumber[opts.codes]){
            var _uin = thisAPI.LIB.cookie.get('uin'), _last_uin = _uin.substr(_uin.length - 2, 1);
            supported = _webpayGrayNumber[opts.codes].indexOf(_last_uin)<=0;
        }
        return supported;
    };
    thisAPI.dialog.midasBuy = function (opts) {
        // 检查业务列表
        if (!opts) {
            return null;
        }

        // 检查是否允许多开
        if (!opts.multi && dialogQueue.length >= 1) {
            return null;
        }
        //构造登录态参数
        var urlParams = []
        if (opts.params) {
            for (var paramItem in opts.params) {
                urlParams.push("&" + paramItem + "=" + (opts.params[paramItem]))
            }
        }
        LIB.logData({
            36: location.href,//调用业务网址
            21:'pay.cashier.midasBuy',//接口名
            50:navigator.userAgent,//userAgent
            19:opts.codes,
            8:opts
        });
        var _dlg = thisAPI.LIB.Dialog.construct(opts, {
            targetNode: opts.targetNode,
            wrapper: 'left_sidebar',
            title: (opts.title || '充值'),
            //src: "//pay.qq.com:8080/views/mini.html?" + urlParams.join("") + (opts.debug ? "&sandbox=1" : "")+(opts.showHeaderLogo ? "&show_header_logo=1" : "&show_header_logo=0"),
            src: "//pay.qq.com/midas/minipay/views/mini.html?" + urlParams.join("") + (opts.debug ? "&sandbox=1" : "")+(opts.showHeaderLogo ? "&show_header_logo=1" : "&show_header_logo=0"),
            size: {
                w: opts.width || 700,
                h: opts.height || 620
            },
            hideBorder: opts.hideBorder === false ? opts.hideBorder : true,
            hideHeader: opts.hideHeader === false ? opts.hideHeader : true,
            preventDragging: opts.preventDragging ? opts.preventDragging : false,
            hideCloseButton: opts.hideCloseButton === false ? opts.hideCloseButton : true

        }, 'dialog.midasbuy');
        return _dlg;
    };
    
    thisAPI.dialog.mobileBuy = function (opts) {
        // 检查业务列表
        if (!opts || !opts.codes) {
            return null;
        }

        // 检查是否允许多开
        if (!opts.multi && dialogQueue.length >= 1) {
            return null;
        }
        //构造登录态参数
        var urlLoginParams = []
        if (opts.params) {
            for (var paramItem in opts.params) {
                urlLoginParams.push("&" + paramItem + "=" + opts.params[paramItem])
            }
        }
        LIB.logData({
            36: location.href,//调用业务网址
            21:'pay.cashier.mobileBuy',//接口名
            50:navigator.userAgent,//userAgent
            19:opts.codes,
            8:opts
        });
        var _dlg = thisAPI.LIB.Dialog.construct(opts, {
            targetNode: opts.targetNode,
            wrapper: 'left_sidebar',
            title: (opts.title || '充值'),
            src: "//pay.qq.com/ipay/mobile-game/mini.shtml?game=" + opts.codes + (opts.debug ? "&sandbox=1" : "") + urlLoginParams.join(""),
            size: {
                w: opts.width || 575,
                h: opts.height || 456
            },
            hideBorder: opts.hideBorder || false,
            hideHeader: opts.hideHeader || false,
            preventDragging: opts.preventDragging || false,
            hideCloseButton: opts.hideCloseButton || false

        }, 'dialog.mobilebuy');
        return _dlg;

    };

    thisAPI.dialog.buy = function (opts) {
        // 检查业务列表
        if (!opts || !opts.codes) {
            return null;
        }

        // 检查aid
        if (!opts.aid) {
            alert('minipay的统计字段aid似乎没有指定');
            return null;
        }

        // 检查是否允许多开
        if (!opts.multi && dialogQueue.length >= 1) {
            return null;
        }

        var codes = opts.codes = opts.codes || 'qqacct_save';

        // Fixme: 蓝钻兼容性处理
        if (codes.indexOf('xxzxgp') > -1 && codes.indexOf('xxzxgj') > -1) {
            opts.codes = codes.replace(/,xxzxgp|xxzxgp,|xxzxgp/, '');
        }

        var _src_name = _map[opts.scene || 'minipay'] || 'minipay',
            _channels = opts.soc ? '!' + opts.soc : "";
        var useWebpay = _webpaySupported(opts);
        if(useWebpay&&_src_name == "iframe"){
            _src_arr = [
                '//pay.qq.com/midas/minipay_v2/views/payindex/pcgame.shtml?code=' + opts.codes,
                opts.amount ? '&buy_quantity=' + opts.amount : '',
                opts.debug ? '&env=sandbox' : '',
                opts.aid ? '&aid=' + opts.aid : '',
                opts.pf ? '&pf=' + opts.pf : ''
            ];
        }else{
            _src_arr = [
                '//pay.qq.com/ipay/' + _src_name + '.shtml?s=' + (_src_name === 'mini' ? 'minipay' : ''),
                '&ch=' + (opts.channels || _channels),
                '&c=' + opts.codes,
                opts.defaultChannel ? '&dc=' + opts.defaultChannel : '',
                opts.amount ? '&n=' + opts.amount : '',
                opts.presetAmount ? '&nl=' + opts.presetAmount : '',
                opts.target ? '&u=' + opts.target : '',
                opts.amountType ? '&nt=' + opts.amountType : '',
                opts.disallowSend ? '&ds=1' : '',
                opts.disableRule ? '&dr=1' : '',
                opts.actid ? '&actid=' + opts.actid : '',
                opts.actinfo ? '&actinfo=' + opts.actinfo : '',
                opts.price ? '&price=' + opts.price : '',
                opts.appid ? '&appid=' + opts.appid : '',
                opts.token ? '&token=' + opts.token : '',
                opts.openid ? '&openid=' + opts.openid : '',
                opts.version ? '&version=' + opts.version : '',
                opts.source ? '&p=' + opts.source : '',
                opts.zoneid ? '&zoneid=' + opts.zoneid : '',
                opts.defaultTeam ? '&defaultteam=' + opts.defaultTeam : '',
                opts.rolename ? '&rolename=' + opts.rolename : '',
                opts.skin ? '&skin=' + opts.skin : '',
                opts.autopay === false ? '&autopay=0' : '',
                opts.hideCloseButton ? '&hcb=1' : '',
                opts.hideLeftSidebar ? '&hl=1' : '',
                opts.period ? '&period=1' : '',
                opts.debug ? '&debug=1' : '',
                opts.sandbox? ('&sandbox='+opts.sandbox):"",
                opts.aid ? '&aid=' + opts.aid : '',
                opts.buttons ? '&btns=' + opts.buttons : '',
                opts.pf ? '&pf=' + opts.pf : ''
            ];
            LIB.logData({
                36: location.href,//调用业务网址
                21: 'pay.cashier.buy',//接口名
                50: navigator.userAgent,//userAgent
                19: opts.codes,
                8: opts
            });
        }
        if (_src_name === 'iframe') {
            var iframeHeight = useWebpay?(opts.h||755):580;
            opts.pre_node && (function () {
                opts.pre_node.style.width = '990px';
                opts.pre_node.style.height = iframeHeight+"px";
            })();
            var _dlg_iframe = thisAPI.LIB.Dialog.construct(opts, {
                targetNode: opts.pre_node,
                title: '',
                src: _src_arr.join(''),
                hideBorder: true,
                hideHeader: true,
                size: {
                    w: 990,
                    h: iframeHeight
                },
                methods: {
                    foot2: function (args) {
                        args = args || {h: iframeHeight};
                        this.targetNode ? this.targetNode.style.height = args.h + 'px' : 0;
                    },
                    foot3: function (args) {
                        args = args || {h: iframeHeight};
                        this.targetNode ? this.targetNode.style.height = args.h + 'px' : 0;
                        try {
                            ('function' === typeof this.opt.onHeight) && this.opt.onHeight(args);
                        } catch (e) {
                        }
                    }
                }
            }, 'dialog.buy');
            _dlg_iframe.dialogFrame.scrolling = 'no';
            return _dlg_iframe;
        } else {
            var _dlg = thisAPI.LIB.Dialog.construct(opts, {
                targetNode: opts.targetNode,
                wrapper: 'left_sidebar',
                title: opts.title || ( (_map[opts.type || 'recharge'] || 'Q币充值') + ((thisAPI.LIB.cookie.get('uin') && thisAPI.LIB.cookie.get('skey')) ? '（' + thisAPI.LIB.cookie.get('uin').substr(1) * 1 + '）' : '')),
                src: _src_arr.join(''),
                size: {
                    w: opts.width || 575,
                    h: opts.height || 456
                },
                hideBorder: opts.hideBorder || false,
                hideHeader: opts.hideHeader || false,
                preventDragging: opts.preventDragging || false,
                hideCloseButton: opts.hideCloseButton || false,
                methods: {
                    modifyTitle: function (args) {
                        args && _dlg.dialogTitle && (_dlg.dialogTitle.innerHTML = args);
                    }
                }
            }, 'dialog.buy');
            return _dlg;
        }
    };

    thisAPI.dialog.officialBuy = function (opts) {
        // 检查业务列表
        if (!opts || !opts.appid) {
            alert('游戏侧的应用id不能为空');
            return null;
        }

        if (!opts || !opts.productid) {
            alert('游戏侧的道具不能为空');
            return null;
        }

        if (!opts || !opts.pf) {
            alert('支付下单pf不能为空');
            return null;
        }

        if (!opts || !opts.itemnum) {
            alert('购买数量不能为空！');
            return null;
        }

        if (!opts || !opts.zoneid) {
            alert('账户分区不能为空！');
            return null;
        }

        if (!opts || !opts.gameid) {
            alert('游戏分区不能为空！');
            return null;
        }

        if (!opts || !opts.app_metadata) {
            alert('业务侧需要回传的信息不能为空，例如订单号！');
            return null;
        }

        if (!opts || !opts.sig) {
            alert('支付订单签名不能为空！');
            return null;
        }

        if (!opts || !opts.sessionid) {
            alert('缺少登录态字段sessionid！');
            return null;
        }

        if (!opts || !opts.sessiontype) {
            alert('缺少登录态字段sessiontype！');
            return null;
        }

        if (!opts || !opts.openid) {
            alert('缺少登录态字段openid！');
            return null;
        }

        if (!opts || !opts.openkey) {
            alert('缺少登录态字段openkey！');
            return null;
        }

        var _params = function (params) {
            params = params || {};
            var gets = [];
            for (var k in params) {
                gets.push(k + '=' + encodeURIComponent(params[k]));
            }
            return gets.join('&');
        }, _dlg = thisAPI.LIB.Dialog.construct(opts, {
            targetNode: opts.targetNode,
            wrapper: 'left_sidebar',
            title: (opts.title || '手游充值'),
            src: '//pay.qq.com/ipay/official_buy.shtml?' + _params({
                c: opts.appid,
                pid: opts.productid,
                pf: opts.pf,
                openid: opts.openid,
                openkey: opts.openkey,
                sessionid: opts.sessionid,
                sessiontype: opts.sessiontype,
                n: opts.itemnum,
                zid: opts.zoneid,
                gid: opts.gameid,
                amid: opts.app_metadata,
                sig: opts.sig
            }) + (opts.sandbox == 1 ? '&sandbox=1' : ''),
            size: {
                w: opts.width || 575,
                h: opts.height || 456
            },
            hideBorder: opts.hideBorder || false,
            hideHeader: opts.hideHeader || false,
            preventDragging: opts.preventDragging || false,
            hideCloseButton: opts.hideCloseButton || false

        }, 'dialog.officialBuy');
        return _dlg;
    };

    /* 游戏点券的灰度相关解决方案
     * {
     *  pre_node :
     * 	scene : 'pay' // minipay, frame, app ...
     * 	codes : 'ylzt'
     * 	uin : '5,6,7,8,9' //灰度号段用新版，必选
     *  cb  : function(){}//0：回到老版本；-1：未登录
     *  aid : ''
     * }
     */
    thisAPI.gray = function (opts) {
        if (!opts || !opts.uin) {
            return null;
        }
        var _gray_uin = opts.uin.split(','), _uin = thisAPI.LIB.cookie.get('uin'), _last_uin = _uin.substr(_uin.length - 2, 1), _rr = Math.random();
        thisAPI.LIB.report(['//upayportal.qq.com/cgi-bin/action_report.fcg?ch=self',
            'uin=' + _uin.substr(1) * 1,
            'action=' + opts.source + '_' + opts.type + '.pv',
            'aid=' + (opts.aid || ''),
            'service=' + (opts.type === 'game' ? '-' + opts.codes : opts.codes),
            'sessionid=' + (_uin + _rr),
            'rr=' + _rr].join('&'));
        LIB.logData({
            36: location.href,//调用业务网址
            3: _uin,//用户uin
            21:'pay.cashier.gray',//接口名
            50:navigator.userAgent,//userAgent
            19:opts.codes,
            8:opts
        });
        if (!opts.qqnumber && !thisAPI.LIB.cookie.get('skey')) {//not login
            try {
                ('function' == typeof opts.cb) && opts.cb(-1);
            } catch (e) {
                thisAPI.LIB.err(e);
            }
        } else if (_gray_uin.length <= 0) {//not gray
            return thisAPI.dialog.buy(opts);
        } else {
            try {
                !!opts.qqnumber && (function () {
                    opts.qqnumber = opts.qqnumber.toString();
                    _last_uin = opts.qqnumber.substr(opts.qqnumber.length - 2, 1);
                })();
                if (opts.uin.indexOf(_last_uin) > -1) {
                    return thisAPI.dialog.buy(opts);
                } else {
                    ('function' == typeof opts.cb) && opts.cb(0);
                }
            } catch (e) {
                thisAPI.LIB.err(e);
            }
        }
    };
})();