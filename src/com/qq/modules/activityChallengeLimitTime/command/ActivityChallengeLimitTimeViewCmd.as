package com.qq.modules.activityChallengeLimitTime.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ActivityChallengeLimitTimeViewCmd
   {
       
      
      public function ActivityChallengeLimitTimeViewCmd()
      {
         super();
      }
      
      public static function showWd() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActivityChallengeLimitTimeViewCommand","showWd",[]));
      }
   }
}
