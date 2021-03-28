package com.qq.modules.activity.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ActivityViewCmd
   {
       
      
      public function ActivityViewCmd()
      {
         super();
      }
      
      public static function addActivityIcon(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActivityViewCommand","addActivityIcon",[param1]));
      }
      
      public static function removeActivityIcon(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActivityViewCommand","removeActivityIcon",[param1]));
      }
      
      public static function openActivityByEntry(param1:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActivityViewCommand","openActivityByEntry",[param1]));
      }
   }
}
