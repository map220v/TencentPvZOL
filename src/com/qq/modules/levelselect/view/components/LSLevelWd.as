package com.qq.modules.levelselect.view.components
{
   import asgui.containers.Canvas;
   import asgui.containers.HBox;
   import asgui.containers.VBox;
   import asgui.controls.Button;
   import asgui.controls.Label;
   import com.qq.templates.font.FontHKHB;
   
   public class LSLevelWd extends LSLevelWdCE
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
      
      public function LSLevelWd(param1:int, param2:int, param3:int = 1)
      {
         this.subLevelId = param3;
         this.levelId = param2;
         this.stageId = param1;
         super(LSLevelWdMediator);
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
         topBk.title = FontHKHB.BONUS;
         l_sctgjl.SetStyle("color","#A37441");
         l_rcjl.SetStyle("color","#A37441");
         l_x1.SetStyle("textShadowColor","#452B12");
         l_x2.SetStyle("textShadowColor","#452B12");
         l_x1.SetStyle("textShadowBlurX","4");
         l_x2.SetStyle("textShadowBlurX","4");
         l_x1.SetStyle("textShadowBlurY","4");
         l_x2.SetStyle("textShadowBlurY","4");
         this.panelRightBox = new VBox();
         this.panelRightBox.width = 104;
         this.panelRightBox.height = 70;
         this.panelRightBox.top = 30;
         this.panelRightBox.left = 40;
         this.panelRightBox.SetStyle("verticalGap","5");
         topL.addChild(this.panelRightBox);
         this.panelItemsBox = new VBox();
         this.panelItemsBox.width = 104;
         this.panelItemsBox.height = 70;
         this.panelItemsBox.top = 30;
         this.panelItemsBox.left = 150;
         this.panelItemsBox.SetStyle("verticalGap","5");
         this.panelItemsBox.scrollRectEnabled = false;
         topL.addChild(this.panelItemsBox);
         this.plantCav = new Canvas();
         this.plantCav.width = 88;
         this.plantCav.height = 88;
         this.plantCav.right = 5;
         this.plantCav.top = 0;
         this.plantCav.scrollRectEnabled = false;
         topL.addChild(this.plantCav);
         this.firstCoin = new Label();
         this.firstCoin.styleName = ".TXT_Brown_Value_16";
         this.firstCoin.SetStyle("textShadowColor","#452B12");
         this.firstCoin.SetStyle("textShadowBlurX","4");
         this.firstCoin.SetStyle("textShadowBlurY","4");
         this.firstCoin.SetStyle("fontSize","14");
         this.firstCoin.top = 34;
         this.firstCoin.left = 10;
         this.firstCoin.right = 0;
         topR.addChild(this.firstCoin);
         this.txtBonusCoin = new Label();
         this.txtBonusCoin.styleName = ".TXT_Brown_Value_16";
         this.txtBonusCoin.SetStyle("textShadowColor","#452B12");
         this.txtBonusCoin.SetStyle("textShadowBlurX","4");
         this.txtBonusCoin.SetStyle("textShadowBlurY","4");
         this.txtBonusCoin.SetStyle("fontSize","14");
         this.txtBonusCoin.top = 70;
         this.txtBonusCoin.left = 10;
         this.txtBonusCoin.right = 0;
         topR.addChild(this.txtBonusCoin);
         this.boxAch = new HBox();
         this.boxAch.width = 360;
         this.boxAch.height = 90;
         this.boxAch.hcenter = -5;
         this.boxAch.bottom = 68.5;
         this.boxAch.SetStyle("paddingTop","0");
         this.boxAch.SetStyle("horizontalGap","59");
         this.boxAch.SetStyle("horizontalAlign","center");
         this.boxAch.SetStyle("verticalAlign","center");
         addChild(this.boxAch);
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
   }
}
