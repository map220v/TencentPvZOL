package com.qq.modules.balance.command
{
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class BalanceViewCmd
   {
       
      
      public function BalanceViewCmd()
      {
         super();
      }
      
      public static function prepareFight(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BalanceViewCommand","prepareFight",[param1]));
      }
   }
}
