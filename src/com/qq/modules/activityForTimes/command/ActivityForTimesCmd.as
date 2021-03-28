package com.qq.modules.activityForTimes.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ActivityForTimesCmd
   {
       
      
      public function ActivityForTimesCmd()
      {
         super();
      }
      
      public static function openActivityForTimes() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActivityForTimesCommand","openActivityForTimes",[]));
      }
      
      public static function getActivityReward(param1:uint, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActivityForTimesCommand","getActivityReward",[param1,param2]));
      }
      
      public static function unloaderActivityForTime() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActivityForTimesCommand","unloaderActivityForTime",[]));
      }
   }
}
