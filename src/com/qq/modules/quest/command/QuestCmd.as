package com.qq.modules.quest.command
{
   import flash.display.DisplayObjectContainer;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class QuestCmd
   {
       
      
      public function QuestCmd()
      {
         super();
      }
      
      public static function openQuestWindow(param1:int = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QuestCommand","openQuestWindow",[param1]));
      }
      
      public static function openDailyQuestWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QuestCommand","openDailyQuestWindow",[]));
      }
      
      public static function closenQuestWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QuestCommand","closenQuestWindow",[]));
      }
      
      public static function showQuickRewardWindow(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QuestCommand","showQuickRewardWindow",[param1,param2]));
      }
      
      public static function addQuickQuestPanel(param1:DisplayObjectContainer) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QuestCommand","addQuickQuestPanel",[param1]));
      }
      
      public static function removeQuestPanel() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QuestCommand","removeQuestPanel",[]));
      }
      
      public static function flyQuestReceiveTip(param1:int, param2:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QuestCommand","flyQuestReceiveTip",[param1,param2]));
      }
   }
}
