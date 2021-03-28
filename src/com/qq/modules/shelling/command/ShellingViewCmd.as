package com.qq.modules.shelling.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ShellingViewCmd
   {
       
      
      public function ShellingViewCmd()
      {
         super();
      }
      
      public static function openMainWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ShellingViewCommand","openMainWindow",[]));
      }
      
      public static function openExchangeWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ShellingViewCommand","openExchangeWindow",[]));
      }
   }
}
