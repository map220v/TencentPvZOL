package com.qq.modules.slot.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class SlotViewCmd
   {
       
      
      public function SlotViewCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SlotViewCommand","openWindow",[]));
      }
      
      public static function openExchange() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SlotViewCommand","openExchange",[]));
      }
   }
}
