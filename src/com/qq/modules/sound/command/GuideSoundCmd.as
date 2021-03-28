package com.qq.modules.sound.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class GuideSoundCmd
   {
       
      
      public function GuideSoundCmd()
      {
         super();
      }
      
      public static function crazeDaveTalk() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideSoundCommand","crazeDaveTalk",[]));
      }
      
      public static function winnieTalk() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideSoundCommand","winnieTalk",[]));
      }
      
      public static function timeTravel() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideSoundCommand","timeTravel",[]));
      }
   }
}
