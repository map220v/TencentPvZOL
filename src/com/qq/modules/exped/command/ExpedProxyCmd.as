package com.qq.modules.exped.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ExpedProxyCmd
   {
       
      
      public function ExpedProxyCmd()
      {
         super();
      }
      
      public static function queryCityList(param1:int, param2:int, param3:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpedProxyCommand","queryCityList",[param1,param2,param3]));
      }
      
      public static function queryTemplateList(param1:int, param2:int, param3:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpedProxyCommand","queryTemplateList",[param1,param2,param3]));
      }
      
      public static function queryTimes(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpedProxyCommand","queryTimes",[param1]));
      }
      
      public static function buyExpedCount() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpedProxyCommand","buyExpedCount",[]));
      }
      
      public static function checkAndExped(param1:Function, param2:Array = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpedProxyCommand","checkAndExped",[param1,param2]));
      }
      
      public static function checkPlantHP(param1:Function, param2:Array = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpedProxyCommand","checkPlantHP",[param1,param2]));
      }
   }
}
