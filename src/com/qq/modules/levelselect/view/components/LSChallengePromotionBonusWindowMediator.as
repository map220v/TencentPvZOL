package com.qq.modules.levelselect.view.components
{
   import PVZ.Cmd.Dto_TD_PromotionRewardInfo;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.levelselect.LSGlobals;
   import com.qq.modules.levelselect.command.LSProxyCmd;
   import com.qq.modules.levelselect.model.LSProxy;
   import com.qq.modules.levelselect.model.vo.LSChallengePromotionBonusVO;
   
   public class LSChallengePromotionBonusWindowMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:LSChallengePromotionBonusWindow;
      
      [Inject]
      public var lsProxy:LSProxy;
      
      public var vec:Vector.<LSChallengePromotionBonusVO>;
      
      public function LSChallengePromotionBonusWindowMediator()
      {
         this.vec = new Vector.<LSChallengePromotionBonusVO>();
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this.view.list_cell.rowHeight = 66;
         this.view.list_cell.itemRendererClass = LSChallengePromotionBonusCell;
         this.view.list_cell.dataProvider = this.vec;
         LSProxyCmd.getPromotionRewardInfo();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(LSGlobals.LS_GET_PROMOTION_REWARD_INFO,this.onGetInfo,CommonEvent);
         addContextListener(LSGlobals.LS_GET_PROMOTION_BONUS,this.onGetBonus,CommonEvent);
      }
      
      private function onGetInfo(param1:CommonEvent) : void
      {
         var _loc3_:Dto_TD_PromotionRewardInfo = null;
         var _loc4_:LSChallengePromotionBonusVO = null;
         var _loc2_:Array = this.lsProxy.promotionRewardInfo;
         this.vec = new Vector.<LSChallengePromotionBonusVO>();
         for each(_loc3_ in _loc2_)
         {
            (_loc4_ = new LSChallengePromotionBonusVO()).index = _loc2_.indexOf(_loc3_);
            _loc4_.stageId = _loc3_.stageId;
            _loc4_.levelId = _loc3_.levelId;
            _loc4_.subLevelId = _loc3_.subLevelId;
            _loc4_.challengeId = _loc3_.challengeLevelId;
            _loc4_.rankBefore = _loc3_.fromRank;
            _loc4_.rankAfter = _loc3_.toRank;
            _loc4_.time = _loc3_.timestamp;
            _loc4_.rewardStatus = _loc3_.rewardState;
            this.vec.push(_loc4_);
         }
         this.view.list_cell.dataProvider = this.vec;
      }
      
      private function onGetBonus(param1:CommonEvent) : void
      {
         LSProxyCmd.getPromotionRewardInfo();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
