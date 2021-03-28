package com.qq.modules.actXY.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ActXYCmd
   {
       
      
      public function ActXYCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActXYCommand","openWindow",[]));
      }
   }
}
