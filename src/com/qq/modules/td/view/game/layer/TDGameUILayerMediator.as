package com.qq.modules.td.view.game.layer
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import flash.events.Event;
   
   public class TDGameUILayerMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDGameUILayer;
      
      public function TDGameUILayerMediator()
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
         addContextListener(CommandName.TD_InitTDView,this.onStartTDGame,CommonEvent);
         addContextListener(CommandName.TD_hideUI,this.onHideUI,CommonEvent);
         addContextListener(CommandName.TD_showUI,this.onShowUI,CommonEvent);
         addContextListener(CommandName.TDGameEvent_StartInitUI,this.onStartInitUI);
         addContextListener(CommandName.TD_PRIVILEGE_CHANGED,this.onPrivilegeChanged);
      }
      
      private function onHideUI(param1:Event) : void
      {
         this.view.visible = false;
      }
      
      private function onShowUI(param1:Event) : void
      {
         this.view.visible = true;
      }
      
      private function onStartTDGame(param1:CommonEvent) : void
      {
         this.view.initUI();
      }
      
      private function onStartInitUI(param1:Event) : void
      {
         this.view.updateLocation();
      }
      
      private function onPrivilegeChanged(param1:Event) : void
      {
         this.view.addSkillPlantPanel();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
