package com.qq.modules.awake.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ModuleAwakeCmd
   {
       
      
      public function ModuleAwakeCmd()
      {
         super();
      }
      
      public static function start(param1:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleAwakeCommand","start",[param1]));
      }
      
      public static function unload() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleAwakeCommand","unload",[]));
      }
   }
}
