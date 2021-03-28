package com.qq.utils
{
   import asgui.resources.AssetManager;
   import com.qq.display.QIconWithLabel;
   import com.qq.templates.font.FontHKHB;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.external.ExternalInterface;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.utils.ByteArray;
   
   public class UtilsManager
   {
      
      public static var exitTip:Function;
       
      
      public function UtilsManager()
      {
         super();
      }
      
      public static function removeFromContainer(param1:Object) : void
      {
         if(param1 == null || param1.parent == null)
         {
            return;
         }
         param1.parent.removeChild(param1);
      }
      
      public static function bringToTop(param1:Object) : void
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:int = 0;
         if(param1 is DisplayObject)
         {
            _loc2_ = param1 as DisplayObject;
            _loc3_ = _loc2_.parent;
            if(_loc3_ == null)
            {
               return;
            }
            _loc4_ = _loc3_.numChildren - 1;
            if(_loc3_.getChildIndex(_loc2_) != _loc4_)
            {
               _loc3_.setChildIndex(_loc2_,_loc4_);
            }
            return;
         }
      }
      
      public static function filpRectHorizontal(param1:Rectangle, param2:int) : Rectangle
      {
         if(param1 == null)
         {
            return null;
         }
         param1.x = param2 - Math.abs(param2 - param1.right);
         return param1;
      }
      
      public static function converNum(param1:Number, param2:int = 1, param3:int = 9999) : String
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param1 <= param3)
         {
            _loc4_ = param1.toString();
         }
         else
         {
            param1 *= 0.0001;
            if((_loc6_ = (_loc5_ = param1.toString()).indexOf(".")) != -1)
            {
               _loc7_ = param2;
               if(param2 > 0)
               {
                  _loc7_ += 1;
               }
               _loc5_ = _loc5_.substr(0,_loc6_ + _loc7_);
            }
            _loc4_ = _loc5_ + FontHKHB.Ten_Thousand;
         }
         return _loc4_;
      }
      
      public static function fixNum(param1:Number, param2:int = 1) : String
      {
         var _loc5_:int = 0;
         var _loc3_:String = param1.toString();
         var _loc4_:int;
         if((_loc4_ = _loc3_.indexOf(".")) != -1)
         {
            _loc5_ = param2;
            if(param2 > 0)
            {
               _loc5_ += 1;
            }
            _loc3_ = _loc3_.substr(0,_loc4_ + _loc5_);
         }
         return _loc3_;
      }
      
      public static function registerExitFunc() : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.addCallback("getExitTip",getExitTip);
            ExternalInterface.call("registerExitFunc");
         }
      }
      
      public static function getExitTip() : String
      {
         if(Boolean(exitTip))
         {
            return exitTip();
         }
         return "";
      }
      
      public static function unregisterExitFunc() : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("unregisterExitFunc");
         }
      }
      
      public static function gotoUrl(param1:String, param2:String = "_blank") : void
      {
         if("_self" == param2)
         {
            unregisterExitFunc();
         }
         navigateToURL(new URLRequest(param1),param2);
      }
      
      public static function roleNameCut(param1:String) : String
      {
         return cutString(param1,8);
      }
      
      public static function cutString(param1:String, param2:int) : String
      {
         if(param1 == null)
         {
            return "";
         }
         if(param1.length > param2)
         {
            return param1.substr(0,param2 - 3) + "...";
         }
         return param1;
      }
      
      public static function splitMulStr(param1:String, param2:*, param3:*) : Array
      {
         var _loc6_:String = null;
         var _loc4_:Array = [];
         var _loc5_:Array = param1.split(param2);
         for each(_loc6_ in _loc5_)
         {
            _loc4_.push(_loc6_.split(param3));
         }
         return _loc4_;
      }
      
      public static function compressLog(param1:String, param2:ByteArray) : int
      {
         var _loc3_:int = 0;
         param2.writeUTFBytes(param1);
         _loc3_ = param2.length;
         param2.compress();
         return _loc3_;
      }
      
      public static function num2Chinese(param1:int, param2:Boolean = false) : String
      {
         var _loc4_:String = null;
         var _loc3_:Array = ["零","一","二","三","四","五","六","七","八","九","十"];
         param1 %= 11;
         if(param1 < _loc3_.length)
         {
            _loc4_ = _loc3_[param1];
            if(param2 && (_loc4_ == "七" || _loc4_ == "零"))
            {
               _loc4_ = "日";
            }
         }
         else
         {
            _loc4_ = "";
         }
         return _loc4_;
      }
      
      public static function createIconButton(param1:String, param2:String, param3:String, param4:String = null, param5:int = -1, param6:int = 65, param7:int = 75) : QIconWithLabel
      {
         var _loc8_:QIconWithLabel = null;
         (_loc8_ = new QIconWithLabel(param1,UrlManager.getUrl(0,param2),".TXT_HKHB_21_Yellow_Shadow")).buttonMode = true;
         _loc8_.width = param6;
         _loc8_.height = param7;
         if(param5 == -1)
         {
            param5 = 25;
         }
         _loc8_.txt.SetStyle("fontSize",param5.toString());
         _loc8_.txt.mouseChildren = false;
         _loc8_.txt.mouseEnabled = false;
         _loc8_.id = param3;
         if(param4)
         {
            _loc8_.toolTip = param4;
         }
         return _loc8_;
      }
      
      public static function createAssetButton(param1:String, param2:String, param3:String, param4:String = null, param5:int = -1) : QIconWithLabel
      {
         var _loc6_:QIconWithLabel = null;
         (_loc6_ = new QIconWithLabel(param1,AssetManager.GetClass(param2),".TXT_HKHB_21_Yellow_Shadow")).buttonMode = true;
         _loc6_.width = 65;
         _loc6_.height = 75;
         if(param5 == -1)
         {
            param5 = 25;
         }
         _loc6_.txt.SetStyle("fontSize",param5.toString());
         _loc6_.txt.mouseChildren = false;
         _loc6_.txt.mouseEnabled = false;
         _loc6_.id = param3;
         if(param4)
         {
            _loc6_.toolTip = param4;
         }
         return _loc6_;
      }
      
      public static function copyAsBitmapData(param1:Object, param2:Boolean = false) : BitmapData
      {
         var _loc3_:DisplayObject = param1 as DisplayObject;
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:BitmapData;
         (_loc4_ = new BitmapData(_loc3_.width,_loc3_.height,true,0)).draw(_loc3_);
         return _loc4_;
      }
   }
}
