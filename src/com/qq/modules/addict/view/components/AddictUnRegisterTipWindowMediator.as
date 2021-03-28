package com.qq.modules.addict.view.components
{
   import asgui.managers.PopUpManager;
   import com.qq.GameGloble;
   import com.qq.constant.addict.AddictConstant;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.main.server.ErrorHanderManager;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.UtilsManager;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class AddictUnRegisterTipWindowMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:AddictUnRegisterTipWindow;
      
      private var _timer:Timer;
      
      private var _counter:int;
      
      private var _type:int;
      
      private var _isJumpUrl:Boolean;
      
      public function AddictUnRegisterTipWindowMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this._counter = 10;
         this._timer = new Timer(1000,0);
      }
      
      override public function reset(param1:Object = null) : void
      {
         var _loc2_:String = null;
         super.reset(param1);
         this._type = int(param1);
         var _loc3_:Boolean = true;
         this._isJumpUrl = false;
         switch(this._type)
         {
            case AddictConstant.Addict_1_Hour_Tip:
               _loc2_ = FontNormal.Addict_1_Hour_Tip;
               _loc3_ = false;
               break;
            case AddictConstant.Addict_2_Hour_Tip:
               _loc2_ = FontNormal.Addict_2_Hour_Tip;
               _loc3_ = false;
               break;
            case AddictConstant.Addict_3_Hour_Tip:
               _loc2_ = FontNormal.Addict_3_Hour_Tip;
               break;
            case AddictConstant.Addict_4_Hour_Tip:
               _loc2_ = FontNormal.Addict_4_Hour_Tip;
               break;
            case AddictConstant.Addict_5_Hour_Tip:
               _loc2_ = FontNormal.Addict_5_Hour_Tip;
               break;
            case AddictConstant.UnRegister:
               _loc2_ = FontNormal.Addict_UnRegister_Tip;
               this._isJumpUrl = true;
               break;
            case AddictConstant.NotAdult:
               _loc2_ = FontNormal.Addict_Not_Adult;
               this._isJumpUrl = true;
               break;
            default:
               _loc2_ = "";
         }
         if(this._type == AddictConstant.UnRegister)
         {
            addComponentListener(this.view.btnClose,MouseEvent.CLICK,this.onClick);
         }
         else
         {
            removeComponentListener(this.view.btnClose,MouseEvent.CLICK,this.onClick);
         }
         this.view.contentText.htmlText = _loc2_;
         if(_loc3_)
         {
            this.view.contentText.SetStyle("textAlign","left");
         }
         else
         {
            this.view.contentText.SetStyle("textAlign","center");
         }
         this.onResize(null);
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         addComponentListener(this.view.okBtn,MouseEvent.CLICK,this.onClick);
         addComponentListener(GameGloble.stage,Event.RESIZE,this.onResize);
      }
      
      private function onResize(param1:Event) : void
      {
         this.view.x = (GameGloble.stage.stageWidth - this.view.width) * 0.5;
         this.view.y = (GameGloble.stage.stageHeight - this.view.height) * 0.5;
      }
      
      override protected function initialized() : void
      {
         super.initialized();
         this.update();
         this._timer.start();
      }
      
      private function update() : void
      {
         this.view.leftTimeTipLabel.text = "";
      }
      
      private function onClick(param1:Event) : void
      {
         if(this._type == AddictConstant.Addict_5_Hour_Tip)
         {
            ErrorHanderManager.gotoHome(null);
         }
         else
         {
            this.onClose();
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         this.onResize(null);
      }
      
      override public function dispose() : void
      {
         if(this._timer != null)
         {
            this._timer.reset();
            this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer = null;
         }
         super.dispose();
      }
      
      private function onClose() : void
      {
         PopUpManager.RemovePopUp(this.view);
         if(this._isJumpUrl)
         {
            UtilsManager.gotoUrl("http://jkyx.qq.com","_self");
         }
      }
   }
}
