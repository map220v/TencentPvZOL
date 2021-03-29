package com.qq.modules.levelselect.view.components
{
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.TextInput;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   import com.qq.utils.UrlManager;
   
   public class LSChallengeRankWdCE extends QCanvas
   {
       
      
      public var imageBG:Image;
      
      public var l_tab_1:Label;
      
      public var l_tab_2:Label;
      
      public var btnStart:Image;
      
      public var btnLeft:Image;
      
      public var btnRight:Image;
      
      public var btnEnd:Image;
      
      public var txtPage:Label;
      
      public var btnJump:Button;
      
      public var txtInput:TextInput;
      
      public function LSChallengeRankWdCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : LSChallengeRankWdMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 775;
         this.height = 637;
         this.imageBG = new Image();
         this.imageBG.width = 775;
         this.imageBG.height = 637;
         this.imageBG.source = AssetManager.GetClass("LS_Rank_BG");
         this.imageBG.x = 0;
         this.imageBG.y = 0;
         this.imageBG.id = "imageBG";
         this.addChild(this.imageBG);
         this.l_tab_1 = new Label();
         this.l_tab_1.text = "塔防成就排行";
         this.l_tab_1.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.l_tab_1.x = 25;
         this.l_tab_1.y = 9;
         this.l_tab_1.width = 135;
         this.l_tab_1.height = 24;
         this.l_tab_1.id = "l_tab_1";
         this.addChild(this.l_tab_1);
         this.l_tab_2 = new Label();
         this.l_tab_2.text = "挑战关卡排行";
         this.l_tab_2.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.l_tab_2.x = 185;
         this.l_tab_2.y = 8;
         this.l_tab_2.width = 135;
         this.l_tab_2.height = 24;
         this.l_tab_2.id = "l_tab_2";
         this.addChild(this.l_tab_2);
         this.btnStart = new Image();
         this.btnStart.width = 25;
         this.btnStart.height = 26;
         this.btnStart.source = UrlManager.getUrl(0,"image/rank/BTN_START.png");
         this.btnStart.id = "btnStart";
         this.btnStart.x = 265;
         this.btnStart.y = 595;
         this.addChild(this.btnStart);
         this.btnLeft = new Image();
         this.btnLeft.width = 21;
         this.btnLeft.height = 26;
         this.btnLeft.source = UrlManager.getUrl(0,"image/rank/BTN_LEFT.png");
         this.btnLeft.x = 305;
         this.btnLeft.y = 595;
         this.btnLeft.id = "btnLeft";
         this.addChild(this.btnLeft);
         this.btnRight = new Image();
         this.btnRight.width = 21;
         this.btnRight.height = 25;
         this.btnRight.source = UrlManager.getUrl(0,"image/rank/BTN_RIGHT.png");
         this.btnRight.x = 415;
         this.btnRight.y = 595;
         this.btnRight.id = "btnRight";
         this.addChild(this.btnRight);
         this.btnEnd = new Image();
         this.btnEnd.width = 25;
         this.btnEnd.height = 25;
         this.btnEnd.source = UrlManager.getUrl(0,"image/rank/BTN_END.png");
         this.btnEnd.id = "btnEnd";
         this.btnEnd.x = 455;
         this.btnEnd.y = 595;
         this.addChild(this.btnEnd);
         this.txtPage = new Label();
         this.txtPage.text = "1/1";
         this.txtPage.styleName = ".TXT_HKHB_18_Yellow_Shadow";
         this.txtPage.x = 320;
         this.txtPage.y = 599;
         this.txtPage.width = 100;
         this.txtPage.height = 24;
         this.txtPage.id = "txtPage";
         this.addChild(this.txtPage);
         this.btnJump = new Button();
         this.btnJump.x = 580;
         this.btnJump.y = 591;
         this.btnJump.width = 65;
         this.btnJump.height = 30;
         this.btnJump.id = "btnJump";
         this.btnJump.label = "跳转";
         this.btnJump.styleName = ".GreenButtonRect_font_16";
         this.addChild(this.btnJump);
         this.txtInput = new TextInput();
         this.txtInput.styleName = ".TextInput_Gray_Font_White";
         this.txtInput.x = 510;
         this.txtInput.y = 595;
         this.txtInput.width = 60;
         this.txtInput.height = 24;
         this.txtInput.id = "txtInput";
         this.txtInput.restrict = "0-9";
         this.addChild(this.txtInput);
      }
      
      override public function Dispose() : void
      {
         this.imageBG = null;
         this.l_tab_1 = null;
         this.l_tab_2 = null;
         this.btnStart = null;
         this.btnLeft = null;
         this.btnRight = null;
         this.btnEnd = null;
         this.txtPage = null;
         this.btnJump = null;
         this.txtInput = null;
         super.Dispose();
      }
   }
}
