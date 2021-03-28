package com.qq.modules.td.logic.bt_ai.aiUtils
{
   public class DataCompareUtils
   {
       
      
      public function DataCompareUtils()
      {
         super();
      }
      
      public static function compareNumber(param1:Number, param2:String, param3:Number) : Boolean
      {
         switch(param2)
         {
            case "less":
               return param1 < param3;
            case "lessEqual":
               return param1 <= param3;
            case "greater":
               return param1 > param3;
            case "greaterEqual":
               return param1 >= param3;
            case "equal":
               return param1 == param3;
            case "notEqual":
               return param1 != param3;
            default:
               return false;
         }
      }
      
      public static function compareString(param1:String, param2:String, param3:String) : Boolean
      {
         switch(param2)
         {
            case "equal":
               return param1 == param3;
            case "notEqual":
               return param1 != param3;
            default:
               return false;
         }
      }
   }
}
