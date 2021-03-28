package asgui.serialization.css
{
   import asgui.logger.AsguiLogger;
   import asgui.utils.StringUtil;
   
   public class CssDeserializer
   {
       
      
      public function CssDeserializer()
      {
         super();
      }
      
      public static function GetCleanCode(param1:String) : String
      {
         var _loc2_:RegExp = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:Array = null;
         var _loc8_:String = param1;
         _loc2_ = /\t/g;
         _loc8_ = _loc8_.replace(_loc2_,"");
         _loc2_ = /\r\n\r\n/g;
         _loc8_ = _loc8_.replace(_loc2_,"");
         return RemoveStringDuring(_loc8_);
      }
      
      public static function RemoveStringDuring(param1:String, param2:String = "/*", param3:String = "*/") : String
      {
         var _loc4_:String = "";
         var _loc5_:int = 0;
         var _loc6_:int = param2.length;
         var _loc7_:int = 0;
         var _loc8_:int = param3.length;
         var _loc9_:int = 0;
         var _loc10_:int = param1.length;
         while(_loc9_ < _loc10_)
         {
            if((_loc5_ = param1.indexOf(param2,_loc9_)) > -1)
            {
               _loc4_ += param1.substring(_loc9_,_loc5_);
               _loc9_ = _loc7_ = param1.indexOf(param3,_loc9_) + _loc8_;
            }
            else
            {
               _loc4_ += param1.substring(_loc9_);
               _loc9_ = _loc10_;
            }
         }
         return _loc4_;
      }
      
      public static function SeparateIntoTags(param1:String, param2:String = "{", param3:String = "}") : Array
      {
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:Array = [];
         var _loc7_:* = param1.split(param2);
         _loc6_.push(_loc7_[0]);
         _loc4_ = 1;
         while(_loc4_ < _loc7_.length)
         {
            if((_loc5_ = _loc7_[_loc4_].toString().split(param3)).length == 2)
            {
               _loc6_.push(_loc5_[0]);
               _loc6_.push(_loc5_[1]);
            }
            else
            {
               AsguiLogger.Error(CssDeserializer,"SeparateIntoTags compiler error at [" + _loc7_[_loc4_] + "]");
            }
            _loc4_++;
         }
         return _loc6_;
      }
      
      public static function AnalyseToObject(param1:String) : Object
      {
         var _loc4_:int = 0;
         var _loc6_:Array = null;
         var _loc2_:Object = new Object();
         var _loc3_:Array = param1.split(",");
         var _loc5_:RegExp = /"/g;
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(_loc3_[_loc4_].toString().length != 0)
            {
               _loc6_ = _loc3_[_loc4_].toString().split("=");
               _loc2_[StringUtil.trim(_loc6_[0])] = _loc6_[1].toString().replace(_loc5_,"");
            }
            _loc4_++;
         }
         return _loc2_;
      }
   }
}
