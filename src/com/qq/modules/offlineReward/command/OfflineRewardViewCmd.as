package com.qq.modules.offlineReward.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class OfflineRewardViewCmd
   {
       
      
      public function OfflineRewardViewCmd()
      {
         super();
      }
      
      public static function openOfflineRewardWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("OfflineRewardViewCommand","openOfflineRewardWindow",[]));
      }
      
      public static function showOfflineEffect() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("OfflineRewardViewCommand","showOfflineEffect",[]));
      }
   }
}
