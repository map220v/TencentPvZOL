package com.qq.modules.td.view.chooseCard.selfCard
{
   import PVZ.Cmd.Dto_PlantInfo;
   import asgui.core.IDisposable;
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.login.service.LoginService;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.vo.TDCardData;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UtilsManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Point;
   import org.as3commons.logging.api.getLogger;
   import tencent.base.utils.DelayCall;
   
   public class TDCardAllListPanelMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDCardAllListPanel;
      
      [Inject]
      public var settingsModel:SettingsModel;
      
      [Inject]
      public var loginService:LoginService;
      
      public function TDCardAllListPanelMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         addContextListener(CommandName.TDGameEvent_EnterChooseCardScreen,this.onEnterChooseCardScreen,CommonEvent);
         addContextListener(CommandName.TDGameEvent_BackToChooseCardScreen,this.onEnterChooseCardScreen,CommonEvent);
         addContextListener(CommandName.TD_CancelChoosePlantCard,this.onCancelChooseCard,CommonEvent);
         addContextListener(CommandName.TD_ADD_UNLOCK_PLANT_TO_CHOOSE,this.onAddUnlockPlantToChoose,CommonEvent);
      }
      
      public function setCard(param1:Vector.<TDCardData>, param2:Vector.<int>) : void
      {
         var _loc4_:int = 0;
         var _loc5_:TDBasicChooseCard = null;
         this.cleanCardInfo();
         param1 = param1.concat();
         var _loc3_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = new TDChooseCard(TDChooseCardMediator,param1[_loc4_]);
            this.view.addChild(_loc5_);
            _loc5_.alpha = 1;
            _loc4_++;
         }
      }
      
      private function getCardPos(param1:TDCardData) : Point
      {
         var _loc3_:int = 0;
         var _loc5_:TDBasicChooseCard = null;
         var _loc2_:Point = new Point();
         var _loc4_:int = this.view.numChildren;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if((_loc5_ = this.view.getChildAt(_loc3_) as TDBasicChooseCard).cardData.id == param1.id)
            {
               _loc2_.x = _loc5_.x;
               _loc2_.y = _loc5_.y;
               break;
            }
            _loc3_++;
         }
         _loc2_ = this.view.localToGlobal(_loc2_);
         _loc2_.y -= this.view.verticalScrollPosition;
         return _loc2_;
      }
      
      private function cleanCardInfo() : void
      {
         while(this.view.numChildren > 0)
         {
            (this.view.removeChildAt(0) as IDisposable).Dispose();
         }
      }
      
      private function onEnterChooseCardScreen(param1:Event) : void
      {
         var _loc5_:Dto_PlantInfo = null;
         var _loc2_:Vector.<TDCardData> = new Vector.<TDCardData>();
         var _loc3_:Boolean = false;
         var _loc4_:Vector.<Dto_PlantInfo> = TDStageInfo.getInstance().plantIDList;
         for each(_loc5_ in _loc4_)
         {
            _loc2_.push(new TDCardData(_loc5_,null));
         }
         this.setCard(_loc2_,TDStageInfo.getInstance().banNormalPlant);
      }
      
      private function onAddUnlockPlantToChoose(param1:CommonEvent) : void
      {
         var card:TDBasicChooseCard = null;
         var fromPoint:Point = null;
         var bitmap:Bitmap = null;
         var e:CommonEvent = param1;
         var unlockCard:TDUnlockCard = e.param as TDUnlockCard;
         card = new TDChooseCard(TDChooseCardMediator,unlockCard.cardData);
         this.view.addChild(card);
         card.alpha = 0;
         fromPoint = new Point();
         unlockCard.lockMc.visible = unlockCard.ticketCostBg.visible = unlockCard.txtTicketCost.visible = unlockCard.notRecommendedSp.visible = false;
         var bitmapData:BitmapData = new BitmapData(unlockCard.width,unlockCard.height,true,0);
         bitmapData.draw(unlockCard);
         bitmap = new Bitmap(bitmapData);
         fromPoint.x = unlockCard.x;
         fromPoint.y = unlockCard.y;
         fromPoint = unlockCard.localToGlobal(new Point(0,0));
         DelayCall.call(50,function():void
         {
            if(view.scrollHandler.hasVerticalScrollBar)
            {
               view.verticalScrollPosition = view.height;
            }
            var _loc1_:Point = getCardPos(card.cardData);
            var _loc2_:Object = new Object();
            _loc2_.obj = bitmap;
            _loc2_.fromPoint = fromPoint;
            _loc2_.targetPoint = _loc1_;
            _loc2_.card = card;
            _loc2_.needFly = 1;
            _loc2_.callBack = onPlayUnlockCardEffectComplete;
            CommandDispatcher.send(CommandName.TD_PlayUnlockCardEffect,_loc2_);
         });
      }
      
      private function onPlayUnlockCardEffectComplete(param1:TDChooseCard) : void
      {
         param1.alpha = 1;
      }
      
      private function onCancelChooseCard(param1:CommonEvent) : void
      {
         var _loc3_:Point = null;
         var _loc4_:Bitmap = null;
         var _loc5_:BitmapData = null;
         var _loc6_:Point = null;
         var _loc2_:TDBasicChooseCard = param1.readCustomParam("chooseCard") as TDBasicChooseCard;
         if(!_loc2_)
         {
            getLogger("TD").debug("没有选中的卡片");
            return;
         }
         _loc3_ = new Point();
         (_loc5_ = new BitmapData(_loc2_.width,_loc2_.height,true,16711680)).draw(_loc2_);
         _loc4_ = new Bitmap(_loc5_);
         _loc3_.x = _loc2_.x;
         _loc3_.y = _loc2_.y;
         _loc3_ = _loc2_.parent.localToGlobal(_loc3_);
         _loc6_ = this.getCardPos(_loc2_.cardData);
         UtilsManager.removeFromContainer(_loc2_);
         if(_loc2_.cardData != null)
         {
            TDGameInfo.getInstance().removeCardFromSlot(_loc2_.cardData);
         }
         TDSoundCmd.restorePlantCard();
         var _loc7_:Object;
         (_loc7_ = new Object()).obj = _loc4_;
         _loc7_.fromPoint = _loc3_;
         _loc7_.targetPoint = _loc6_;
         _loc7_.needFly = 1;
         CommandDispatcher.send(CommandName.TD_PlayCancelChooseCardEffect,_loc7_);
      }
   }
}
