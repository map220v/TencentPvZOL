package com.qq.modules.union.command
{
   import PVZ.Cmd.Cmd_GuildAckJoin_CS;
   import PVZ.Cmd.Cmd_GuildAppoint_CS;
   import PVZ.Cmd.Cmd_GuildBid_CS;
   import PVZ.Cmd.Cmd_GuildCancerLeaderDeliver_CS;
   import PVZ.Cmd.Cmd_GuildChangeFlag_CS;
   import PVZ.Cmd.Cmd_GuildChangeNotice_CS;
   import PVZ.Cmd.Cmd_GuildChangeQQ_CS;
   import PVZ.Cmd.Cmd_GuildCreate_CS;
   import PVZ.Cmd.Cmd_GuildDelateLeader_CS;
   import PVZ.Cmd.Cmd_GuildDonate_CS;
   import PVZ.Cmd.Cmd_GuildEventList_CS;
   import PVZ.Cmd.Cmd_GuildFertilizerLog_CS;
   import PVZ.Cmd.Cmd_GuildFertilizer_CS;
   import PVZ.Cmd.Cmd_GuildHonorList_CS;
   import PVZ.Cmd.Cmd_GuildInfo_CS;
   import PVZ.Cmd.Cmd_GuildInviteAck_CS;
   import PVZ.Cmd.Cmd_GuildInviteList_CS;
   import PVZ.Cmd.Cmd_GuildInviteReq_CS;
   import PVZ.Cmd.Cmd_GuildJoinList_CS;
   import PVZ.Cmd.Cmd_GuildJoinReq_CS;
   import PVZ.Cmd.Cmd_GuildKick_CS;
   import PVZ.Cmd.Cmd_GuildLeaderDeliver_CS;
   import PVZ.Cmd.Cmd_GuildLevelUp_CS;
   import PVZ.Cmd.Cmd_GuildList_CS;
   import PVZ.Cmd.Cmd_GuildMember_CS;
   import PVZ.Cmd.Cmd_GuildQuit_CS;
   import PVZ.Cmd.Cmd_GuildSkill_Info_CS;
   import PVZ.Cmd.Cmd_GuildSkill_Upgrade_CS;
   import PVZ.Cmd.Cmd_Guild_GetQuickJoin_CS;
   import PVZ.Cmd.Cmd_Guild_IgnoreApply_CS;
   import PVZ.Cmd.Cmd_Guild_Observe_CS;
   import PVZ.Cmd.Cmd_Guild_QuickJoin_CS;
   import PVZ.Cmd.Cmd_Guild_Search_SummaryInfo_CS;
   import PVZ.Cmd.Cmd_Guild_SetQuickJoin_CS;
   import PVZ.Cmd.Cmd_RoleGuildInfo_CS;
   import PVZ.Cmd.Cmd_Temple_ShowDailyReward_CS;
   import PVZ.Cmd.Cmd_Temple_TakeDailyReward_CS;
   import PVZ.Cmd.Dto_Guild_FlagInfo;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.union.model.UnionModel;
   import com.qq.modules.union.model.UnionService;
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class UnionServiceCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var pvzServer:PvzSocketService;
      
      [Inject]
      public var unionService:UnionService;
      
      [Inject]
      public var unionModel:UnionModel;
      
      public function UnionServiceCommand()
      {
         super();
      }
      
      public function getMyUnionInfo() : void
      {
         var _loc1_:Cmd_RoleGuildInfo_CS = new Cmd_RoleGuildInfo_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function requestUnionListInfo(param1:int, param2:int) : void
      {
         var _loc3_:Cmd_GuildList_CS = new Cmd_GuildList_CS();
         _loc3_.begIndex = param1 * param2;
         _loc3_.endIndex = _loc3_.begIndex + param2 - 1;
         this.pvzServer.sendMessage(_loc3_);
      }
      
      public function applyUnion(param1:Int64) : void
      {
         var _loc2_:Cmd_GuildJoinReq_CS = new Cmd_GuildJoinReq_CS();
         _loc2_.guildId = param1;
         this.pvzServer.sendMessage(_loc2_);
         GameFlowCmd.lockScreen();
      }
      
      public function agreeToJoinUnion(param1:Int64) : void
      {
         var _loc2_:Cmd_GuildInviteAck_CS = new Cmd_GuildInviteAck_CS();
         _loc2_.guildId = param1;
         _loc2_.agree = true;
         this.pvzServer.sendMessage(_loc2_);
         GameFlowCmd.lockScreen();
      }
      
      public function applyCreateUnion(param1:String, param2:Object) : void
      {
         var _loc3_:Cmd_GuildCreate_CS = new Cmd_GuildCreate_CS();
         _loc3_.flagInfo = param2 as Dto_Guild_FlagInfo;
         _loc3_.name = param1;
         this.pvzServer.sendMessage(_loc3_);
         GameFlowCmd.lockScreen();
      }
      
      public function requestUnionInfo(param1:Int64, param2:Array) : void
      {
         var _loc3_:Cmd_GuildInfo_CS = new Cmd_GuildInfo_CS();
         _loc3_.guildId = param1;
         this.pvzServer.sendMessage(_loc3_);
         this.unionService.callBackCommand = param2;
         GameFlowCmd.lockScreen();
      }
      
      public function requestMyUnionInfo() : void
      {
         this.requestUnionInfo(this.unionModel.playerUnionInfo.id,null);
      }
      
      public function requestOtherUnionInfo(param1:Int64, param2:Array) : void
      {
         var _loc3_:Cmd_Guild_Observe_CS = new Cmd_Guild_Observe_CS();
         _loc3_.guildId = param1;
         this.pvzServer.sendMessage(_loc3_);
         this.unionService.callBackCommand = param2;
         GameFlowCmd.lockScreen();
      }
      
      public function requestUnionUnionMemberList(param1:Int64) : void
      {
         var _loc2_:Cmd_GuildMember_CS = new Cmd_GuildMember_CS();
         _loc2_.guildId = param1;
         this.pvzServer.sendMessage(_loc2_);
      }
      
      public function levelUp() : void
      {
         var _loc1_:Cmd_GuildLevelUp_CS = new Cmd_GuildLevelUp_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function quit() : void
      {
         var _loc1_:Cmd_GuildQuit_CS = new Cmd_GuildQuit_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function fire(param1:Int64) : void
      {
         var _loc2_:Cmd_GuildKick_CS = new Cmd_GuildKick_CS();
         _loc2_.roleId = param1;
         this.pvzServer.sendMessage(_loc2_);
      }
      
      public function changeQQGroup(param1:String) : void
      {
         var _loc2_:Cmd_GuildChangeQQ_CS = new Cmd_GuildChangeQQ_CS();
         _loc2_.qqGroup = param1;
         this.pvzServer.sendMessage(_loc2_);
      }
      
      public function requestUnionJoinList() : void
      {
         var _loc1_:Cmd_GuildJoinList_CS = new Cmd_GuildJoinList_CS();
         this.pvzServer.sendMessage(_loc1_);
         GameFlowCmd.lockScreen();
      }
      
      public function processUnionJoin(param1:Int64, param2:Boolean) : void
      {
         var _loc3_:Cmd_GuildAckJoin_CS = new Cmd_GuildAckJoin_CS();
         _loc3_.roleId = param1;
         _loc3_.agree = param2;
         this.pvzServer.sendMessage(_loc3_);
         GameFlowCmd.lockScreen();
      }
      
      public function unionBidding(param1:String, param2:int) : void
      {
         var _loc3_:Cmd_GuildBid_CS = new Cmd_GuildBid_CS();
         _loc3_.manifesto = param1;
         _loc3_.guildExp = param2;
         this.pvzServer.sendMessage(_loc3_);
         GameFlowCmd.lockScreen();
      }
      
      public function donate(param1:int) : void
      {
         var _loc2_:Cmd_GuildDonate_CS = new Cmd_GuildDonate_CS();
         _loc2_.coin = param1;
         this.pvzServer.sendMessage(_loc2_);
      }
      
      public function editAnnouncement(param1:String) : void
      {
         var _loc2_:Cmd_GuildChangeNotice_CS = new Cmd_GuildChangeNotice_CS();
         _loc2_.notice = param1;
         this.pvzServer.sendMessage(_loc2_);
      }
      
      public function changeUnionFlag(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:Cmd_GuildChangeFlag_CS;
         (_loc5_ = new Cmd_GuildChangeFlag_CS()).flagInfo = new Dto_Guild_FlagInfo();
         _loc5_.flagInfo.color2Id = param2;
         _loc5_.flagInfo.colorId = param4;
         _loc5_.flagInfo.surfaceId = param3;
         _loc5_.flagInfo.signId = param1;
         this.pvzServer.sendMessage(_loc5_);
      }
      
      public function requestInviteListData() : void
      {
         var _loc1_:Cmd_GuildInviteList_CS = new Cmd_GuildInviteList_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function invitePlayer(param1:Int64) : void
      {
         var _loc2_:Cmd_GuildInviteReq_CS = new Cmd_GuildInviteReq_CS();
         _loc2_.roleId = param1;
         this.pvzServer.sendMessage(_loc2_);
      }
      
      public function useMuck(param1:int) : void
      {
         this.unionModel.useMuckID = param1;
         var _loc2_:Cmd_GuildFertilizer_CS = new Cmd_GuildFertilizer_CS();
         _loc2_.fertilizerId = param1;
         this.pvzServer.sendMessage(_loc2_);
      }
      
      public function requestGardenLog() : void
      {
         var _loc1_:Cmd_GuildFertilizerLog_CS = new Cmd_GuildFertilizerLog_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function requestTempleBonus() : void
      {
         var _loc1_:Cmd_Temple_ShowDailyReward_CS = new Cmd_Temple_ShowDailyReward_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function takeUnionBonus() : void
      {
         var _loc1_:Cmd_Temple_TakeDailyReward_CS = new Cmd_Temple_TakeDailyReward_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function searchUnionByID(param1:int) : void
      {
         var _loc2_:Cmd_Guild_Search_SummaryInfo_CS = new Cmd_Guild_Search_SummaryInfo_CS();
         _loc2_.guildId = new Int64(param1);
         this.pvzServer.sendMessage(_loc2_);
      }
      
      public function delate() : void
      {
         var _loc1_:Cmd_GuildDelateLeader_CS = new Cmd_GuildDelateLeader_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function appoint(param1:Int64, param2:int) : void
      {
         var _loc3_:Cmd_GuildAppoint_CS = new Cmd_GuildAppoint_CS();
         _loc3_.roleId = param1;
         _loc3_.position = param2;
         this.pvzServer.sendMessage(_loc3_);
      }
      
      public function deliver(param1:Int64) : void
      {
         var _loc2_:Cmd_GuildLeaderDeliver_CS = new Cmd_GuildLeaderDeliver_CS();
         _loc2_.roleId = param1;
         this.pvzServer.sendMessage(_loc2_);
      }
      
      public function cancelDeliver() : void
      {
         var _loc1_:Cmd_GuildCancerLeaderDeliver_CS = new Cmd_GuildCancerLeaderDeliver_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function requestUnionHonorRank() : void
      {
         var _loc1_:Cmd_GuildHonorList_CS = new Cmd_GuildHonorList_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function requestUnionEventList() : void
      {
         var _loc1_:Cmd_GuildEventList_CS = new Cmd_GuildEventList_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function requestIgnoreApply() : void
      {
         var _loc1_:Cmd_Guild_IgnoreApply_CS = null;
         if(this.unionModel.playerUnionInfo.isVaild())
         {
            _loc1_ = new Cmd_Guild_IgnoreApply_CS();
            _loc1_.guildId = this.unionModel.playerUnionInfo.id;
            this.pvzServer.sendMessage(_loc1_);
         }
      }
      
      public function setOneKeyCondition(param1:Boolean, param2:int) : void
      {
         var _loc3_:Cmd_Guild_SetQuickJoin_CS = null;
         if(this.unionModel.playerUnionInfo.isVaild())
         {
            _loc3_ = new Cmd_Guild_SetQuickJoin_CS();
            _loc3_.allowQuickJoin = param1;
            _loc3_.needPower = param2;
            this.pvzServer.sendMessage(_loc3_);
         }
      }
      
      public function requestOneKeyCondition() : void
      {
         var _loc1_:Cmd_Guild_GetQuickJoin_CS = null;
         if(this.unionModel.playerUnionInfo.isVaild())
         {
            _loc1_ = new Cmd_Guild_GetQuickJoin_CS();
            this.pvzServer.sendMessage(_loc1_);
         }
      }
      
      public function requestOneKeyJoin() : void
      {
         var _loc1_:Cmd_Guild_QuickJoin_CS = new Cmd_Guild_QuickJoin_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function querySkill() : void
      {
         var _loc1_:Cmd_GuildSkill_Info_CS = new Cmd_GuildSkill_Info_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function upgradeSkill(param1:int) : void
      {
         var _loc2_:Cmd_GuildSkill_Upgrade_CS = new Cmd_GuildSkill_Upgrade_CS();
         _loc2_.skillId = param1;
         this.pvzServer.sendMessage(_loc2_);
      }
   }
}
