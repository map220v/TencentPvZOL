package com.qq.modules.actNightclub.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ActNightclubViewCmd
   {
       
      
      public function ActNightclubViewCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActNightclubViewCommand","openWindow",[]));
      }
   }
}
