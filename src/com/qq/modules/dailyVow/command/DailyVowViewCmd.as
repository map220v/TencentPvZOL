package com.qq.modules.dailyVow.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class DailyVowViewCmd
   {
       
      
      public function DailyVowViewCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DailyVowViewCommand","openWindow",[]));
      }
   }
}
