package com.qq.modules.dailyTD.command
{
   import flash.display.DisplayObject;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class DailyTdViewCmd
   {
       
      
      public function DailyTdViewCmd()
      {
         super();
      }
      
      public static function showMainPanel() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DailyTdViewCommand","showMainPanel",[]));
      }
      
      public static function switchDailyTDScene() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DailyTdViewCommand","switchDailyTDScene",[]));
      }
      
      public static function leaveDailyTDScene() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DailyTdViewCommand","leaveDailyTDScene",[]));
      }
      
      public static function showDailyTDScene() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DailyTdViewCommand","showDailyTDScene",[]));
      }
      
      public static function startDailyTD() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DailyTdViewCommand","startDailyTD",[]));
      }
      
      public static function showDrawCardPanel() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DailyTdViewCommand","showDrawCardPanel",[]));
      }
      
      public static function gotoDailyTD() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DailyTdViewCommand","gotoDailyTD",[]));
      }
      
      public static function showRainbowHorseWinds() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DailyTdViewCommand","showRainbowHorseWinds",[]));
      }
      
      public static function closeRainbowHorseWinds(param1:DisplayObject) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DailyTdViewCommand","closeRainbowHorseWinds",[param1]));
      }
      
      public static function showExchangePanel() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DailyTdViewCommand","showExchangePanel",[]));
      }
      
      public static function showDailyTDFailedPopup() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DailyTdViewCommand","showDailyTDFailedPopup",[]));
      }
      
      public static function dailyTDRestartGame(param1:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DailyTdViewCommand","dailyTDRestartGame",[param1]));
      }
      
      public static function dailyTDPlayerGameExit(param1:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DailyTdViewCommand","dailyTDPlayerGameExit",[param1]));
      }
   }
}
