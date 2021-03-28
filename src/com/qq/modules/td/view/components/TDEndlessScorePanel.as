package com.qq.modules.td.view.components
{
   import asgui.controls.Label;
   import com.qq.GameGloble;
   import com.qq.display.QCanvas;
   import com.qq.modules.td.view.game.layer.ITDLocationUpdatable;
   import com.qq.templates.font.FontHKHB;
   import flash.geom.Point;
   
   public class TDEndlessScorePanel extends QCanvas implements ITDLocationUpdatable
   {
       
      
      public var label_score:Label;
      
      public function TDEndlessScorePanel()
      {
         super(TDEndlessScorePanelMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 900;
         this.height = 400;
         this.enabled = false;
         this.label_score = new Label();
         this.label_score.x = 500;
         this.label_score.y = 18;
         this.label_score.width = 300;
         this.label_score.height = 30;
         this.label_score.text = FontHKHB.TD_MiniGame_Score + 0;
         this.label_score.styleName = ".Label_MiniGame_Score";
         this.addChild(this.label_score);
      }
      
      public function updateLocation() : void
      {
         var _loc1_:Point = new Point((GameGloble.stage.stageWidth - this.width) * 0.5,10);
         _loc1_ = this.parent.globalToLocal(_loc1_);
         this.x = _loc1_.x;
         this.y = _loc1_.y;
      }
   }
}
