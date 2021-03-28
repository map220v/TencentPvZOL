package com.qq.modules.goldExchange.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class GoldExchangeViewCmd
   {
       
      
      public function GoldExchangeViewCmd()
      {
         super();
      }
      
      public static function showBuyCoinPanel() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GoldExchangeViewCommand","showBuyCoinPanel",[]));
      }
   }
}
