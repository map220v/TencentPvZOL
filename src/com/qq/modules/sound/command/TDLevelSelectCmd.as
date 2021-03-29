package com.qq.modules.sound.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TDLevelSelectCmd
   {
       
      
      public function TDLevelSelectCmd()
      {
         super();
      }
      
      public static function playBGSound(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDLevelSelectCommand","playBGSound",[param1]));
      }
      
      public static function openLockDoor() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDLevelSelectCommand","openLockDoor",[]));
      }
   }
}
