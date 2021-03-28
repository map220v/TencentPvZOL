package com.qq.modules.topKing.model
{
   import PVZ.Cmd.Cmd_TopFight_Bet_SC;
   import PVZ.Cmd.Cmd_TopFight_GetBetInfo_SC;
   import PVZ.Cmd.Cmd_TopFight_HistoryRoleInfo_SC;
   import PVZ.Cmd.Cmd_TopFight_Info_SC;
   import PVZ.Cmd.Cmd_TopFight_PairInfo_SC;
   import PVZ.Cmd.Cmd_TopFight_RecordInfo_SC;
   import PVZ.Cmd.Cmd_TopFight_RoleInfo_SC;
   import PVZ.Cmd.Cmd_TopFight_RoleList_SC;
   import PVZ.Cmd.Cmd_TopFight_StatusChanged_SC;
   import PVZ.Cmd.Cmd_TopFight_TakeBetReward_SC;
   import PVZ.Cmd.Cmd_TopFight_TakeReward_SC;
   import PVZ.Cmd.Cmd_TopFight_TopN_SC;
   import com.qq.GameGloble;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.topKing.TopKingConst;
   import com.qq.modules.topKing.command.TopKingProxyCmd;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.DMath;
   import com.qq.utils.DelayManager;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class TopKingProxy extends BasicProxy
   {
       
      
      public var model:TopKingModel;
      
      public function TopKingProxy()
      {
         super();
         this.model = new TopKingModel();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_TopFight_Info_SC.$MessageID,this.onCmd_TopFight_Info_SC],[Cmd_TopFight_TakeReward_SC.$MessageID,this.onCmd_TopFight_TakeReward_SC],[Cmd_TopFight_PairInfo_SC.$MessageID,this.onCmd_TopFight_PairInfo_SC],[Cmd_TopFight_RoleInfo_SC.$MessageID,this.onCmd_TopFight_RoleInfo_SC],[Cmd_TopFight_RecordInfo_SC.$MessageID,this.onCmd_TopFight_RecordInfo_SC],[Cmd_TopFight_RoleList_SC.$MessageID,this.onCmd_TopFight_RoleList_SC],[Cmd_TopFight_TopN_SC.$MessageID,this.onCmd_TopFight_TopN_SC],[Cmd_TopFight_StatusChanged_SC.$MessageID,this.onCmd_TopFight_StatusChanged_SC],[Cmd_TopFight_HistoryRoleInfo_SC.$MessageID,this.onCmd_TopFight_HistoryRoleInfo_SC],[Cmd_TopFight_Bet_SC.$MessageID,this.onCmd_TopFight_Bet_SC],[Cmd_TopFight_GetBetInfo_SC.$MessageID,this.onCmd_TopFight_GetBetInfo_SC],[Cmd_TopFight_TakeBetReward_SC.$MessageID,this.onCmd_TopFight_TakeBetReward_SC]];
      }
      
      private function onCmd_TopFight_TakeBetReward_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TopFight_TakeBetReward_SC = param1.socketData as Cmd_TopFight_TakeBetReward_SC;
         CommonCmd.itemFly(_loc2_.reward);
         CommandDispatcher.send(TopKingConst.TopKing_Take_Bet_Reward_Success);
      }
      
      private function onCmd_TopFight_GetBetInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TopFight_GetBetInfo_SC = param1.socketData as Cmd_TopFight_GetBetInfo_SC;
         CommandDispatcher.send(TopKingConst.TopKing_MyBetInfo_Ready,_loc2_.betInfo);
      }
      
      private function onCmd_TopFight_Bet_SC(param1:SocketServiceEvent) : void
      {
         CommandDispatcher.send(TopKingConst.TopKing_Bet_Success);
      }
      
      private function onCmd_TopFight_HistoryRoleInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TopFight_HistoryRoleInfo_SC = param1.socketData as Cmd_TopFight_HistoryRoleInfo_SC;
         CommandDispatcher.send(TopKingConst.TopKing_RoleInfo_Ready,_loc2_);
      }
      
      private function onCmd_TopFight_TopN_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TopFight_TopN_SC = param1.socketData as Cmd_TopFight_TopN_SC;
         CommandDispatcher.send(TopKingConst.TopKing_RankInfo_Ready,_loc2_.roleInfo);
      }
      
      private function onCmd_TopFight_RoleList_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TopFight_RoleList_SC = param1.socketData as Cmd_TopFight_RoleList_SC;
         CommandDispatcher.send(TopKingConst.TopKing_CandiatePlayerInfo_Ready,_loc2_);
      }
      
      private function onCmd_TopFight_RecordInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TopFight_RecordInfo_SC = param1.socketData as Cmd_TopFight_RecordInfo_SC;
         CommandDispatcher.send(TopKingConst.TopKing_MyScoreInfo_Ready,_loc2_.recordInfo);
      }
      
      private function onCmd_TopFight_RoleInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TopFight_RoleInfo_SC = param1.socketData as Cmd_TopFight_RoleInfo_SC;
         CommandDispatcher.send(TopKingConst.TopKing_RoleInfo_Ready,_loc2_);
      }
      
      private function onCmd_TopFight_PairInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TopFight_PairInfo_SC = param1.socketData as Cmd_TopFight_PairInfo_SC;
         CommandDispatcher.send(TopKingConst.TopKing_BattleInfo_Ready,_loc2_);
      }
      
      private function onCmd_TopFight_Info_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TopFight_Info_SC = param1.socketData as Cmd_TopFight_Info_SC;
         this.model.reset(_loc2_);
         CommandDispatcher.send(TopKingConst.TopKing_Info_update);
      }
      
      private function onCmd_TopFight_TakeReward_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TopFight_TakeReward_SC = param1.socketData as Cmd_TopFight_TakeReward_SC;
         GameGloble.autoOpenGiftBag(_loc2_.reward,true);
         TopKingProxyCmd.requestTopKingInfo();
      }
      
      private function onCmd_TopFight_StatusChanged_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:int = DMath.randNum(5000,10000);
         DelayManager.getInstance().addDelay(_loc2_,CommandDispatcher.send,false,[TopKingConst.TopKing_Request_Update_Main_Info]);
      }
   }
}
