package com.qq.modules.main.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class LevelObserverCmd
   {
       
      
      public function LevelObserverCmd()
      {
         super();
      }
      
      public static function initLevelObserver() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LevelObserverCommand","initLevelObserver",[]));
      }
   }
}
