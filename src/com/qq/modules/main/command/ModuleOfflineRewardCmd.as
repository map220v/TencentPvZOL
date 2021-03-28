package com.qq.modules.main.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ModuleOfflineRewardCmd
   {
       
      
      public function ModuleOfflineRewardCmd()
      {
         super();
      }
      
      public static function start() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleOfflineRewardCommand","start",[]));
      }
      
      public static function unload() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleOfflineRewardCommand","unload",[]));
      }
   }
}
