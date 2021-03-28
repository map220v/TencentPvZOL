package com.qq.modules.pcManager.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class PcManagerViewCmd
   {
       
      
      public function PcManagerViewCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("PcManagerViewCommand","openWindow",[]));
      }
   }
}
