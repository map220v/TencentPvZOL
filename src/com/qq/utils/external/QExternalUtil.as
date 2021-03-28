package com.qq.utils.external
{
   import asgui.utils.StringUtil;
   import com.qq.modules.buy.command.BuyViewCmd;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.pcManager.command.PcManagerProxyCmd;
   import com.qq.modules.qzoneShare.command.QZoneShareCmd;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import org.as3commons.logging.api.getLogger;
   
   public final class QExternalUtil
   {
      
      private static var _isQQBrowser:int = -1;
       
      
      public function QExternalUtil()
      {
         super();
      }
      
      public static function addListener() : Boolean
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.addCallback("onInviteSuccess",function(... rest):void
            {
               getLogger("external").info("onInviteSuccess");
            });
            ExternalInterface.addCallback("onPaySuccess",function(... rest):void
            {
               getLogger("external").info("onPaySuccess");
               CommonCmd.sendVipPaySuccess();
            });
            ExternalInterface.addCallback("onSendStorySuccess",function(... rest):void
            {
               getLogger("external").info("onSendStorySuccess");
               QZoneShareCmd.sendQZoneShareMsg();
            });
            ExternalInterface.addCallback("onBuySuccess",function(... rest):void
            {
               getLogger("external").info("onBuySuccess");
            });
            ExternalInterface.addCallback("onBuyClose",function(... rest):void
            {
               getLogger("external").info("onBuyClose");
            });
            ExternalInterface.addCallback("onPayClose",function(... rest):void
            {
               getLogger("external").info("onPayClose");
            });
            ExternalInterface.addCallback("onCheckPcManager",function(param1:Object):void
            {
               PcManagerProxyCmd.checkPcManager(param1);
            });
            return true;
         }
         return false;
      }
      
      public static function queryServerName(param1:String) : String
      {
         var _loc2_:String = null;
         if(ExternalInterface.available)
         {
            _loc2_ = ExternalInterface.call("queryServerName",param1);
         }
         if(_loc2_ == null || _loc2_ == "undefined")
         {
            _loc2_ = "测试服务器" + param1;
         }
         return _loc2_;
      }
      
      public static function showInvite() : Boolean
      {
         var _loc1_:Object = null;
         if(ExternalInterface.available)
         {
            _loc1_ = {};
            ExternalInterface.call("invite",_loc1_);
            return true;
         }
         return false;
      }
      
      public static function showSendStory(param1:String, param2:String, param3:String, param4:String, param5:String) : Boolean
      {
         var _loc6_:Object = null;
         getLogger("external").info("showSendStory : " + param1 + ", " + param2 + ", " + param3 + ", " + param4 + ", " + param5);
         if(ExternalInterface.available)
         {
            _loc6_ = {
               "title":param1,
               "img":param2,
               "summary":param3,
               "msg":param4,
               "button":param5
            };
            ExternalInterface.call("sendStory",_loc6_);
            return true;
         }
         return false;
      }
      
      public static function showBuy(param1:String, param2:String) : Boolean
      {
         var _loc3_:Object = null;
         var _loc4_:String = null;
         if(ExternalInterface.available)
         {
            _loc3_ = {
               "param":param1,
               "context":param2
            };
            if(ExternalVars.IS_UNION)
            {
               _loc4_ = "UNION.APP{0}.PLATUNIONmini.{1}";
               _loc3_.aid = StringUtil.substitute(_loc4_,ExternalVars.APP_ID,ExternalVars.SFrom);
            }
            ExternalInterface.call("buy",_loc3_);
            return true;
         }
         return false;
      }
      
      public static function checkPcManager() : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("checkPcManager");
         }
      }
      
      public static function showPay(param1:String) : Boolean
      {
         var _loc2_:Object = null;
         BuyViewCmd.openMallWnd();
         return true;
      }
      
      public static function showPayVip() : Boolean
      {
         var _loc1_:Object = null;
         if(ExternalInterface.available)
         {
            _loc1_ = {};
            ExternalInterface.call("payVip",_loc1_);
            return true;
         }
         return false;
      }
      
      public static function isQQBrowser() : Boolean
      {
         var _loc1_:* = undefined;
         if(_isQQBrowser == -1)
         {
            if(ExternalInterface.available)
            {
               _loc1_ = ExternalInterface.call("isQQBrowser");
               _isQQBrowser = !!_loc1_ ? 1 : 0;
            }
            else
            {
               _isQQBrowser = 0;
            }
         }
         return _isQQBrowser == 1;
      }
      
      public static function downloadQQBrowser() : Boolean
      {
         navigateToURL(new URLRequest("http://dldir1.qq.com/invc/tt/QQBrowser_Setup_PVZ.exe"),"_blank");
         return true;
      }
      
      public static function buyYellowDiamond() : void
      {
         navigateToURL(new URLRequest("http://pay.qq.com/qzone/index.shtml?aid=game1101214027.op"),"_blank");
      }
      
      public static function getMicroClientId() : int
      {
         if(ExternalInterface.available)
         {
            return ExternalInterface.call("getMicroClientId");
         }
         return -1;
      }
      
      public static function getMicroClientIsAutoLaunch() : Boolean
      {
         if(ExternalInterface.available)
         {
            return ExternalInterface.call("getMicroClientIsAutoLaunch");
         }
         return false;
      }
      
      public static function getMicroClientIsAutoLaunchWithStartup() : Boolean
      {
         if(ExternalInterface.available)
         {
            return ExternalInterface.call("getMicroClientIsAutoLaunchWithStartup");
         }
         return false;
      }
      
      public static function setMicroClientSetAutoLaunch() : Boolean
      {
         if(ExternalInterface.available)
         {
            return ExternalInterface.call("setMicroClientSetAutoLaunch");
         }
         return false;
      }
      
      public static function doSummerActivity(param1:int) : String
      {
         if(ExternalInterface.available)
         {
            return ExternalInterface.call("doSummerActivity",param1);
         }
         return "";
      }
      
      public static function openNativePage(param1:String) : String
      {
         if(ExternalInterface.available)
         {
            return ExternalInterface.call("showNativePage",param1);
         }
         return null;
      }
      
      public static function closeNativePage() : String
      {
         if(ExternalInterface.available)
         {
            return ExternalInterface.call("hideBangBang");
         }
         return null;
      }
   }
}
