package com.qq.modules.act3years.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class Act3yearsViewCmd
   {
       
      
      public function Act3yearsViewCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("Act3yearsViewCommand","openWindow",[]));
      }
      
      public static function openTempbag() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("Act3yearsViewCommand","openTempbag",[]));
      }
      
      public static function openExchange() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("Act3yearsViewCommand","openExchange",[]));
      }
   }
}
