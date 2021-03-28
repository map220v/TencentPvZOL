package com.qq.modules.onlineReward.model
{
   import PVZ.Cmd.Cmd_OnlineReward_GetInfo_SC;
   import PVZ.Cmd.Cmd_OnlineReward_TakeRewardWeekly_SC;
   import PVZ.Cmd.Cmd_OnlineReward_TakeReward_SC;
   import PVZ.Cmd.Dto_IdNum;
   import PVZ.Cmd.Dto_ItemInfo;
   import com.qq.CommandName;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.entryIcon.ActivityIconConst;
   import com.qq.modules.entryIcon.command.EntryIconCmd;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.logic.initData.InitDataManager;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.onlineReward.command.OnlineRewardCmd;
   import com.qq.modules.sound.command.UISoundCmd;
   import com.qq.utils.CommandDispatcher;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class OnlineRewardService extends BasicProxy
   {
       
      
      [Inject]
      public var pvzServer:PvzSocketService;
      
      [Inject]
      public var model:OnlineRewardModel;
      
      public function OnlineRewardService()
      {
         super();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_OnlineReward_GetInfo_SC.$MessageID,this.onCmd_OnlineReward_GetInfo_SC],[Cmd_OnlineReward_TakeReward_SC.$MessageID,this.onCmd_OnlineReward_TakeReward_SC],[Cmd_OnlineReward_TakeRewardWeekly_SC.$MessageID,this.onCmd_OnlineReward_TakeRewardWeekly_SC]];
      }
      
      private function onCmd_OnlineReward_GetInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_OnlineReward_GetInfo_SC = null;
         this.model.reset();
         _loc2_ = param1.socketData as Cmd_OnlineReward_GetInfo_SC;
         this.model.daliyOnlineEffectiveTime = _loc2_.dailyOnlineTime;
         this.model.weekOnlineTime = _loc2_.weeklyOnlineTime;
         this.model.lastLoginTime = _loc2_.lastLoginTime;
         this.model.lastDailyRewardTime = _loc2_.lastDailyRewardTime;
         this.model.lastWeekRewardStat = _loc2_.lastWeekRewardStat;
         if(this.model.nextDailyRewardID != _loc2_.nextDailyRewardID)
         {
            this.model.resetNextRewardData();
         }
         this.model.nextDailyRewardID = _loc2_.nextDailyRewardID;
         this.model.lastWeekRewardList = _loc2_.lastWeekRewardList;
         this.model.dailyRewardList = _loc2_.dailyRewardList;
         InitDataManager.getInstance().finishTask(InitDataManager.Init_OnlineReward);
         CommandDispatcher.send(CommandName.OnlineReward_Data_Change);
         if(this.model.getNextRewardTime() != 0)
         {
            EntryIconCmd.addActivityIcon(ActivityIconConst.ICON_ONLINE_DAILY_REWARD,OnlineRewardCmd.clickDailyRewardIcon);
         }
      }
      
      private function onCmd_OnlineReward_TakeReward_SC(param1:SocketServiceEvent) : void
      {
         var _loc4_:Dto_IdNum = null;
         var _loc5_:Dto_ItemInfo = null;
         var _loc2_:Cmd_OnlineReward_TakeReward_SC = param1.socketData as Cmd_OnlineReward_TakeReward_SC;
         var _loc3_:Array = new Array();
         for each(_loc4_ in _loc2_.rewardList)
         {
            (_loc5_ = new Dto_ItemInfo()).id = _loc4_.id;
            _loc5_.num = _loc4_.num;
            _loc3_.push(_loc5_);
         }
         CommonCmd.itemFly(_loc3_);
         UISoundCmd.UI_collect();
      }
      
      private function onCmd_OnlineReward_TakeRewardWeekly_SC(param1:SocketServiceEvent) : void
      {
         var _loc4_:Dto_IdNum = null;
         var _loc5_:Dto_ItemInfo = null;
         var _loc2_:Cmd_OnlineReward_TakeRewardWeekly_SC = param1.socketData as Cmd_OnlineReward_TakeRewardWeekly_SC;
         var _loc3_:Array = new Array();
         for each(_loc4_ in _loc2_.rewardList)
         {
            (_loc5_ = new Dto_ItemInfo()).id = _loc4_.id;
            _loc5_.num = _loc4_.num;
            _loc3_.push(_loc5_);
         }
         CommonCmd.itemFly(_loc3_);
         UISoundCmd.UI_collect();
      }
   }
}
