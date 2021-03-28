package com.qq.modules.td.command.game
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TDGameCmd
   {
       
      
      public function TDGameCmd()
      {
         super();
      }
      
      public static function finishGame(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameCommand","finishGame",[param1]));
      }
      
      public static function reportTDResult() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameCommand","reportTDResult",[]));
      }
      
      public static function winGame() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameCommand","winGame",[]));
      }
      
      public static function failGame() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameCommand","failGame",[]));
      }
      
      public static function ImmediatelyWinGame() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameCommand","ImmediatelyWinGame",[]));
      }
      
      public static function isStopCheckEndTDGame(param1:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameCommand","isStopCheckEndTDGame",[param1]));
      }
      
      public static function playerPauseGame() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameCommand","playerPauseGame",[]));
      }
      
      public static function playerResumeGame() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameCommand","playerResumeGame",[]));
      }
      
      public static function playerRestartGame() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameCommand","playerRestartGame",[]));
      }
      
      public static function playerExitGame() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameCommand","playerExitGame",[]));
      }
      
      public static function pauseGame() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameCommand","pauseGame",[]));
      }
      
      public static function resumeGame() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameCommand","resumeGame",[]));
      }
      
      public static function exitGame(param1:Object = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameCommand","exitGame",[param1]));
      }
      
      public static function changeSun(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameCommand","changeSun",[param1]));
      }
      
      public static function changeFuel(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameCommand","changeFuel",[param1]));
      }
      
      public static function changeRain(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameCommand","changeRain",[param1]));
      }
      
      public static function setRain(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameCommand","setRain",[param1]));
      }
      
      public static function changeEndlessScore(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameCommand","changeEndlessScore",[param1]));
      }
      
      public static function addTrackCard(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameCommand","addTrackCard",[param1]));
      }
      
      public static function reportCheatGame() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameCommand","reportCheatGame",[]));
      }
      
      public static function copyTDDataForEndlessTD() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameCommand","copyTDDataForEndlessTD",[]));
      }
      
      public static function showInstrustation(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameCommand","showInstrustation",[param1,param2]));
      }
   }
}
