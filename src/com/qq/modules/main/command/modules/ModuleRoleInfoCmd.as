package com.qq.modules.main.command.modules
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ModuleRoleInfoCmd
   {
       
      
      public function ModuleRoleInfoCmd()
      {
         super();
      }
      
      public static function start(param1:int = 0, param2:int = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleRoleInfoCommand","start",[param1,param2]));
      }
      
      public static function unload() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleRoleInfoCommand","unload",[]));
      }
      
      public static function doUnload() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleRoleInfoCommand","doUnload",[]));
      }
   }
}
