package com.qq.modules.td.view.components
{
   import asgui.utils.StringUtil;
   import com.qq.CommandName;
   import com.qq.constant.td.TDChallengeScoreType;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.logic.TDChallengeScoreManager;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.DelayManager;
   
   public class TDChallengeScorePanelMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDChallengeScorePanel;
      
      private var m_delayId:int;
      
      public function TDChallengeScorePanelMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         if(TDStageInfo.getInstance().challengeAchiTimeLimit > 0 || TDStageInfo.getInstance().challengeAchiTimeRecord > 0)
         {
            this.view.label_countDown.visible = true;
         }
         else
         {
            this.view.label_countDown.visible = false;
         }
         this.view.label_countDown.text = "";
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TD_Challenge_Score_Changed,this.onChangeScore);
         addContextListener(CommandName.TD_STOP_CHALLENGE_TIME_RECORD,this.onStopChallengeTimeRecord);
         addContextListener(CommandName.TDMiniGame_CoconutCannon_ChangeScore,this.onCoconutCannonAttack);
         addContextListener(CommandName.TD_READY_ENDGAME,this.onReadyEndGame);
         this.m_delayId = DelayManager.getInstance().addDelay(1000,this.onCountDown,true);
      }
      
      private function onReadyEndGame(param1:CommonEvent) : void
      {
         var _loc2_:int = 0;
         if(TDChallengeScoreManager.instance.isRegisterByType(TDChallengeScoreType.Cannon_Kill_Num))
         {
            _loc2_ = TDChallengeScoreManager.instance.getCntByType(TDChallengeScoreType.Cannon_Kill_Combo_Num).get();
            TDChallengeScoreManager.instance.setScoreByType(TDChallengeScoreType.Cannon_Kill_Num,_loc2_);
         }
      }
      
      private function onCoconutCannonAttack(param1:CommonEvent) : void
      {
         var _loc2_:int = param1.param as int;
         TDChallengeScoreManager.instance.addScoreByType(TDChallengeScoreType.Cannon_Kill_Combo_Num,_loc2_);
      }
      
      private function onCountDown() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.view.label_countDown.visible)
         {
            if(TDStageInfo.getInstance().challengeAchiTimeLimit > 0)
            {
               _loc1_ = TDStageInfo.getInstance().challengeAchiTimeLimit * 1000 - TDGameInfo.getInstance().getCurGameTime();
               if(_loc1_ < 0)
               {
                  _loc1_ = 0;
               }
               _loc2_ = _loc1_ / 1000 / 60;
               _loc3_ = _loc1_ / 1000 % 60;
               if(TDStageInfo.getInstance().challengeAchiTimeRecord > 0)
               {
                  this.view.label_countDown.text = StringUtil.substitute(FontHKHB.TD_CHALLENGE_COUNTDOWN_1,_loc2_ + ":" + _loc3_);
               }
               else
               {
                  this.view.label_countDown.text = StringUtil.substitute(FontHKHB.TD_CHALLENGE_COUNTDOWN,_loc2_ + ":" + _loc3_);
               }
            }
            else if(TDStageInfo.getInstance().challengeAchiTimeRecord > 0)
            {
               _loc1_ = TDGameInfo.getInstance().getCurGameTime();
               _loc2_ = _loc1_ / 1000 / 60;
               _loc3_ = _loc1_ / 1000 % 60;
               if(TDStageInfo.getInstance().challengeAchiTimeRecord > 0)
               {
                  this.view.label_countDown.text = StringUtil.substitute(FontHKHB.TD_CHALLENGE_COUNTDOWN_1,_loc2_ + ":" + _loc3_);
               }
               else
               {
                  this.view.label_countDown.text = StringUtil.substitute(FontHKHB.TD_CHALLENGE_COUNTDOWN,_loc2_ + ":" + _loc3_);
               }
            }
         }
      }
      
      private function onChangeScore(param1:CommonEvent) : void
      {
         this.view.label_score.text = FontHKHB.TD_MiniGame_Score + TDStageInfo.getInstance().challengeScore.get();
      }
      
      private function onStopChallengeTimeRecord(param1:CommonEvent) : void
      {
         if(TDStageInfo.getInstance().challengeAchiTimeRecord > 0)
         {
            DelayManager.getInstance().removeDelay(this.m_delayId);
         }
      }
      
      override public function dispose() : void
      {
         DelayManager.getInstance().removeDelay(this.m_delayId);
         super.dispose();
      }
   }
}
