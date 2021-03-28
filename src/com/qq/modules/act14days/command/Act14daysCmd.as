package com.qq.modules.act14days.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class Act14daysCmd
   {
       
      
      public function Act14daysCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("Act14daysCommand","openWindow",[]));
      }
   }
}
