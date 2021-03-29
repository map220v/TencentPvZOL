package com.qq.modules.levelselect.view.components
{
   import asgui.containers.Canvas;
   import asgui.containers.Panel;
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.QWindow;
   
   public class LSLevelWdCE extends QWindow
   {
       
      
      public var topBk:Panel;
      
      public var topL:Canvas;
      
      public var l_sctgjl:Label;
      
      public var l_x1:Label;
      
      public var l_x2:Label;
      
      public var topR:Canvas;
      
      public var l_rcjl:Label;
      
      public var image_104:Image;
      
      public var btnGo:Button;
      
      public function LSLevelWdCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : LSLevelWdMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.title = "关卡 2 - 2";
         this.width = 520;
         this.height = 380;
         this.topBk = new Panel();
         this.topBk.width = 490;
         this.topBk.height = 150;
         this.topBk.x = 5;
         this.topBk.y = 0;
         this.topBk.id = "topBk";
         this.topBk.styleName = ".Canvas_HeadGreen";
         this.topBk.title = "奖励";
         this.addChild(this.topBk);
         this.topL = new Canvas();
         this.topL.width = 230;
         this.topL.height = 100;
         this.topL.styleName = ".Canvas_LightBrown";
         this.topL.x = 16;
         this.topL.y = 40;
         this.topL.id = "topL";
         this.l_sctgjl = new Label();
         this.l_sctgjl.x = 10;
         this.l_sctgjl.y = 5;
         this.l_sctgjl.width = 150;
         this.l_sctgjl.height = 24;
         this.l_sctgjl.id = "l_sctgjl";
         this.l_sctgjl.text = "首次通关奖励";
         this.l_sctgjl.styleName = ".TXT_HKHB_15_White";
         this.topL.addChild(this.l_sctgjl);
         this.l_x1 = new Label();
         this.l_x1.text = "*";
         this.l_x1.styleName = ".TXT_Brown_Value_16";
         this.l_x1.x = 15;
         this.l_x1.y = 35;
         this.l_x1.width = 48;
         this.l_x1.height = 24;
         this.l_x1.id = "l_x1";
         this.topL.addChild(this.l_x1);
         this.l_x2 = new Label();
         this.l_x2.text = "*";
         this.l_x2.styleName = ".TXT_Brown_Value_16";
         this.l_x2.x = 14;
         this.l_x2.y = 65;
         this.l_x2.width = 48;
         this.l_x2.height = 24;
         this.l_x2.id = "l_x2";
         this.topL.addChild(this.l_x2);
         this.addChild(this.topL);
         this.topR = new Canvas();
         this.topR.width = 230;
         this.topR.height = 100;
         this.topR.styleName = ".Canvas_LightBrown";
         this.topR.x = 255;
         this.topR.y = 40;
         this.topR.id = "topR";
         this.l_rcjl = new Label();
         this.l_rcjl.x = 10;
         this.l_rcjl.y = 5;
         this.l_rcjl.width = 150;
         this.l_rcjl.height = 24;
         this.l_rcjl.id = "l_rcjl";
         this.l_rcjl.text = "金币奖励";
         this.l_rcjl.styleName = ".TXT_HKHB_15_White";
         this.topR.addChild(this.l_rcjl);
         this.addChild(this.topR);
         this.image_104 = new Image();
         this.image_104.width = 493;
         this.image_104.height = 129;
         this.image_104.source = AssetManager.GetClass("LS_Select_Bt_BK");
         this.image_104.x = 3;
         this.image_104.y = 152;
         this.image_104.id = "image_104";
         this.addChild(this.image_104);
         this.btnGo = new Button();
         this.btnGo.label = "开始战斗";
         this.btnGo.styleName = ".GreenButton";
         this.btnGo.x = 176;
         this.btnGo.y = 280;
         this.btnGo.width = 140;
         this.btnGo.height = 55;
         this.btnGo.id = "btnGo";
         this.addChild(this.btnGo);
      }
      
      override public function Dispose() : void
      {
         this.topBk = null;
         this.topL = null;
         this.topR = null;
         this.image_104 = null;
         this.btnGo = null;
         super.Dispose();
      }
   }
}
