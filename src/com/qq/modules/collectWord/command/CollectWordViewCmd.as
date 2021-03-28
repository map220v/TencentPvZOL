package com.qq.modules.collectWord.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class CollectWordViewCmd
   {
       
      
      public function CollectWordViewCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CollectWordViewCommand","openWindow",[]));
      }
      
      public static function openExchangeWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CollectWordViewCommand","openExchangeWindow",[]));
      }
   }
}
