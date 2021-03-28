package com.qq.modules.main.command.modules
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ModuleNutritionCmd
   {
       
      
      public function ModuleNutritionCmd()
      {
         super();
      }
      
      public static function start(param1:Object = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleNutritionCommand","start",[param1]));
      }
      
      public static function unload() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleNutritionCommand","unload",[]));
      }
   }
}
