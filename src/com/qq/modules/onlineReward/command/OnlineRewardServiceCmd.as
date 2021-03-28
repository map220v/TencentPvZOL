package com.qq.modules.onlineReward.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class OnlineRewardServiceCmd
   {
       
      
      public function OnlineRewardServiceCmd()
      {
         super();
      }
      
      public static function requestOnlineRewardInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("OnlineRewardServiceCommand","requestOnlineRewardInfo",[]));
      }
      
      public static function takeOnlineDailyReward() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("OnlineRewardServiceCommand","takeOnlineDailyReward",[]));
      }
      
      public static function takeWeeklyReward() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("OnlineRewardServiceCommand","takeWeeklyReward",[]));
      }
   }
}
