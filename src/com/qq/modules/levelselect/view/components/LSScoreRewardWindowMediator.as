package com.qq.modules.levelselect.view.components
{
   import PVZ.Cmd.Cmd_TD_ReportLevelResult_SC;
   import asgui.managers.PopUpManager;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.levelselect.command.LSViewCmd;
   import flash.events.MouseEvent;
   
   public class LSScoreRewardWindowMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:LSScoreRewardWindow;
      
      public function LSScoreRewardWindowMediator()
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
         addComponentListener(this.view.btnClose,MouseEvent.CLICK,this.onBtnCloseClick);
         addComponentListener(this.view.btnGO,MouseEvent.CLICK,this.onBtnGOClick);
      }
      
      private function onBtnCloseClick(param1:MouseEvent) : void
      {
         this.close();
      }
      
      private function onBtnGOClick(param1:MouseEvent) : void
      {
         LSViewCmd.showChallengeBonusWd(2);
         this.close();
      }
      
      override public function reset(param1:Object = null) : void
      {
         var _loc2_:Cmd_TD_ReportLevelResult_SC = param1 as Cmd_TD_ReportLevelResult_SC;
         this.view.txtNewScore.text = _loc2_.toScore.toString();
         this.view.txtOldScore.text = _loc2_.fromScore.toString();
         this.view.goldCount = _loc2_.promotionReward;
      }
      
      private function close() : void
      {
         PopUpManager.RemovePopUp(this.view);
         this.view.Dispose();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
