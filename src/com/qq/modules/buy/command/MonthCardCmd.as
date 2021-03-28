package com.qq.modules.buy.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class MonthCardCmd
   {
       
      
      public function MonthCardCmd()
      {
         super();
      }
      
      public static function queryInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MonthCardCommand","queryInfo",[]));
      }
      
      public static function getDailyCardReward() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MonthCardCommand","getDailyCardReward",[]));
      }
      
      public static function getReward() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MonthCardCommand","getReward",[]));
      }
      
      public static function showGetRewardWd() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MonthCardCommand","showGetRewardWd",[]));
      }
   }
}
