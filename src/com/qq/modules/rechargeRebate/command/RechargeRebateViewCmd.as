package com.qq.modules.rechargeRebate.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class RechargeRebateViewCmd
   {
       
      
      public function RechargeRebateViewCmd()
      {
         super();
      }
      
      public static function openRechargeRebate() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RechargeRebateViewCommand","openRechargeRebate",[]));
      }
   }
}
