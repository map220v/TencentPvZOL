package com.qq.modules.main.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class RegisterModuleCmd
   {
       
      
      public function RegisterModuleCmd()
      {
         super();
      }
      
      public static function registerModuleMVC(param1:Array, param2:Array, param3:Array, param4:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RegisterModuleCommand","registerModuleMVC",[param1,param2,param3,param4]));
      }
      
      public static function unregisterModuleMVC(param1:Array, param2:Array, param3:Array, param4:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RegisterModuleCommand","unregisterModuleMVC",[param1,param2,param3,param4]));
      }
      
      public static function registerModuleCommand(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RegisterModuleCommand","registerModuleCommand",[param1]));
      }
      
      public static function unregisterModuleCommand(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RegisterModuleCommand","unregisterModuleCommand",[param1]));
      }
      
      public static function registerModuleView(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RegisterModuleCommand","registerModuleView",[param1]));
      }
      
      public static function unregisterModuleView(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RegisterModuleCommand","unregisterModuleView",[param1]));
      }
      
      public static function registerModuleSingtlon(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RegisterModuleCommand","registerModuleSingtlon",[param1]));
      }
      
      public static function unregisterModuleSingtlon(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RegisterModuleCommand","unregisterModuleSingtlon",[param1]));
      }
      
      public static function registerModuleProxy(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RegisterModuleCommand","registerModuleProxy",[param1]));
      }
      
      public static function unregisterModuleProxy(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RegisterModuleCommand","unregisterModuleProxy",[param1]));
      }
   }
}
