package com.qq.modules.main.view.components
{
   import asgui.managers.PopUpManager;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.utils.external.QExternalUtil;
   import flash.events.MouseEvent;
   
   public class DiamondNotEnoughMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:DiamondNotEnoughCE;
      
      [Inject]
      public var actorModel:ActorModel;
      
      public function DiamondNotEnoughMediator()
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
         addComponentListener(this.view.button_recharge,MouseEvent.CLICK,this.onClickGo,MouseEvent);
         addComponentListener(this.view.button_cancel,MouseEvent.CLICK,this.onClickCancel,MouseEvent);
      }
      
      private function onClickGo(param1:MouseEvent) : void
      {
         QExternalUtil.showPay(this.actorModel.actorName);
         this.view.Dispose();
      }
      
      private function onClickCancel(param1:MouseEvent) : void
      {
         this.view.Dispose();
      }
      
      override public function dispose() : void
      {
         PopUpManager.RemovePopUp(this.view);
         super.dispose();
      }
   }
}
