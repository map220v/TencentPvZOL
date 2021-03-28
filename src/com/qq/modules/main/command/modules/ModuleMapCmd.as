package com.qq.modules.main.command.modules
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ModuleMapCmd
   {
       
      
      public function ModuleMapCmd()
      {
         super();
      }
      
      public static function start(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleMapCommand","start",[param1]));
      }
      
      public static function unload() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleMapCommand","unload",[]));
      }
   }
}
