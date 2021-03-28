package com.qq.modules.collectCoin.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class CollectCoinServiceCmd
   {
       
      
      public function CollectCoinServiceCmd()
      {
         super();
      }
      
      public static function requestCoinCollectInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CollectCoinServiceCommand","requestCoinCollectInfo",[]));
      }
      
      public static function collectCoin() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CollectCoinServiceCommand","collectCoin",[]));
      }
      
      public static function collectPhysical() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CollectCoinServiceCommand","collectPhysical",[]));
      }
      
      public static function collectTicket() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CollectCoinServiceCommand","collectTicket",[]));
      }
   }
}
