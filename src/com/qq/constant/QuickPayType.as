package com.qq.constant
{
   public class QuickPayType
   {
      
      public static const NONE:int = 0;
      
      public static const BUY_Physical:int = 5;
      
      public static const BUY_SIGN_CARD:int = 6;
      
      public static const RANK_ARENA_CLEAR_CD:int = 10;
      
      public static const RANK_ARENA_BUY_TIME:int = 11;
      
      public static const FUZION_SHORT_PAY_KEY:uint = 12;
      
      public static const BUY_Chlorophyll:int = 18;
      
      public static const BUY_TD:int = 19;
      
      public static const SHOP_BUY:int = 20;
      
      public static const TIP_ONLY_THIS:int = 100;
      
      public static const TIP_ONLY_THIS_Expedition_SPY:int = 101;
      
      public static const TIP_ONLY_THIS_Expedition_RemoveCD:int = 102;
      
      public static const TIP_ONLY_THIS_Dummy_Draw:int = 103;
      
      public static const TIP_ONLY_THIS_PlantArmor:int = 104;
      
      public static const TIP_ONLY_THIS_EndlessFuben:int = 105;
      
      public static var IS_SELECT_TIP_ONLY_THIS:Boolean = false;
      
      private static var _tipOnlyThisList:Array = new Array();
       
      
      public function QuickPayType()
      {
         super();
      }
      
      public static function isQuickPay(param1:int) : Boolean
      {
         return param1 >= 100;
      }
      
      public static function setTipOnlyThis(param1:int) : void
      {
         _tipOnlyThisList[param1] = true;
      }
      
      public static function isTipOnlyThis(param1:int) : Boolean
      {
         return _tipOnlyThisList[param1] != null;
      }
   }
}
