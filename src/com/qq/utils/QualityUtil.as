package com.qq.utils
{
   import com.qq.templates.font.FontHKHB;
   
   public class QualityUtil
   {
      
      private static const START:int = 0;
      
      private static const END:int = 7;
      
      public static const TYPE_WHITE:int = 1;
      
      public static const TYPE_GREEN:int = 2;
      
      public static const TYPE_BLUE:int = 3;
      
      public static const TYPE_PURPLE:int = 4;
      
      public static const TYPE_ORANGE:int = 5;
      
      public static const TYPE_GOLDEN:int = 6;
      
      private static var ARY_COLOR:Array = [16777215,16578808,65280,7404795,14652415,16754688,14737408];
       
      
      public function QualityUtil()
      {
         super();
      }
      
      public static function getQualityColorUint(param1:int) : uint
      {
         if(param1 >= START && param1 < END)
         {
            return ARY_COLOR[param1];
         }
         return 0;
      }
      
      public static function getQualityColorString(param1:int) : String
      {
         return "#" + getQualityColorUint(param1).toString(16);
      }
      
      public static function getQualityName(param1:int) : String
      {
         return FontHKHB["COMMON_QUALITY_NAME_" + param1];
      }
      
      public static function getLevelColor(param1:int) : String
      {
         var _loc2_:String = "#ffffff";
         if(param1 <= 1)
         {
            _loc2_ = "#ffffff";
         }
         else if(param1 == 2)
         {
            _loc2_ = "#00ff00";
         }
         else if(param1 == 3)
         {
            _loc2_ = "#70FCFB";
         }
         else if(param1 == 4)
         {
            _loc2_ = "#ff66ff";
         }
         else if(param1 == 5)
         {
            _loc2_ = "#ff9900";
         }
         else
         {
            _loc2_ = "#ffff00";
         }
         return _loc2_;
      }
   }
}
