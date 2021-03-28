package com.qq.modules.main.command.modules
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ModuleWorldBossCmd
   {
       
      
      public function ModuleWorldBossCmd()
      {
         super();
      }
      
      public static function unload() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleWorldBossCommand","unload",[]));
      }
   }
}
