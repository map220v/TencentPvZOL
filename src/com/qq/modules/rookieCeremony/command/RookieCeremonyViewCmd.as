package com.qq.modules.rookieCeremony.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class RookieCeremonyViewCmd
   {
       
      
      public function RookieCeremonyViewCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RookieCeremonyViewCommand","openWindow",[]));
      }
   }
}
