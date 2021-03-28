package com.qq.modules.td.view.ui.mini
{
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.modules.td.view.game.layer.ITDLocationUpdatable;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   
   public class TDMusicGameScorePanel extends TDMusicGameScorePanelCE implements ITDLocationUpdatable
   {
       
      
      public var resultMc:MovieClip;
      
      public var label_combat:Label;
      
      public var resultContainer:Sprite;
      
      public function TDMusicGameScorePanel()
      {
         super(TDMusicGameScorePanelMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         label_score.styleName = ".Label_MiniGame_Score";
         this.resultContainer = new Sprite();
         this.resultContainer.x = width * 0.5;
         this.resultContainer.y = label_score.y + label_score.height + 10;
         addChild(this.resultContainer);
         this.resultMc = AssetManager.instance.GetNewClass("TDUI_MusicGameResult") as MovieClip;
         this.resultMc.x = 0;
         this.resultMc.y = 30;
         this.resultMc.gotoAndStop("none");
         this.resultContainer.addChild(this.resultMc);
         this.label_combat = new Label();
         this.label_combat.width = 100;
         this.label_combat.height = 60;
         this.label_combat.x = -this.label_combat.width * 0.5;
         this.label_combat.y = this.resultMc.y + this.resultMc.height + 50;
         this.resultContainer.addChild(this.label_combat);
         this.label_combat.styleName = ".Label_MiniGame_CombatNum";
      }
      
      public function updateLocation() : void
      {
      }
   }
}
