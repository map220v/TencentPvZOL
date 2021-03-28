package com.qq.modules.rookieCeremony.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class RookieCeremonyCmd
   {
       
      
      public function RookieCeremonyCmd()
      {
         super();
      }
      
      public static function getInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RookieCeremonyCommand","getInfo",[]));
      }
   }
}
