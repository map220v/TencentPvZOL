package com.qq.modules.td.view.chooseCard.endlessTD
{
   import asgui.containers.Canvas;
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.constant.ResLibID;
   import com.qq.display.QPanel;
   import com.qq.modules.td.view.chooseCard.selfCard.TDRoleDiamondBar;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.ResLibManager;
   import flash.display.MovieClip;
   
   public class TDChooseCardPanelWithEndlessTD extends QPanel
   {
       
      
      public var cardAllListPanel:TDCardAllListPanelWithEndlessTD;
      
      public var cardChoosenListPanel:TDCardChoosenListPanelWithEndlessTD;
      
      public var externCardChoosenListPanel:TDExternCardChoosenListPanelWithEndless;
      
      public var cardUnlockPanel:TDUnlockCardPanelWithEndlessTD;
      
      public var bg:Canvas;
      
      public var okBtn:Button;
      
      private var waterDropImg:Image;
      
      public var txtWaterDrop:Label;
      
      public var privilegeImageBtn:Image;
      
      public var privilegeLightMC:MovieClip;
      
      public var privilegeWordMC:MovieClip;
      
      public var collectSunMC:Image;
      
      public var selectCBSun:MovieClip;
      
      public var openPayAlertMC:Image;
      
      public var selectCBPay:MovieClip;
      
      public var diamondBar:TDRoleDiamondBar;
      
      public function TDChooseCardPanelWithEndlessTD(param1:Class = null)
      {
         super(TDChooseCardPanelWithEndlessTDMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.styleName = "Window";
         this.SetStyle("paddingLeft","0");
         this.SetStyle("paddingRight","0");
         this.width = 536;
         this.height = 581;
         this.bg = new Canvas();
         this.addChild(this.bg);
         this.cardChoosenListPanel = new TDCardChoosenListPanelWithEndlessTD();
         this.addChild(this.cardChoosenListPanel);
         this.externCardChoosenListPanel = new TDExternCardChoosenListPanelWithEndless();
         this.addChild(this.externCardChoosenListPanel);
         this.cardAllListPanel = new TDCardAllListPanelWithEndlessTD();
         this.cardAllListPanel.name = "cardListPanel";
         this.cardAllListPanel.x = 15;
         this.cardAllListPanel.y = 123;
         this.cardAllListPanel.height = 290;
         this.cardAllListPanel.width = 505;
         this.addChild(this.cardAllListPanel);
         this.cardUnlockPanel = new TDUnlockCardPanelWithEndlessTD();
         this.cardUnlockPanel.name = "cardUnlockPanel";
         this.cardUnlockPanel.x = 15;
         this.cardUnlockPanel.y = 413;
         this.cardUnlockPanel.width = 505;
         this.cardUnlockPanel.height = 220;
         this.addChild(this.cardUnlockPanel);
         this.cardUnlockPanel.visible = false;
         this.okBtn = new Button();
         this.okBtn.width = 156;
         this.okBtn.bottom = 10;
         this.okBtn.hcenter = 0;
         this.addChild(this.okBtn);
         this.waterDropImg = new Image();
         this.waterDropImg.source = AssetManager.getInstance().GetClass("TDUI_WaterDropImg");
         this.waterDropImg.x = 120;
         this.waterDropImg.y = 530;
         this.addChild(this.waterDropImg);
         this.waterDropImg.toolTip = "雨露值由关卡积分转化获得，可用于关卡开始时召唤植物，召唤后雨露值扣除";
         this.txtWaterDrop = new Label();
         this.txtWaterDrop.width = 70;
         this.txtWaterDrop.x = 120;
         this.txtWaterDrop.y = 535;
         this.txtWaterDrop.styleName = ".TXT_TD_Card";
         this.txtWaterDrop.text = "0";
         this.txtWaterDrop.mouseEnabled = false;
         this.addChild(this.txtWaterDrop);
         var _loc1_:Image = new Image();
         _loc1_.source = AssetManager.getInstance().GetClass("TD_UI_chooseCardBG");
         addChild(_loc1_);
         _loc1_.y = 91;
         _loc1_.x = 7;
         this.bg.styleName = ".HBox_Gray_With_Leaves";
         this.bg.width = 538;
         this.bg.height = 340;
         this.bg.y = 100;
         this.okBtn.styleName = ".GreenButton";
         this.okBtn.label = FontHKHB.TXT_nextStep;
         this.privilegeImageBtn = new Image();
         this.privilegeImageBtn.source = ResLibManager.getInstance().getClassFromRes("TD_UI_PrivilegeBtn",ResLibID.TDRes);
         this.privilegeImageBtn.bottom = -60;
         this.privilegeImageBtn.left = 25;
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
         }
         else
         {
            this.height = 551;
            this.bg.height = 340;
         }
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
   }
}
