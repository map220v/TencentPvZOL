package com.qq.modules.buffActivity.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class BuffActivityViewCmd
   {
       
      
      public function BuffActivityViewCmd()
      {
         super();
      }
      
      public static function openBuffActivityWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BuffActivityViewCommand","openBuffActivityWindow",[]));
      }
   }
}
