package com.qq.modules.main.command
{
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class GameFlowCmd
   {
       
      
      public function GameFlowCmd()
      {
         super();
      }
      
      public static function startLoad() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","startLoad",[]));
      }
      
      public static function loadNextFile() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","loadNextFile",[]));
      }
      
      public static function finishLoad() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","finishLoad",[]));
      }
      
      public static function startGame() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","startGame",[]));
      }
      
      public static function gotoCity() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoCity",[]));
      }
      
      public static function gotoNutrition(param1:int = 1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoNutrition",[param1]));
      }
      
      public static function balanceFight(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","balanceFight",[param1]));
      }
      
      public static function gotoAwake() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoAwake",[]));
      }
      
      public static function gotoPlantTest() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoPlantTest",[]));
      }
      
      public static function gotoMyHome() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoMyHome",[]));
      }
      
      public static function gotoMap(param1:int = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoMap",[param1]));
      }
      
      public static function gotoLevelSelect(param1:Object = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoLevelSelect",[param1]));
      }
      
      public static function gotoLevelSelectByStateID(param1:int, param2:int, param3:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoLevelSelectByStateID",[param1,param2,param3]));
      }
      
      public static function gotoFuben(param1:int = 0, param2:int = 1, param3:int = 0, param4:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoFuben",[param1,param2,param3,param4]));
      }
      
      public static function gotoEndlessTD() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoEndlessTD",[]));
      }
      
      public static function gotoTD(param1:int, param2:int, param3:int, param4:int = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoTD",[param1,param2,param3,param4]));
      }
      
      public static function startTD(param1:int, param2:int, param3:int, param4:int, param5:Vector.<int>, param6:Boolean = false, param7:Array = null, param8:Object = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","startTD",[param1,param2,param3,param4,param5,param6,param7,param8]));
      }
      
      public static function gotoGuideTD() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoGuideTD",[]));
      }
      
      public static function enterLab() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","enterLab",[]));
      }
      
      public static function gotoCardBar() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoCardBar",[]));
      }
      
      public static function gotoTrialRoad() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoTrialRoad",[]));
      }
      
      public static function gotoDrunkery() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoDrunkery",[]));
      }
      
      public static function gotoArenaEntrance() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoArenaEntrance",[]));
      }
      
      public static function gotoArena() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoArena",[]));
      }
      
      public static function gotoRankArena() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoRankArena",[]));
      }
      
      public static function gotoGarden() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoGarden",[]));
      }
      
      public static function gotoWT() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoWT",[]));
      }
      
      public static function gotoHole(param1:Int64 = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoHole",[param1]));
      }
      
      public static function gotoExpedition(param1:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoExpedition",[param1]));
      }
      
      public static function gotoBattleByID(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoBattleByID",[param1]));
      }
      
      public static function gotoBattleByReport(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoBattleByReport",[param1]));
      }
      
      public static function gotoTDChallengeLevel(param1:int = 1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoTDChallengeLevel",[param1]));
      }
      
      public static function lockScreen(param1:int = 7) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","lockScreen",[param1]));
      }
      
      public static function unlockScreen() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","unlockScreen",[]));
      }
      
      public static function queryReport(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","queryReport",[param1]));
      }
      
      public static function querySpecialReport(param1:String, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","querySpecialReport",[param1,param2]));
      }
      
      public static function forbidConnectAgain() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","forbidConnectAgain",[]));
      }
      
      public static function finishLoadBaseModule() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","finishLoadBaseModule",[]));
      }
      
      public static function openTDPrivilegeWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","openTDPrivilegeWindow",[]));
      }
      
      public static function gotoZombieIsland() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoZombieIsland",[]));
      }
      
      public static function gotoPlantTalent() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoPlantTalent",[]));
      }
      
      public static function gotoWebpage(param1:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoWebpage",[param1]));
      }
      
      public static function gotoEndlessFuben() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoEndlessFuben",[]));
      }
      
      public static function gotoSuperArena() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","gotoSuperArena",[]));
      }
      
      public static function readClientData(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","readClientData",[param1]));
      }
      
      public static function writeClientData(param1:Int64, param2:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GameFlowCommand","writeClientData",[param1,param2]));
      }
   }
}
