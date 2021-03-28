package com.qq.modules.exchange.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ExchangeCmd
   {
       
      
      public function ExchangeCmd()
      {
         super();
      }
      
      public static function openExchangeWithType(param1:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExchangeCommand","openExchangeWithType",[param1]));
      }
      
      public static function getExchangeList() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExchangeCommand","getExchangeList",[]));
      }
      
      public static function exchangeItem(param1:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExchangeCommand","exchangeItem",[param1]));
      }
      
      public static function refreshExchangeStore() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExchangeCommand","refreshExchangeStore",[]));
      }
   }
}
