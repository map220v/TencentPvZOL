package com.qq.utils
{
   import asgui.utils.AsguiDisplayUtil;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.utils.Dictionary;
   
   public final class QDisplayUtil
   {
      
      private static const viewMap:Dictionary = new Dictionary();
       
      
      public function QDisplayUtil()
      {
         super();
      }
      
      public static function registerView(param1:String, param2:DisplayObject) : void
      {
         viewMap[param1] = param2;
      }
      
      public static function unregisterView(param1:String) : void
      {
         viewMap[param1] = null;
      }
      
      public static function getView(param1:String) : DisplayObject
      {
         return viewMap[param1];
      }
      
      public static function DisplayListToCode(param1:Array) : String
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            if(param1[_loc3_] is MovieClip)
            {
               if(param1[_loc3_].id == "LSMapContent")
               {
                  _loc2_ = "$LSMapContent/";
                  _loc4_ = param1.splice(0,_loc3_);
                  _loc2_ += AsguiDisplayUtil.DisplayListToCode(_loc4_);
                  break;
               }
            }
            _loc3_++;
         }
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         return AsguiDisplayUtil.DisplayListToCode(param1);
      }
      
      public static function checkRootLayer(param1:Object) : Boolean
      {
         var _loc2_:Object = null;
         for each(_loc2_ in viewMap)
         {
            if(_loc2_ == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function CodeToDisplay(param1:String, param2:Boolean = true) : *
      {
         var _loc4_:DisplayObject = null;
         var _loc5_:int = 0;
         var _loc3_:Array = param1.split("/");
         switch(_loc3_[0])
         {
            case "$LSMapContent":
               _loc4_ = getView("LSMapContent");
               param1 = param1.replace("$LSMapContent/","");
               _loc4_ = AsguiDisplayUtil.CodeToDisplay(param1,_loc4_ as DisplayObjectContainer,param2);
               break;
            case "$FubenMapsContent":
               _loc4_ = getView("FubenMapsContent");
               param1 = param1.replace("$FubenMapsContent/","");
               _loc4_ = AsguiDisplayUtil.CodeToDisplay(param1,_loc4_ as DisplayObjectContainer,param2);
               break;
            case "$TDCardSlotPanel":
               _loc4_ = getView("$TDCardSlotPanel");
               param1 = param1.replace("$TDCardSlotPanel/","");
               _loc5_ = int(param1);
               return _loc4_["getCardBgByIndex"](_loc5_);
            case "$TDSkyLayer":
               _loc4_ = getView("$TDSkyLayer");
               param1 = param1.replace("$TDSkyLayer/","");
               return _loc4_[param1];
         }
         if(_loc4_ != null)
         {
            return _loc4_;
         }
         return AsguiDisplayUtil.CodeToDisplay(param1,null,param2);
      }
      
      public static function getDisplayByName(param1:String, param2:DisplayObjectContainer) : DisplayObject
      {
         return AsguiDisplayUtil.CodeToDisplay(param1,param2,false);
      }
   }
}
