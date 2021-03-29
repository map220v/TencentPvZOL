package com.qq.modules.levelselect.view.components
{
   import asgui.containers.Canvas;
   import asgui.containers.HBox;
   import asgui.containers.VBox;
   import asgui.controls.Button;
   import asgui.controls.Label;
   
   public class LSLevelChallengeWd extends LSLevelChallengeWdCE
   {
       
      
      public var stageId:int;
      
      public var levelId:int;
      
      public var subLevelId:int;
      
      public var btnWinDebug:Button;
      
      public var txtBonusCoin:Label;
      
      public var firstCoin:Label;
      
      public var boxAch:HBox;
      
      public var panelRightBox:VBox;
      
      public var panelItemsBox:VBox;
      
      public var plantCav:Canvas;
      
      public function LSLevelChallengeWd(param1:int, param2:int, param3:int = 1)
      {
         this.subLevelId = param3;
         this.levelId = param2;
         this.stageId = param1;
         super(LSLevelChallengeWdMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.btnWinDebug = new Button();
         this.btnWinDebug.label = "模拟胜利";
         this.btnWinDebug.bottom = 0;
         this.btnWinDebug.right = 0;
         this.btnWinDebug.visible = false;
         this.addChild(this.btnWinDebug);
         this.label_329.SetStyle("color","#663300");
         this.label_329.SetStyle("fontSize","14");
         this.label_329.SetStyle("textShadowStrength","0");
         this.label_335.SetStyle("color","#663300");
         this.label_335.SetStyle("fontSize","14");
         this.label_335.SetStyle("textShadowStrength","0");
         this.label_332.SetStyle("color","#a9ff8d");
         this.panelRightBox = new VBox();
         this.panelRightBox.width = 104;
         this.panelRightBox.height = 70;
         this.panelRightBox.top = 70;
         this.panelRightBox.left = 40;
         this.panelRightBox.SetStyle("verticalGap","5");
         addChild(this.panelRightBox);
         this.panelItemsBox = new VBox();
         this.panelItemsBox.width = 104;
         this.panelItemsBox.height = 70;
         this.panelItemsBox.top = 70;
         this.panelItemsBox.left = 150;
         this.panelItemsBox.SetStyle("verticalGap","5");
         this.panelItemsBox.scrollRectEnabled = false;
         addChild(this.panelItemsBox);
         this.plantCav = new Canvas();
         this.plantCav.width = 88;
         this.plantCav.height = 88;
         this.plantCav.x = 210;
         this.plantCav.top = 34;
         this.plantCav.scrollRectEnabled = false;
         addChild(this.plantCav);
         this.firstCoin = new Label();
         this.firstCoin.styleName = ".TXT_Brown_Value_16";
         this.firstCoin.SetStyle("textShadowColor","#452B12");
         this.firstCoin.SetStyle("textShadowBlurX","4");
         this.firstCoin.SetStyle("textShadowBlurY","4");
         this.firstCoin.SetStyle("fontSize","14");
         this.firstCoin.top = 75;
         this.firstCoin.x = 324;
         this.firstCoin.width = 260;
         addChild(this.firstCoin);
         this.txtBonusCoin = new Label();
         this.txtBonusCoin.styleName = ".TXT_Brown_Value_16";
         this.txtBonusCoin.SetStyle("textShadowColor","#452B12");
         this.txtBonusCoin.SetStyle("textShadowBlurX","4");
         this.txtBonusCoin.SetStyle("textShadowBlurY","4");
         this.txtBonusCoin.SetStyle("fontSize","14");
         this.txtBonusCoin.top = 105;
         this.txtBonusCoin.x = 324;
         this.txtBonusCoin.width = 260;
         addChild(this.txtBonusCoin);
         this.boxAch = new HBox();
         this.boxAch.width = 360;
         this.boxAch.height = 90;
         this.boxAch.hcenter = -5;
         this.boxAch.bottom = 264.5;
         this.boxAch.SetStyle("paddingTop","0");
         this.boxAch.SetStyle("horizontalGap","59");
         this.boxAch.SetStyle("horizontalAlign","center");
         this.boxAch.SetStyle("verticalAlign","center");
         addChild(this.boxAch);
         this.imgBtnChallenge.buttonMode = true;
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
   }
}
