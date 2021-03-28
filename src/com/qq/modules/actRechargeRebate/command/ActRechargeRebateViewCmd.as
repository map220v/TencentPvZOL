package com.qq.modules.actRechargeRebate.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ActRechargeRebateViewCmd
   {
       
      
      public function ActRechargeRebateViewCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActRechargeRebateViewCommand","openWindow",[]));
      }
   }
}
