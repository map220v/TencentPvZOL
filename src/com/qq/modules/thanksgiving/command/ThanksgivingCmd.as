package com.qq.modules.thanksgiving.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ThanksgivingCmd
   {
       
      
      public function ThanksgivingCmd()
      {
         super();
      }
      
      public static function openTanksgiving() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ThanksgivingCommand","openTanksgiving",[]));
      }
      
      public static function sendGetInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ThanksgivingCommand","sendGetInfo",[]));
      }
      
      public static function sendLottery() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ThanksgivingCommand","sendLottery",[]));
      }
   }
}
