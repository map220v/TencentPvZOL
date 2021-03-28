package com.qq.modules.guide.command
{
   import flash.display.DisplayObjectContainer;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class GuideCmd
   {
       
      
      public function GuideCmd()
      {
         super();
      }
      
      public static function registerGuide(param1:String, param2:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","registerGuide",[param1,param2]));
      }
      
      public static function unregisterGuidesWithoutInitcode() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","unregisterGuidesWithoutInitcode",[]));
      }
      
      public static function checkBeforeToScene(param1:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","checkBeforeToScene",[param1]));
      }
      
      public static function checkProgressGuide(param1:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","checkProgressGuide",[param1]));
      }
      
      public static function showBattleLineupGuide(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","showBattleLineupGuide",[param1,param2]));
      }
      
      public static function clearArrows() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","clearArrows",[]));
      }
      
      public static function clearArea() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","clearArea",[]));
      }
      
      public static function clearGuide() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","clearGuide",[]));
      }
      
      public static function checkPrevSaveIfInGuide() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","checkPrevSaveIfInGuide",[]));
      }
      
      public static function killGuide() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","killGuide",[]));
      }
      
      public static function tryLsLevelGuide(param1:int, param2:int, param3:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","tryLsLevelGuide",[param1,param2,param3]));
      }
      
      public static function tryGuide(param1:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","tryGuide",[param1]));
      }
      
      public static function tryFirstEntryGuide(param1:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","tryFirstEntryGuide",[param1]));
      }
      
      public static function showDebugWd() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","showDebugWd",[]));
      }
      
      public static function showGuide(param1:Object, param2:String = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","showGuide",[param1,param2]));
      }
      
      public static function exitGuide() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","exitGuide",[]));
      }
      
      public static function showDaveTalkByText(param1:String, param2:DisplayObjectContainer = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","showDaveTalkByText",[param1,param2]));
      }
      
      public static function addLightArea(param1:int, param2:int, param3:int, param4:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","addLightArea",[param1,param2,param3,param4]));
      }
      
      public static function addArrow(param1:*, param2:String = null, param3:* = null, param4:int = 0, param5:int = 0, param6:Boolean = true, param7:Boolean = false, param8:Number = NaN, param9:Number = NaN) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","addArrow",[param1,param2,param3,param4,param5,param6,param7,param8,param9]));
      }
      
      public static function addTip(param1:*, param2:String = null, param3:String = null, param4:Array = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","addTip",[param1,param2,param3,param4]));
      }
      
      public static function requestKeys() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","requestKeys",[]));
      }
      
      public static function setKey(param1:String, param2:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","setKey",[param1,param2]));
      }
      
      public static function checkBtnVisible(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","checkBtnVisible",[param1]));
      }
      
      public static function checkAllBtnVisible() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","checkAllBtnVisible",[]));
      }
      
      public static function chooseGameType() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","chooseGameType",[]));
      }
      
      public static function showFirstSkip() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","showFirstSkip",[]));
      }
      
      public static function autoGotoCityScene() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","autoGotoCityScene",[]));
      }
      
      public static function checkButtonComplete(param1:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","checkButtonComplete",[param1]));
      }
      
      public static function checkBuildingLoadComplete(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","checkBuildingLoadComplete",[param1]));
      }
      
      public static function showDaveEndDialog(param1:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","showDaveEndDialog",[param1]));
      }
      
      public static function skipSome() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideCommand","skipSome",[]));
      }
   }
}
