package com.qq.modules.td.view.game
{
   import com.greensock.TweenMax;
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.login.service.LoginService;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.vo.TDCardData;
   import com.qq.modules.td.view.chooseCard.selfCard.TDBasicChooseCard;
   import com.qq.modules.td.view.debug.TDDebugCommandLayer;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UtilsManager;
   import flash.display.Bitmap;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class TDUIPanelMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDUIPanel;
      
      [Inject]
      public var loginServer:LoginService;
      
      private var tween:TweenMax;
      
      public function TDUIPanelMediator()
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
         addContextListener(CommandName.TD_Debug_ShowOrHidePanel,this.showDebugPanel,CommonEvent);
         addContextListener(CommandName.TD_PlayChooseCardEffect,this.onPlayChooseCardEffect,CommonEvent);
         addContextListener(CommandName.TD_PlayCancelChooseCardEffect,this.onPlayCancelChooseCardEffect,CommonEvent);
         addContextListener(CommandName.TD_PlayUnlockCardEffect,this.onPlayUnlockCardEffect,CommonEvent);
         addContextListener(CommandName.TD_hideUI,this.onHideUI,CommonEvent);
         addContextListener(CommandName.TD_showUI,this.onShowUI,CommonEvent);
         addContextListener(CommandName.TD_DownEffectImmediately,this.onDownEffectImmediately,CommonEvent);
         addContextListener(CommandName.TDGameEvent_InitChooseCardPanel,this.onInitChooseCardPanel);
         addContextListener(CommandName.TDGameEvent_InitChooseCardPanelWithEndlessTD,this.onInitChooseCardPanelWithEndlessTD);
      }
      
      private function onDownEffectImmediately(param1:CommonEvent) : void
      {
         if(this.tween)
         {
            this.tween.complete();
            this.tween = null;
         }
      }
      
      private function onHideUI(param1:Event) : void
      {
         this.view.visible = false;
      }
      
      private function onShowUI(param1:Event) : void
      {
         this.view.visible = true;
      }
      
      private function showDebugPanel(param1:Event) : void
      {
         var _loc2_:TDDebugCommandLayer = null;
         if(this.view.getChildByName("debugPanel") == null)
         {
            _loc2_ = new TDDebugCommandLayer();
            _loc2_.name = "debugPanel";
            this.view.addChild(_loc2_);
         }
         else
         {
            this.view.removeChild(this.view.getChildByName("debugPanel"));
         }
      }
      
      private function onPlayChooseCardEffect(param1:CommonEvent) : void
      {
         var _loc2_:Bitmap = null;
         var _loc3_:TDCardData = null;
         var _loc4_:* = undefined;
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         _loc2_ = param1.readCustomParam("obj");
         _loc3_ = param1.readCustomParam("cardState") as TDCardData;
         if((_loc4_ = param1.readCustomParam("flyEndCall")) == "")
         {
            _loc4_ = null;
         }
         if(param1.readCustomParam_Number("needFly") == 1)
         {
            _loc5_ = param1.readCustomParam("fromPoint");
            _loc6_ = param1.readCustomParam("targetPoint");
            _loc5_ = this.view.globalToLocal(_loc5_);
            _loc6_ = this.view.globalToLocal(_loc6_);
            _loc2_.x = _loc5_.x;
            _loc2_.y = _loc5_.y;
            this.view.addChild(_loc2_);
            this.tween = TweenMax.to(_loc2_,0.4,{
               "x":_loc6_.x,
               "y":_loc6_.y,
               "onComplete":this.onFinishChooseCard,
               "onCompleteParams":[_loc2_,_loc3_,_loc4_]
            });
         }
         else
         {
            this.onFinishChooseCard(_loc2_,_loc3_,_loc4_);
         }
      }
      
      private function onFinishChooseCard(param1:Bitmap, param2:TDCardData, param3:Function = null) : void
      {
         var timer:Timer = null;
         var delayTimeHandler:Function = null;
         var bitmap:Bitmap = param1;
         var cardState:TDCardData = param2;
         var flyEndCall:Function = param3;
         delayTimeHandler = function(param1:TimerEvent):void
         {
            timer.removeEventListener(TimerEvent.TIMER_COMPLETE,delayTimeHandler);
            timer = null;
            if(bitmap != null)
            {
               bitmap.bitmapData.dispose();
               UtilsManager.removeFromContainer(bitmap);
            }
         };
         this.tween = null;
         TDGameInfo.getInstance().addCardToSlot(cardState);
         timer = new Timer(100,1);
         timer.addEventListener(TimerEvent.TIMER_COMPLETE,delayTimeHandler);
         timer.start();
         if(flyEndCall != null)
         {
            flyEndCall();
         }
      }
      
      private function onPlayCancelChooseCardEffect(param1:CommonEvent) : void
      {
         var _loc2_:Bitmap = null;
         var _loc3_:Point = null;
         var _loc4_:Point = null;
         _loc2_ = param1.readCustomParam("obj");
         if(param1.readCustomParam_Number("needFly") == 1)
         {
            _loc3_ = param1.readCustomParam("fromPoint");
            _loc4_ = param1.readCustomParam("targetPoint");
            _loc3_ = this.view.globalToLocal(_loc3_);
            _loc4_ = this.view.globalToLocal(_loc4_);
            _loc2_.x = _loc3_.x;
            _loc2_.y = _loc3_.y;
            this.view.addChild(_loc2_);
            this.tween = TweenMax.to(_loc2_,0.2,{
               "x":_loc4_.x,
               "y":_loc4_.y,
               "onComplete":this.onFinishCancelChooseCard,
               "onCompleteParams":[_loc2_]
            });
         }
         else
         {
            this.onFinishCancelChooseCard(_loc2_);
         }
      }
      
      private function onPlayUnlockCardEffect(param1:CommonEvent) : void
      {
         var bitmap:Bitmap = null;
         var card:TDBasicChooseCard = null;
         var fromPoint:Point = null;
         var targetPoint:Point = null;
         var callBack:Function = null;
         var e:CommonEvent = param1;
         bitmap = e.readCustomParam("obj");
         card = e.readCustomParam("card") as TDBasicChooseCard;
         var flyEndCall:* = e.readCustomParam("flyEndCall");
         if(flyEndCall == "")
         {
            flyEndCall = null;
         }
         if(e.readCustomParam_Number("needFly") == 1)
         {
            fromPoint = e.readCustomParam("fromPoint");
            targetPoint = e.readCustomParam("targetPoint");
            fromPoint = this.view.globalToLocal(fromPoint);
            targetPoint = this.view.globalToLocal(targetPoint);
            bitmap.x = fromPoint.x;
            bitmap.y = fromPoint.y;
            this.view.addChild(bitmap);
            callBack = e.readCustomParam("callBack");
            this.tween = TweenMax.to(bitmap,0.4,{
               "x":targetPoint.x,
               "y":targetPoint.y,
               "onComplete":function():void
               {
                  tween = null;
                  bitmap.bitmapData.dispose();
                  UtilsManager.removeFromContainer(bitmap);
                  callBack(card);
               }
            });
         }
      }
      
      private function onFinishCancelChooseCard(param1:Bitmap) : void
      {
         this.tween = null;
         CommandDispatcher.send(CommandName.TD_ChangeChoosePlant);
         param1.bitmapData.dispose();
         UtilsManager.removeFromContainer(param1);
      }
      
      private function onInitChooseCardPanel(param1:CommonEvent) : void
      {
         this.view.showChooseCardPanel();
      }
      
      private function onInitChooseCardPanelWithEndlessTD(param1:CommonEvent) : void
      {
         this.view.showChooseCardPanelWithEndlessTD();
      }
   }
}
