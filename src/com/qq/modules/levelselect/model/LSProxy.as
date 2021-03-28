package com.qq.modules.levelselect.model
{
   import PVZ.Cmd.Cmd_TD_ChallengeInheritLastWeekScore_SC;
   import PVZ.Cmd.Cmd_TD_GetChallengeLevelInfo_SC;
   import PVZ.Cmd.Cmd_TD_GetOldPromotionRewardInfo_SC;
   import PVZ.Cmd.Cmd_TD_GetPromotionRewardInfo_SC;
   import PVZ.Cmd.Cmd_TD_GetPromotionReward_SC;
   import PVZ.Cmd.Cmd_TD_GetRankRewardInfo_SC;
   import PVZ.Cmd.Cmd_TD_GetRankReward_SC;
   import PVZ.Cmd.Cmd_TD_GetRank_SC;
   import PVZ.Cmd.Cmd_TD_GetStageInfo_SC;
   import PVZ.Cmd.Cmd_TD_ReportLevelResult_SC;
   import PVZ.Cmd.Cmd_TD_TakeOldPromotionReward_SC;
   import PVZ.Cmd.Cmd_TD_UnlockLevelGate_SC;
   import PVZ.Cmd.Dto_TD_ChallengeLevelInfo;
   import PVZ.Cmd.Dto_TD_PromotionRewardInfo;
   import PVZ.Cmd.Dto_TD_RankRewardInfo;
   import PVZ.Cmd.E_RewardState;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.SceneCenter;
   import com.qq.constant.SceneName;
   import com.qq.constant.ls.LSConstant;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.guide.GuideSceneType;
   import com.qq.modules.guide.command.GuideCmd;
   import com.qq.modules.levelselect.LSGlobals;
   import com.qq.modules.levelselect.command.LSProxyCmd;
   import com.qq.modules.levelselect.command.LSViewCmd;
   import com.qq.modules.levelselect.model.vo.LSGateInfoVO;
   import com.qq.modules.levelselect.model.vo.LSLevelInfoVO;
   import com.qq.modules.main.command.CommonCmd;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class LSProxy extends BasicProxy
   {
       
      
      private var _data:LSData;
      
      private var _rankData:Cmd_TD_GetRank_SC;
      
      public var recordLastStageId:int;
      
      public var rankRewardInfo:Array;
      
      public var promotionRewardInfo:Array;
      
      public var challengeLevelInfo:Array;
      
      private var m_lastReport:Cmd_TD_ReportLevelResult_SC;
      
      public var initData:LSInitData;
      
      public function LSProxy()
      {
         this.initData = new LSInitData();
         super();
      }
      
      public function get data() : LSData
      {
         return this._data;
      }
      
      public function get levels() : Vector.<LSLevelInfoVO>
      {
         return this.data.levels;
      }
      
      public function get gates() : Vector.<LSGateInfoVO>
      {
         return this.data.gates;
      }
      
      public function getLevelInfo(param1:int, param2:int) : LSLevelInfoVO
      {
         var _loc3_:LSLevelInfoVO = null;
         var _loc5_:int = 0;
         var _loc4_:Vector.<LSLevelInfoVO>;
         var _loc6_:int = (_loc4_ = this.levels).length;
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc3_ = _loc4_[_loc5_];
            if(_loc3_.levelId == param1 && _loc3_.subLevelId == param2 && _loc3_.challengeLevelId == 0)
            {
               return _loc3_;
            }
            _loc5_++;
         }
         return null;
      }
      
      public function getChallengeLevelInfo(param1:int, param2:int, param3:int) : LSLevelInfoVO
      {
         var _loc4_:LSLevelInfoVO = null;
         var _loc6_:int = 0;
         var _loc5_:Vector.<LSLevelInfoVO>;
         var _loc7_:int = (_loc5_ = this.levels).length;
         _loc6_ = 0;
         while(_loc6_ < _loc7_)
         {
            if((_loc4_ = _loc5_[_loc6_]).levelId == param1 && _loc4_.subLevelId == param2 && _loc4_.challengeLevelId == param3)
            {
               return _loc4_;
            }
            _loc6_++;
         }
         return null;
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[CommandName.TD_RECORD_STAGE_INFO,this.onRecordStageInfo],[Cmd_TD_GetRank_SC.$MessageID,this.onCmd_TD_GetRank_SC],[Cmd_TD_ReportLevelResult_SC.$MessageID,this.onCmd_TD_PassLevel_SC],[Cmd_TD_GetRankReward_SC.$MessageID,this.onCmd_TD_GetRankReward_SC],[Cmd_TD_GetStageInfo_SC.$MessageID,this.onCmd_TD_RequestStageInfo_SC],[Cmd_TD_UnlockLevelGate_SC.$MessageID,this.onCmd_TD_UnlockLevelGate_SC],[Cmd_TD_GetRankRewardInfo_SC.$MessageID,this.onCmd_TD_GetRankRewardInfo_SC],[Cmd_TD_GetPromotionReward_SC.$MessageID,this.onCmd_TD_GetPromotionReward_SC],[Cmd_TD_GetChallengeLevelInfo_SC.$MessageID,this.onCmd_TD_GetChallengeLevelInfo_SC],[Cmd_TD_GetPromotionRewardInfo_SC.$MessageID,this.onCmd_TD_GetPromotionRewardInfo_SC],[Cmd_TD_TakeOldPromotionReward_SC.$MessageID,this.onCmd_TD_TakeOldPromotionReward_SC],[Cmd_TD_GetOldPromotionRewardInfo_SC.$MessageID,this.onCmd_TD_GetOldPromotionRewardInfo_SC],[Cmd_TD_ChallengeInheritLastWeekScore_SC.$MessageID,this.onCmd_TD_ChallengeInheritLastWeekScore_SC]];
      }
      
      private function onCmd_TD_RequestStageInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:LSLevelInfoVO = null;
         var _loc2_:Cmd_TD_GetStageInfo_SC = param1.socketData as Cmd_TD_GetStageInfo_SC;
         if(SceneCenter.getInstance().currentScene == SceneName.City)
         {
            return;
         }
         if(this.data == null || _loc2_.stageId != this.data.$stageId)
         {
            this._data = new LSData();
            this.data.$stageId = _loc2_.stageId;
         }
         this.data.hasSwapTD = _loc2_.hasSwapTD;
         this.data.loadCmd_TD_GetStageInfo_SC(_loc2_);
         if(LSConstant.LS_Goto_Level_ID == -1 || LSConstant.LS_Goto_Level_ID == -1)
         {
            _loc3_ = this.data.getLastMainLevel();
            LSViewCmd.addInitCmd(LSInitCmdType.CAMERA_TO,[_loc3_.stageId,_loc3_.levelId,_loc3_.subLevelId]);
         }
         else
         {
            LSViewCmd.addInitCmd(LSInitCmdType.CAMERA_TO,[LSConstant.LS_Goto_Chapter_ID,LSConstant.LS_Goto_Level_ID,LSConstant.LS_Goto_Sub_Level_ID]);
            LSConstant.LS_Goto_Chapter_ID = -1;
            LSConstant.LS_Goto_Level_ID = -1;
            LSConstant.LS_Goto_Sub_Level_ID = -1;
         }
         dispatch(new CommonEvent(LSGlobals.LS_LEVEL_INFOS_UPDATED,this));
         dispatch(new CommonEvent(LSGlobals.LS_STAGE_INFO_UPDATED,this));
         GuideCmd.checkProgressGuide(GuideSceneType.TD_SCENE);
      }
      
      private function onCmd_TD_GetChallengeLevelInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TD_GetChallengeLevelInfo_SC = param1.socketData as Cmd_TD_GetChallengeLevelInfo_SC;
         this.challengeLevelInfo = _loc2_.infos;
         dispatch(new CommonEvent(LSGlobals.LS_GET_CHALLENGE_LEVEL_INFO));
      }
      
      private function onCmd_TD_PassLevel_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TD_ReportLevelResult_SC = param1.socketData as Cmd_TD_ReportLevelResult_SC;
         this.m_lastReport = _loc2_;
         if(this.data == null || SceneCenter.getInstance().currentScene != SceneName.LevelSelect)
         {
            return;
         }
         LSProxyCmd.requestStageInfo(this.data.stageId);
         var _loc3_:int = _loc2_.star - this.data.$star;
         if(GameGloble.actorModel.actorLatestTDLevel.stageId == _loc2_.stageId)
         {
            GameGloble.actorModel.actorLatestTDLevel.levelId = Math.max(_loc2_.levelId,GameGloble.actorModel.actorLatestTDLevel.levelId);
         }
         else if(_loc2_.stageId > GameGloble.actorModel.actorLatestTDLevel.stageId)
         {
            GameGloble.actorModel.actorLatestTDLevel.stageId = _loc2_.stageId;
            GameGloble.actorModel.actorLatestTDLevel.levelId = _loc2_.levelId;
         }
         LSViewCmd.addInitCmd(LSInitCmdType.ADD_EXP,[_loc2_.stageId,_loc2_.levelId,_loc2_.subLevelId],_loc2_.expReward);
         LSViewCmd.addInitCmd(LSInitCmdType.ADD_MONEY,[_loc2_.stageId,_loc2_.levelId,_loc2_.subLevelId],_loc2_.firstPassCoinReward);
         LSViewCmd.addInitCmd(LSInitCmdType.NEW_UNLOCK_LEVEL,[_loc2_.stageId,_loc2_.levelId,_loc2_.subLevelId],_loc3_);
         LSViewCmd.addInitCmd(LSInitCmdType.CAMERA_TO,[_loc2_.stageId,_loc2_.levelId,_loc2_.subLevelId]);
         this.data.$star = _loc2_.star;
         dispatch(new CommonEvent(LSGlobals.LS_STAGE_INFO_UPDATED,this));
      }
      
      private function onCmd_TD_UnlockLevelGate_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TD_UnlockLevelGate_SC = null;
         var _loc3_:LSGateInfoVO = null;
         var _loc4_:LSLevelInfoVO = null;
         if(param1.retCode == 0)
         {
            _loc2_ = param1.socketData as Cmd_TD_UnlockLevelGate_SC;
            if(this.data == null)
            {
               return;
            }
            _loc3_ = this.data.getGateById(_loc2_.gateId);
            if(_loc3_)
            {
               _loc3_.unlocked = true;
               if(_loc4_ = this.data.getLevelByLevelId(_loc3_.levelId,_loc3_.subLevelId))
               {
                  _loc4_.unlocked = true;
               }
               this.data.$star = _loc2_.star;
               LSViewCmd.addInitCmd(LSInitCmdType.NEW_UNLOCK_GATE,[_loc3_.stageId,_loc3_.levelId,_loc3_.subLevelId]);
               dispatch(new CommonEvent(LSGlobals.LS_GATE_UNLOCKED,_loc3_));
               dispatch(new CommonEvent(LSGlobals.LS_STAGE_INFO_UPDATED));
            }
         }
      }
      
      private function onCmd_TD_GetRank_SC(param1:SocketServiceEvent) : void
      {
         this._rankData = param1.socketData as Cmd_TD_GetRank_SC;
         dispatch(new CommonEvent(LSGlobals.LS_GET_RANK));
      }
      
      private function onCmd_TD_GetPromotionReward_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TD_GetPromotionReward_SC = param1.socketData as Cmd_TD_GetPromotionReward_SC;
         CommonCmd.itemFly(_loc2_.reward);
         dispatch(new CommonEvent(LSGlobals.LS_GET_PROMOTION_BONUS));
      }
      
      private function onCmd_TD_GetRankReward_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TD_GetRankReward_SC = param1.socketData as Cmd_TD_GetRankReward_SC;
         CommonCmd.itemFly(_loc2_.reward);
         dispatch(new CommonEvent(LSGlobals.LS_GET_RANK_BONUS));
      }
      
      private function onCmd_TD_GetRankRewardInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TD_GetRankRewardInfo_SC = param1.socketData as Cmd_TD_GetRankRewardInfo_SC;
         this.rankRewardInfo = _loc2_.rewardInfo;
         dispatch(new CommonEvent(LSGlobals.LS_GET_RANK_REWARD_INFO));
      }
      
      private function onCmd_TD_GetPromotionRewardInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TD_GetPromotionRewardInfo_SC = param1.socketData as Cmd_TD_GetPromotionRewardInfo_SC;
         this.promotionRewardInfo = _loc2_.rewardInfo;
         this.promotionRewardInfo.sortOn("timestamp",Array.NUMERIC | Array.DESCENDING);
         dispatch(new CommonEvent(LSGlobals.LS_GET_PROMOTION_REWARD_INFO));
      }
      
      private function onCmd_TD_GetOldPromotionRewardInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TD_GetOldPromotionRewardInfo_SC = param1.socketData as Cmd_TD_GetOldPromotionRewardInfo_SC;
         dispatch(new CommonEvent(LSGlobals.LS_GET_OLD_PROMOTION_REWARD_INFO,_loc2_.hasReward));
      }
      
      private function onCmd_TD_TakeOldPromotionReward_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_TD_TakeOldPromotionReward_SC = param1.socketData as Cmd_TD_TakeOldPromotionReward_SC;
         LSProxyCmd.getOldPromotionRewardInfo();
         CommonCmd.itemFly(_loc2_.reward);
      }
      
      private function onRecordStageInfo(param1:CommonEvent) : void
      {
         this.recordLastStageId = param1.param as int;
      }
      
      public function get rankData() : Cmd_TD_GetRank_SC
      {
         return this._rankData;
      }
      
      public function checkChallengeWeeklyBonusTag() : Boolean
      {
         var _loc1_:Dto_TD_RankRewardInfo = null;
         if(this.rankRewardInfo)
         {
            for each(_loc1_ in this.rankRewardInfo)
            {
               if(_loc1_.rewardState == E_RewardState.E_RewardState_CanTake)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function getLastReportOnce() : Cmd_TD_ReportLevelResult_SC
      {
         var _loc1_:Cmd_TD_ReportLevelResult_SC = this.m_lastReport;
         this.m_lastReport = null;
         return _loc1_;
      }
      
      private function onCmd_TD_ChallengeInheritLastWeekScore_SC(param1:SocketServiceEvent) : void
      {
         var _loc4_:Dto_TD_ChallengeLevelInfo = null;
         var _loc2_:Cmd_TD_ChallengeInheritLastWeekScore_SC = param1.socketData as Cmd_TD_ChallengeInheritLastWeekScore_SC;
         var _loc3_:Dto_TD_ChallengeLevelInfo = _loc2_.info;
         var _loc5_:int = 0;
         while(_loc5_ < this.challengeLevelInfo.length)
         {
            if((_loc4_ = this.challengeLevelInfo[_loc5_]).stageId == _loc3_.stageId && _loc4_.levelId == _loc3_.levelId && _loc4_.subLevelId == _loc3_.subLevelId && _loc4_.challengeLevelId == _loc3_.challengeLevelId)
            {
               this.challengeLevelInfo[_loc5_] = _loc3_;
               break;
            }
            _loc5_++;
         }
         dispatch(new CommonEvent(LSGlobals.LS_INHERIT_LAST_WEEK_SCORE));
      }
      
      public function getDto_TD_ChallengeLevelInfo(param1:uint, param2:uint, param3:uint, param4:uint) : Dto_TD_ChallengeLevelInfo
      {
         var _loc5_:Dto_TD_ChallengeLevelInfo = null;
         for each(_loc5_ in this.challengeLevelInfo)
         {
            if(_loc5_.stageId == param1 && _loc5_.levelId == param2 && _loc5_.subLevelId == param3 && _loc5_.challengeLevelId == param4)
            {
               return _loc5_;
            }
         }
         return null;
      }
      
      public function checkChallengePromotionBonusTag() : Boolean
      {
         var _loc1_:Dto_TD_PromotionRewardInfo = null;
         if(this.promotionRewardInfo)
         {
            for each(_loc1_ in this.promotionRewardInfo)
            {
               if(_loc1_.rewardState == E_RewardState.E_RewardState_CanTake)
               {
                  return true;
               }
            }
         }
         return false;
      }
   }
}
