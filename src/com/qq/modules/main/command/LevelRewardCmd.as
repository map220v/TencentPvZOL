package com.qq.modules.main.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class LevelRewardCmd
   {
       
      
      public function LevelRewardCmd()
      {
         super();
      }
      
      public static function queryReward() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LevelRewardCommand","queryReward",[]));
      }
      
      public static function takeReward() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LevelRewardCommand","takeReward",[]));
      }
   }
}
