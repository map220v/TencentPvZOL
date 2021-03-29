package com.qq.modules.map.view.components
{
   import com.qq.modules.bag.command.BagViewCmd;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.embattle.command.EmbattleCmd;
   import com.qq.modules.exped.command.ExpedViewCmd;
   import com.qq.modules.mail.command.MailCmd;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.map.MapGlobals;
   import com.qq.modules.mapinfo.command.MapInfoViewCmd;
   import com.qq.modules.preview.command.PreviewViewCmd;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class MapUIMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:MapUI;
      
      public function MapUIMediator()
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
         this.addComponentListener(this.view.btnPreview,MouseEvent.CLICK,this.clickHandler);
         this.addComponentListener(this.view.btnExit,MouseEvent.CLICK,this.clickHandler);
         this.addComponentListener(this.view.btnSwitch,MouseEvent.CLICK,this.clickHandler);
         this.addComponentListener(this.view.btnMail,MouseEvent.CLICK,this.clickHandler);
         this.addComponentListener(this.view.btnExped,MouseEvent.CLICK,this.clickHandler);
         this.addComponentListener(this.view.btnMylineup,MouseEvent.CLICK,this.clickHandler);
         this.addComponentListener(this.view.btnBag,MouseEvent.CLICK,this.clickHandler);
         this.addContextListener(MapGlobals.MAP_DO_SHOW_UI,this.onMAP_DO_SHOW_UI);
         this.addContextListener(MapGlobals.MAP_DO_HIDE_UI,this.onMAP_DO_HIDE_UI);
      }
      
      private function onMAP_DO_SHOW_UI(param1:Event) : void
      {
         this.view.visible = true;
      }
      
      private function onMAP_DO_HIDE_UI(param1:Event) : void
      {
         this.view.visible = false;
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.view.btnBag:
               BagViewCmd.start();
               break;
            case this.view.btnExit:
               GameFlowCmd.gotoCity();
               break;
            case this.view.btnPreview:
               PreviewViewCmd.openPreviewWindow();
               break;
            case this.view.btnSwitch:
               MapInfoViewCmd.showSwitchChapterWnd();
               break;
            case this.view.btnMail:
               MailCmd.openMailWin();
               break;
            case this.view.btnExped:
               ExpedViewCmd.openExpedWindow();
               break;
            case this.view.btnMylineup:
               EmbattleCmd.embattleByMap();
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
