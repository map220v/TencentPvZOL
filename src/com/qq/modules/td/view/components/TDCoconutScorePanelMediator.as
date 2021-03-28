package com.qq.modules.td.view.components
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import com.qq.modules.td.logic.trigger.events.TriggerEvent;
   import com.qq.modules.td.model.TDMiniGameCoconutCannonData;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.CommandDispatcher;
   
   public class TDCoconutScorePanelMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDCoconutScorePanel;
      
      public function TDCoconutScorePanelMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this.view.label_needScore.text = FontHKHB.TD_MIMINIGAME_TARGETSCORE + TDStageInfo.getInstance().needScore.get();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TDMiniGame_CoconutCannon_ChangeScore,this.onBeAttacked);
      }
      
      private function onBeAttacked(param1:CommonEvent) : void
      {
         TDMiniGameCoconutCannonData.getInstance().addAttack(param1.param as int);
         this.view.label_score.text = FontHKHB.TD_MiniGame_Score + TDMiniGameCoconutCannonData.getInstance().totalScore;
         CommandDispatcher._dispatcher.dispatchEvent(new TriggerEvent(TDTrigConst.TYPE_COCONUT_CANNON_GAME_SCORE));
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
