package com.qq.modules.td.view.ui.mini
{
   import asgui.controls.Label;
   import com.qq.display.QCanvas;
   
   public class TDMusicGameScorePanelCE extends QCanvas
   {
       
      
      public var label_score:Label;
      
      public function TDMusicGameScorePanelCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : TDMusicGameScorePanelMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 400;
         this.height = 400;
         this.enabled = false;
         this.label_score = new Label();
         this.label_score.x = 175;
         this.label_score.y = 18;
         this.label_score.width = 248;
         this.label_score.height = 30;
         this.label_score.id = "label_score";
         this.label_score.hcenter = 0;
         this.label_score.text = "222222";
         this.addChild(this.label_score);
      }
      
      override public function Dispose() : void
      {
         this.label_score = null;
         super.Dispose();
      }
   }
}
