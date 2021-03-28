package com.qq.modules.main.view.components
{
   import asgui.managers.PopUpManager;
   import com.qq.constant.QuickPayType;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import flash.events.MouseEvent;
   
   public class ConfirmWindowMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:ConfirmWindowCE;
      
      private var _confirmCallback:Function;
      
      private var _confirmCallbackParam:Array;
      
      private var _cancelCallback:Function;
      
      private var _cancelCallbackParam:Array;
      
      private var _quickPayType:uint;
      
      public function ConfirmWindowMediator()
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
         addComponentListener(this.view.button_ok,MouseEvent.CLICK,this.onClickOk);
         addComponentListener(this.view.button_cancel,MouseEvent.CLICK,this.onClickCancel);
      }
      
      override public function reset(param1:Object = null) : void
      {
         super.reset(param1);
         var _loc2_:Array = param1 as Array;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:String = _loc2_[0];
         this.view.textarea_desc.htmlText = _loc3_;
         this._confirmCallback = _loc2_[1];
         this._confirmCallbackParam = _loc2_[2];
         this._cancelCallback = _loc2_[3];
         this._cancelCallbackParam = _loc2_[4];
         this._quickPayType = _loc2_[5];
         if(this._quickPayType == 0)
         {
            this.view.checkbox_tip.visible = false;
            this.view.label_only_this.visible = false;
         }
         else
         {
            this.view.checkbox_tip.visible = true;
            this.view.label_only_this.visible = true;
         }
      }
      
      private function onClickOk(param1:MouseEvent) : void
      {
         if(this.view.checkbox_tip.selected && this._quickPayType != 0)
         {
            if(QuickPayType.isQuickPay(this._quickPayType))
            {
               QuickPayType.setTipOnlyThis(this._quickPayType);
            }
         }
         if(this._confirmCallback != null)
         {
            this._confirmCallback.apply(this,this._confirmCallbackParam);
         }
         PopUpManager.RemovePopUp(this.view);
      }
      
      private function onClickCancel(param1:MouseEvent) : void
      {
         if(this._cancelCallback != null)
         {
            this._cancelCallback.apply(this,this._cancelCallbackParam);
         }
         PopUpManager.RemovePopUp(this.view);
      }
      
      override public function dispose() : void
      {
         this._confirmCallback = null;
         this._confirmCallbackParam = null;
         this._cancelCallback = null;
         this._cancelCallbackParam = null;
         super.dispose();
      }
   }
}
