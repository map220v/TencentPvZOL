package com.qq.modules.levelselect.view.components
{
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.rank.RankGlobal;
   import com.qq.modules.rank.model.RankProxy;
   
   public class LSChallengeRankScoreWdMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:LSChallengeRankScoreWd;
      
      [Inject]
      public var rankProxy:RankProxy;
      
      public function LSChallengeRankScoreWdMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function initialized() : void
      {
         super.initialized();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(RankGlobal.EVENT_RANK_LIST_UPDATE,this.onRankListUpdate1,CommonEvent);
      }
      
      private function onRankListUpdate1(param1:CommonEvent) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.view.m_cellVec.length)
         {
            if(this.rankProxy.rankList[_loc2_] && this.rankProxy.rankList[_loc2_].roleID != null)
            {
               this.view.m_cellVec[_loc2_].visible = true;
               this.view.m_cellVec[_loc2_].data = this.rankProxy.rankList[_loc2_];
            }
            else
            {
               this.view.m_cellVec[_loc2_].visible = false;
            }
            _loc2_++;
         }
         this.view.myCell.data = this.rankProxy.selfRank;
      }
      
      override public function dispose() : void
      {
         removeContextListener(RankGlobal.EVENT_RANK_LIST_UPDATE,this.onRankListUpdate1,CommonEvent);
         super.dispose();
      }
   }
}
