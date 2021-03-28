package com.qq.modules.activity.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ActivityProxyCmd
   {
       
      
      public function ActivityProxyCmd()
      {
         super();
      }
      
      public static function getActivityList() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActivityProxyCommand","getActivityList",[]));
      }
      
      public static function getActivityInfo(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActivityProxyCommand","getActivityInfo",[param1]));
      }
      
      public static function takeActivityReward(param1:int, param2:int, param3:Boolean = true) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActivityProxyCommand","takeActivityReward",[param1,param2,param3]));
      }
      
      public static function operateActivity(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActivityProxyCommand","operateActivity",[param1]));
      }
   }
}
