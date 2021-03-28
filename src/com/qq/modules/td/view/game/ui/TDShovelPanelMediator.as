package com.qq.modules.td.view.game.ui
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenSupportStarlingMediator;
   import com.qq.modules.td.command.game.drag.TDMouseActionCmd;
   import flash.events.MouseEvent;
   
   public class TDShovelPanelMediator extends BasicScreenSupportStarlingMediator
   {
       
      
      [Inject]
      public var view:TDShovelPanel;
      
      public function TDShovelPanelMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TD_Show_Shovel,this.onShowShovel,CommonEvent);
         addContextListener(CommandName.TD_Hide_Shovel,this.onHideShovel,CommonEvent);
         addContextListener(CommandName.TDGameEvent_StartTDGame,this.onStartTDGame,CommonEvent);
         addContextListener(CommandName.TDGameEvent_EnterChooseCardScreen,this.onEnterChooseCardScreen,CommonEvent);
         addComponentListener(this.view.display,MouseEvent.CLICK,this.onClickShovel,MouseEvent);
      }
      
      private function onShowShovel(param1:CommonEvent) : void
      {
         this.view.shovelView.visible = true;
      }
      
      private function onHideShovel(param1:CommonEvent) : void
      {
         this.view.shovelView.visible = false;
      }
      
      private function onStartTDGame(param1:CommonEvent) : void
      {
         this.view.setVisible(true);
      }
      
      private function onEnterChooseCardScreen(param1:CommonEvent) : void
      {
         this.view.setVisible(false);
      }
      
      private function onClickShovel(param1:MouseEvent) : void
      {
         TDMouseActionCmd.startUseShovel();
      }
   }
}
