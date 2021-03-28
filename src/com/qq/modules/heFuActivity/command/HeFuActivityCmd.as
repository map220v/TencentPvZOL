package com.qq.modules.heFuActivity.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class HeFuActivityCmd
   {
       
      
      public function HeFuActivityCmd()
      {
         super();
      }
      
      public static function openHeFuActivityWin() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("HeFuActivityCommand","openHeFuActivityWin",[]));
      }
   }
}
