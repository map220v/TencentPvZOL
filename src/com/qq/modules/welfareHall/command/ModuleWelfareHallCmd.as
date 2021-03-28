package com.qq.modules.welfareHall.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ModuleWelfareHallCmd
   {
       
      
      public function ModuleWelfareHallCmd()
      {
         super();
      }
      
      public static function start() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleWelfareHallCommand","start",[]));
      }
      
      public static function unload() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleWelfareHallCommand","unload",[]));
      }
   }
}
