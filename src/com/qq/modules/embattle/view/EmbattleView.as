package com.qq.modules.embattle.view
{
   import asgui.containers.Box;
   import asgui.containers.Canvas;
   import asgui.containers.HBox;
   import asgui.controls.CheckBox;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.Text;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvasSelfFullSize;
   import com.qq.display.QIconWithLabel;
   import com.qq.modules.arena.view.comps.NameDataBar;
   import com.qq.modules.embattle.EmbattleUtils;
   import com.qq.modules.embattle.view.components.HeathAutoRecoverSettingPanel;
   import com.qq.modules.map.command.MapUIViewCmd;
   import com.qq.templates.font.FontHKHB;
   import com.qq.tooltip.EmbattleDeckToolTip;
   import com.qq.utils.UrlManager;
   
   public class EmbattleView extends QCanvasSelfFullSize
   {
       
      
      public var cardListView:EmbattleCardListView;
      
      public var closeBtn:QIconWithLabel;
      
      public var txt_leader:Label;
      
      public var leaderBtn:QIconWithLabel;
      
      public var txt_powerData:Label;
      
      public var txtSpeed:Label;
      
      public var txt_embattlePlantData:Label;
      
      public var topBox:Canvas;
      
      public var bottomBox:Canvas;
      
      public var dec_leaderSkill:Text;
      
      public var data_leaderSkill:Label;
      
      public var rightBox:Canvas;
      
      public var formationBox:Box;
      
      public var txt_warTimeCostData:Label;
      
      public var txt_warTimeCost:Label;
      
      public var btnRecover:QIconWithLabel;
      
      public var healthRecoverSetting:HeathAutoRecoverSettingPanel;
      
      public var btnStart:QIconWithLabel;
      
      public var btn_armyInfo:NameDataBar;
      
      public var img_armyInfo:Image;
      
      public var img_backGround:Image;
      
      public var imgDeck:Image;
      
      public var imgCurse:Image;
      
      public var txtCurse:Label;
      
      public var btnHealth:QIconWithLabel;
      
      public var btnNutrition:QIconWithLabel;
      
      public var btnDummy:QIconWithLabel;
      
      public var ck_extraChoose:CheckBox;
      
      public function EmbattleView(param1:Class = null)
      {
         super(EmbattleViewMediator);
      }
      
      override public function Dispose() : void
      {
         if(this.topBox)
         {
            this.topBox.Dispose();
            this.topBox = null;
         }
         if(this.bottomBox)
         {
            this.bottomBox.Dispose();
            this.bottomBox = null;
         }
         if(this.rightBox)
         {
            this.rightBox.Dispose();
            this.rightBox = null;
         }
         if(this.cardListView)
         {
            if(this.cardListView.parent)
            {
               this.cardListView.parent.removeChild(this.cardListView);
            }
            this.cardListView.Dispose();
            this.cardListView = null;
         }
         MapUIViewCmd.showUI();
         if(parent && parent.contains(this))
         {
            parent.removeChild(this);
         }
         super.Dispose();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         left = 0;
         right = 0;
         top = 0;
         bottom = 0;
         this.img_backGround = new Image();
         addChild(this.img_backGround);
         this.img_backGround.vcenter = 0;
         this.img_backGround.hcenter = 0;
         this.closeBtn = new QIconWithLabel(FontHKHB.RETURN_TO_CITY,UrlManager.getUrl(0,"swf/city/btn_to_city.swf"),".TXT_HKHB_21_Yellow_Shadow");
         addChild(this.closeBtn);
         this.closeBtn.buttonMode = true;
         this.closeBtn.right = 20;
         this.closeBtn.top = 20;
         this.closeBtn.width = 100;
         this.closeBtn.height = 70;
         this.closeBtn.right = 20;
         this.closeBtn.top = 20;
         this.closeBtn.id = "closeBtn";
         this.closeBtn.txt.SetStyle("color","#5DCFFF");
         this.closeBtn.txt.mouseEnabled = false;
         this.closeBtn.txt.mouseChildren = false;
         this.initTopUI();
         this.initBottomUI();
         this.initRightUI();
         MapUIViewCmd.hideUI();
      }
      
      private function initTopUI() : void
      {
         this.topBox = new Canvas();
         this.topBox.scrollRectEnabled = false;
         this.topBox.height = 50;
         var _loc1_:Image = new Image();
         _loc1_.source = AssetManager.GetClass("City_embattle_bj3");
         this.topBox.addChild(_loc1_);
         var _loc2_:Label = new Label();
         this.topBox.addChild(_loc2_);
         _loc2_.text = "部队总先攻：";
         _loc2_.y = 4;
         _loc2_.x = 25;
         _loc2_.styleName = ".TXT_HKHB_13_White";
         _loc2_.width = 90;
         _loc2_.SetStyle("color","#EDE963");
         this.txtSpeed = new Label();
         this.topBox.addChild(this.txtSpeed);
         this.txtSpeed.text = "--";
         this.txtSpeed.width = 60;
         this.txtSpeed.x = _loc2_.x + _loc2_.width;
         this.txtSpeed.y = 4;
         this.txtSpeed.styleName = ".TXT_HKHB_13_White";
         this.txtSpeed.SetStyle("color","#C8A251");
         var _loc3_:Image = new Image();
         _loc3_.y = 30;
         _loc3_.source = AssetManager.GetClass("City_embattle_bj1");
         this.topBox.addChild(_loc3_);
         this.topBox.width = _loc3_.width;
         var _loc4_:Label = new Label();
         this.topBox.addChild(_loc4_);
         _loc4_.text = "上阵植物：";
         _loc4_.styleName = ".TXT_HKHB_13_White";
         _loc4_.SetStyle("color","#EDE963");
         _loc4_.y = 35;
         this.txt_embattlePlantData = new Label();
         this.topBox.addChild(this.txt_embattlePlantData);
         this.txt_embattlePlantData.text = "7/7";
         this.txt_embattlePlantData.width = 40;
         this.txt_embattlePlantData.x = 70;
         this.txt_embattlePlantData.y = 35;
         this.txt_embattlePlantData.styleName = ".TXT_HKHB_13_White";
         this.txt_embattlePlantData.SetStyle("color","#80B776");
         var _loc5_:Label = new Label();
         this.topBox.addChild(_loc5_);
         _loc5_.text = "总战力：";
         _loc5_.x = this.txt_embattlePlantData.x + this.txt_embattlePlantData.width;
         _loc5_.y = 35;
         _loc5_.styleName = ".TXT_HKHB_13_White";
         _loc5_.width = 55;
         _loc5_.SetStyle("color","#EDE963");
         this.txt_powerData = new Label();
         this.topBox.addChild(this.txt_powerData);
         this.txt_powerData.text = "100000";
         this.txt_powerData.width = 70;
         this.txt_powerData.x = _loc5_.x + _loc5_.width;
         this.txt_powerData.y = 35;
         this.txt_powerData.styleName = ".TXT_HKHB_13_White";
         this.txt_powerData.SetStyle("color","#C8A251");
         this.txt_powerData.SetStyle("textAlign","left");
         this.txt_warTimeCost = new Label();
         this.topBox.addChild(this.txt_warTimeCost);
         this.txt_warTimeCost.text = "耗时：";
         this.txt_warTimeCost.x = this.txt_powerData.x + this.txt_powerData.width;
         this.txt_warTimeCost.y = 35;
         this.txt_warTimeCost.width = 50;
         this.txt_warTimeCost.styleName = ".TXT_HKHB_13_White";
         this.txt_warTimeCost.SetStyle("color","#EDE963");
         this.txt_warTimeCostData = new Label();
         this.topBox.addChild(this.txt_warTimeCostData);
         this.txt_warTimeCostData.text = "100000";
         this.txt_warTimeCostData.width = 110;
         this.txt_warTimeCostData.x = this.txt_warTimeCost.x + this.txt_warTimeCost.width;
         this.txt_warTimeCostData.y = 35;
         this.txt_warTimeCostData.styleName = ".TXT_HKHB_13_White";
         this.txt_warTimeCostData.SetStyle("color","#C8A251");
         this.img_armyInfo = new Image();
         this.topBox.addChild(this.img_armyInfo);
         this.img_armyInfo.x = this.txt_warTimeCost.x;
         this.img_armyInfo.y = 37;
         this.img_armyInfo.source = UrlManager.getUrl(UrlManager.Url_UI,"armyInfo.png");
         this.btn_armyInfo = new NameDataBar();
         this.btn_armyInfo.x = this.img_armyInfo.x - 60;
         this.btn_armyInfo.y = 35;
         this.topBox.addChild(this.btn_armyInfo);
         this.btn_armyInfo.setName("");
         this.btn_armyInfo.setData(FontHKHB.BATTLE_ARMY_INFO);
         this.btn_armyInfo.buttonMode = true;
         this.btn_armyInfo.txt_data.SetStyle("textDecoration","underline");
         this.btn_armyInfo.setDataToolTip("点击查看当前军情");
         this.imgDeck = new Image();
         this.imgDeck.y = 30;
         this.imgDeck.source = AssetManager.GetClass("Embattle_UI_Icon_Deck");
         this.topBox.addChild(this.imgDeck);
         this.imgDeck.width = 50;
         this.imgDeck.x = this.btn_armyInfo.x + this.btn_armyInfo.width + 5;
         this.imgDeck.toolTipClass = EmbattleDeckToolTip;
         this.imgCurse = new Image();
         this.imgCurse.source = AssetManager.GetClass("Embattle_UI_Icon_Curse");
         this.topBox.addChild(this.imgCurse);
         this.imgCurse.x = this.imgDeck.x + 30;
         this.imgCurse.y = this.imgDeck.y + 4;
         this.imgCurse.visible = false;
         this.imgCurse.toolTip = FontHKHB.HOLE_CURSE;
         this.txtCurse = new Label();
         this.txtCurse.visible = false;
         this.txtCurse.styleName = ".TXT_HKHB_13_Yellow_Center";
         this.txtCurse.x = 10;
         this.txtCurse.text = FontHKHB.HOLE_CURSE;
         this.txtCurse.y = 65;
         this.txtCurse.width = 400;
         this.txtCurse.mouseEnabled = false;
         this.topBox.addChild(this.txtCurse);
      }
      
      private function initBottomUI() : void
      {
         this.bottomBox = new Canvas();
         this.bottomBox.scrollRectEnabled = false;
         var _loc1_:Image = new Image();
         _loc1_.source = AssetManager.GetClass("City_embattle_bj2");
         this.bottomBox.addChild(_loc1_);
         this.bottomBox.width = _loc1_.width + 220;
         this.bottomBox.height = _loc1_.height + 20;
         this.leaderBtn = EmbattleUtils.createLeaderButton();
         this.bottomBox.addChild(this.leaderBtn);
         this.leaderBtn.x = 10;
         this.leaderBtn.y = 8;
         var _loc2_:Label = new Label();
         this.bottomBox.addChild(_loc2_);
         _loc2_.x = 90;
         _loc2_.y = 15;
         _loc2_.styleName = ".TXT_HKHB_13_White";
         _loc2_.SetStyle("color","#FDF77F");
         _loc2_.text = "队长技能：";
         this.data_leaderSkill = new Label();
         this.bottomBox.addChild(this.data_leaderSkill);
         this.data_leaderSkill.x = 160;
         this.data_leaderSkill.y = 15;
         this.data_leaderSkill.styleName = ".TXT_HKHB_13_White";
         this.data_leaderSkill.text = "[怒火中骚]";
         this.data_leaderSkill.width = 130;
         this.data_leaderSkill.SetStyle("color","#75F761");
         this.dec_leaderSkill = new Text();
         this.bottomBox.addChild(this.dec_leaderSkill);
         this.dec_leaderSkill.x = 90;
         this.dec_leaderSkill.y = 35;
         this.dec_leaderSkill.width = 175;
         this.dec_leaderSkill.height = 65;
         this.dec_leaderSkill.styleName = ".TXT_HKHB_13_White";
         this.dec_leaderSkill.text = "阿隆索的空间拉什科剪短发啦斯蒂芬了";
         var _loc3_:HBox = new HBox();
         _loc3_.x = 260;
         _loc3_.y = 10;
         this.bottomBox.addChild(_loc3_);
         this.btnDummy = EmbattleUtils.createDummyButton();
         this.btnDummy.visible = false;
         _loc3_.addChild(this.btnDummy);
         this.btnNutrition = EmbattleUtils.createNutritionButton();
         this.btnNutrition.visible = false;
         _loc3_.addChild(this.btnNutrition);
         this.btnHealth = EmbattleUtils.createHealthButton();
         _loc3_.addChild(this.btnHealth);
         this.btnRecover = EmbattleUtils.createRecoverButton();
         _loc3_.addChild(this.btnRecover);
         this.healthRecoverSetting = new HeathAutoRecoverSettingPanel();
         this.healthRecoverSetting.x = 0;
         this.healthRecoverSetting.y = 70;
         this.bottomBox.addChild(this.healthRecoverSetting);
         this.ck_extraChoose = new CheckBox();
         this.ck_extraChoose.styleName = ".CheckBox_Yellow";
         this.ck_extraChoose.y = -20;
         this.ck_extraChoose.height = 24;
         this.ck_extraChoose.width = 130;
         this.ck_extraChoose.visible = false;
         this.bottomBox.addChild(this.ck_extraChoose);
      }
      
      private function initRightUI() : void
      {
         this.rightBox = new Canvas();
         this.rightBox.width = 180;
         this.rightBox.height = 500;
         this.rightBox.scrollRectEnabled = false;
         this.btnStart = EmbattleUtils.createSetOutButton();
         this.btnStart.x = 105;
         this.btnStart.y = 435;
         this.rightBox.addChild(this.btnStart);
      }
   }
}
