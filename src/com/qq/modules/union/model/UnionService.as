package com.qq.modules.union.model
{
   import PVZ.Cmd.Cmd_GuildAckJoin_SC;
   import PVZ.Cmd.Cmd_GuildAppoint_SC;
   import PVZ.Cmd.Cmd_GuildBid_SC;
   import PVZ.Cmd.Cmd_GuildCancerLeaderDeliver_SC;
   import PVZ.Cmd.Cmd_GuildChangeFlag_SC;
   import PVZ.Cmd.Cmd_GuildChangeNotice_SC;
   import PVZ.Cmd.Cmd_GuildChangeQQ_SC;
   import PVZ.Cmd.Cmd_GuildCreate_SC;
   import PVZ.Cmd.Cmd_GuildDelateLeader_SC;
   import PVZ.Cmd.Cmd_GuildDonate_SC;
   import PVZ.Cmd.Cmd_GuildEventList_SC;
   import PVZ.Cmd.Cmd_GuildFertilizerLog_SC;
   import PVZ.Cmd.Cmd_GuildFertilizer_SC;
   import PVZ.Cmd.Cmd_GuildHonorList_SC;
   import PVZ.Cmd.Cmd_GuildInfoRefresh_SC;
   import PVZ.Cmd.Cmd_GuildInfo_SC;
   import PVZ.Cmd.Cmd_GuildInviteAck_SC;
   import PVZ.Cmd.Cmd_GuildInviteList_SC;
   import PVZ.Cmd.Cmd_GuildInviteReq_SC;
   import PVZ.Cmd.Cmd_GuildJoinList_SC;
   import PVZ.Cmd.Cmd_GuildJoinReq_SC;
   import PVZ.Cmd.Cmd_GuildKick_SC;
   import PVZ.Cmd.Cmd_GuildLeaderDeliver_SC;
   import PVZ.Cmd.Cmd_GuildLevelUp_SC;
   import PVZ.Cmd.Cmd_GuildList_SC;
   import PVZ.Cmd.Cmd_GuildMember_SC;
   import PVZ.Cmd.Cmd_GuildQuit_SC;
   import PVZ.Cmd.Cmd_GuildSkill_Info_SC;
   import PVZ.Cmd.Cmd_GuildSkill_Upgrade_SC;
   import PVZ.Cmd.Cmd_Guild_GetQuickJoin_SC;
   import PVZ.Cmd.Cmd_Guild_IgnoreApply_SC;
   import PVZ.Cmd.Cmd_Guild_Observe_SC;
   import PVZ.Cmd.Cmd_Guild_QuickJoin_SC;
   import PVZ.Cmd.Cmd_Guild_Search_SummaryInfo_SC;
   import PVZ.Cmd.Cmd_Guild_SetQuickJoin_SC;
   import PVZ.Cmd.Cmd_RoleGuildInfo_SC;
   import PVZ.Cmd.Cmd_Temple_ShowDailyReward_SC;
   import PVZ.Cmd.Cmd_Temple_TakeDailyReward_SC;
   import PVZ.Cmd.Dto_IdNum;
   import PVZ.Cmd.Dto_ItemInfo;
   import PVZ.Cmd.Dto_SkillInfo;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.ItemID;
   import com.qq.display.QAlert;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.main.logic.initData.InitDataManager;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.union.command.UnionCmd;
   import com.qq.modules.union.command.UnionServiceCmd;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.CommandDispatcher;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class UnionService extends BasicProxy
   {
       
      
      [Inject]
      public var pvzServer:PvzSocketService;
      
      [Inject]
      public var model:UnionModel;
      
      public var callBackCommand:Array;
      
      public function UnionService()
      {
         super();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_RoleGuildInfo_SC.$MessageID,this.onCmd_RoleGuildInfo_SC],[Cmd_GuildList_SC.$MessageID,this.onCmd_GuildList_SC],[Cmd_GuildJoinReq_SC.$MessageID,this.onCmd_GuildJoinReq_SC],[Cmd_GuildCreate_SC.$MessageID,this.onCmd_GuildCreate_SC],[Cmd_GuildInfo_SC.$MessageID,this.onCmd_GuildInfo_SC],[Cmd_GuildJoinList_SC.$MessageID,this.onCmd_GuildJoinList_SC],[Cmd_GuildAckJoin_SC.$MessageID,this.onCmd_GuildAckJoin_SC],[Cmd_GuildMember_SC.$MessageID,this.onCmd_GuildMember_SC],[Cmd_GuildBid_SC.$MessageID,this.onCmd_GuildBid_SC],[Cmd_GuildChangeNotice_SC.$MessageID,this.onCmd_GuildChgNotice_SC],[Cmd_GuildInfoRefresh_SC.$MessageID,this.onCmd_GuildInfoRefresh_SC],[Cmd_GuildLevelUp_SC.$MessageID,this.onCmd_GuildLevelUp_SC],[Cmd_GuildDonate_SC.$MessageID,this.onCmd_GuildDonate_SC],[Cmd_GuildChangeQQ_SC.$MessageID,this.onCmd_GuildChangeQQ_SC],[Cmd_GuildChangeFlag_SC.$MessageID,this.onCmd_GuildChangeFlag_SC],[Cmd_GuildInviteList_SC.$MessageID,this.onCmd_GuildInviteList_SC],[Cmd_GuildInviteReq_SC.$MessageID,this.onCmd_GuildInviteReq_SC],[Cmd_GuildFertilizer_SC.$MessageID,this.onCmd_GuildFertilizer_SC],[Cmd_GuildFertilizerLog_SC.$MessageID,this.onCmd_GuildFertilizerLog_SC],[Cmd_GuildQuit_SC.$MessageID,this.onCmd_GuildQuit_SC],[Cmd_GuildKick_SC.$MessageID,this.onCmd_GuildKick_SC],[Cmd_GuildInviteAck_SC.$MessageID,this.onCmd_GuildInviteAck_SC],[Cmd_Temple_ShowDailyReward_SC.$MessageID,this.onCmd_Temple_ShowDailyReward_SC],[Cmd_Temple_TakeDailyReward_SC.$MessageID,this.onCmd_Temple_TakeDailyReward_SC],[Cmd_Guild_Search_SummaryInfo_SC.$MessageID,this.onCmd_Guild_Search_SummaryInfo_SC],[Cmd_Guild_Observe_SC.$MessageID,this.onCmd_Guild_Observe_SC],[Cmd_GuildDelateLeader_SC.$MessageID,this.onCmd_GuildDelateLeader_SC],[Cmd_GuildAppoint_SC.$MessageID,this.onCmd_GuildAppoint_SC],[Cmd_GuildLeaderDeliver_SC.$MessageID,this.onCmd_GuildLeaderDeliver_SC],[Cmd_GuildCancerLeaderDeliver_SC.$MessageID,this.onCmd_GuildCancerLeaderDeliver_SC],[Cmd_GuildHonorList_SC.$MessageID,this.onCmd_GuildHonorList_SC],[Cmd_GuildEventList_SC.$MessageID,this.onCmd_GuildEventList_SC],[Cmd_Guild_IgnoreApply_SC.$MessageID,this.onCmd_Guild_IgnoreApply_SC],[Cmd_Guild_SetQuickJoin_SC.$MessageID,this.onCmd_Guild_SetQuickJoin_SC],[Cmd_Guild_GetQuickJoin_SC.$MessageID,this.onCmd_Guild_GetQuickJoin_SC],[Cmd_Guild_QuickJoin_SC.$MessageID,this.onCmd_Guild_QuickJoin_SC],[Cmd_GuildSkill_Info_SC.$MessageID,this.onCmd_GuildSkill_Info_SC],[Cmd_GuildSkill_Upgrade_SC.$MessageID,this.onCmd_GuildSkill_Upgrade_SC]];
      }
      
      private function onCmd_RoleGuildInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_RoleGuildInfo_SC = null;
         _loc2_ = param1.socketData as Cmd_RoleGuildInfo_SC;
         this.model.playerUnionInfo.id = _loc2_.roleGuildInfo.guildId;
         this.model.playerUnionInfo.name = _loc2_.roleGuildInfo.guildName;
         this.model.playerUnionInfo.inviteNum = _loc2_.roleGuildInfo.invitedCount;
         this.model.playerUnionInfo.lastLeaveUnionTime = _loc2_.roleGuildInfo.lastQuitTime;
         this.model.playerUnionInfo.applyUnionList = _loc2_.roleGuildInfo.applyList;
         this.model.playerUnionInfo.position = _loc2_.roleGuildInfo.guildPosition;
         this.model.playerUnionInfo.leftFertilizerTimes = _loc2_.roleGuildInfo.fertilizerTimes;
         this.model.playerUnionInfo.level = _loc2_.roleGuildInfo.guildLevel;
         this.model.playerUnionInfo.cohesion = _loc2_.roleGuildInfo.cohesion;
         this.model.playerUnionInfo.dailyDonate = _loc2_.roleGuildInfo.dayContribCoin;
         InitDataManager.getInstance().finishTask(InitDataManager.Init_UnionInfo);
         GameGloble.unionModel = this.model;
         CommandDispatcher.send(CommandName.MY_UNION_INFO_RETURN);
      }
      
      private function onCmd_GuildList_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_GuildList_SC = param1.socketData as Cmd_GuildList_SC;
         this.model.count = _loc2_.count;
         this.model.baseInfoListCache = _loc2_.guildList;
         CommandDispatcher.send(CommandName.Union_ResetUnionListUI);
      }
      
      private function onCmd_GuildJoinReq_SC(param1:SocketServiceEvent) : void
      {
         CommandDispatcher.send(CommandName.ChangeUnionApply);
         GameFlowCmd.unlockScreen();
      }
      
      private function onCmd_GuildCreate_SC(param1:SocketServiceEvent) : void
      {
         CommandDispatcher.send(CommandName.Union_CreateUnion_Success);
      }
      
      private function onCmd_GuildInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:Function = null;
         var _loc2_:Cmd_GuildInfo_SC = param1.socketData as Cmd_GuildInfo_SC;
         this.model.playerUnionInfo.level = _loc2_.guildInfo.baseInfo.level;
         if(this.callBackCommand != null && this.callBackCommand.length > 0)
         {
            _loc3_ = this.callBackCommand.shift();
            this.callBackCommand.push([_loc2_.guildInfo]);
            if(_loc3_ != null)
            {
               _loc3_.apply(this,this.callBackCommand);
            }
            this.callBackCommand = null;
         }
         GameFlowCmd.unlockScreen();
         UnionServiceCmd.getMyUnionInfo();
      }
      
      private function onCmd_GuildJoinList_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_GuildJoinList_SC = param1.socketData as Cmd_GuildJoinList_SC;
         this.model.unionJoinListCache = _loc2_.joinPlayerList;
         CommandDispatcher.send(CommandName.Union_JoinListData_Ready);
         GameFlowCmd.unlockScreen();
      }
      
      private function onCmd_GuildAckJoin_SC(param1:SocketServiceEvent) : void
      {
         CommandDispatcher.send(CommandName.Union_Request_JoinListData);
         CommandDispatcher.send(CommandName.Union_Request_UnionMemberList);
         GameFlowCmd.unlockScreen();
      }
      
      private function onCmd_GuildMember_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_GuildMember_SC = param1.socketData as Cmd_GuildMember_SC;
         this.model.otherUnionUID = _loc2_.guildId;
         if(this.model.playerUnionInfo.isVaild() && this.model.otherUnionUID.compare(this.model.playerUnionInfo.id))
         {
            this.model.unionMemberList = _loc2_.member;
         }
         else
         {
            this.model.otherUnionMemberList = _loc2_.member;
         }
         CommandDispatcher.send(CommandName.Union_UnionMemberList_Ready);
      }
      
      private function onCmd_GuildBid_SC(param1:SocketServiceEvent) : void
      {
         CommandDispatcher.send(CommandName.Union_bidding_Success);
      }
      
      private function onCmd_GuildChgNotice_SC(param1:SocketServiceEvent) : void
      {
         CommandDispatcher.send(CommandName.Union_Annoucement_Edit_Success);
      }
      
      private function onCmd_GuildInfoRefresh_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_GuildInfoRefresh_SC = param1.socketData as Cmd_GuildInfoRefresh_SC;
         this.model.myUnionDetailInfoCache = _loc2_.guildInfo;
         CommandDispatcher.send(CommandName.Change_MyUnionInfo);
      }
      
      private function onCmd_GuildLevelUp_SC(param1:SocketServiceEvent) : void
      {
         UnionServiceCmd.requestMyUnionInfo();
         CommandDispatcher.send(CommandName.Union_LevelUp_Success);
      }
      
      private function onCmd_GuildDonate_SC(param1:SocketServiceEvent) : void
      {
         CommandDispatcher.send(CommandName.Union_Donate_Success);
      }
      
      private function onCmd_GuildChangeQQ_SC(param1:SocketServiceEvent) : void
      {
         CommandDispatcher.send(CommandName.Union_Change_QQGroup_Success);
      }
      
      private function onCmd_GuildChangeFlag_SC(param1:SocketServiceEvent) : void
      {
         CommandDispatcher.send(CommandName.Union_Change_Flag_Success);
      }
      
      private function onCmd_GuildInviteList_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_GuildInviteList_SC = param1.socketData as Cmd_GuildInviteList_SC;
         this.model.inviteList = _loc2_.guildList;
         CommandDispatcher.send(CommandName.Union_InviteList_Data_Ready);
      }
      
      private function onCmd_GuildInviteReq_SC(param1:SocketServiceEvent) : void
      {
         QAlert.Show(FontNormal.Union_Invite_Success);
      }
      
      private function onCmd_GuildFertilizer_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_GuildFertilizer_SC = param1.socketData as Cmd_GuildFertilizer_SC;
         var _loc3_:Dto_ItemInfo = new Dto_ItemInfo();
         _loc3_.id = ItemID.Power;
         _loc3_.num = _loc2_.rewardEnergy;
         var _loc4_:Array = [_loc3_];
         CommonCmd.itemFly(_loc4_);
         CommandDispatcher.send(CommandName.Union_UseMuck_Success);
      }
      
      private function onCmd_GuildFertilizerLog_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_GuildFertilizerLog_SC = param1.socketData as Cmd_GuildFertilizerLog_SC;
         this.model.gardenLogData = _loc2_.fertilizerInfo;
         CommandDispatcher.send(CommandName.Union_GardenLogData_Ready);
      }
      
      private function onCmd_GuildQuit_SC(param1:SocketServiceEvent) : void
      {
         CommandDispatcher.send(CommandName.Union_Quit_Success);
         this.model.playerUnionInfo.clean();
         GameFlowCmd.gotoCity();
      }
      
      private function onCmd_GuildKick_SC(param1:SocketServiceEvent) : void
      {
         CommandDispatcher.send(CommandName.Union_Kick_Success);
      }
      
      private function onCmd_GuildInviteAck_SC(param1:SocketServiceEvent) : void
      {
         CommandDispatcher.send(CommandName.Union_Invite_EnterUnion_Success);
         UnionCmd.enterUnion();
      }
      
      private function onCmd_Temple_ShowDailyReward_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Temple_ShowDailyReward_SC = param1.socketData as Cmd_Temple_ShowDailyReward_SC;
         this.model.unionBonusData.rewardState = _loc2_.rewardStat;
         this.model.unionBonusData.itemRewards = _loc2_.itemRewards;
         this.model.unionBonusData.specialRewards = _loc2_.specialRewards;
         this.model.unionBonusData.captureTempleList = _loc2_.captureTempleList;
         this.model.unionBonusData.takeNum = _loc2_.takeNum;
         this.model.unionBonusData.maxTakeNum = _loc2_.maxTakeNum;
         this.model.unionBonusData.captureRewardCount = _loc2_.captureRewardNum;
         CommandDispatcher.send(CommandName.Union_Temple_ShowDailyReward_Data_Ready);
      }
      
      private function onCmd_Temple_TakeDailyReward_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:Dto_IdNum = null;
         var _loc6_:Dto_ItemInfo = null;
         var _loc2_:Cmd_Temple_TakeDailyReward_SC = param1.socketData as Cmd_Temple_TakeDailyReward_SC;
         if(_loc2_.itemRewards != null)
         {
            _loc3_ = new Array();
            _loc4_ = 0;
            while(_loc4_ < _loc2_.itemRewards.length > 0)
            {
               _loc5_ = _loc2_.itemRewards[_loc4_];
               (_loc6_ = new Dto_ItemInfo()).id = _loc5_.id;
               _loc6_.num = _loc5_.num;
               _loc3_.push(_loc6_);
               _loc4_++;
            }
            if(_loc3_.length > 0)
            {
               CommonCmd.itemFly(_loc3_);
            }
         }
         CommandDispatcher.send(CommandName.Union_Take_Temple_Bonus_Success);
      }
      
      private function onCmd_Guild_Search_SummaryInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Guild_Search_SummaryInfo_SC = param1.socketData as Cmd_Guild_Search_SummaryInfo_SC;
         this.model.searchUnionInfoCache = _loc2_.guildInfo;
         CommandDispatcher.send(CommandName.Union_Seach_Finish);
      }
      
      private function onCmd_Guild_Observe_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:Function = null;
         var _loc2_:Cmd_Guild_Observe_SC = param1.socketData as Cmd_Guild_Observe_SC;
         if(this.callBackCommand != null && this.callBackCommand.length > 0)
         {
            _loc3_ = this.callBackCommand.shift();
            this.callBackCommand.push([_loc2_.baseInfo,_loc2_.occupyCircus,_loc2_.occupyPlay]);
            if(_loc3_ != null)
            {
               _loc3_.apply(this,this.callBackCommand);
            }
            this.callBackCommand = null;
         }
         GameFlowCmd.unlockScreen();
      }
      
      private function onCmd_GuildDelateLeader_SC(param1:SocketServiceEvent) : void
      {
         CommandDispatcher.send(CommandName.Union_StartDelate_Success);
         QAlert.Show(FontNormal.Union_Start_Delate_Success);
      }
      
      private function onCmd_GuildAppoint_SC(param1:SocketServiceEvent) : void
      {
         CommonCmd.txtFly(FontNormal.Union_Appoint_Success);
         UnionServiceCmd.requestUnionUnionMemberList(this.model.playerUnionInfo.id);
         CommandDispatcher.send(CommandName.Change_MyUnionInfo);
      }
      
      private function onCmd_GuildLeaderDeliver_SC(param1:SocketServiceEvent) : void
      {
         QAlert.Show(FontNormal.Union_Start_Deliver_Success);
      }
      
      private function onCmd_GuildCancerLeaderDeliver_SC(param1:SocketServiceEvent) : void
      {
         QAlert.Show(FontNormal.Union_Cancel_Deliver_Success);
      }
      
      private function onCmd_GuildHonorList_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_GuildHonorList_SC = param1.socketData as Cmd_GuildHonorList_SC;
         this.model.honorRankList = _loc2_.guildList;
         CommandDispatcher.send(CommandName.Request_UnionHonorList_Success);
      }
      
      private function onCmd_GuildEventList_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_GuildEventList_SC = param1.socketData as Cmd_GuildEventList_SC;
         this.model.eventList = _loc2_.eventList;
         CommandDispatcher.send(CommandName.Request_UnionEventList_Success);
      }
      
      private function onCmd_Guild_IgnoreApply_SC(param1:SocketServiceEvent) : void
      {
         UnionServiceCmd.requestUnionJoinList();
      }
      
      private function onCmd_Guild_GetQuickJoin_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Guild_GetQuickJoin_SC = param1.socketData as Cmd_Guild_GetQuickJoin_SC;
         this.model.isAllowOneKey = _loc2_.allowQuickJoin;
         this.model.needPower = _loc2_.needPower;
         CommandDispatcher.send(CommandName.REQUEST_ONE_KEY_INFO_SUCCESS);
      }
      
      private function onCmd_Guild_SetQuickJoin_SC(param1:SocketServiceEvent) : void
      {
         UnionServiceCmd.requestOneKeyCondition();
         CommonCmd.txtFly(FontNormal.Union_SET_ONE_KEY_INFO_SUCCESS,NaN,NaN,0,null,true);
      }
      
      private function onCmd_Guild_QuickJoin_SC(param1:SocketServiceEvent) : void
      {
         UnionServiceCmd.getMyUnionInfo();
      }
      
      private function onCmd_GuildSkill_Info_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:Dto_SkillInfo = null;
         var _loc2_:Cmd_GuildSkill_Info_SC = param1.socketData as Cmd_GuildSkill_Info_SC;
         for each(_loc3_ in _loc2_.infos)
         {
            this.model.setSkillLevel(_loc3_.id,_loc3_.level);
         }
         CommandDispatcher.send(CommandName.UNION_QUERY_SKILL);
      }
      
      private function onCmd_GuildSkill_Upgrade_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_GuildSkill_Upgrade_SC = param1.socketData as Cmd_GuildSkill_Upgrade_SC;
         this.model.setSkillLevel(_loc2_.info.id,_loc2_.info.level);
         CommandDispatcher.send(CommandName.UNION_UPGRADE_SKILL,_loc2_.info.id);
      }
   }
}
