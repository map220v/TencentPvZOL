package com.qq.modules.everyDayBuy.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class EveryDayBuyCmd
   {
       
      
      public function EveryDayBuyCmd()
      {
         super();
      }
      
      public static function openEveryDayBuy() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EveryDayBuyCommand","openEveryDayBuy",[]));
      }
      
      public static function buy(param1:uint, param2:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EveryDayBuyCommand","buy",[param1,param2]));
      }
      
      public static function getPayInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EveryDayBuyCommand","getPayInfo",[]));
      }
      
      public static function exchange(param1:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EveryDayBuyCommand","exchange",[param1]));
      }
      
      public static function getItem(param1:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EveryDayBuyCommand","getItem",[param1]));
      }
   }
}
