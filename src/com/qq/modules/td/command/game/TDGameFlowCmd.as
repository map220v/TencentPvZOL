package com.qq.modules.td.command.game
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TDGameFlowCmd
   {
       
      
      public function TDGameFlowCmd()
      {
         super();
      }
      
      public static function restartGame() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameFlowCommand","restartGame",[]));
      }
      
      public static function gotoGuide() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameFlowCommand","gotoGuide",[]));
      }
      
      public static function reviewStageMap() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameFlowCommand","reviewStageMap",[]));
      }
      
      public static function reviewStageMapWhenNotRunning() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameFlowCommand","reviewStageMapWhenNotRunning",[]));
      }
      
      public static function gotoChooseCard() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameFlowCommand","gotoChooseCard",[]));
      }
      
      public static function enterChoosePlantCardScreen() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameFlowCommand","enterChoosePlantCardScreen",[]));
      }
      
      public static function finishEnterChoosePlantCardScreen() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameFlowCommand","finishEnterChoosePlantCardScreen",[]));
      }
      
      public static function loadFriendCardInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameFlowCommand","loadFriendCardInfo",[]));
      }
      
      public static function enterChooseFriendCardScreen() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameFlowCommand","enterChooseFriendCardScreen",[]));
      }
      
      public static function finishEnterChooseFriendCardScreen() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameFlowCommand","finishEnterChooseFriendCardScreen",[]));
      }
      
      public static function backToChooseCardScreen() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameFlowCommand","backToChooseCardScreen",[]));
      }
      
      public static function enterChoosePlantCardScreenWithEndlessTD() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameFlowCommand","enterChoosePlantCardScreenWithEndlessTD",[]));
      }
      
      public static function readyTDGame() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameFlowCommand","readyTDGame",[]));
      }
      
      public static function readyTDGameWithoutLoading(param1:Array, param2:Vector.<int> = null, param3:Vector.<Object> = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameFlowCommand","readyTDGameWithoutLoading",[param1,param2,param3]));
      }
      
      public static function requestStartTDGame() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameFlowCommand","requestStartTDGame",[]));
      }
      
      public static function finishLoadAllTDData() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameFlowCommand","finishLoadAllTDData",[]));
      }
      
      public static function startBackToWarfield() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameFlowCommand","startBackToWarfield",[]));
      }
      
      public static function finishBackToWarfield() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameFlowCommand","finishBackToWarfield",[]));
      }
      
      public static function startTDGame() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameFlowCommand","startTDGame",[]));
      }
      
      public static function reportTDResult() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameFlowCommand","reportTDResult",[]));
      }
      
      public static function passGuideTD() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDGameFlowCommand","passGuideTD",[]));
      }
   }
}
