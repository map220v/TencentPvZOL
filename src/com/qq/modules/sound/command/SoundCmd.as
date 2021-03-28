package com.qq.modules.sound.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class SoundCmd
   {
       
      
      public function SoundCmd()
      {
         super();
      }
      
      public static function stopSoundByModuleID(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SoundCommand","stopSoundByModuleID",[param1]));
      }
      
      public static function stopSound(param1:int, param2:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SoundCommand","stopSound",[param1,param2]));
      }
      
      public static function pauseAllSound() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SoundCommand","pauseAllSound",[]));
      }
      
      public static function playRandomSound(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SoundCommand","playRandomSound",[param1]));
      }
      
      public static function playSound(param1:int, param2:int = -1, param3:int = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SoundCommand","playSound",[param1,param2,param3]));
      }
      
      public static function resumeAllSound() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SoundCommand","resumeAllSound",[]));
      }
      
      public static function setMusicMute(param1:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SoundCommand","setMusicMute",[param1]));
      }
      
      public static function setSoundEffMute(param1:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SoundCommand","setSoundEffMute",[param1]));
      }
      
      public static function playBackgroundSound(param1:int, param2:int = -1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SoundCommand","playBackgroundSound",[param1,param2]));
      }
      
      public static function stopBackgroundSound() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SoundCommand","stopBackgroundSound",[]));
      }
   }
}
