package com.qq.modules.endlessTD
{
   import com.qq.modules.endlessTD.model.EndlessTDStageRecord;
   
   public class EndlessTDConst
   {
      
      public static const GET_ENDLESS_TD_INFO:String = "GET_ENDLESS_TD_INFO";
      
      public static const GET_ENDLESS_TD_RANK:String = "GET_ENDLESS_TD_RANK";
      
      public static const ENDLESS_VOTE:String = "ENDLESS_VOTE";
      
      public static const ENDLESS_UPGRADE_OK:String = "ENDLESS_UPGRADE_OK";
      
      public static const ENDLESS_TD_EXIT_SCENE:String = "ENDLESS_TD_EXIT_SCENE";
      
      public static const ENDLESS_RANK_PAGE_SIZE:uint = 5;
      
      public static const ENDLESS_STRENGTHEN_PAGE_SIZE:uint = 20;
      
      public static const ENDLESS_TD_RECORD_VERSION:uint = 1;
      
      public static var oldRecord:EndlessTDStageRecord;
      
      public static var newRecord:EndlessTDStageRecord;
      
      public static var Text_Rule1:String = "1. 在无尽挑战中，击杀任意僵尸均可获得积分。每周日24点结算本周积分排名，下一周内根据名次领取丰厚的金币奖励（点击界面下方的宝箱）<br>2. 每人每天都可以参加一次无尽挑战；如果对成绩不满意，可以额外购买一次挑战次数 <br>3. 挑战中每一轮关卡结束后至多保留3000阳光，并且可以存档和读档以备隔日再战<br>4. 每一轮获得积分越多，该轮次结算时获得的雨露和强化点也越多<br>5. 雨露可用于关卡开始前购买植物，以及在关卡中购买技能<br>6. 强化点可用于强化植物，永久提高击杀僵尸获得的积分";
       
      
      public function EndlessTDConst()
      {
         super();
      }
   }
}
