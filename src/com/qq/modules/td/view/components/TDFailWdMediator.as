package com.qq.modules.td.view.components
{
   import asgui.managers.PopUpManager;
   import com.qq.GameGloble;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.plantTalent.service.PlantTalentService;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.command.game.TDGameFlowCmd;
   import com.qq.modules.td.model.TDStageInfo;
   import flash.events.MouseEvent;
   
   public class TDFailWdMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDFailWd;
      
      [Inject]
      public var ptService:PlantTalentService;
      
      public function TDFailWdMediator()
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
         addComponentListener(this.view.btnTalent,MouseEvent.CLICK,this.onClick);
         addComponentListener(this.view.btnRestart,MouseEvent.CLICK,this.onClick);
         addComponentListener(this.view.btnExit,MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:uint = 0;
         this.closeWd();
         switch(param1.currentTarget)
         {
            case this.view.btnTalent:
               if(!GameGloble.isGuildTD(TDStageInfo.getInstance().stageID))
               {
                  _loc2_ = TDStageInfo.getInstance().stageID;
                  this.ptService.initEnterTalentStageId = _loc2_;
                  GameFlowCmd.gotoPlantTalent();
               }
               break;
            case this.view.btnRestart:
               TDGameFlowCmd.restartGame();
               break;
            case this.view.btnExit:
               TDGameCmd.exitGame();
         }
      }
      
      private function closeWd() : void
      {
         PopUpManager.impl.RemovePopUp(this.view);
         this.view.Dispose();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
