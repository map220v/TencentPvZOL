package com.qq.modules.levelselect.view.components
{
   import PVZ.Cmd.Dto_IdNum;
   import asgui.managers.PopUpManager;
   import com.qq.modules.bag.view.components.BagItemIcon;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.market.view.MarketItemToolTip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class LSPromotionRewardWdMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:LSPromotionRewardWd;
      
      private var bonusIconList:Vector.<BagItemIcon>;
      
      private var m_preRank:int;
      
      private var m_curRank:int;
      
      private var m_rewardList:Array;
      
      public function LSPromotionRewardWdMediator()
      {
         this.bonusIconList = new Vector.<BagItemIcon>();
         super();
      }
      
      override protected function init() : void
      {
         var _loc2_:BagItemIcon = null;
         super.init();
         var _loc1_:int = 0;
         while(_loc1_ < 1)
         {
            _loc2_ = new BagItemIcon();
            this.bonusIconList.push(_loc2_);
            this.view.boxRankReward.addChild(_loc2_);
            _loc1_++;
         }
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         this.view.addEventListener(Event.CHANGE,this.onChangeHandler);
         addComponentListener(this.view.closeBtn,MouseEvent.CLICK,this.onClose);
      }
      
      private function onChangeHandler(param1:Event) : void
      {
         if(this.view.data)
         {
            this.m_preRank = this.view.data.preRank;
            this.m_curRank = this.view.data.curRank;
            this.m_rewardList = this.view.data.rewardList;
            this.refreshPanel();
         }
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         PopUpManager.impl.RemovePopUp(this.view);
         this.view.Dispose();
      }
      
      private function refreshPanel() : void
      {
         var _loc2_:Dto_IdNum = null;
         this.view.l_preRank_num.text = this.m_preRank.toString();
         this.view.l_curRank_num.text = this.m_curRank.toString();
         this.view.l_cross_num.text = (this.m_preRank - this.m_curRank).toString();
         var _loc1_:int = 0;
         while(_loc1_ < this.bonusIconList.length)
         {
            this.bonusIconList[_loc1_].visible = false;
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.m_rewardList.length)
         {
            _loc2_ = this.m_rewardList[_loc1_];
            if(this.bonusIconList[_loc1_])
            {
               this.bonusIconList[_loc1_].itemData = _loc2_;
               this.bonusIconList[_loc1_].visible = true;
               this.bonusIconList[_loc1_].toolTip = _loc2_.id.toString();
               this.bonusIconList[_loc1_].toolTipClass = MarketItemToolTip;
            }
            _loc1_++;
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
