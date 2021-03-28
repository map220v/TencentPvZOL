package com.qq.modules.td.view.components
{
   import com.qq.CommandName;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class TDYetiKeyPanelMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDYetiKeyPanel;
      
      public function TDYetiKeyPanelMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this.view.setKeyCount(TDGameInfo.getInstance().yetiKillNum);
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TD_ChangeYetiKeyCount,this.onChangeKeyCount);
      }
      
      private function onChangeKeyCount(param1:Event) : void
      {
         this.view.setKeyCount(TDGameInfo.getInstance().yetiKillNum);
      }
   }
}
