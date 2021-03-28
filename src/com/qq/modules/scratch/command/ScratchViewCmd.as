package com.qq.modules.scratch.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ScratchViewCmd
   {
       
      
      public function ScratchViewCmd()
      {
         super();
      }
      
      public static function openScratchWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ScratchViewCommand","openScratchWindow",[]));
      }
   }
}
