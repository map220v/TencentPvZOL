var APP_ID = 1101214027;//PVZ的aid
var APP_KEY= "v2eGGy09qTO51t1g";


function init()
{
	var m_isQa = window.location.href.indexOf("isQa") != -1;
	if (m_isQa)
		isQa = m_isQa;

	if (!isQa)
		document.domain = "qq.com";
	showFlash(1);
	
	window.onkeypress = function()
	{
		flash().focus();
	}
}

function registerExitFunc(){
	window.onbeforeunload = onExit; 	
}  
      
function unregisterExitFunc(){
    window.onbeforeunload = null; 
}

//退出提示
function onExit(){
	if(flash()){
			//新用户关闭窗口提示收藏页面
			//if(window.isNewPlayer==1 && getPlatform()=="gamewireless"){
				//bookmarksite('http://pvz.qq.com','');
			//}
			var tip=flash().getExitTip();
			if(tip && tip.length>0){
				return tip;
			}else{
				return;
			}		
		}
		return;
}
		 
function QueryString(fieldName) { 
	var urlString = document.location.search;
	var defVal = null;
	var result = ((RegExp('(^|\\?|&|#)' + fieldName+ '=([^&#]*)').exec(urlString || location.href)||[,,undefined===defVal ? '' : defVal])[2]);
	return null == result ? result : result.replace(/['"<>]/g, "");
}
function getFlashSize()
{
	var maxW = $(window).width();
	if (maxW > 1440)
		maxW = 1440;
	if (maxW < 900)
		maxW = 900;
	var maxH = $(window).height();
	if (maxH > 900)
		maxH = 900;
	if (maxH < 500)
		maxH = 500;
	var fitH;
	var fitW;
	var ratio16_10 = 16/10;
	var ratio4_3 = 4/3;
	var ratio = maxW / maxH;
	if(ratio>ratio16_10){
		ratio=ratio16_10;
	}else if(ratio<(4/3)){
		ratio=ratio4_3;
	}
	fitH = Math.floor(maxW * (1/ratio)) ;
	fitW = Math.floor(maxH * ratio) ;
	if(fitW>maxW){
		fitW=maxW;
		fitH = Math.floor(maxW * (1/ratio));
	}
	if(fitH>maxH){
		fitH=maxH;
		fitW = Math.floor(maxH * ratio);
	}

	return [fitW,fitH];
}
function getFlashWidth()
{
	var size = getFlashSize();
	return size[0];
}

function getFlashHeight()
{
	var size = getFlashSize();
	return size[1];
}

function refresh()
{
	window.location.reload();
}

function refreshParent()
{
	window.parent.location.reload();
}

function getCookie(key)
{
	return $.cookie(key);
}
function invite(args)
{
	args.msg = decodeURIComponent(args.msg);
	if(getPlatform() == "qplus")
	{
		args.param = args.source;
		qplus.app.invite(args,
			function(json){
				if(json.errCode == 0)
					flash().onInviteSuccess(json);
			})
	}
	else if(getPlatform() == "qqgame")
	{
		var param = {'tabid':0,'gamepara':QueryString('zone')};

		top.window.GameAPI.InviteEx(10134,param,onClose,function(ret){flash().onInviteSuccess(ret);});
	}
	else if(getPlatform() == "3366")
	{
		args.title = "邀请好友";
		args.onSuccess = function(ret){flash().onInviteSuccess(ret);};
		args.onCancel = onClose;
		args.onClose = onClose;
		Open3366API.Invite.show(APP_ID, args);
		setBackground();
	}
	else if(QueryString("channel") == "facebook")
	{
		 FB.ui({method: 'apprequests',
			message: args.msg,
			data:{"invite_uin":QueryString2("invite_uin",args.source),"invite_zone":QueryString2("invite_zone",args.source),"act_id":QueryString2("act_id",args.source)}
		},function(param){
			flash().onInviteSuccess({"invitees":param.to});
		});
	}
	else
	{
		onShow();
		args.onSuccess = function(ret){flash().onInviteSuccess(ret);};
		args.onClose = onClose;
		fusion2.dialog.invite(args);
	}
}
function sendStory(args)
{
	if(getPlatform() == "qplus")
	{
		args.shareBtnText = "分享";
		args.pic = args.img;
		args.shareTo = ["buddy","qzone","wblog"];
		qplus.app.share(args,
			function(json){
				if(json.errCode == 0)
					flash().onSendStorySuccess(json);
			});
	}
	else
	{
		onShow();
		args.onSuccess = function(ret){flash().onSendStorySuccess(ret);};
		args.onClose = onClose;
		fusion2.dialog.sendStory(args);
	}
}
function openYellow(args)
{
	args.onSuccess = function(ret){flash().onOpenYellowSuccess(ret);};
	fusion2.dialog.openVipGift(args);
}
function openQQVip(args)
{
	qplus.payment.buyVipService(args,
		function (json) 
		{
			if(json.errCode == 0)
			{
				flash().onOpenQQVipSuccess(json);
			}
		}
	);
}
function openMagic(args)
{
	args.onClose = function(ret){flash().onOpenMagicSuccess(ret);};
	args.onSuccess = function(ret){
		flash().onOpenMagicSuccess(ret);
	};
	fusion2.dialog.openVipGift(args);
}

var rawHeight=0;
var rawWidth=0;
var isShowGame=1;
function onShow()
{
	//if(getPlatform() == "website")
	//{
	//	isShowGame=0;
	//	rawHeight = jQuery("#flashContent").height();
	//	rawWidth = jQuery("#flashContent").width();
	//	jQuery("#flashContent").width("1px");
	//	jQuery("#flashContent").height("1px");
		$("#bg1").css('display','block');
	//}
}
function onClose()
{
	//if(getPlatform() == "website")
	//{
	//	isShowGame=1;
	//	jQuery("#flashContent").width(getFlashWidth()+"px");
	//	jQuery("#flashContent").height(getFlashHeight()+"px");
		$("#bg1").css('display','none');
	//}
}
function flash() {
    if (navigator.appName.indexOf("Microsoft") != -1) {
        return window["flashContent"];
    } else {
        return document["flashContent"];
    }
}
function getParamOrCookie(name){
	var val  = QueryString(name);
	if(!val || val == "null" || val == "undefined" || val == ""){
		val = $.cookie(name);
	}
	if (!val) { val = ""; }
	return val;
}

function showFlash(isnew) {
	var resurl = location.href.replace(/\?.*/, '');
	resurl = resurl.substr(0, resurl.lastIndexOf('/') + 1);
	var loaderswf = resurl + getLoaderName();
	var swfVersionStr = "10.0.0";
	var xiSwfUrlStr = resurl + "playerProductInstall.swf";
	var attributes = {};
	attributes.id = "flashContent";
	attributes.name = "flashContent";
	var params;
	if (isDebug)
		params = {
				"mode":getGameMode(),
				"sFrom":getParamOrCookie("sFrom") || '',
				"channel":getParamOrCookie("channel") || '0',
				"ADTAG":getParamOrCookie("ADTAG") || '0',
				"openid":getParamOrCookie("openid") || '',
				"openkey":getParamOrCookie("openkey") || '',
				"needactive":getParamOrCookie("needactive") || '',
				"pf":getParamOrCookie("pf") || '',
				"pfkey":getParamOrCookie("pfkey") || '',
				"isMC":getParamOrCookie("isMC") || '0',
				"banActViewID":getParamOrCookie("banActViewID") || '',
				"app_custom":getParamOrCookie("app_custom") || ''
			};
	else
		params = {
				"mode":getGameMode(),
				"uin":getParamOrCookie("uin"),
				"skey":getParamOrCookie("skey"),
				"zoneID":getParamOrCookie("sServerID"),
				"tgw":QueryString("tgw") || '',
				"server":QueryString("game_url") || '',
				"sFrom":getParamOrCookie("sFrom") || '',
				"channel":getParamOrCookie("channel") || '0',
				"ADTAG":getParamOrCookie("ADTAG") || '0',
				"openid":getParamOrCookie("openid") || '',
				"openkey":getParamOrCookie("openkey") || '',
				"needactive":getParamOrCookie("needactive") || '',
				"pf":getParamOrCookie("pf") || '',
				"pfkey":getParamOrCookie("pfkey") || '',
				"zoneParam":getParamOrCookie("app_custom") || '',
				"hallParam":getParamOrCookie("param") || '',
				"APP_ID":APP_ID,
				"isMC":getParamOrCookie("isMC") || '0',
				"banActViewID":getParamOrCookie("banActViewID") || '',
				"app_custom":getParamOrCookie("app_custom") || ''
			};
	
	swfobject.embedSWF(loaderswf, "flashdiv", getFlashWidth(), getFlashHeight(), swfVersionStr, xiSwfUrlStr, 
			params,
			{
				'allowfullscreen':'true',
		        'allowscriptaccess':'always',
		        'wmode':getWmode()
			},attributes);
	swfobject.createCSS("#flashdiv", "display:block;");
	
}


function payVip(args)
{
	if(getPlatform() == "qplus")
	{
	}else if(getPlatform() == "3366"){
		Open3366API.NewOpenGameVIPService.show(1101214027,
		function(){
				flash().onPayClose(this.opt);
				onClose();
		},
		'VIP.APP1101214027.PLAT3366mini',
		1,
		1);
	}
	else
	{	
		//蓝钻贵族 XXQGAME//QQ会员 LTMCLUB//黄钻贵族 XXJZGW
		var codes;
		switch (getPlatform())
		{
			case "qqgame":
				codes = "XXQGAME";
				break;

			case "qzone":
				codes = "XXJZGW";
				break;
				
			case "":
			default:
				codes = "LTMCLUB";
				break;
		}

		var _dlg = cashier.dialog.buy({
			scene : 'minipay',
			codes : codes,
			type:'service',
			amountType : 'month',
			amount:'1',
			source:15998,
			channels : 'qdqb,kj',
			aid:'VIP.APP' + APP_ID + '.PLATqqgamemini',
			//appid:APP_ID,
			skin:'minipay4',
			hideBorder:false,
			hideHeader:false,
			preventDragging:true,
			hideCloseButton:false,
			onClose:function(){
				flash().onPayClose(this.opt);
				onClose();
			},
			onCancel:function(){
			},
			onSuccess:function(){
				flash().onPaySuccess(this.opt);
			}
		});

		
		
	}
}

function queryServerName(id)
{
	var serverName = "";
	$.each(JSON_server, function(i, field)
	{
		if(i == id)
		{
			serverName = field.sServerName;
			return false;
		}
	});
	if(serverName==""){
		serverName="测试服务器"+id;
	}
	return serverName;
}

function getMiniClientInfo()
{
	var info1 = window.external.IsAutoLaunch();
	var info2 = window.external.IsAutoLaunchWithStartup();
	var info3 = window.external.SetAutoLaunch();
	//alert("enter=======");
	return "true";
}

function pay(args)
{
	if(getPlatform() == "qplus")
	{
	}
	else if(getPlatform() == "3366")
	{
	}
	else
	{
		var _dlg = cashier.dialog.buy({
			scene : 'minipay',
			codes:'zdjpc',//ZDJPC//hltjcz
			type:'game',
			source:15998,
			aid:'cashier.mini',
			skin:'minipay4',
			rolename:args.rolename,
			zoneid:getParamOrCookie("sServerID"),
			hideBorder:false,
			hideHeader:false,
			preventDragging:true,
			hideCloseButton:false,
			onClose:function(){
				onClose();
			},
			onCancel:function(){
			},
			onSuccess:function(){
				flash().onPaySuccess(ret);
			}
		});
	}

}


function buy(args)
{
	if(getPlatform() == "qplus")
	{
		needNotice = true;
		if(init == false)
		{
			qplus.onReady(function () {
			    qplus.on('payment.stateChange', function (json) {
				    	if(json.state == "change" && needNotice){
				    		needNotice = false;
				       		flash().onBuySuccess({context:args.context})
				       		}
			       		});
			    });
			init = true;
		}
		qplus.payment.trade({
			platform:"unipay",
			sandbox:args.sandbox?1:0,
			url_params:args.param});
	}
	else if(getPlatform() == "3366")
	{
		//Open3366API.Pay.show (appid, url, sandbox, title, close_cb, buy_cb, disturb, isNew); sandbox是否沙箱环境(1:是，0:否)
		Open3366API.Pay.show(APP_ID,args.param,0,"购买道具",function(){onClose();},function(){flash().onBuySuccess({context:args.context});},0,true);
	}
	else
	{
		onShow();
		args.onSuccess = function(ret){flash().onBuySuccess(ret);};
		args.onClose = function(ret){flash().onBuyClose(ret);onClose();};
		args.onCancel = function(ret){flash().onBuyClose(ret);};
		args.sandbox = false;
		args.disturb = true;
		fusion2.dialog.buy(args);
	}
}

function onResize()
{
	if(isShowGame==1){
		rawHeight=getFlashHeight();
		rawWidth=getFlashWidth();
		$('#flashContent').width(rawWidth);
		$('#flashContent').height(rawHeight);
	}
}	

$(document).ready(function(){
	var title = queryServerName(getParamOrCookie('sServerID'));
	document.title=title+"-植物大战僵尸ONLINE";
	$(window).resize(function(){
		onResize();
	});
});

function isNormalMode(){
	if(QueryString('safeMode')==1){
		return true;
	}
	var minMajorVersion=11;
	var minMinorVersion=1;
	var flashVersion = swfobject.getFlashPlayerVersion();
	if(flashVersion['major'] == minMajorVersion && flashVersion['minor'] >= minMinorVersion){
		return false;
	}else if(flashVersion['major'] > minMajorVersion){
		return false;
	}
	return true;
}

function isStage3D(){
	return isNormalMode();
}



function getWmode(){
	if(!isStage3D()){
		if(isNormalMode()){
			return "window";
		}else{
			return "direct";
		}
	}
	return "window";
}

function getGameMode()
{
	if(!isStage3D()){
		return "super";
	}
	return "normal";
}

function getPlatform()
{
	var s = getParamOrCookie("sFrom");
	if (s == null
		|| s.length == 0){
		return "website";
		}else{
			if(s.indexOf("union")!=-1){
				var index=s.indexOf("*");
				var unionStr=s.substr(index);
				if(unionStr.indexOf("qqgame")!=-1){
					s="qqgame";
				}else if(unionStr.indexOf("3366")!=-1){
					s="3366";
				}else if(unionStr.indexOf("website")!=-1){
					s="website";
				}else if(unionStr.indexOf("qzone")!=-1){
					s="qzone";
				}else if(unionStr.indexOf("10029")!=-1){
					s="10029";
				}else{
					s="qzone";
				}
			}
		}
	return s;
}

function loadFusionjs(){
		if(getPlatform() == "qplus")
		{
			document.getElementById("fusionjs").src = "http://cdn.qplus.com/js/qplus.api.js";
		}
		else if(getPlatform() == "3366")
		{
			document.getElementById("externaljs").src = "http://www.3366.com/js/jquery.pm.js";
			document.getElementById("fusionjs").src = "http://www.3366.com/js/module/openapilib.js";
			document.getElementById("cashierjs").src = "http://imgcache.qq.com/bossweb/ipay/js/api/cashier.js";
		}
		else if(getPlatform() == "qqgame")
		{
			document.getElementById("externaljs").src = "http://imgcache.qq.com/bossweb/ipay/js/api/cashier.js";
			document.getElementById("fusionjs").src = "http://fusion.qq.com/fusion_loader?appid=" + APP_ID + "&platform=qzone"
		}
		else if(getPlatform() == "lianyun_xunlei")
		{
			document.getElementById("externaljs").src = "http://niu.xunlei.com/entergame/js/plugin.js";
		}
		else if(getPlatform() == "lianyun_dudai")
		{ 
			if(QueryString("channel") == "facebook")
			{
				window.fbAsyncInit = function() {
				    FB.init({
				      appId      : QueryString("appid")||'248420678643013',          // App ID from the app dashboard
				      status     : true,                                 // Check Facebook Login status
				      xfbml      : true                                  // Look for social plugins on the page
				    });
				 };
				(function(d, s, id) {
				  var js, fjs = d.getElementsByTagName(s)[0];
				  if (d.getElementById(id)) return;
				  js = d.createElement(s); js.id = id;
				  js.src = "//connect.facebook.net/zh_TW/all.js";
				  fjs.parentNode.insertBefore(js, fjs);
				}(document, 'script', 'facebook-jssdk'));
			}
		}
		else
		{
			document.getElementById("fusionjs").src = "http://fusion.qq.com/fusion_loader?appid=" + APP_ID + "&platform=qzone"
		}
}

function checkPcManager(){
	$.getJSON("http://p.guanjia.qq.com/bin/in/querygjstatus.php?callback=?", function(data){
							flash().onCheckPcManager(data);
						});
}

function getQtSign(url){
	$.getJSON("http://openapi.tencentyun.com/qt/get_sign_common", function(data){
							flash().onGetQTSign(data);
						});
}

function dataReport(params){
	$.getJSON("http://s9.zone.pvz.qq.com/cgi-bin/stat_log.pl?param="+ params+"&callback=?");
}

function getQBVersion() {
	var version = 0;
	try{
		try{
			version = window.external.getVersion() || 1;
		}catch(e){
			version = window.external.getbrowserversion() || 1;
		}
	}catch(e){
		version = "100.0.0.0";
	}
	return version;
}

function isQQBrowser() {
	return /QQBrowser/i.test(navigator.userAgent);
}


/**
微端：登陆入口
1.	返回参数为-1，非微端登陆
1.	返回参数为1，具有联盟平台礼包特权
2.	返回参数为2，具有3366平台礼包特权（蓝钻等）
3.	返回参数为7，具有QQ会员平台礼包特权
4.	返回参数为8，具有QQ空间平台礼包特权
5.	返回参数为9，具有游戏频道平台礼包特权
6.	返回参数为10，具有所有官网平台礼包特权
*/
function getMicroClientId() {
	var n = -1;
	try{
		n = window.external.IsMicroClient();
	}catch(e){
		n = -1;
	}

	return n;
}

/**
微端：检查当前是否开机自启动状态
*/
function getMicroClientIsAutoLaunch() {
	if (getMicroClientId() >= 0)
		return window.external.IsAutoLaunch();
	return false;
}

/**
微端：检查当前是否开机自启动状态
*/
function getMicroClientIsAutoLaunchWithStartup() {
	if (getMicroClientId() >= 0)
		return window.external.IsAutoLaunchWithStartup();
	return false;
}

/**
微端：一键设置自启动
*/
function setMicroClientSetAutoLaunch() {
	if (getMicroClientId() >= 0)
		return window.external.SetAutoLaunch();
	return false;
}


$(document).ready(function()
{
	init();
		
	loadFusionjs();

});

function keyMapToString(data){
	var str='';
	for(var value in data){
		str+=value+"="+data[value]+"&";
	}
	if(str.length>0){
		str=str.substr(0,str.length-1);
	}
	return str;
}

function doSummerActivity(taskID){
	var url="http://openapi.tencentyun.com/v3/user/set_playzone_task";
	//var url="http://119.147.19.43/v3/user/set_playzone_task";
	var data={
		openid:getParamOrCookie("openid") || '',
		openkey:getParamOrCookie("openkey") || '',
		appid:APP_ID || '',
		pf:getParamOrCookie("pf") || getParamOrCookie("sFrom"),
		format:"json",
		task_id:taskID,
		source_id:"10000454",
		cmd:"1"
	};
	var paramUrl=keyMapToString(data);
	var sigValue=getSig("GET","/v3/user/set_playzone_task",paramUrl,APP_KEY);
	data["sig"]=sigValue;
	paramUrl=keyMapToString(data);
	return paramUrl;
}

var isShowWebPage=0;

function showNativePage(url){
	if(isShowWebPage==1) return;
	isShowWebPage=1;
	onShow();
	jQuery("#webpage").attr("style","display: block;width:1600px;height:900px;margin-left: -800px;left:50%;position: absolute;background-color: #000000;");
	jQuery("#webpage").html("<iframe src='"+url+"' style='width:1600px;height:"+$(window).height()+"px;border:0px'></iframe>" );
}

function hideBangBang(){
	if(isShowWebPage==0) return;
	isShowWebPage=0;
	jQuery("#webpage").hide();
	jQuery("#webpage").html("");
	onClose();
}
