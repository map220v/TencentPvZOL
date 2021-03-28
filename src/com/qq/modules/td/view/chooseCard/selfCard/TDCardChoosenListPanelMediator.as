package com.qq.modules.td.view.chooseCard.selfCard
{
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.vo.TDCardData;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.tqos.TQOSUtils;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import org.robotlegs.mvcs.Mediator;
   
   public class TDCardChoosenListPanelMediator extends Mediator
   {
       
      
      [Inject]
      public var view:TDCardChoosenListPanel;
      
      private var cardList:Vector.<TDBasicChooseCard>;
      
      public function TDCardChoosenListPanelMediator()
      {
         super();
      }
      
      override public function onRegister() : void
      {
         this.initListener();
         this.cardList = new Vector.<TDBasicChooseCard>();
      }
      
      override public function onRemove() : void
      {
      }
      
      protected function initListener() : void
      {
         addContextListener(CommandName.TD_ChooseCard,this.onChooseCardHandler,CommonEvent);
         addContextListener(CommandName.TD_Add_CardToSlot,this.addCardHandler,CommonEvent);
         addContextListener(CommandName.TDGameEvent_RestartGame,this.onRestartGame,CommonEvent);
      }
      
      private function onRestartGame(param1:CommonEvent) : void
      {
         while(this.view.cardBox.numChildren > 0)
         {
            this.view.cardBox.removeChildAt(0);
         }
      }
      
      private function addCardHandler(param1:CommonEvent) : void
      {
         var _loc3_:TDCardData = null;
         var _loc4_:TDBeChoosedCard = null;
         var _loc2_:int = TDGameInfo.getInstance().normalCardsData.getExtenalCardNum();
         if(TDGameInfo.getInstance().normalCardsData.slotCardData.length <= TDStageInfo.getInstance().originalCardSlotNum.get() && _loc2_ == 0 || _loc2_ == 1 && TDGameInfo.getInstance().normalCardsData.slotCardData.length <= TDStageInfo.getInstance().originalCardSlotNum.get() + _loc2_)
         {
            _loc3_ = param1.readCustomParam("cardState");
            _loc3_.choosePos = TDCardData.CARD_CHOOSE_POS_ORIGINAL;
            _loc4_ = new TDBeChoosedCard(TDBeChoosedCardMediator,_loc3_);
            this.view.cardBox.addChild(_loc4_);
         }
      }
      
      private function onChooseCardHandler(param1:CommonEvent) : void
      {
         var _loc2_:TDBasicChooseCard = null;
         var _loc3_:Point = null;
         var _loc4_:BitmapData = null;
         var _loc5_:Bitmap = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Point = null;
         var _loc9_:Object = null;
         if(this.isOriginal)
         {
            _loc2_ = param1.param.chooseCard as TDBasicChooseCard;
            if(!_loc2_)
            {
               TQOSUtils.getInstance().reportMsg("事件 CommandName.TD_ChooseCard 参数错误！");
               return;
            }
            _loc3_ = new Point();
            (_loc4_ = new BitmapData(_loc2_.width,_loc2_.height,true,0)).draw(_loc2_);
            _loc5_ = new Bitmap(_loc4_);
            _loc3_.x = _loc2_.x;
            _loc3_.y = _loc2_.y;
            _loc3_ = _loc2_.parent.localToGlobal(_loc3_);
            if((_loc6_ = TDGameInfo.getInstance().normalCardsData.getCardSlotIndex()) == -1)
            {
               CommonCmd.txtFly("无法选择更多植物!",GameGloble.stage.stageWidth * 0.5 - 200,GameGloble.stage.stageHeight * 0.5);
               return;
            }
            _loc7_ = TDGameInfo.getInstance().normalCardsData.getExtenalCardNum();
            _loc6_ -= _loc7_;
            _loc8_ = this.getCardPosByIndex(_loc6_,_loc2_.width);
            (_loc9_ = new Object()).obj = _loc5_;
            _loc9_.fromPoint = _loc3_;
            _loc9_.targetPoint = _loc8_;
            _loc9_.cardState = _loc2_.cardData;
            _loc9_.needFly = 1;
            CommandDispatcher.send(CommandName.TD_PlayChooseCardEffect,_loc9_);
         }
      }
      
      private function get isOriginal() : Boolean
      {
         var _loc1_:int = TDGameInfo.getInstance().normalCardsData.getCardSlotIndex();
         var _loc2_:int = TDGameInfo.getInstance().normalCardsData.getExtenalCardNum();
         var _loc3_:int = TDStageInfo.getInstance().originalCardSlotNum.get();
         if(_loc1_ < _loc3_ || _loc1_ == _loc3_ && _loc2_ > 0)
         {
            return true;
         }
         return false;
      }
      
      private function getCardPosByIndex(param1:int, param2:Number) : Point
      {
         var _loc3_:Point = new Point();
         _loc3_.x = (param2 + 1) * param1;
         _loc3_.y = 0;
         return this.view.cardBox.localToGlobal(_loc3_);
      }
   }
}
