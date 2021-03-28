package com.qq.modules.childrenDay.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ChildrenDayViewCmd
   {
       
      
      public function ChildrenDayViewCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ChildrenDayViewCommand","openWindow",[]));
      }
   }
}
