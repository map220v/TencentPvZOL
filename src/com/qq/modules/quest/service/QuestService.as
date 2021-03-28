package com.qq.modules.quest.service
{
   import PVZ.Cmd.Cmd_DailyActivity_GetInfo_CS;
   import PVZ.Cmd.Cmd_DailyActivity_GetInfo_SC;
   import PVZ.Cmd.Cmd_DailyActivity_Sync_SC;
   import PVZ.Cmd.Cmd_DailyQuest_GetInfo_CS;
   import PVZ.Cmd.Cmd_DailyQuest_GetInfo_SC;
   import PVZ.Cmd.Cmd_DailyQuest_Sync_SC;
   import PVZ.Cmd.Cmd_DailyQuest_TakeReward_CS;
   import PVZ.Cmd.Cmd_DailyQuest_TakeReward_SC;
   import PVZ.Cmd.Cmd_Quest_GetList_CS;
   import PVZ.Cmd.Cmd_Quest_GetList_SC;
   import PVZ.Cmd.Cmd_Quest_SyncState_SC;
   import PVZ.Cmd.Cmd_Quest_TakeReward_CS;
   import PVZ.Cmd.Cmd_Quest_TakeReward_SC;
   import PVZ.Cmd.Dto_IdNum;
   import PVZ.Cmd.Dto_ItemInfo;
   import com.qq.constant.ItemID;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.logic.initData.InitDataManager;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.quest.model.QuestModel;
   import com.qq.modules.sound.command.UISoundCmd;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.mvcs.Actor;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class QuestService extends Actor
   {
       
      
      [Inject]
      public var pvzServer:PvzSocketService;
      
      [Inject]
      public var questModel:QuestModel;
      
      [Inject]
      public var actorModel:ActorModel;
      
      private var hasInited:Boolean = false;
      
      public function QuestService()
      {
         super();
      }
      
      public function init() : void
      {
         if(!this.hasInited)
         {
            this.pvzServer.eventDispatcher.addEventListener(Cmd_Quest_GetList_SC.$MessageID,this.cmdHandler);
            this.pvzServer.eventDispatcher.addEventListener(Cmd_Quest_SyncState_SC.$MessageID,this.cmdHandler);
            this.pvzServer.eventDispatcher.addEventListener(Cmd_Quest_TakeReward_SC.$MessageID,this.cmdHandler);
            this.pvzServer.eventDispatcher.addEventListener(Cmd_DailyQuest_GetInfo_SC.$MessageID,this.cmdHandler);
            this.pvzServer.eventDispatcher.addEventListener(Cmd_DailyQuest_TakeReward_SC.$MessageID,this.cmdHandler);
            this.pvzServer.eventDispatcher.addEventListener(Cmd_DailyQuest_Sync_SC.$MessageID,this.cmdHandler);
            this.pvzServer.eventDispatcher.addEventListener(Cmd_DailyActivity_GetInfo_SC.$MessageID,this.cmdHandler);
            this.pvzServer.eventDispatcher.addEventListener(Cmd_DailyActivity_Sync_SC.$MessageID,this.cmdHandler);
            this.hasInited = true;
         }
      }
      
      private function cmdHandler(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Quest_GetList_SC = null;
         var _loc3_:Cmd_Quest_SyncState_SC = null;
         var _loc4_:Cmd_Quest_TakeReward_SC = null;
         var _loc5_:Array = null;
         var _loc6_:Dto_IdNum = null;
         var _loc7_:Dto_ItemInfo = null;
         var _loc8_:Cmd_DailyQuest_GetInfo_SC = null;
         var _loc9_:Cmd_DailyQuest_TakeReward_SC = null;
         var _loc10_:Array = null;
         var _loc11_:Dto_IdNum = null;
         var _loc12_:Dto_ItemInfo = null;
         var _loc13_:int = 0;
         var _loc14_:Cmd_DailyQuest_Sync_SC = null;
         var _loc15_:Cmd_DailyActivity_GetInfo_SC = null;
         var _loc16_:Cmd_DailyActivity_Sync_SC = null;
         if(param1.retCode != 0)
         {
            getLogger("Socket").error("socket error: " + param1.retCode);
            return;
         }
         switch(param1.type)
         {
            case Cmd_Quest_GetList_SC.$MessageID:
               _loc2_ = param1.socketData as Cmd_Quest_GetList_SC;
               this.questModel.updateQuestList(_loc2_.quests);
               InitDataManager.getInstance().finishTask(InitDataManager.Init_QuestInfo);
               break;
            case Cmd_Quest_SyncState_SC.$MessageID:
               _loc3_ = param1.socketData as Cmd_Quest_SyncState_SC;
               this.questModel.updateQuestInfo(_loc3_.quest);
               break;
            case Cmd_Quest_TakeReward_SC.$MessageID:
               _loc4_ = param1.socketData as Cmd_Quest_TakeReward_SC;
               _loc5_ = new Array();
               for each(_loc6_ in _loc4_.rewardList)
               {
                  (_loc7_ = new Dto_ItemInfo()).id = _loc6_.id;
                  _loc7_.num = _loc6_.num;
                  _loc5_.push(_loc7_);
               }
               CommonCmd.itemFly(_loc5_);
               UISoundCmd.UI_collect();
               UISoundCmd.mission_complete();
               break;
            case Cmd_DailyQuest_GetInfo_SC.$MessageID:
               _loc8_ = param1.socketData as Cmd_DailyQuest_GetInfo_SC;
               this.questModel.updateDailyQuestList(_loc8_.questList);
               break;
            case Cmd_DailyQuest_TakeReward_SC.$MessageID:
               _loc9_ = param1.socketData as Cmd_DailyQuest_TakeReward_SC;
               _loc10_ = new Array();
               for each(_loc11_ in _loc9_.rewardList)
               {
                  (_loc12_ = new Dto_ItemInfo()).id = _loc11_.id;
                  _loc13_ = _loc11_.num;
                  if(_loc12_.id == ItemID.ROLE_DAILY_ACTIVITY_EXP)
                  {
                     _loc13_ = ServerConfigTemplateFactory.instance.conver_daily_act_exp(this.actorModel.actorLevel) * _loc13_;
                  }
                  _loc12_.num = _loc13_;
                  _loc10_.push(_loc12_);
               }
               CommonCmd.itemFly(_loc10_);
               UISoundCmd.UI_collect();
               UISoundCmd.mission_complete();
               break;
            case Cmd_DailyQuest_Sync_SC.$MessageID:
               _loc14_ = param1.socketData as Cmd_DailyQuest_Sync_SC;
               this.questModel.updateDailyQuestInfo(_loc14_.dailyquest);
               break;
            case Cmd_DailyActivity_GetInfo_SC.$MessageID:
               _loc15_ = param1.socketData as Cmd_DailyActivity_GetInfo_SC;
               this.questModel.updateDailyActList(_loc15_.activityList);
               break;
            case Cmd_DailyActivity_Sync_SC.$MessageID:
               _loc16_ = param1.socketData as Cmd_DailyActivity_Sync_SC;
               this.questModel.updateDailyActInfo(_loc16_.dailyActivity);
         }
      }
      
      public function getQuestInfo() : void
      {
         var _loc1_:Cmd_Quest_GetList_CS = new Cmd_Quest_GetList_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function getDailyQusetInfo() : void
      {
         var _loc1_:Cmd_DailyQuest_GetInfo_CS = new Cmd_DailyQuest_GetInfo_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function getDailyActInfo() : void
      {
         var _loc1_:Cmd_DailyActivity_GetInfo_CS = new Cmd_DailyActivity_GetInfo_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function submitQuest(param1:int) : void
      {
         var _loc2_:Cmd_Quest_TakeReward_CS = new Cmd_Quest_TakeReward_CS();
         _loc2_.questId = param1;
         this.pvzServer.sendMessage(_loc2_);
      }
      
      public function takeDailyQuestReward(param1:int) : void
      {
         var _loc2_:Cmd_DailyQuest_TakeReward_CS = new Cmd_DailyQuest_TakeReward_CS();
         _loc2_.questId = param1;
         this.pvzServer.sendMessage(_loc2_);
      }
   }
}
