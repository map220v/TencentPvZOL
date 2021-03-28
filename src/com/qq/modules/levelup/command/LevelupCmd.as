package com.qq.modules.levelup.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class LevelupCmd
   {
       
      
      public function LevelupCmd()
      {
         super();
      }
      
      public static function openLevelupWin(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LevelupCommand","openLevelupWin",[param1]));
      }
   }
}
