package com.qq.modules.sound.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class CitySoundCmd
   {
       
      
      public function CitySoundCmd()
      {
         super();
      }
      
      public static function playBGSound() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CitySoundCommand","playBGSound",[]));
      }
   }
}
