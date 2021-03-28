package com.qq.modules.buy.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class BuyProxyCmd
   {
       
      
      public function BuyProxyCmd()
      {
         super();
      }
      
      public static function getBuyMallInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BuyProxyCommand","getBuyMallInfo",[]));
      }
      
      public static function buy(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BuyProxyCommand","buy",[param1]));
      }
   }
}
