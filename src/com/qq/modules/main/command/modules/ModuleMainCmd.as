package com.qq.modules.main.command.modules
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ModuleMainCmd
   {
       
      
      public function ModuleMainCmd()
      {
         super();
      }
      
      public static function gotoChooseStage() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleMainCommand","gotoChooseStage",[]));
      }
      
      public static function loadingForNextStep(param1:Vector.<String>, param2:Function, param3:Vector.<int> = null, param4:Vector.<Object> = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleMainCommand","loadingForNextStep",[param1,param2,param3,param4]));
      }
   }
}
