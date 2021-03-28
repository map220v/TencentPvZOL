package com.qq.modules.activityFirstRecharge.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class FirstRechargeViewCmd
   {
       
      
      public function FirstRechargeViewCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FirstRechargeViewCommand","openWindow",[]));
      }
   }
}
