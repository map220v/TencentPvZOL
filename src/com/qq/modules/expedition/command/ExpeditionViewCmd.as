package com.qq.modules.expedition.command
{
   import flash.display.DisplayObjectContainer;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ExpeditionViewCmd
   {
       
      
      public function ExpeditionViewCmd()
      {
         super();
      }
      
      public static function openMainWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionViewCommand","openMainWindow",[]));
      }
      
      public static function openSignUpDetailWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionViewCommand","openSignUpDetailWindow",[]));
      }
      
      public static function gotoBatte() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionViewCommand","gotoBatte",[]));
      }
      
      public static function leaveBattle() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionViewCommand","leaveBattle",[]));
      }
      
      public static function openAttackBuildingWindow(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionViewCommand","openAttackBuildingWindow",[param1]));
      }
      
      public static function openDefenceBuildingWindow(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionViewCommand","openDefenceBuildingWindow",[param1]));
      }
      
      public static function requestNextAction(param1:Function, param2:Array = null, param3:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionViewCommand","requestNextAction",[param1,param2,param3]));
      }
      
      public static function addSignUpDefenceChoosePanel(param1:DisplayObjectContainer) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionViewCommand","addSignUpDefenceChoosePanel",[param1]));
      }
      
      public static function openBuildingDetectWindow(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionViewCommand","openBuildingDetectWindow",[param1,param2]));
      }
      
      public static function openRobResultWindow(param1:int, param2:int, param3:int, param4:Object, param5:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionViewCommand","openRobResultWindow",[param1,param2,param3,param4,param5]));
      }
      
      public static function openNPCAttackWindow(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionViewCommand","openNPCAttackWindow",[param1]));
      }
   }
}
