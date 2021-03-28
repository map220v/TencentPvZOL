package com.qq.modules.expedition.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ExpeditionProxyCmd
   {
       
      
      public function ExpeditionProxyCmd()
      {
         super();
      }
      
      public static function takeReward() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionProxyCommand","takeReward",[]));
      }
      
      public static function requestSignUpDetail(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionProxyCommand","requestSignUpDetail",[param1]));
      }
      
      public static function requestDefenceBuildingInfo(param1:int, param2:int, param3:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionProxyCommand","requestDefenceBuildingInfo",[param1,param2,param3]));
      }
      
      public static function defenceBuilding(param1:int, param2:int, param3:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionProxyCommand","defenceBuilding",[param1,param2,param3]));
      }
      
      public static function gatherToDefend(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionProxyCommand","gatherToDefend",[param1,param2]));
      }
      
      public static function attackBuilding(param1:int, param2:int, param3:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionProxyCommand","attackBuilding",[param1,param2,param3]));
      }
      
      public static function gatherToAttack(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionProxyCommand","gatherToAttack",[param1,param2]));
      }
      
      public static function aheadDefenceList(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionProxyCommand","aheadDefenceList",[param1,param2]));
      }
      
      public static function requestInitBattleData() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionProxyCommand","requestInitBattleData",[]));
      }
      
      public static function requestOutlineData() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionProxyCommand","requestOutlineData",[]));
      }
      
      public static function requestSelfCampBattleScoreData(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionProxyCommand","requestSelfCampBattleScoreData",[param1]));
      }
      
      public static function requestAllCampBattleScoreData() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionProxyCommand","requestAllCampBattleScoreData",[]));
      }
      
      public static function sendBattleIdle() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionProxyCommand","sendBattleIdle",[]));
      }
      
      public static function requestSignUp() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionProxyCommand","requestSignUp",[]));
      }
      
      public static function requestDetect(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionProxyCommand","requestDetect",[param1,param2]));
      }
      
      public static function requestBattleReport(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionProxyCommand","requestBattleReport",[param1]));
      }
      
      public static function requestAttackBoss(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionProxyCommand","requestAttackBoss",[param1]));
      }
      
      public static function requestNextAction(param1:int, param2:int, param3:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ExpeditionProxyCommand","requestNextAction",[param1,param2,param3]));
      }
   }
}
