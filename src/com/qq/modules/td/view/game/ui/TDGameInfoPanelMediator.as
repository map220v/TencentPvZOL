package com.qq.modules.td.view.game.ui
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenSupportStarlingMediator;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class TDGameInfoPanelMediator extends BasicScreenSupportStarlingMediator
   {
       
      
      [Inject]
      public var view:TDGameInfoPanel;
      
      public function TDGameInfoPanelMediator()
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
         addContextListener(CommandName.TD_ChangeSun,this.updateSun,CommonEvent);
         addContextListener(CommandName.TD_ResetGameInfoPanelBG,this.onResetCardSoltBG,CommonEvent);
         addContextListener(CommandName.TD_HideGameInfoPanel,this.onHideGameInfoPanel,CommonEvent);
         addContextListener(CommandName.TDGameEnter_StartReadyTDGame,this.onEnterChooseCardScreen,CommonEvent);
         addContextListener(CommandName.TDGameEvent_StartInitUI,this.onStartInitUI,CommonEvent);
         addContextListener(CommandName.TD_hideUI,this.onHideUI,CommonEvent);
         addContextListener(CommandName.TD_showUI,this.onShowUI,CommonEvent);
      }
      
      private function onHideUI(param1:Event) : void
      {
         this.view.setVisible(false);
      }
      
      private function onShowUI(param1:Event) : void
      {
         this.view.setVisible(true);
      }
      
      private function onStartInitUI(param1:Event) : void
      {
         this.view.setVisible(true);
      }
      
      private function onHideGameInfoPanel(param1:Event) : void
      {
         this.view.setVisible(false);
      }
      
      private function updateSun(param1:Event) : void
      {
      }
      
      private function onResetCardSoltBG(param1:Event) : void
      {
         this.view.setVisible(false);
         var _loc2_:int = TDGameInfo.getInstance().normalCardsData.maxSlotNum - 1;
      }
      
      private function onEnterChooseCardScreen(param1:CommonEvent) : void
      {
         this.view.y = 0;
         this.view.setVisible(true);
      }
      
      private function onClickShovelBtn(param1:Event) : void
      {
      }
   }
}
