package com.qq.modules.actRed.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ActRedCmd
   {
       
      
      public function ActRedCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActRedCommand","openWindow",[]));
      }
      
      public static function openSendWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActRedCommand","openSendWindow",[]));
      }
   }
}
