package com.qq.modules.td.view.chooseCard.friendCard
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.vo.TDCardData;
   import com.qq.modules.td.view.chooseCard.selfCard.TDBasicChooseCard;
   import com.qq.utils.CommandDispatcher;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.mvcs.Mediator;
   
   public class TDFriendCardListChoosePanelMediator extends Mediator
   {
       
      
      [Inject]
      public var view:TDFriendCardListChoosePanel;
      
      private var cardList:Vector.<TDBeChoosedFriendCard>;
      
      public function TDFriendCardListChoosePanelMediator()
      {
         super();
      }
      
      override public function onRegister() : void
      {
         this.initListener();
         this.cardList = new Vector.<TDBeChoosedFriendCard>();
      }
      
      override public function onRemove() : void
      {
      }
      
      protected function initListener() : void
      {
         addContextListener(CommandName.TD_ChooseFriendCard,this.onChooseCardHandler,CommonEvent);
         addContextListener(CommandName.TD_Add_FriendCardToSlot,this.addCardHandler,CommonEvent);
         addContextListener(CommandName.TD_CancelChooseFriendCard,this.onCancelChooseCard,CommonEvent);
         addContextListener(CommandName.TDGameEvent_RestartGame,this.onRestartGame,CommonEvent);
         addContextListener(CommandName.TDGameEvent_EndlessTD_EnterChooseCard,this.onRestartGame,CommonEvent);
      }
      
      private function onRestartGame(param1:CommonEvent) : void
      {
         this.cleanCardInfo();
      }
      
      private function cleanCardInfo() : void
      {
         while(this.view.cardBox.numChildren > 0)
         {
            this.view.cardBox.removeChildAt(0);
         }
      }
      
      private function addCardHandler(param1:CommonEvent) : void
      {
         var _loc2_:TDCardData = param1.readCustomParam("cardState");
         var _loc3_:TDBeChoosedFriendCard = new TDBeChoosedFriendCard(TDBeChoosedFriendCardMediator,_loc2_);
         this.view.cardBox.addChild(_loc3_);
      }
      
      private function onChooseCardHandler(param1:CommonEvent) : void
      {
         var _loc2_:TDBasicChooseCard = param1.param.chooseCard as TDBasicChooseCard;
         if(!_loc2_)
         {
            getLogger("UI").error("事件 CommandName.TD_ChooseCard 参数错误！");
            return;
         }
         var _loc3_:Point = new Point();
         var _loc4_:BitmapData;
         (_loc4_ = new BitmapData(_loc2_.width,_loc2_.height,true,0)).draw(_loc2_);
         var _loc5_:Bitmap = new Bitmap(_loc4_);
         _loc3_.x = _loc2_.x;
         _loc3_.y = _loc2_.y;
         _loc3_ = _loc2_.parent.localToGlobal(_loc3_);
         var _loc6_:int;
         if((_loc6_ = TDGameInfo.getInstance().friendCardsData.getFreeSkillPlantSlotIndex()) == -1)
         {
            return;
         }
         var _loc7_:Point = this.getCardPosByIndex(_loc6_,_loc2_.width);
         var _loc8_:Object;
         (_loc8_ = new Object()).obj = _loc5_;
         _loc8_.fromPoint = _loc3_;
         _loc8_.targetPoint = _loc7_;
         _loc8_.cardState = _loc2_.cardData;
         _loc8_.needFly = 1;
         CommandDispatcher.send(CommandName.TD_PlayChooseCardEffect,_loc8_);
      }
      
      private function getCardPosByIndex(param1:int, param2:Number) : Point
      {
         var _loc3_:Point = new Point();
         _loc3_.x = (param2 + 1) * param1;
         _loc3_.y = 0;
         return this.view.cardBox.localToGlobal(_loc3_);
      }
      
      private function onCancelChooseCard(param1:CommonEvent) : void
      {
         var _loc3_:TDBeChoosedFriendCard = null;
         var _loc2_:Object = param1.readCustomParam("chooseCard");
         if(_loc2_ is TDBeChoosedFriendCard)
         {
            _loc3_ = _loc2_ as TDBeChoosedFriendCard;
            this.view.cardBox.removeChild(_loc3_);
         }
      }
   }
}
