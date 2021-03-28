package com.qq.modules.td.view.chooseCard.selfCard
{
   import asgui.containers.Canvas;
   import asgui.containers.HBox;
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.constant.ResLibID;
   import com.qq.display.QPanel;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.TDStartParam;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.ResLibManager;
   import flash.display.MovieClip;
   
   public class TDChooseCardPanel extends QPanel
   {
       
      
      public var cardAllListPanel:TDCardAllListPanel;
      
      public var cardChoosenListPanel:TDCardChoosenListPanel;
      
      public var externCardChoosenListPanel:TDExternCardChoosenListPanel;
      
      public var cardUnlockPanel:TDUnlockCardPanel;
      
      public var bg:Canvas;
      
      public var okBtn:Button;
      
      public var privilegeImageBtn:Image;
      
      public var privilegeLightMC:MovieClip;
      
      public var privilegeWordMC:MovieClip;
      
      public var collectSunMC:Image;
      
      public var selectCBSun:MovieClip;
      
      public var openPayAlertMC:Image;
      
      public var selectCBPay:MovieClip;
      
      public var diamondBar:TDRoleDiamondBar;
      
      public var achievementBox:HBox;
      
      public function TDChooseCardPanel()
      {
         super(TDChooseCardPanelMediator);
      }
      
      override public function InitializeComponent() : void
      {
         var _loc1_:Image = null;
         super.InitializeComponent();
         this.styleName = "Window";
         this.SetStyle("paddingLeft","0");
         this.SetStyle("paddingRight","0");
         this.width = 536;
         this.height = 551;
         this.bg = new Canvas();
         this.addChild(this.bg);
         this.cardChoosenListPanel = new TDCardChoosenListPanel();
         this.addChild(this.cardChoosenListPanel);
         this.externCardChoosenListPanel = new TDExternCardChoosenListPanel();
         this.addChild(this.externCardChoosenListPanel);
         this.cardAllListPanel = new TDCardAllListPanel();
         this.cardAllListPanel.name = "cardListPanel";
         this.cardAllListPanel.x = 15;
         this.cardAllListPanel.y = 123;
         this.cardAllListPanel.width = 505;
         this.cardAllListPanel.height = 220;
         this.addChild(this.cardAllListPanel);
         this.cardUnlockPanel = new TDUnlockCardPanel();
         this.cardUnlockPanel.name = "cardUnlockPanel";
         this.cardUnlockPanel.x = 15;
         this.cardUnlockPanel.y = 353;
         this.cardUnlockPanel.width = 505;
         this.cardUnlockPanel.height = 180;
         this.addChild(this.cardUnlockPanel);
         this.cardUnlockPanel.visible = false;
         this.okBtn = new Button();
         this.okBtn.width = 156;
         this.okBtn.bottom = 10;
         this.okBtn.hcenter = 0;
         this.addChild(this.okBtn);
         _loc1_ = new Image();
         _loc1_.source = AssetManager.getInstance().GetClass("TD_UI_chooseCardBG");
         addChild(_loc1_);
         _loc1_.y = 91;
         _loc1_.x = 7;
         this.bg.styleName = ".HBox_Gray_With_Leaves";
         this.bg.width = 538;
         this.bg.height = 340;
         this.bg.y = 100;
         this.achievementBox = new HBox();
         addChild(this.achievementBox);
         this.achievementBox.y = 360;
         this.achievementBox.width = 500;
         this.achievementBox.height = 50;
         this.achievementBox.x = 63;
         this.okBtn.styleName = ".GreenButton";
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Daily)
         {
            this.okBtn.label = FontHKHB.TXT_StartFight;
         }
         else
         {
            this.okBtn.label = FontHKHB.TXT_nextStep;
         }
         this.privilegeImageBtn = new Image();
         this.privilegeImageBtn.source = ResLibManager.getInstance().getClassFromRes("TD_UI_PrivilegeBtn",ResLibID.TDRes);
         this.privilegeImageBtn.bottom = -60;
         this.privilegeImageBtn.left = 65;
         this.addChild(this.privilegeImageBtn);
         this.privilegeImageBtn.buttonMode = true;
         this.privilegeLightMC = this.privilegeImageBtn.mcHolder["mcLight"];
         this.privilegeLightMC.visible = false;
         this.privilegeWordMC = this.privilegeImageBtn.mcHolder["mcWord"];
         this.collectSunMC = new Image();
         this.collectSunMC.source = ResLibManager.getInstance().getClassFromRes("TD_UI_AutoCollectSunBg",ResLibID.TDRes);
         this.collectSunMC.right = 25;
         this.collectSunMC.bottom = 35;
         this.addChild(this.collectSunMC);
         var _loc2_:Label = new Label();
         _loc2_.width = 100;
         _loc2_.styleName = ".TXT_HKHB_16_Yellow_Shadow_left";
         _loc2_.text = FontHKHB.TD_PRIVILEGE_CHECKBOX_WORD_SUN;
         this.collectSunMC.addChild(_loc2_);
         _loc2_.x = 23;
         this.selectCBSun = this.collectSunMC.mcHolder["cbSelect"];
         this.selectCBSun.buttonMode = true;
         this.openPayAlertMC = new Image();
         this.openPayAlertMC.source = ResLibManager.getInstance().getClassFromRes("TD_UI_AutoCollectSunBg",ResLibID.TDRes);
         this.openPayAlertMC.right = 25;
         this.openPayAlertMC.bottom = 5;
         this.addChild(this.openPayAlertMC);
         this.openPayAlertMC.toolTip = "购买阳光、能量豆、小推车、额外一次挑战次数时会有提示，三个炸弹植物不会有提示";
         var _loc3_:Label = new Label();
         _loc3_.width = 100;
         _loc3_.styleName = ".TXT_HKHB_16_Yellow_Shadow_left";
         _loc3_.text = FontHKHB.TD_PRIVILEGE_CHECKBOX_WORD_ALERT;
         this.openPayAlertMC.addChild(_loc3_);
         _loc3_.x = 23;
         this.selectCBPay = this.openPayAlertMC.mcHolder["cbSelect"];
         this.selectCBPay.buttonMode = true;
         this.diamondBar = new TDRoleDiamondBar();
         this.diamondBar.right = 55;
         this.diamondBar.bottom = 40;
         this.diamondBar.scaleX = this.diamondBar.scaleY = 1;
         this.addChild(this.diamondBar);
         this.diamondBar.visible = false;
         this.title = FontHKHB.TITLE_YOUR_PLANT;
      }
      
      public function setTxt(param1:Button, param2:String) : void
      {
         if(param1.hasOwnProperty("label"))
         {
            param1.label = param2;
         }
      }
      
      public function setUnlockPanelVisible(param1:Boolean) : void
      {
         this.cardUnlockPanel.visible = param1;
         this.externCardChoosenListPanel.visible = param1;
         this.privilegeImageBtn.visible = param1;
         this.collectSunMC.visible = param1;
         if(param1)
         {
            this.height = 631;
            this.bg.height = 420;
            this.achievementBox.y = 450;
         }
         else
         {
            this.height = 551;
            this.bg.height = 340;
            this.achievementBox.y = 360;
         }
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
   }
}
