package com.qq.modules.topKing.command
{
   import PVZ.Cmd.Cmd_TopFight_Bet_CS;
   import PVZ.Cmd.Cmd_TopFight_GetBetInfo_CS;
   import PVZ.Cmd.Cmd_TopFight_HistoryRoleInfo_CS;
   import PVZ.Cmd.Cmd_TopFight_Info_CS;
   import PVZ.Cmd.Cmd_TopFight_PairInfo_CS;
   import PVZ.Cmd.Cmd_TopFight_RecordInfo_CS;
   import PVZ.Cmd.Cmd_TopFight_RoleInfo_CS;
   import PVZ.Cmd.Cmd_TopFight_RoleList_CS;
   import PVZ.Cmd.Cmd_TopFight_SaveFormation_CS;
   import PVZ.Cmd.Cmd_TopFight_TakeBetReward_CS;
   import PVZ.Cmd.Cmd_TopFight_TakeReward_CS;
   import PVZ.Cmd.Cmd_TopFight_TopN_CS;
   import com.qq.GameGloble;
   import com.qq.modules.embattle.constant.EmbattleConst;
   import com.qq.modules.main.model.vo.BattleCardFormationVO;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.topKing.TopKingConst;
   import com.qq.modules.topKing.model.TopKingDataFactory;
   import com.qq.modules.topKing.model.TopKingStageInfo;
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TopKingProxyCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var pvzService:PvzSocketService;
      
      public function TopKingProxyCommand()
      {
         super();
      }
      
      public function requestTopKingInfo() : void
      {
         var _loc1_:Cmd_TopFight_Info_CS = new Cmd_TopFight_Info_CS();
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function requestBattleInfo(param1:int) : void
      {
         var _loc2_:int = TopKingConst.getStageIndexByBattleID(param1);
         var _loc3_:TopKingStageInfo = TopKingDataFactory.getInstance().getStageInfoByIndex(_loc2_);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:int = _loc3_.id;
         var _loc5_:int = TopKingConst.getBattleIndexByBattleID(param1);
         var _loc6_:Cmd_TopFight_PairInfo_CS;
         (_loc6_ = new Cmd_TopFight_PairInfo_CS()).stageId = _loc4_;
         _loc6_.pairIndex = _loc5_;
         this.pvzService.sendMessage(_loc6_);
      }
      
      public function takeReward() : void
      {
         var _loc1_:Cmd_TopFight_TakeReward_CS = new Cmd_TopFight_TakeReward_CS();
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function requestRoleInfo(param1:Int64) : void
      {
         var _loc2_:Cmd_TopFight_RoleInfo_CS = new Cmd_TopFight_RoleInfo_CS();
         _loc2_.roleId = param1;
         this.pvzService.sendMessage(_loc2_);
      }
      
      public function requestMyScore() : void
      {
         var _loc1_:Cmd_TopFight_RecordInfo_CS = new Cmd_TopFight_RecordInfo_CS();
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function requestCandiatePlayerInfo(param1:int, param2:int) : void
      {
         var _loc3_:Cmd_TopFight_RoleList_CS = new Cmd_TopFight_RoleList_CS();
         _loc3_.page = param1;
         _loc3_.pageSize = param2;
         this.pvzService.sendMessage(_loc3_);
      }
      
      public function requestRankInfo() : void
      {
         var _loc1_:Cmd_TopFight_TopN_CS = new Cmd_TopFight_TopN_CS();
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function saveLineup() : void
      {
         var _loc1_:Cmd_TopFight_SaveFormation_CS = new Cmd_TopFight_SaveFormation_CS();
         var _loc2_:BattleCardFormationVO = GameGloble.actorModel.battleCardModel.getFormationInfo(EmbattleConst.MODE_TOP_KING);
         _loc1_.formation = _loc2_.dto;
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function requestHistroyRoleInfo(param1:int) : void
      {
         var _loc2_:Cmd_TopFight_HistoryRoleInfo_CS = new Cmd_TopFight_HistoryRoleInfo_CS();
         _loc2_.roleIndex = param1;
         this.pvzService.sendMessage(_loc2_);
      }
      
      public function betBattle(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
         var _loc5_:int = TopKingConst.getStageIndexByBattleID(param1);
         var _loc6_:TopKingStageInfo;
         if((_loc6_ = TopKingDataFactory.getInstance().getStageInfoByIndex(_loc5_)) == null)
         {
            return;
         }
         var _loc7_:int = _loc6_.id;
         var _loc8_:int = TopKingConst.getBattleIndexByBattleID(param1);
         var _loc9_:Cmd_TopFight_Bet_CS;
         (_loc9_ = new Cmd_TopFight_Bet_CS()).stageId = _loc6_.id;
         _loc9_.pairIndex = _loc8_;
         _loc9_.betType = param2;
         _loc9_.betValue = param3;
         _loc9_.betFightResult = param4;
         this.pvzService.sendMessage(_loc9_);
      }
      
      public function requestMyBetInfo() : void
      {
         var _loc1_:Cmd_TopFight_GetBetInfo_CS = new Cmd_TopFight_GetBetInfo_CS();
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function takeMyBetReward(param1:int, param2:int) : void
      {
         var _loc3_:Cmd_TopFight_TakeBetReward_CS = new Cmd_TopFight_TakeBetReward_CS();
         _loc3_.stageId = param1;
         _loc3_.pairIndex = param2;
         this.pvzService.sendMessage(_loc3_);
      }
   }
}
