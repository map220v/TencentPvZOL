package com.qq.modules.main.command.modules
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ModuleMailCmd
   {
       
      
      public function ModuleMailCmd()
      {
         super();
      }
      
      public static function start() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleMailCommand","start",[]));
      }
      
      public static function unload() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleMailCommand","unload",[]));
      }
   }
}
