package com.qq.modules.singlesDay.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class SinglesDayViewCmd
   {
       
      
      public function SinglesDayViewCmd()
      {
         super();
      }
      
      public static function openSinglesDay() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SinglesDayViewCommand","openSinglesDay",[]));
      }
   }
}
