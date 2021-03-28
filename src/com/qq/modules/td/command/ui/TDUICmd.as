package com.qq.modules.td.command.ui
{
   import flash.geom.Rectangle;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TDUICmd
   {
       
      
      public function TDUICmd()
      {
         super();
      }
      
      public static function specialSkillUpdatePosAt(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDUICommand","specialSkillUpdatePosAt",[param1,param2]));
      }
      
      public static function showFinishedPopup() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDUICommand","showFinishedPopup",[]));
      }
      
      public static function showNormalFailedPopup() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDUICommand","showNormalFailedPopup",[]));
      }
      
      public static function showChallengeFailedPopup() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDUICommand","showChallengeFailedPopup",[]));
      }
      
      public static function showMenuPopup() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDUICommand","showMenuPopup",[]));
      }
      
      public static function startPlantSettingByID(param1:int, param2:String, param3:Boolean = false, param4:Rectangle = null, param5:Boolean = true) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDUICommand","startPlantSettingByID",[param1,param2,param3,param4,param5]));
      }
      
      public static function startPlantSettingByIndex(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDUICommand","startPlantSettingByIndex",[param1]));
      }
      
      public static function startEnergyTileByType(param1:int, param2:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDUICommand","startEnergyTileByType",[param1,param2]));
      }
      
      public static function showUI() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDUICommand","showUI",[]));
      }
      
      public static function hideUI() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDUICommand","hideUI",[]));
      }
      
      public static function addCardSlot(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDUICommand","addCardSlot",[param1]));
      }
      
      public static function releaseSkillByIndex(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDUICommand","releaseSkillByIndex",[param1]));
      }
      
      public static function releaseSkillByType(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDUICommand","releaseSkillByType",[param1]));
      }
      
      public static function showNewZombieTip(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDUICommand","showNewZombieTip",[param1]));
      }
      
      public static function showPrivilegeWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDUICommand","showPrivilegeWindow",[]));
      }
   }
}
