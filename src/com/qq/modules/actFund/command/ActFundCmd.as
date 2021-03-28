package com.qq.modules.actFund.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ActFundCmd
   {
       
      
      public function ActFundCmd()
      {
         super();
      }
      
      public static function openFundWindow(param1:int = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActFundCommand","openFundWindow",[param1]));
      }
   }
}
