package com.qq.modules.actDf51.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ActDf51Cmd
   {
       
      
      public function ActDf51Cmd()
      {
         super();
      }
      
      public static function openActView() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActDf51Command","openActView",[]));
      }
      
      public static function showGetItemView(param1:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActDf51Command","showGetItemView",[param1]));
      }
      
      public static function getTodayReward() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActDf51Command","getTodayReward",[]));
      }
      
      public static function getStepReward(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActDf51Command","getStepReward",[param1]));
      }
   }
}
