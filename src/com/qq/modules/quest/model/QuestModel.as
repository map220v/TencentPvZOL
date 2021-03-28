package com.qq.modules.quest.model
{
   import PVZ.Cmd.Dto_DailyActivity;
   import PVZ.Cmd.Dto_DailyQuest;
   import PVZ.Cmd.Dto_Quest_Info;
   import com.qq.CommandName;
   import com.qq.constant.quest.QuestConstant;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.quest.QuestDataFactory;
   import com.qq.modules.quest.command.QuestCmd;
   import com.qq.modules.quest.model.templates.ce.DailyQuestInfoTemplateCE;
   import com.qq.modules.quest.model.templates.ce.QuestInfoTemplateCE;
   import org.robotlegs.mvcs.Actor;
   
   public class QuestModel extends Actor
   {
       
      
      public var questList:Array;
      
      public var dailyQuestList:Array;
      
      private var dailyQuestDtoList:Array;
      
      public var dailyActList:Array;
      
      public function QuestModel()
      {
         super();
         this.questList = new Array();
         this.dailyQuestList = new Array();
      }
      
      public function getDailyQuestInfoById(param1:int) : DailyQuestInfo
      {
         var _loc4_:DailyQuestInfo = null;
         var _loc2_:int = this.dailyQuestList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this.dailyQuestList[_loc3_] as DailyQuestInfo).questID == param1)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getQailyQuestListByState(param1:Array) : Array
      {
         var _loc5_:DailyQuestInfo = null;
         var _loc2_:Array = new Array();
         var _loc3_:int = this.dailyQuestList.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = this.dailyQuestList[_loc4_] as DailyQuestInfo;
            if(param1.indexOf(_loc5_.state) != -1)
            {
               _loc2_.push(_loc5_);
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      private function dailyQuestSort(param1:DailyQuestInfo, param2:DailyQuestInfo) : Number
      {
         var _loc3_:int = param1.state;
         var _loc4_:int = param2.state;
         if(_loc3_ == 4)
         {
            _loc3_ = -1;
         }
         if(_loc4_ == 4)
         {
            _loc4_ = -1;
         }
         if(_loc3_ > _loc4_)
         {
            return -1;
         }
         if(_loc3_ < _loc4_)
         {
            return 1;
         }
         if(param1.questTemplate.order > param2.questTemplate.order)
         {
            return 1;
         }
         if(param1.questTemplate.order < param2.questTemplate.order)
         {
            return -1;
         }
         return 0;
      }
      
      public function updateDailyQuestList(param1:Array) : void
      {
         var _loc2_:Dto_DailyQuest = null;
         var _loc3_:Vector.<DailyQuestInfoTemplateCE> = null;
         var _loc4_:DailyQuestInfoTemplateCE = null;
         var _loc5_:DailyQuestInfo = null;
         this.dailyQuestDtoList = new Array();
         for each(_loc2_ in param1)
         {
            this.dailyQuestDtoList[_loc2_.questId] = _loc2_;
         }
         _loc3_ = QuestDataFactory.getInstance().getDailyQuestList();
         this.dailyQuestList = new Array();
         for each(_loc4_ in _loc3_)
         {
            _loc5_ = new DailyQuestInfo(_loc4_.id,this.dailyQuestDtoList[_loc4_.id]);
            this.dailyQuestList.push(_loc5_);
         }
         this.dailyQuestList.sort(this.dailyQuestSort);
         dispatch(new CommonEvent(CommandName.DailyQuest_UpdateList));
      }
      
      public function updateDailyQuestInfo(param1:Dto_DailyQuest) : void
      {
         var _loc6_:DailyQuestInfo = null;
         if(this.dailyQuestList == null)
         {
            return;
         }
         var _loc2_:int = this.dailyQuestList.length;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            if((_loc6_ = this.dailyQuestList[_loc5_] as DailyQuestInfo).questID == param1.questId)
            {
               if(param1.state != _loc6_.state)
               {
                  _loc4_ = true;
               }
               _loc6_.reset(param1);
               _loc3_ = true;
               break;
            }
            _loc5_++;
         }
         if(_loc3_)
         {
            if(_loc4_ && param1.state == QuestConstant.receive)
            {
               QuestCmd.flyQuestReceiveTip(param1.questId,true);
            }
            this.dailyQuestList.sort(this.dailyQuestSort);
            dispatch(new CommonEvent(CommandName.DailyQuest_UpdateList));
         }
      }
      
      public function getQuestByType(param1:int) : Array
      {
         var _loc5_:Dto_Quest_Info = null;
         var _loc6_:QuestInfoTemplateCE = null;
         var _loc2_:Array = new Array();
         var _loc3_:int = this.questList.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = this.questList[_loc4_] as Dto_Quest_Info;
            if((_loc6_ = QuestDataFactory.getInstance().getQuestDataByID(_loc5_.id)) != null && _loc6_.type == param1)
            {
               _loc2_.push(_loc5_);
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function getQuestInfoById(param1:int) : Dto_Quest_Info
      {
         var _loc4_:Dto_Quest_Info = null;
         var _loc2_:int = this.questList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this.questList[_loc3_] as Dto_Quest_Info).id == param1)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function updateQuestList(param1:Array) : void
      {
         this.questList = param1;
         this.questList.sortOn(["state","id"],[Array.NUMERIC | Array.DESCENDING,Array.NUMERIC]);
         dispatch(new CommonEvent(CommandName.Quest_UpdateList));
      }
      
      public function updateQuestInfo(param1:Dto_Quest_Info) : void
      {
         var _loc7_:Dto_Quest_Info = null;
         var _loc2_:int = this.questList.length;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = true;
         var _loc6_:int = 0;
         while(_loc6_ < _loc2_)
         {
            if((_loc7_ = this.questList[_loc6_] as Dto_Quest_Info).id == param1.id)
            {
               if(param1.state != _loc7_.state)
               {
                  _loc4_ = true;
               }
               if(param1.state == QuestConstant.finished)
               {
                  this.questList.splice(_loc6_,1);
               }
               else
               {
                  this.questList[_loc6_] = param1;
               }
               _loc3_ = true;
               _loc5_ = false;
               break;
            }
            _loc6_++;
         }
         if(_loc5_)
         {
            this.questList.push(param1);
            _loc4_ = true;
         }
         if(_loc4_ && param1.state == QuestConstant.receive)
         {
            QuestCmd.flyQuestReceiveTip(param1.id);
         }
         if(_loc3_ || _loc5_)
         {
            this.questList.sortOn(["state","id"],[Array.NUMERIC | Array.DESCENDING,Array.NUMERIC]);
            dispatch(new CommonEvent(CommandName.Quest_UpdateList));
         }
      }
      
      public function getDailyAct(param1:int) : DailyActInfo
      {
         var _loc2_:DailyActInfo = null;
         for each(_loc2_ in this.dailyActList)
         {
            if(_loc2_.activityID == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function updateDailyActList(param1:Array) : void
      {
         var _loc2_:Dto_DailyActivity = null;
         var _loc3_:DailyActInfo = null;
         this.dailyActList = new Array();
         for each(_loc2_ in param1)
         {
            _loc3_ = new DailyActInfo(_loc2_);
            this.dailyActList.push(_loc3_);
         }
         this.dailyActList.sort(this.dailyActSort);
         dispatch(new CommonEvent(CommandName.Daily_Act_UpdateList));
      }
      
      public function updateDailyActInfo(param1:Dto_DailyActivity) : void
      {
         var _loc3_:DailyActInfo = null;
         var _loc4_:DailyActInfo = null;
         if(this.dailyActList == null)
         {
            return;
         }
         var _loc2_:Boolean = true;
         for each(_loc3_ in this.dailyActList)
         {
            if(_loc3_.activityID == param1.activityId)
            {
               _loc3_.reset(param1);
               _loc2_ = false;
               break;
            }
         }
         if(_loc2_)
         {
            _loc4_ = new DailyActInfo(param1);
            this.dailyActList.push(_loc4_);
         }
         this.dailyActList.sort(this.dailyActSort);
         dispatch(new CommonEvent(CommandName.Daily_Act_UpdateList));
      }
      
      public function sortDailyActList() : void
      {
         this.dailyActList.sort(this.dailyActSort);
      }
      
      private function dailyActSort(param1:DailyActInfo, param2:DailyActInfo) : Number
      {
         var _loc3_:int = int(param1.isShow);
         var _loc4_:int = int(param2.isShow);
         if(_loc3_ > _loc4_)
         {
            return -1;
         }
         if(_loc3_ < _loc4_)
         {
            return 1;
         }
         if(param1.info.order > param2.info.order)
         {
            return 1;
         }
         if(param1.info.order < param2.info.order)
         {
            return -1;
         }
         return 0;
      }
   }
}
