package com.qq.modules.endlessTD.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class EndlessTDViewCmd
   {
       
      
      public function EndlessTDViewCmd()
      {
         super();
      }
      
      public static function enterScene() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDViewCommand","enterScene",[]));
      }
      
      public static function goToEndlessTD() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDViewCommand","goToEndlessTD",[]));
      }
      
      public static function beginEndlessTD(param1:Object = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDViewCommand","beginEndlessTD",[param1]));
      }
      
      public static function startNextLevel() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDViewCommand","startNextLevel",[]));
      }
      
      public static function exitGame() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDViewCommand","exitGame",[]));
      }
      
      public static function congratulatePassAll() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDViewCommand","congratulatePassAll",[]));
      }
      
      public static function showFailedPopup() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDViewCommand","showFailedPopup",[]));
      }
      
      public static function openStrengthen() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDViewCommand","openStrengthen",[]));
      }
      
      public static function openRank() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDViewCommand","openRank",[]));
      }
      
      public static function openSavePanel(param1:Boolean = true) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDViewCommand","openSavePanel",[param1]));
      }
      
      public static function openLoadPanel() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDViewCommand","openLoadPanel",[]));
      }
   }
}
