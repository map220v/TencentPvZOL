package com.qq.modules.td.view.chooseCard.endlessTD
{
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.vo.TDCardData;
   import com.qq.utils.CommandDispatcher;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class TDCardChoosenListPanelWithEndlessTDMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDCardChoosenListPanelWithEndlessTD;
      
      private var cardList:Vector.<TDChooseCardWithEndlessTD>;
      
      public function TDCardChoosenListPanelWithEndlessTDMediator()
      {
         super();
      }
      
      override public function onRegister() : void
      {
         this.initListener();
         this.cardList = new Vector.<TDChooseCardWithEndlessTD>();
      }
      
      override public function onRemove() : void
      {
      }
      
      override protected function initListener() : void
      {
         addContextListener(CommandName.TD_EndlessTD_ChooseCard,this.onChooseCardHandler,CommonEvent);
         addContextListener(CommandName.TDGameEvent_EndlessTD_EnterChooseCard,this.onEnterChooseCardScreen,CommonEvent);
         addContextListener(CommandName.TD_Add_CardToSlot,this.addCardHandler,CommonEvent);
         addContextListener(CommandName.TDGameEvent_RestartGame,this.onRestartGame,CommonEvent);
      }
      
      private function onEnterChooseCardScreen(param1:CommonEvent) : void
      {
         this.cleanCardInfo();
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
         var _loc3_:TDCardData = null;
         var _loc4_:TDBeChoosedCardWithEndlessTD = null;
         var _loc2_:int = TDGameInfo.getInstance().normalCardsData.getExtenalCardNum();
         if(TDGameInfo.getInstance().normalCardsData.slotCardData.length <= TDStageInfo.getInstance().originalCardSlotNum.get() && _loc2_ == 0 || _loc2_ == 1 && TDGameInfo.getInstance().normalCardsData.slotCardData.length <= TDStageInfo.getInstance().originalCardSlotNum.get() + _loc2_)
         {
            _loc3_ = param1.readCustomParam("cardState");
            _loc4_ = new TDBeChoosedCardWithEndlessTD(TDBeChoosedCardWithEndlessTDMediator,_loc3_);
            this.view.cardBox.addChild(_loc4_);
         }
      }
      
      private function onChooseCardHandler(param1:CommonEvent) : void
      {
         var _loc2_:TDChooseCardWithEndlessTD = null;
         var _loc3_:Point = null;
         var _loc4_:BitmapData = null;
         var _loc5_:Bitmap = null;
         var _loc6_:int = 0;
         var _loc7_:Point = null;
         var _loc8_:Object = null;
         if(this.isOriginal)
         {
            _loc2_ = param1.param.chooseCard as TDChooseCardWithEndlessTD;
            if(!_loc2_)
            {
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
            if(TDGameInfo.getInstance().rain.get() < _loc2_.cardData.plantStaticInfo.baseInfo.costWater)
            {
               CommonCmd.txtFly("雨露值不足",GameGloble.stage.stageWidth * 0.5 - 200,GameGloble.stage.stageHeight * 0.5);
               return;
            }
            TDGameCmd.changeRain(-_loc2_.cardData.plantStaticInfo.baseInfo.costWater);
            _loc7_ = this.getCardPosByIndex(_loc6_,_loc2_.width);
            (_loc8_ = new Object()).obj = _loc5_;
            _loc8_.fromPoint = _loc3_;
            _loc8_.targetPoint = _loc7_;
            _loc8_.cardState = _loc2_.cardData;
            _loc8_.needFly = 1;
            CommandDispatcher.send(CommandName.TD_PlayChooseCardEffect,_loc8_);
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
         var _loc4_:int;
         if((_loc4_ = TDGameInfo.getInstance().normalCardsData.getExtenalCardNum()) > 0)
         {
            _loc3_.x = (param2 + 1) * param1 - 55;
         }
         else
         {
            _loc3_.x = (param2 + 1) * param1;
         }
         _loc3_.y = 0;
         return this.view.cardBox.localToGlobal(_loc3_);
      }
   }
}
