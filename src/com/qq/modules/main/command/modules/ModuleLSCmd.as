package com.qq.modules.main.command.modules
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ModuleLSCmd
   {
       
      
      public function ModuleLSCmd()
      {
         super();
      }
      
      public static function startLS(param1:int, param2:Object = null, param3:int = -1, param4:int = -1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleLSCommand","startLS",[param1,param2,param3,param4]));
      }
      
      public static function unloadLS() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleLSCommand","unloadLS",[]));
      }
   }
}
