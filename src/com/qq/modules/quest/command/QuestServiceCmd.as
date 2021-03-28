package com.qq.modules.quest.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class QuestServiceCmd
   {
       
      
      public function QuestServiceCmd()
      {
         super();
      }
      
      public static function submitQuest(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QuestServiceCommand","submitQuest",[param1]));
      }
      
      public static function takeDailyQuestReward(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QuestServiceCommand","takeDailyQuestReward",[param1]));
      }
      
      public static function getDailyQuestInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QuestServiceCommand","getDailyQuestInfo",[]));
      }
      
      public static function getDailyActInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QuestServiceCommand","getDailyActInfo",[]));
      }
   }
}
