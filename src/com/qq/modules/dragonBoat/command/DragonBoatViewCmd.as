package com.qq.modules.dragonBoat.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class DragonBoatViewCmd
   {
       
      
      public function DragonBoatViewCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DragonBoatViewCommand","openWindow",[]));
      }
      
      public static function openExchangeWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DragonBoatViewCommand","openExchangeWindow",[]));
      }
   }
}
