package com.qq.modules.td.model
{
   import PVZ.Cmd.Cmd_DailyTD_BuyCart_SC;
   import PVZ.Cmd.Cmd_DailyTD_BuyEnergyBean_SC;
   import PVZ.Cmd.Cmd_DailyTD_BuySun_SC;
   import PVZ.Cmd.Cmd_DailyTD_UseSkill_SC;
   import PVZ.Cmd.Cmd_Friend_GetList_SC;
   import PVZ.Cmd.Cmd_Friend_SyncFriendTalent_SC;
   import PVZ.Cmd.Cmd_NoEndTD_BuyCart_SC;
   import PVZ.Cmd.Cmd_NoEndTD_BuyEnergyBean_SC;
   import PVZ.Cmd.Cmd_NoEndTD_BuySun_SC;
   import PVZ.Cmd.Cmd_TD_BuyCart_SC;
   import PVZ.Cmd.Cmd_TD_BuyEnergyBean_SC;
   import PVZ.Cmd.Cmd_TD_BuySun_SC;
   import PVZ.Cmd.Cmd_TD_ReportLevelResult_SC;
   import PVZ.Cmd.Cmd_TD_StartTDGame_SC;
   import PVZ.Cmd.Cmd_TD_UnlockPrivilegePlant_SC;
   import PVZ.Cmd.Cmd_TD_UseSkill_SC;
   import PVZ.Cmd.Dto_FriendInfo;
   import PVZ.Cmd.Dto_FriendTalent;
   import PVZ.Cmd.FriendModuleType;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.login.command.LoginServerCmd;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.td.command.game.TDGameFlowCmd;
   import com.qq.modules.td.logic.TDDebugManager;
   import com.qq.modules.td.model.vo.TDDataVO;
   import com.qq.utils.CommandDispatcher;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class TDProxy extends BasicProxy
   {
       
      
      [Inject]
      public var data:TDDataVO;
      
      public function TDProxy()
      {
         super();
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_TD_ReportLevelResult_SC.$MessageID,this.onCmd_TD_ReportLevelResult_SC],[Cmd_Friend_GetList_SC.$MessageID,this.onCmd_TD_RequestFriendCard_SC],[Cmd_Friend_SyncFriendTalent_SC.$MessageID,this.onCmd_TD_RequestFriendTalent_SC],[Cmd_TD_StartTDGame_SC.$MessageID,this.onCmd_TD_StartTDGame_CS],[Cmd_TD_UnlockPrivilegePlant_SC.$MessageID,this.onCmd_TD_UnlockPrivilegePlant_SC],[Cmd_TD_BuyEnergyBean_SC.$MessageID,this.onCmd_TD_BuyEnergyBean_SC],[Cmd_NoEndTD_BuyEnergyBean_SC.$MessageID,this.onCmd_NoEndTD_BuyEnergyBean_SC],[Cmd_DailyTD_BuyEnergyBean_SC.$MessageID,this.onCmd_DailyTD_BuyEnergyBean_SC],[Cmd_TD_BuyCart_SC.$MessageID,this.onCmd_TD_BuyCart_SC],[Cmd_NoEndTD_BuyCart_SC.$MessageID,this.onCmd_NoEndTD_BuyCart_SC],[Cmd_DailyTD_BuyCart_SC.$MessageID,this.onCmd_DailyTD_BuyCart_SC],[Cmd_TD_UseSkill_SC.$MessageID,this.onCmd_TD_UseSkill_SC],[Cmd_DailyTD_UseSkill_SC.$MessageID,this.onCmd_DailyTD_UseSkill_SC],[Cmd_TD_BuySun_SC.$MessageID,this.onCmd_TD_BuySun_SC],[Cmd_NoEndTD_BuySun_SC.$MessageID,this.onCmd_NoEndTD_BuySun_SC],[Cmd_DailyTD_BuySun_SC.$MessageID,this.onCmd_DailyTD_BuySun_SC]];
      }
      
      private function onCmd_TD_StartTDGame_CS(param1:SocketServiceEvent) : void
      {
         TDGameFlowCmd.finishLoadAllTDData();
      }
      
      private function onCmd_TD_UnlockPrivilegePlant_SC(param1:SocketServiceEvent) : void
      {
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Normal)
         {
            LoginServerCmd.requestPrivilegeAndUnlockPlantInfo(TDStageInfo.getInstance().stageID,TDStageInfo.getInstance().levelID,TDStageInfo.getInstance().subLevelID,TDStageInfo.getInstance().challengeLevelID);
         }
         else
         {
            CommandDispatcher.send(CommandName.TD_GET_UNLOCK_PLANT_INFO);
         }
      }
      
      private function onCmd_TD_BuyEnergyBean_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TD_BuyEnergyBean_SC = param1.socketData as Cmd_TD_BuyEnergyBean_SC;
         CommandDispatcher.send(CommandName.TD_BuyEnergyBean,_loc2_.remainTimes);
      }
      
      private function onCmd_NoEndTD_BuyEnergyBean_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_NoEndTD_BuyEnergyBean_SC = param1.socketData as Cmd_NoEndTD_BuyEnergyBean_SC;
         CommandDispatcher.send(CommandName.TD_BuyEnergyBean,_loc2_.remainTimes);
      }
      
      private function onCmd_DailyTD_BuyEnergyBean_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_DailyTD_BuyEnergyBean_SC = param1.socketData as Cmd_DailyTD_BuyEnergyBean_SC;
         CommandDispatcher.send(CommandName.TD_BuyEnergyBean,_loc2_.remainTimes);
      }
      
      private function onCmd_DailyTD_BuyCart_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_DailyTD_BuyCart_SC = param1.socketData as Cmd_DailyTD_BuyCart_SC;
         CommandDispatcher.send(CommandName.TD_Buy_Mower,_loc2_.cartId);
      }
      
      private function onCmd_NoEndTD_BuyCart_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_NoEndTD_BuyCart_SC = param1.socketData as Cmd_NoEndTD_BuyCart_SC;
         CommandDispatcher.send(CommandName.TD_Buy_Mower,_loc2_.cartId);
      }
      
      private function onCmd_TD_BuyCart_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TD_BuyCart_SC = param1.socketData as Cmd_TD_BuyCart_SC;
         CommandDispatcher.send(CommandName.TD_Buy_Mower,_loc2_.cartId);
      }
      
      private function onCmd_TD_UseSkill_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TD_UseSkill_SC = param1.socketData as Cmd_TD_UseSkill_SC;
         CommandDispatcher.send(CommandName.TD_UseSkillPlant,_loc2_.remainTimes);
      }
      
      private function onCmd_DailyTD_UseSkill_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_DailyTD_UseSkill_SC = param1.socketData as Cmd_DailyTD_UseSkill_SC;
         CommandDispatcher.send(CommandName.TD_UseSkillPlant,_loc2_.remainTimes);
      }
      
      private function onCmd_TD_BuySun_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TD_BuySun_SC = param1.socketData as Cmd_TD_BuySun_SC;
         CommandDispatcher.send(CommandName.TD_Buy_Sun,_loc2_.buyTimes);
      }
      
      private function onCmd_NoEndTD_BuySun_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_NoEndTD_BuySun_SC = param1.socketData as Cmd_NoEndTD_BuySun_SC;
         CommandDispatcher.send(CommandName.TD_Buy_Sun,_loc2_.buyTimes);
      }
      
      private function onCmd_DailyTD_BuySun_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_DailyTD_BuySun_SC = param1.socketData as Cmd_DailyTD_BuySun_SC;
         CommandDispatcher.send(CommandName.TD_Buy_Sun,_loc2_.buyTimes);
      }
      
      private function onCmd_TD_RequestFriendTalent_SC(param1:SocketServiceEvent) : void
      {
         var _loc4_:Dto_FriendTalent = null;
         var _loc2_:Cmd_Friend_SyncFriendTalent_SC = param1.socketData as Cmd_Friend_SyncFriendTalent_SC;
         var _loc3_:Array = _loc2_.talents;
         for each(_loc4_ in _loc3_)
         {
         }
      }
      
      public function onCmd_TD_RequestFriendCard_SC(param1:SocketServiceEvent) : void
      {
         var _loc6_:Dto_FriendInfo = null;
         var _loc2_:Cmd_Friend_GetList_SC = param1.socketData as Cmd_Friend_GetList_SC;
         if(_loc2_.moduleType != FriendModuleType.FRIEND_MODULE_TYPE_TD_PLANT)
         {
            return;
         }
         var _loc3_:Array = _loc2_.friends;
         var _loc4_:int = _loc3_.length;
         this.data.clean();
         this.data.curPage = _loc2_.page + 1;
         this.data.totalPage = Math.ceil(_loc2_.totalCount / _loc2_.pageSize);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _loc2_.friends[_loc5_];
            this.data.addCard(_loc6_);
            _loc5_++;
         }
         TDGameFlowCmd.enterChooseFriendCardScreen();
         GameFlowCmd.unlockScreen();
      }
      
      private function onCmd_TD_ReportLevelResult_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TD_ReportLevelResult_SC = param1.socketData as Cmd_TD_ReportLevelResult_SC;
         TDGameInfo.getInstance().lastPassStageMsgSC = _loc2_;
         if(GameGloble.actorModel.actorLatestTDLevel.stageId == _loc2_.stageId)
         {
            if(_loc2_.firstPassCoinReward != 0)
            {
               GameGloble.actorModel.actorLatestTDLevel.levelId = Math.max(_loc2_.levelId,GameGloble.actorModel.actorLatestTDLevel.levelId);
            }
         }
         else if(_loc2_.stageId > GameGloble.actorModel.actorLatestTDLevel.stageId)
         {
            GameGloble.actorModel.actorLatestTDLevel.stageId = _loc2_.stageId;
            GameGloble.actorModel.actorLatestTDLevel.levelId = _loc2_.levelId;
         }
         CommonCmd.itemFly(_loc2_.itemReward);
         GameFlowCmd.unlockScreen();
         TDDebugManager.getInstance().uncheckTDSeverMsg();
      }
   }
}
