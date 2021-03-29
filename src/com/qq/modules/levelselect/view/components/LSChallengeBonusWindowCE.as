package com.qq.modules.levelselect.view.components
{
   import asgui.containers.Canvas;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   
   public class LSChallengeBonusWindowCE extends QCanvas
   {
       
      
      public var img_bk:Image;
      
      public var l_title:Label;
      
      public var cv_tabPanel:Canvas;
      
      public function LSChallengeBonusWindowCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : LSChallengeBonusWindowMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 888;
         this.height = 550;
         this.scrollRectEnabled = false;
         this.img_bk = new Image();
         this.img_bk.width = 888;
         this.img_bk.height = 550;
         this.img_bk.source = AssetManager.GetClass("LS_Challenge_Bonus_bk");
         this.img_bk.x = 0;
         this.img_bk.y = 0;
         this.img_bk.id = "img_bk";
         this.img_bk.scrollRectEnabled = false;
         this.addChild(this.img_bk);
         this.l_title = new Label();
         this.l_title.text = "挑战关奖励";
         this.l_title.styleName = ".TXT_HKHB_30_Black_BrownBorder";
         this.l_title.x = 380;
         this.l_title.y = 32;
         this.l_title.width = 160;
         this.l_title.height = 40;
         this.l_title.id = "l_title";
         this.l_title.hcenter = 0;
         this.addChild(this.l_title);
         this.cv_tabPanel = new Canvas();
         this.cv_tabPanel.width = 720;
         this.cv_tabPanel.height = 435;
         this.cv_tabPanel.x = 151;
         this.cv_tabPanel.y = 99;
         this.cv_tabPanel.id = "cv_tabPanel";
         this.addChild(this.cv_tabPanel);
      }
      
      override public function Dispose() : void
      {
         this.img_bk = null;
         this.l_title = null;
         this.cv_tabPanel = null;
         super.Dispose();
      }
   }
}
