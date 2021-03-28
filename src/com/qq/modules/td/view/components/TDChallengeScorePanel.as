package com.qq.modules.td.view.components
{
   import asgui.controls.Label;
   import com.qq.GameGloble;
   import com.qq.display.QCanvas;
   import com.qq.modules.td.view.game.layer.ITDLocationUpdatable;
   import com.qq.templates.font.FontHKHB;
   import flash.geom.Point;
   
   public class TDChallengeScorePanel extends QCanvas implements ITDLocationUpdatable
   {
       
      
      public var label_score:Label;
      
      public var label_countDown:Label;
      
      public function TDChallengeScorePanel(param1:Class = null)
      {
         super(TDChallengeScorePanelMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 1200;
         this.height = 400;
         this.enabled = false;
         this.label_score = new Label();
         this.label_score.x = 500;
         this.label_score.y = 58;
         this.label_score.width = 300;
         this.label_score.height = 30;
         this.label_score.text = FontHKHB.TD_MiniGame_Score + 0;
         this.label_score.styleName = ".Label_MiniGame_Score";
         this.addChild(this.label_score);
         this.label_countDown = new Label();
         this.label_countDown.x = 700;
         this.label_countDown.y = 58;
         this.label_countDown.width = 350;
         this.label_countDown.height = 30;
         this.label_countDown.text = FontHKHB.TD_CHALLENGE_COUNTDOWN;
         this.label_countDown.styleName = ".Label_MiniGame_Score";
         this.label_countDown.toolTip = "本关只记录倒计时结束前的成就分数";
         this.addChild(this.label_countDown);
      }
      
      public function updateLocation() : void
      {
         var _loc1_:Point = new Point((GameGloble.stage.stageWidth - this.width) * 0.5 + 50,10);
         _loc1_ = this.parent.globalToLocal(_loc1_);
         this.x = _loc1_.x;
         this.y = _loc1_.y;
      }
   }
}
