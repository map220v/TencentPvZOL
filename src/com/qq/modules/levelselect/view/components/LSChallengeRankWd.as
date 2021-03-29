package com.qq.modules.levelselect.view.components
{
   import asgui.containers.Canvas;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   public class LSChallengeRankWd extends LSChallengeRankWdCE
   {
       
      
      public var panelCanv:Canvas;
      
      public var closeBtn:SimpleButton;
      
      public var tab_1:MovieClip;
      
      public var tab_2:MovieClip;
      
      public var levelId:int;
      
      public var subLevelId:int;
      
      public var challengeId:int;
      
      public var selectTab:int;
      
      public function LSChallengeRankWd(param1:int, param2:int, param3:int, param4:int = 1)
      {
         this.levelId = param1;
         this.subLevelId = param2;
         this.challengeId = param3;
         this.selectTab = param4;
         super(LSChallengeRankWdMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         btnLeft.buttonMode = true;
         btnRight.buttonMode = true;
         btnEnd.buttonMode = true;
         btnStart.buttonMode = true;
         this.panelCanv = new Canvas();
         addChild(this.panelCanv);
         this.panelCanv.x = 9;
         this.panelCanv.y = 43;
         this.closeBtn = this.imageBG.mcHolder["close_btn"];
         this.tab_1 = this.imageBG.mcHolder["tab_1"];
         this.tab_2 = this.imageBG.mcHolder["tab_2"];
         this.tab_1.buttonMode = true;
         this.tab_2.buttonMode = true;
         this.l_tab_1.mouseEnabled = this.l_tab_1.mouseChildren = false;
         this.l_tab_2.mouseEnabled = this.l_tab_2.mouseChildren = false;
      }
   }
}
