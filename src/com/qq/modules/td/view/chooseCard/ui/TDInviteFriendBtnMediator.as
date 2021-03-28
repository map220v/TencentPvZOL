package com.qq.modules.td.view.chooseCard.ui
{
   import com.qq.modules.basic.view.BasicScreenMediator;
   import flash.events.MouseEvent;
   
   public class TDInviteFriendBtnMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDInviteFriendBtn;
      
      public function TDInviteFriendBtnMediator()
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
         addComponentListener(this.view.button_10,MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
