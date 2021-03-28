package com.qq.modules.td.view.components
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.templates.font.FontHKHB;
   
   public class TDEndlessScorePanelMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDEndlessScorePanel;
      
      public function TDEndlessScorePanelMediator()
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
         addContextListener(CommandName.TD_ChangeEndlessScore,this.onChangeScore);
      }
      
      private function onChangeScore(param1:CommonEvent) : void
      {
         this.view.label_score.text = FontHKHB.TD_MiniGame_Score + TDGameInfo.getInstance().endlessScore.get();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
