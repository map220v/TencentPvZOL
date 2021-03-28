package com.qq.modules.td.view.game.ui.skill
{
   import com.greensock.TweenMax;
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenSupportStarlingMediator;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.vo.TDCardData;
   import com.qq.modules.td.view.chooseCard.selfCard.TDBasicChooseCard;
   import com.qq.modules.td.view.game.ui.plant.TDCardSlot;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UtilsManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   import org.as3commons.logging.api.getLogger;
   
   public class TDSkillSlotPanelMediator extends BasicScreenSupportStarlingMediator
   {
      
      public static var instance:TDSkillSlotPanelMediator;
       
      
      [Inject]
      public var view:TDSkillSlotPanel;
      
      public function TDSkillSlotPanelMediator()
      {
         super();
         instance = this;
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
         addContextListener(CommandName.TD_Init_FriendCardSlot_UI,this.onInit,CommonEvent);
         addContextListener(CommandName.TD_Add_FriendCardToSlot,this.onAddSkillToSlot,CommonEvent);
         addContextListener(CommandName.TD_ChooseFriendCard,this.onChooseCard,CommonEvent);
         addContextListener(CommandName.TD_RemoveChooseSkillPlant,this.onRemoveChooseCard,CommonEvent);
         addContextListener(CommandName.TD_CleanAllFriendPlant,this.onCleanAllCard,CommonEvent);
         addContextListener(CommandName.TDGameEvent_EnterChooseCardScreen,this.onEnterChooseCardScreen,CommonEvent);
         addContextListener(CommandName.TDGameEvent_EnterChooseFriendCardScreen,this.onEnterChooseFriendCardScreen,CommonEvent);
         addContextListener(CommandName.TDGameEvent_BackToChooseCardScreen,this.onEnterChooseCardScreen,CommonEvent);
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
         instance = null;
         super.dispose();
      }
      
      private function onEnterChooseCardScreen(param1:Event) : void
      {
         this.view.setEnable(false);
         this.view.hide();
      }
      
      private function onEnterChooseFriendCardScreen(param1:Event) : void
      {
         this.view.setEnable(true);
         this.view.show();
      }
      
      private function onInit(param1:Event) : void
      {
         this.cleanAllCardSlot();
      }
      
      private function onCleanAllCard(param1:CommonEvent) : void
      {
         this.cleanAllCardSlot();
      }
      
      private function onAddSkillToSlot(param1:CommonEvent) : void
      {
         var _loc2_:TDCardData = param1.readCustomParam("cardState");
         var _loc3_:TDCardSlot = new TDCardSlot(_loc2_);
         _loc3_.setLocation(this.view.cardList.length * (_loc3_.width + 2) + 6,8);
         this.view.cardList.push(_loc3_);
         this.view.cardLayer.addMixLayer(_loc3_);
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
         if((_loc7_ = TDGameInfo.getInstance().friendCardsData.getFreeSkillPlantSlotIndex()) == -1)
         {
            return;
         }
         var _loc8_:Point = this.view.getCardPosByIndex(_loc7_);
         CommandDispatcher.send(CommandName.TD_PlayChooseCardEffect,{
            "obj":_loc6_,
            "fromPoint":_loc4_,
            "targetPoint":_loc8_,
            "cardState":(_loc2_ as TDBasicChooseCard).cardData,
            "needFly":1,
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
               this.updateCardPos();
               break;
            }
         }
      }
      
      private function updateCardPos() : void
      {
         var _loc2_:TDCardSlot = null;
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         for each(_loc2_ in this.view.cardList)
         {
            _loc3_ = _loc1_ * (_loc2_.width + 1) + 6;
            if(_loc2_.x != _loc3_)
            {
               TweenMax.to(_loc2_,0.2,{"x":_loc3_});
            }
            _loc1_++;
         }
      }
   }
}
