package com.qq.modules.td.view.game.ui.plant
{
   import PVZ.Cmd.Dto_PlantInfo;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenSupportStarlingMediator;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.vo.TDCardData;
   import com.qq.modules.td.view.chooseCard.selfCard.TDBasicChooseCard;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UtilsManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   import org.as3commons.logging.api.getLogger;
   
   public class TDCardSlotPanelMediator extends BasicScreenSupportStarlingMediator
   {
       
      
      [Inject]
      public var view:TDCardSlotPanel;
      
      public function TDCardSlotPanelMediator()
      {
         super();
      }
      
      public function getCardByType(param1:TDCardData) : TDCardSlot
      {
         var _loc2_:TDCardSlot = null;
         for each(_loc2_ in this.view.cardList)
         {
            if(_loc2_.cardState.id == param1.id)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TD_Init_CardSlot_UI,this.onInit,CommonEvent);
         addContextListener(CommandName.TD_Add_CardToSlot,this.onAddCardToSlot,CommonEvent);
         addContextListener(CommandName.TD_ChooseCard,this.onChooseCard,CommonEvent);
         addContextListener(CommandName.TD_RemoveChooseNormalPlant,this.onRemoveChooseCard,CommonEvent);
         addContextListener(CommandName.TD_CleanAllNormalPlant,this.onCleanAllCard,CommonEvent);
         addContextListener(CommandName.TDGameEnter_StartReadyTDGame,this.onStartReadyTDGame,CommonEvent);
      }
      
      private function cleanAllCardSlot() : void
      {
         var _loc1_:TDCardSlot = null;
         while(this.view.cardList.length > 0)
         {
            _loc1_ = this.view.cardList.pop();
            _loc1_.removeSelf();
         }
      }
      
      override public function dispose() : void
      {
         this.view.cardList = null;
         super.dispose();
      }
      
      private function onStartReadyTDGame(param1:Event) : void
      {
         this.view.setEnable(true);
         this.view.show();
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
            _loc4_ = GameGloble.actorModel.getUnlockPlant(TDStageInfo.getInstance().initCardList[_loc3_].type);
            _loc5_ = new TDCardData(_loc4_,null);
            TDGameInfo.getInstance().addCardToSlot(_loc5_);
            _loc3_++;
         }
      }
      
      private function onCleanAllCard(param1:CommonEvent) : void
      {
         this.cleanAllCardSlot();
      }
      
      private function onAddCardToSlot(param1:CommonEvent) : void
      {
         var _loc2_:TDCardData = param1.readCustomParam("cardState");
         var _loc3_:TDCardSlot = new TDCardSlot(_loc2_);
         _loc3_.x = this.view.cardList.length * 54;
         this.view.cardList.push(_loc3_);
         this.view.addMixLayer(_loc3_);
      }
      
      private function onChooseCard(param1:CommonEvent) : void
      {
         if(param1.readCustomParam_Number("fromPanel") == 1)
         {
            return;
         }
         var _loc2_:Sprite = param1.readCustomParam("chooseCard");
         var _loc3_:int = param1.readCustomParam_Number("needFly");
         if(_loc2_ == null)
         {
            getLogger("TD").debug("没有选中的卡片");
            return;
         }
         var _loc4_:Point = new Point();
         var _loc5_:BitmapData;
         (_loc5_ = new BitmapData(_loc2_.width,_loc2_.height,true,0)).draw(_loc2_);
         var _loc6_:Bitmap = new Bitmap(_loc5_);
         _loc4_.x = _loc2_.x;
         _loc4_.y = _loc2_.y;
         _loc4_ = _loc2_.parent.localToGlobal(_loc4_);
         var _loc7_:int;
         if((_loc7_ = TDGameInfo.getInstance().normalCardsData.getCardSlotIndex()) == -1)
         {
            return;
         }
         var _loc8_:Point = this.view.getCardPosByIndex(_loc7_);
         CommandDispatcher.send(CommandName.TD_PlayChooseCardEffect,{
            "obj":_loc6_,
            "fromPoint":_loc4_,
            "targetPoint":_loc8_,
            "cardState":(_loc2_ as TDBasicChooseCard).cardData,
            "needFly":_loc3_,
            "flyEndCall":param1.readCustomParam("flyEndCall")
         });
      }
      
      private function onRemoveChooseCard(param1:CommonEvent) : void
      {
         var _loc3_:TDCardSlot = null;
         var _loc4_:int = 0;
         var _loc2_:TDCardData = param1.readCustomParam("cardState");
         for each(_loc3_ in this.view.cardList)
         {
            if(_loc3_.cardState.id == _loc2_.id)
            {
               _loc4_ = this.view.cardList.indexOf(_loc3_);
               this.view.cardList.splice(_loc4_,1);
               UtilsManager.removeFromContainer(_loc3_.display);
               UtilsManager.removeFromContainer(_loc3_);
               _loc3_.Dispose();
               break;
            }
         }
         this.updateCardPos();
      }
      
      private function updateCardPos() : void
      {
         var _loc2_:TDCardSlot = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.view.cardList)
         {
            _loc2_.x = _loc1_ * (_loc2_.width + 1);
            _loc1_++;
         }
      }
   }
}
