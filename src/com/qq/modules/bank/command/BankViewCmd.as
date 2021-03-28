package com.qq.modules.bank.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class BankViewCmd
   {
       
      
      public function BankViewCmd()
      {
         super();
      }
      
      public static function openBank() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BankViewCommand","openBank",[]));
      }
   }
}
