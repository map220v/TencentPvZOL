package org.allencuilib
{
   import asgui.core.Container;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.text.TextField;
   
   public final class Utils
   {
      
      public static var count:int = 0;
       
      
      public function Utils()
      {
         super();
      }
      
      public static function getAllChildrenDesc(param1:DisplayObject, param2:int = 0) : String
      {
         var _loc5_:int = 0;
         var _loc6_:Container = null;
         var _loc7_:DisplayObjectContainer = null;
         var _loc8_:DisplayObject = null;
         var _loc3_:* = "";
         var _loc4_:int = param2;
         ++count;
         while(_loc4_-- > 0)
         {
            _loc3_ += "  ";
         }
         _loc3_ += param1.toString() + (!(param1 is TextField) && param1.filters.length > 0 ? " # " + param1.filters : "") + "\n";
         if(param1 is Container)
         {
            _loc6_ = param1 as Container;
            _loc5_ = 0;
            while(_loc5_ < _loc6_.$numChildren)
            {
               _loc3_ += getAllChildrenDesc(_loc6_.$getChildAt(_loc5_),param2 + 1);
               _loc5_++;
            }
         }
         else if(param1 is DisplayObjectContainer)
         {
            _loc7_ = param1 as DisplayObjectContainer;
            _loc5_ = 0;
            while(_loc5_ < _loc7_.numChildren)
            {
               _loc3_ += getAllChildrenDesc(_loc7_.getChildAt(_loc5_),param2 + 1);
               _loc5_++;
            }
         }
         else if(param1 is Loader)
         {
            _loc8_ = (param1 as Loader).content;
            _loc3_ += getAllChildrenDesc(_loc8_,param2 + 1);
         }
         return _loc3_;
      }
   }
}
