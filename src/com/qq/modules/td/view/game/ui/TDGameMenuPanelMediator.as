package com.qq.modules.td.view.game.ui
{
   import com.qq.managers.FilterManager;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.TDStartParam;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class TDGameMenuPanelMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDGameMenuPanel;
      
      public function TDGameMenuPanelMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Endless || TDStageInfo.getInstance().startParam.gameType == TDStartParam.Yeti)
         {
            this.view.resetBtn.mouseEnabled = this.view.resetBtn.mouseChildren = false;
            this.view.resetBtn.filters = [FilterManager.getGaryFilter()];
         }
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view.pauseBtn,MouseEvent.CLICK,this.onClick,MouseEvent);
         addComponentListener(this.view.resetBtn,MouseEvent.CLICK,this.onClick,MouseEvent);
         addComponentListener(this.view.exitBtn,MouseEvent.CLICK,this.onClick,MouseEvent);
      }
      
      private function onClick(param1:Event) : void
      {
         switch(param1.currentTarget)
         {
            case this.view.pauseBtn:
               if(!TDGameInfo.getInstance().isRunningGame)
               {
                  return;
               }
               TDGameCmd.playerPauseGame();
               break;
            case this.view.resetBtn:
               TDGameCmd.playerRestartGame();
               break;
            case this.view.exitBtn:
               TDGameCmd.playerExitGame();
         }
      }
   }
}
