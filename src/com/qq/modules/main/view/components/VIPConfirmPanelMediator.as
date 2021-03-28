package com.qq.modules.main.view.components
{
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.vip.command.VipCmd;
   import flash.events.MouseEvent;
   
   public class VIPConfirmPanelMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:VIPConfirmPanel;
      
      public function VIPConfirmPanelMediator()
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
         addComponentListener(this.view.btn_ok,MouseEvent.CLICK,this.onClickOk);
         addComponentListener(this.view.btn_vip,MouseEvent.CLICK,this.onClickVip);
      }
      
      private function onClickOk(param1:MouseEvent) : void
      {
         this.view.Close();
      }
      
      private function onClickVip(param1:MouseEvent) : void
      {
         VipCmd.openVipWinds();
         this.view.Close();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
