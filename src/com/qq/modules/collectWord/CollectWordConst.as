package com.qq.modules.collectWord
{
   public class CollectWordConst
   {
      
      public static const EVENT_UPDATE:String = "CollectWordConst_Event_Update";
      
      public static const EVENT_EXCHANGE:String = "CollectWordConst_Event_Exchange";
      
      public static const EVENT_SUMMON:String = "CollectWordConst_Event_Summon";
      
      public static const EVENT_SETOUT:String = "CollectWordConst_Event_SetOut";
      
      public static const Text_Rule:String = "1.活动期间，通关任意冒险关卡就可以必定获得{0}。使用{0}可获得字牌。\n2.集齐一套字牌即可献上完整祝福，并获得{2}个{4}；未集齐一套也可献上零散祝福，每个字牌可获得{3}个{4}。使用{4}可兑换不同的奖励哦。";
      
      public static const ALL_Exchange_RewardNum:int = 80;
      
      public static const NOT_ALL_Exchange_RewardNum:int = 5;
      
      public static const SHORE_ID:uint = 5112;
      
      public static const SCORE_NAME:String = "珍珠";
      
      public static const COLLECT_WORD_NEED_SCORE:String = "需要" + SCORE_NAME + "：<font color=\'#FFFFFF\'>{0}</font>";
      
      public static const COLLECT_WORD_EXCHANGE_SCORE:String = "我的" + SCORE_NAME + "：{0}个";
      
      public static const ITEM_NAME:String = "贝壳";
      
      public static const COLLECT_WORD_SHORE_DESC:String = "剩余" + ITEM_NAME + "：{0}个";
      
      public static const Text_Unit:String = "个";
      
      public static const ACTIVITY_ID:uint = 365;
      
      public static const COLLECT_NUM:uint = 8;
       
      
      public function CollectWordConst()
      {
         super();
      }
   }
}
