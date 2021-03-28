package com.qq.constant
{
   public class CardQuality
   {
      
      public static const WHITE:int = 1;
      
      public static const GREEN:int = 2;
      
      public static const BLUE:int = 3;
      
      public static const PURPLE:int = 4;
      
      public static const ORANGE:int = 5;
      
      public static const GOLD:int = 6;
      
      public static const COLOR:int = 7;
       
      
      public function CardQuality()
      {
         super();
      }
      
      public static function getQuiltyColor(param1:int) : String
      {
         var _loc2_:String = null;
         if(param1 > COLOR || param1 < WHITE)
         {
            param1 = WHITE;
         }
         switch(param1)
         {
            case CardQuality.WHITE:
               _loc2_ = "#ffffff";
               break;
            case CardQuality.GREEN:
               _loc2_ = "#9bff73";
               break;
            case CardQuality.BLUE:
               _loc2_ = "#c3fbff";
               break;
            case CardQuality.PURPLE:
               _loc2_ = "#ffcde1";
               break;
            case CardQuality.ORANGE:
               _loc2_ = "#fb891a";
               break;
            case CardQuality.GOLD:
               _loc2_ = "#ffffc5";
               break;
            case CardQuality.COLOR:
               _loc2_ = "#ff0000";
         }
         return _loc2_;
      }
   }
}
