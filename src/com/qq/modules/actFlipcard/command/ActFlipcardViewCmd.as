package com.qq.modules.actFlipcard.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ActFlipcardViewCmd
   {
       
      
      public function ActFlipcardViewCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActFlipcardViewCommand","openWindow",[]));
      }
   }
}
