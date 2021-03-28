package com.qq.modules.td.view.ui.mini
{
   import com.greensock.TweenMax;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDMusicGameConstant;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import com.qq.modules.td.logic.trigger.events.TriggerEvent;
   import com.qq.modules.td.model.TDMiniGameMusicData;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.CommandDispatcher;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class TDMusicGameScorePanelMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDMusicGameScorePanel;
      
      public function TDMusicGameScorePanelMediator()
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
         addContextListener(CommandName.TDGameEvent_StartTDGame,this.onStartTDGame);
         addContextListener(CommandName.TDMiniGame_Music_ChangeScore,this.onChangeScore);
      }
      
      private function onStartTDGame(param1:Event) : void
      {
         var _loc2_:Point = null;
         this.view.visible = true;
         _loc2_ = new Point((GameGloble.stage.stageWidth - this.view.width) * 0.5,10);
         _loc2_ = this.view.parent.globalToLocal(_loc2_);
         this.view.x = _loc2_.x;
         this.view.y = _loc2_.y;
      }
      
      private function onChangeScore(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         if(TDStageInfo.getInstance().isChallengeLevel())
         {
            _loc2_ = TDStageInfo.getInstance().challengeScore.get();
         }
         else
         {
            _loc2_ = TDMiniGameMusicData.getInstance().totalScore;
         }
         this.view.label_score.text = FontHKHB.TD_MiniGame_Score + _loc2_;
         if(TDMiniGameMusicData.getInstance().combatNum > 0)
         {
            this.view.label_combat.text = TDMiniGameMusicData.getInstance().combatNum.toString();
         }
         else
         {
            this.view.label_combat.text = "";
         }
         switch(TDMiniGameMusicData.getInstance().lastResult)
         {
            case TDMusicGameConstant.Good:
               _loc3_ = "good";
               break;
            case TDMusicGameConstant.Miss:
               _loc3_ = "miss";
               CommandDispatcher._dispatcher.dispatchEvent(new TriggerEvent(TDTrigConst.TYPE_MGAME_MISS_NUM));
               break;
            case TDMusicGameConstant.Perfect:
               _loc3_ = "perfect";
               break;
            default:
               _loc3_ = "none";
         }
         this.view.resultMc.gotoAndStop(_loc3_);
         this.view.resultContainer.alpha = 1;
         TweenMax.killChildTweensOf(this.view);
         TweenMax.fromTo(this.view.resultContainer,0.5,{
            "scaleX":1.4,
            "scaleY":1.4
         },{
            "scaleX":1,
            "scaleY":1,
            "onComplete":this.onComplete
         });
      }
      
      private function onComplete() : void
      {
         TweenMax.fromTo(this.view.resultContainer,1,{"alpha":1},{"alpha":0});
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
