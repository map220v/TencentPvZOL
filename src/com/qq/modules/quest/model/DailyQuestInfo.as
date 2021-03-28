package com.qq.modules.quest.model
{
   import PVZ.Cmd.Dto_DailyQuest;
   import PVZ.Cmd.E_DailyQuestState;
   import com.qq.GameGloble;
   import com.qq.modules.quest.QuestDataFactory;
   import com.qq.modules.quest.model.templates.ce.DailyQuestInfoTemplateCE;
   
   public class DailyQuestInfo
   {
       
      
      public var questID:int;
      
      public var dto_questInfo:Dto_DailyQuest;
      
      public var questTemplate:DailyQuestInfoTemplateCE;
      
      public var state:int;
      
      public function DailyQuestInfo(param1:int, param2:Dto_DailyQuest)
      {
         super();
         this.questID = param1;
         this.dto_questInfo = param2;
         this.state = 0;
         this.questTemplate = QuestDataFactory.getInstance().getDailyQuestDataByID(param1);
         if(param2 != null)
         {
            this.updateState(param2.state);
         }
      }
      
      public function reset(param1:Dto_DailyQuest) : void
      {
         this.dto_questInfo = param1;
         if(param1 != null)
         {
            this.updateState(param1.state);
         }
      }
      
      private function updateState(param1:int) : void
      {
         if(GameGloble.actorModel.actorLevel >= this.questTemplate.openLv)
         {
            this.state = param1;
         }
         else
         {
            this.state = E_DailyQuestState.E_DailyQuestState_Not_Exe;
         }
      }
   }
}
