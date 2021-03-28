package com.qq.modules.td.view.chooseCard.endlessTD
{
   import PVZ.Cmd.Dto_PlantInfo;
   import asgui.core.IDisposable;
   import com.qq.CommandName;
   import com.qq.TDPrivilegeInfo;
   import com.qq.managers.FilterManager;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.model.vo.TDCardData;
   import flash.events.MouseEvent;
   
   public class TDUnlockCardPanelWithEndlessTDMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDUnlockCardPanelWithEndlessTD;
      
      private var _curPage:int;
      
      public function TDUnlockCardPanelWithEndlessTDMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this.curPage = 1;
         this.refreshCardList();
      }
      
      private function refreshCardList() : void
      {
         var _loc4_:Dto_PlantInfo = null;
         var _loc5_:TDCardData = null;
         var _loc6_:TDUnlockCardWithEndlessTD = null;
         while(this.view.cardContainer.numChildren > 0)
         {
            (this.view.cardContainer.removeChildAt(0) as IDisposable).Dispose();
         }
         var _loc1_:Array = TDPrivilegeInfo.getInstance().unlockPlantIDList;
         var _loc2_:int = 0;
         while(_loc2_ < this.view.cardContainer.columnCount)
         {
            if((this._curPage - 1) * this.view.cardContainer.columnCount + _loc2_ < _loc1_.length)
            {
               (_loc4_ = new Dto_PlantInfo()).plantId = _loc1_[(this._curPage - 1) * this.view.cardContainer.columnCount + _loc2_];
               _loc4_.avatarId = _loc4_.plantId + 1;
               _loc5_ = new TDCardData(_loc4_);
               _loc6_ = new TDUnlockCardWithEndlessTD(TDUnlockCardWithEndlessTDMediator,_loc5_);
               this.view.cardContainer.addChild(_loc6_);
            }
            _loc2_++;
         }
         var _loc3_:int = Math.ceil(_loc1_.length / this.view.cardContainer.columnCount);
         if(this._curPage < _loc3_)
         {
            this.view.nextBtn.filters = [];
            addComponentListener(this.view.nextBtn,MouseEvent.CLICK,this.onNext);
         }
         else
         {
            this.view.nextBtn.filters = [FilterManager.getGaryFilter()];
            removeComponentListener(this.view.nextBtn,MouseEvent.CLICK,this.onNext);
         }
         if(this._curPage > 1)
         {
            this.view.prevBtn.filters = [];
            addComponentListener(this.view.prevBtn,MouseEvent.CLICK,this.onPrev);
         }
         else
         {
            this.view.prevBtn.filters = [FilterManager.getGaryFilter()];
            removeComponentListener(this.view.prevBtn,MouseEvent.CLICK,this.onPrev);
         }
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TD_ADD_UNLOCK_PLANT_TO_CHOOSE,this.onAddUnlockPlantToChoose,CommonEvent);
      }
      
      private function onAddUnlockPlantToChoose(param1:CommonEvent) : void
      {
         this.refreshCardList();
      }
      
      private function set curPage(param1:int) : void
      {
         this._curPage = param1;
         this.refreshCardList();
      }
      
      private function onPrev(param1:MouseEvent) : void
      {
         this.curPage = this._curPage - 1;
      }
      
      private function onNext(param1:MouseEvent) : void
      {
         this.curPage = this._curPage + 1;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
