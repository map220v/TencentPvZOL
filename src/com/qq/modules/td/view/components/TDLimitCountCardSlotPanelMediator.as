package com.qq.modules.td.view.components
{
   import PVZ.Cmd.Dto_PlantInfo;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.command.ui.TDUICmd;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.vo.TDCardData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class TDLimitCountCardSlotPanelMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDLimitCountCardSlotPanel;
      
      public function TDLimitCountCardSlotPanelMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TD_Init_CardSlot_UI,this.onInit,CommonEvent);
         addContextListener(CommandName.TD_CancelUseCard,this.onCancelCropPlant,CommonEvent);
         addContextListener(CommandName.TD_StartCardCooldown,this.onDoCropPlant,CommonEvent);
      }
      
      private function onInit(param1:Event) : void
      {
         var _loc4_:Dto_PlantInfo = null;
         var _loc5_:TDCardData = null;
         this.cleanAllCardSlot();
         var _loc2_:int = TDStageInfo.getInstance().initCardList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = GameGloble.actorModel.getUnlockPlant(TDStageInfo.getInstance().initCardList[_loc3_].type)) == null)
            {
               (_loc4_ = new Dto_PlantInfo()).plantId = TDStageInfo.getInstance().initCardList[_loc3_].type;
               _loc4_.avatarId = 0;
            }
            _loc5_ = new TDCardData(_loc4_,null);
            this.addCard(_loc5_,TDStageInfo.getInstance().initCardList[_loc3_].count);
            _loc3_++;
         }
      }
      
      private function cleanAllCardSlot() : void
      {
      }
      
      private function addCard(param1:TDCardData, param2:int) : void
      {
         var _loc3_:TDLimitCountCard = new TDLimitCountCard(param1);
         this.view.addCard(_loc3_);
         _loc3_.cardCount = param2;
         addComponentListener(_loc3_,MouseEvent.CLICK,this.clickHandler);
      }
      
      private function useCard(param1:int) : void
      {
         var _loc3_:TDLimitCountCard = null;
         var _loc2_:Array = this.view.cardList;
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.cardData.plantStaticInfo.type == param1)
            {
               --_loc3_.cardCount;
               _loc3_.selected = false;
            }
         }
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:TDLimitCountCard = param1.currentTarget as TDLimitCountCard;
         if(_loc2_.cardCount > 0)
         {
            TDUICmd.startPlantSettingByID(_loc2_.cardData.plantStaticInfo.type,this.view.id,true,null,false);
            _loc2_.selected = true;
         }
      }
      
      private function onCancelCropPlant(param1:CommonEvent) : void
      {
         var _loc3_:TDLimitCountCard = null;
         var _loc2_:Array = this.view.cardList;
         for each(_loc3_ in _loc2_)
         {
            _loc3_.selected = false;
         }
      }
      
      private function onDoCropPlant(param1:CommonEvent) : void
      {
         var _loc2_:int = param1.readCustomParam_Number("plantType");
         this.useCard(_loc2_);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
