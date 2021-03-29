package com.qq.modules.levelselect.view.components
{
   import PVZ.Cmd.Dto_TD_RankRewardInfo;
   import PVZ.Cmd.E_RewardState;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.levelselect.LSGlobals;
   import com.qq.modules.levelselect.command.LSProxyCmd;
   import com.qq.modules.levelselect.model.LSProxy;
   import com.qq.modules.levelselect.model.vo.LSChallengeWeeklyBonusVO;
   
   public class LSChallengeWeeklyBonusWindowMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:LSChallengeWeeklyBonusWindow;
      
      [Inject]
      public var lsProxy:LSProxy;
      
      public var vec:Vector.<LSChallengeWeeklyBonusVO>;
      
      public function LSChallengeWeeklyBonusWindowMediator()
      {
         this.vec = new Vector.<LSChallengeWeeklyBonusVO>();
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this.view.list_cell.rowHeight = 66;
         this.view.list_cell.itemRendererClass = LSChallengeWeeklyBonusCell;
         this.view.list_cell.dataProvider = this.vec;
         LSProxyCmd.getRankRewardInfo();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(LSGlobals.LS_GET_RANK_REWARD_INFO,this.onGetInfo,CommonEvent);
         addContextListener(LSGlobals.LS_GET_RANK_BONUS,this.onGetBonus,CommonEvent);
      }
      
      private function onGetInfo(param1:CommonEvent) : void
      {
         var _loc3_:Dto_TD_RankRewardInfo = null;
         var _loc4_:LSChallengeWeeklyBonusVO = null;
         var _loc2_:Array = this.lsProxy.rankRewardInfo;
         this.vec = new Vector.<LSChallengeWeeklyBonusVO>();
         for each(_loc3_ in _loc2_)
         {
            (_loc4_ = new LSChallengeWeeklyBonusVO()).stageId = _loc3_.stageId;
            _loc4_.levelId = _loc3_.levelId;
            _loc4_.subLevelId = _loc3_.subLevelId;
            _loc4_.challengeId = _loc3_.challengeLevelId;
            _loc4_.rank = _loc3_.rank;
            _loc4_.rewardStatus = _loc3_.rewardState;
            this.vec.push(_loc4_);
         }
         this.vec = this.vec.sort(this.sortFun);
         this.view.list_cell.dataProvider = this.vec;
      }
      
      private function onGetBonus(param1:CommonEvent) : void
      {
         LSProxyCmd.getRankRewardInfo();
      }
      
      private function sortFun(param1:LSChallengeWeeklyBonusVO, param2:LSChallengeWeeklyBonusVO) : int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         switch(param1.rewardStatus)
         {
            case E_RewardState.E_RewardState_CanTake:
               _loc3_ = 1;
               break;
            case E_RewardState.E_RewardState_NotReached:
               _loc3_ = 3;
               break;
            case E_RewardState.E_RewardState_NoTimes:
               _loc3_ = 4;
               break;
            case E_RewardState.E_RewardState_AlreadyTaken:
               _loc3_ = 2;
               break;
            case E_RewardState.E_RewardState_NoReward:
               _loc3_ = 5;
         }
         switch(param2.rewardStatus)
         {
            case E_RewardState.E_RewardState_CanTake:
               _loc4_ = 1;
               break;
            case E_RewardState.E_RewardState_NotReached:
               _loc4_ = 3;
               break;
            case E_RewardState.E_RewardState_NoTimes:
               _loc4_ = 4;
               break;
            case E_RewardState.E_RewardState_AlreadyTaken:
               _loc4_ = 2;
               break;
            case E_RewardState.E_RewardState_NoReward:
               _loc4_ = 5;
         }
         if(_loc3_ == _loc4_)
         {
            return param1.stageId * 100 + param1.levelId * 10 + param1.subLevelId - (param2.stageId * 100 + param2.levelId * 10 + param2.subLevelId);
         }
         return _loc3_ - _loc4_;
      }
      
      override public function reset(param1:Object = null) : void
      {
         super.reset(param1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
