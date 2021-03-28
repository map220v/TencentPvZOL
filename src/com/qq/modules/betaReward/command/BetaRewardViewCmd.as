package com.qq.modules.betaReward.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class BetaRewardViewCmd
   {
       
      
      public function BetaRewardViewCmd()
      {
         super();
      }
      
      public static function openBetaReward() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BetaRewardViewCommand","openBetaReward",[]));
      }
   }
}
