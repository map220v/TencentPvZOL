package com.qq.tooltip
{
   import PVZ.Cmd.Dto_CardFullInfo;
   import PVZ.Cmd.Dto_CardPower;
   import PVZ.Cmd.Dto_EnemyCardInfo;
   import PVZ.Cmd.Dto_FightCardInfo;
   import PVZ.Cmd.E_PowerEle;
   import asgui.containers.Canvas;
   import asgui.containers.HBox;
   import asgui.containers.VBox;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.Text;
   import asgui.core.Container;
   import asgui.core.IToolTip;
   import asgui.resources.AssetManager;
   import com.qq.ConstGlobal;
   import com.qq.GameGloble;
   import com.qq.constant.BattleCardStatus;
   import com.qq.constant.CardQuality;
   import com.qq.display.QCanvas;
   import com.qq.display.QProgressBar;
   import com.qq.display.SimpleCardItem;
   import com.qq.managers.FilterManager;
   import com.qq.modules.battleLineup.model.BattleLineupModel;
   import com.qq.modules.card.CardGlobals;
   import com.qq.modules.card.model.templates.CardDeckDetailInfo;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.card.model.templates.ce.CardDeckShowTemplateCE;
   import com.qq.modules.commEmbattle.model.CommEmbattleProxy;
   import com.qq.modules.embattle.constant.EmbattleConst;
   import com.qq.modules.embattle.model.EmbattleModel;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.battle.BattleCardSettings;
   import com.qq.modules.main.model.settings.battle.BattleLineupCardSkillTemplate;
   import com.qq.modules.main.model.settings.battle.BattleLineupTemplateFactory;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardFeatureTemp;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.QualityUtil;
   import com.qq.utils.UrlManager;
   import com.qq.utils.UtilsManager;
   import com.tencent.protobuf.Int64;
   import flash.utils.Dictionary;
   import tencent.base.utils.StringUtil;
   
   public class PlantCardToolTip extends QCanvas implements IToolTip
   {
       
      
      public var nameTxt:Label;
      
      public var qualityImg:Image;
      
      public var qualityData:Label;
      
      public var levelData:Label;
      
      public var starBox:Canvas;
      
      public var strengthImg:Image;
      
      public var strengthData:Label;
      
      public var powerName:Label;
      
      public var powerData:Label;
      
      public var propData:Label;
      
      public var normalSkillNameData:Text;
      
      public var normalSkillName:Label;
      
      public var skillNameData:Text;
      
      public var skillName:Label;
      
      public var leaderTxt:Label;
      
      public var helpTxt:Label;
      
      public var txtRarityName:Label;
      
      public var txtRarityData:Label;
      
      public var hpName:Label;
      
      public var hpBar:QProgressBar;
      
      public var hpData:Label;
      
      public var shiledName:Label;
      
      public var shiledBar:QProgressBar;
      
      public var shiledData:Label;
      
      public var healthName:Label;
      
      public var healthData:Text;
      
      public var healthImg:Image;
      
      public var leftFrame:QCanvas;
      
      private var vBox:VBox;
      
      public var rightFrame:QCanvas;
      
      private var deckVBox:VBox;
      
      protected var m_activeDeckList:Array;
      
      protected var m_propertyContainer:Container;
      
      private var m_txtPropertyName:Text;
      
      private var m_txtPropertyFight:Text;
      
      private var m_txtPropertySpeed:Text;
      
      protected var lessW:int = 25;
      
      public function PlantCardToolTip(param1:Class = null)
      {
         if(param1 == null)
         {
            param1 = PlantCardToolTipMediator;
         }
         super(param1);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 450;
         this.leftFrame = new QCanvas();
         this.leftFrame.width = 220;
         this.leftFrame.styleName = "ToolTip";
         addChild(this.leftFrame);
         this.leftFrame.x = 0;
         this.rightFrame = new QCanvas();
         this.rightFrame.width = 230;
         this.rightFrame.styleName = "ToolTip";
         addChild(this.rightFrame);
         this.rightFrame.x = 220;
         this.vBox = new VBox();
         this.vBox.width = 230;
         this.leftFrame.addChild(this.vBox);
         var _loc1_:Canvas = this.createCav();
         _loc1_.height = 28;
         this.vBox.addChild(_loc1_);
         this.nameTxt = this.creatLabel("",".TXT_Panel_Title_Normal");
         this.nameTxt.y = 1;
         this.nameTxt.width = 130;
         this.nameTxt.height = 28;
         this.nameTxt.SetStyle("textAlign","left");
         _loc1_.addChild(this.nameTxt);
         this.qualityImg = new Image();
         this.qualityImg.width = 25;
         this.qualityImg.height = 25;
         this.qualityImg.x = 120;
         _loc1_.addChild(this.qualityImg);
         this.qualityData = this.creatLabel("",".TXT_Panel_Title_Normal");
         this.qualityData.width = 50;
         this.qualityData.height = 28;
         this.qualityData.SetStyle("textAlign","left");
         this.qualityData.x = this.qualityImg.x;
         this.qualityData.y = 1;
         _loc1_.addChild(this.qualityData);
         this.levelData = this.creatLabel("",".TXT_Panel_Title_Normal");
         this.levelData.width = 80;
         this.levelData.x = 150;
         this.levelData.y = 1;
         this.levelData.height = 28;
         this.levelData.SetStyle("textAlign","left");
         _loc1_.addChild(this.levelData);
         var _loc2_:Canvas = this.createCav();
         _loc2_.height = 10;
         this.vBox.addChild(_loc2_);
         var _loc3_:Image = new Image();
         _loc3_.source = AssetManager.GetClass("skin_battle_cutOff");
         _loc2_.addChild(_loc3_);
         var _loc4_:Canvas = this.createCav();
         this.vBox.addChild(_loc4_);
         this.starBox = new Canvas();
         this.starBox.x = 5;
         this.starBox.width = this.width - 20;
         this.starBox.height = 20;
         _loc4_.addChild(this.starBox);
         this.strengthImg = new Image();
         this.strengthImg.x = 150;
         this.strengthImg.width = 22;
         this.strengthImg.height = 20;
         this.strengthImg.source = AssetManager.GetClass("Card_christmas_Strength_BG");
         _loc4_.addChild(this.strengthImg);
         this.strengthData = this.creatLabel("",".TXT_15_White","","11");
         this.strengthData.width = 40;
         this.strengthData.x = this.strengthImg.x + 5;
         _loc4_.addChild(this.strengthData);
         var _loc5_:Canvas = this.createCav();
         this.vBox.addChild(_loc5_);
         this.txtRarityName = this.creatLabel(FontHKHB.BATTLE_CARD_RARITY,".TXT_15_White","#EBB00C");
         this.txtRarityName.width = 60;
         _loc5_.addChild(this.txtRarityName);
         this.txtRarityData = new Text();
         this.txtRarityData.styleName = ".TXT_15_White";
         this.txtRarityData.width = 150;
         this.txtRarityData.height = 20;
         this.txtRarityData.x = this.txtRarityName.x + this.txtRarityName.width;
         _loc5_.addChild(this.txtRarityData);
         var _loc6_:Canvas;
         (_loc6_ = this.createCav()).height = 35;
         this.vBox.addChild(_loc6_);
         this.shiledName = this.creatLabel(FontHKHB.BATTLE_CARD_SHIELD,".TXT_15_White","#EBB00C");
         this.shiledName.width = 50;
         _loc6_.addChild(this.shiledName);
         this.shiledBar = new QProgressBar();
         this.shiledBar.x = this.shiledName.x + this.shiledName.width;
         this.shiledBar.setSkin("UI_Card_hp_mc","UI_Card_hp_bar","","");
         _loc6_.addChild(this.shiledBar);
         this.shiledBar.visible = false;
         this.shiledData = this.creatLabel("100/100",".TXT_15_White","#EBB00C");
         this.shiledData.SetStyle("textAlign","center");
         this.shiledData.width = 150;
         this.shiledData.height = 20;
         this.shiledData.x = this.shiledName.x + this.shiledName.width - 10;
         _loc6_.addChild(this.shiledData);
         var _loc7_:Canvas;
         (_loc7_ = this.createCav()).height = 30;
         this.vBox.addChild(_loc7_);
         this.hpName = this.creatLabel(FontHKHB.BATTLE_CARD_HP,".TXT_15_White","#EBB00C");
         this.hpName.width = 50;
         _loc7_.addChild(this.hpName);
         this.hpBar = new QProgressBar();
         this.hpBar.x = this.hpName.x + this.hpName.width;
         this.hpBar.setSkin("UI_Card_hp_mc","UI_Card_hp_bar",null,null);
         _loc7_.addChild(this.hpBar);
         this.hpData = this.creatLabel(FontHKHB.BATTLE_CARD_HP,"","#FFFFFF","12");
         this.hpData.SetStyle("textAlign","center");
         this.hpData.width = 150;
         this.hpData.height = 20;
         this.hpData.text = "100/100";
         this.hpData.x = this.hpName.x + this.hpName.width - 12;
         this.hpData.y = 2;
         _loc7_.addChild(this.hpData);
         this.m_propertyContainer = new Container();
         this.healthImg = new Image();
         this.healthImg.source = AssetManager.GetClass("UI_Source_Health_down");
         this.healthImg.width = 16;
         this.healthImg.height = 18;
         this.healthImg.x = 110;
         this.m_propertyContainer.addChild(this.healthImg);
         this.healthImg.visible = false;
         this.m_txtPropertyName = new Text();
         this.m_txtPropertyName.styleName = ".TXT_15_White";
         this.m_txtPropertyName.y = 20;
         this.m_txtPropertyName.x = 0;
         this.m_txtPropertyName.width = 75;
         this.m_txtPropertyName.SetStyle("color","#EBB00C");
         this.m_propertyContainer.addChild(this.m_txtPropertyName);
         this.m_txtPropertyFight = new Text();
         this.m_txtPropertyFight.styleName = ".TXT_15_White";
         this.m_txtPropertyFight.width = 65;
         this.m_txtPropertyFight.SetStyle("color","#BBBCB7");
         this.m_txtPropertyFight.y = 20;
         this.m_txtPropertyFight.x = this.m_txtPropertyName.x + this.m_txtPropertyName.width;
         var _loc8_:Label;
         (_loc8_ = this.creatLabel(FontHKHB.FIGHT_POWER,".TXT_15_White","#EBB00C")).width = 65;
         _loc8_.x = this.m_txtPropertyFight.x;
         this.m_propertyContainer.addChild(_loc8_);
         this.m_propertyContainer.addChild(this.m_txtPropertyFight);
         this.m_txtPropertySpeed = new Text();
         this.m_txtPropertySpeed.styleName = ".TXT_15_White";
         this.m_txtPropertySpeed.width = 65;
         this.m_txtPropertySpeed.SetStyle("color","#BBBCB7");
         this.m_txtPropertySpeed.y = 20;
         this.m_txtPropertySpeed.x = this.m_txtPropertyFight.x + this.m_txtPropertyFight.width;
         var _loc9_:Label;
         (_loc9_ = this.creatLabel(FontHKHB.FIGHT_SPEED,".TXT_15_White","#EBB00C")).width = 65;
         _loc9_.x = this.m_txtPropertySpeed.x;
         this.m_propertyContainer.addChild(_loc9_);
         this.m_propertyContainer.addChild(this.m_txtPropertySpeed);
         this.vBox.addChild(this.m_propertyContainer);
         var _loc10_:Canvas = this.createCav();
         this.vBox.addChild(_loc10_);
         this.healthName = this.creatLabel(FontHKHB.BATTLE_CARD_HEALTH,".TXT_15_White","#EBB00C");
         this.healthName.width = 50;
         _loc10_.addChild(this.healthName);
         this.healthData = new Text();
         this.healthData.styleName = ".TXT_15_White";
         this.healthData.SetStyle("fontSize","12");
         this.healthData.width = 150;
         this.healthData.height = 20;
         this.healthData.text = "100/100";
         this.healthData.x = this.healthName.x + this.healthName.width;
         _loc10_.addChild(this.healthData);
         var _loc11_:Canvas = this.createCav();
         this.vBox.addChild(_loc11_);
         this.normalSkillName = this.creatLabel(FontHKHB.BATTLE_CARD_NORMAL_SKILL,".TXT_15_White","#EBB00C");
         this.normalSkillName.width = 50;
         _loc11_.addChild(this.normalSkillName);
         this.normalSkillNameData = new Text();
         this.normalSkillNameData.styleName = ".TXT_15_White";
         this.normalSkillNameData.width = 200;
         _loc11_.addChild(this.normalSkillNameData);
         var _loc12_:Canvas = this.createCav();
         this.vBox.addChild(_loc12_);
         this.skillName = this.creatLabel(FontHKHB.BATTLE_CARD_SKILL,".TXT_15_White","#EBB00C");
         this.skillName.width = 50;
         _loc12_.addChild(this.skillName);
         this.skillNameData = new Text();
         this.skillNameData.styleName = ".TXT_15_White";
         this.skillNameData.width = 200;
         _loc12_.addChild(this.skillNameData);
         var _loc13_:Canvas = this.createCav();
         this.vBox.addChild(_loc13_);
         var _loc14_:Label;
         (_loc14_ = this.creatLabel(FontHKHB.BATTLE_CARD_LEADER,".TXT_15_White","#FF9393")).width = 65;
         _loc13_.addChild(_loc14_);
         this.leaderTxt = this.creatLabel("",".TXT_15_White","#00EC32","15");
         this.leaderTxt.height = 40;
         this.leaderTxt.width = 130;
         this.leaderTxt.x = _loc14_.x + _loc14_.width;
         _loc13_.addChild(this.leaderTxt);
         var _loc15_:Canvas = this.createCav();
         this.vBox.addChild(_loc15_);
         this.helpTxt = this.creatLabel("","","#00EC32");
         this.helpTxt.width = this.width;
         _loc15_.addChild(this.helpTxt);
         this.deckVBox = new VBox();
         this.deckVBox.width = 220;
         this.rightFrame.addChild(this.deckVBox);
      }
      
      protected function creatLabel(param1:String, param2:String = "", param3:String = "", param4:String = "") : Label
      {
         var _loc5_:Label = new Label();
         if(param2 != "")
         {
            _loc5_.styleName = param2;
         }
         if(param3 != "")
         {
            _loc5_.SetStyle("color",param3);
         }
         if(param4 != "")
         {
            _loc5_.SetStyle("fontSize",param4);
         }
         _loc5_.text = param1;
         _loc5_.height = 20;
         return _loc5_;
      }
      
      private function createCav() : Canvas
      {
         var _loc1_:Canvas = new Canvas();
         _loc1_.width = this.width;
         _loc1_.height = 20;
         return _loc1_;
      }
      
      private function refreshHealthInfluence(param1:int, param2:int) : void
      {
         this.hpData.parent.visible = true;
         this.healthData.parent.height = 20;
         var _loc3_:String = "";
         var _loc4_:String = "#FFFFFF";
         if(param2 == -1)
         {
            _loc3_ = "100/100";
         }
         else if(param2 != 0)
         {
            _loc4_ = "#FF0000";
            _loc3_ = _loc3_.concat(param1 + "/100 (战力" + param2 + ")");
         }
         this.healthName.SetStyle("color",_loc4_);
         this.healthData.SetStyle("color",_loc4_);
         this.healthData.text = _loc3_.toString();
      }
      
      public function update(param1:Dto_CardFullInfo, param2:int = -1) : void
      {
         var _loc7_:int = 0;
         var _loc8_:Canvas = null;
         this.getActiveDeckList(param1.base.uid);
         var _loc3_:BattleLineupCardTemp = SettingsModel.instance.battleCardSettings.getBattleCardTempById(param1.base.cardId);
         this.nameTxt.text = _loc3_.name;
         this.nameTxt.SetStyle("color",CardQuality.getQuiltyColor(param1.base.quality));
         if(param1.base.rank != 0)
         {
            this.qualityData.text = "+" + param1.base.rank;
            this.qualityData.SetStyle("color",CardQuality.getQuiltyColor(param1.base.quality));
            this.qualityImg.source = UrlManager.getUrl(UrlManager.Url_IMG_CARD,"quality_" + param1.base.quality + ".png");
            this.qualityImg.visible = true;
         }
         else
         {
            this.qualityData.text = "";
            this.qualityImg.visible = false;
         }
         this.levelData.text = param1.base.level.toString() + "级";
         this.setStar(_loc3_.star,_loc3_.awakeLevel);
         this.setStrengthLv(param1.base.forgeLevel);
         this.txtRarityData.text = _loc3_.rarity.toString();
         this.shiledData.parent.height = 0;
         this.shiledBar.visible = false;
         this.hpData.parent.visible = true;
         this.hpData.parent.height = 30;
         this.hpData.text = UtilsManager.converNum(param1.hp.toNumber(),1,9999999) + "/" + UtilsManager.converNum(param1.hp.toNumber(),1,9999999);
         this.hpBar.setPercent(1);
         this.healthData.parent.height = 0;
         var _loc4_:BattleLineupCardSkillTemplate = BattleLineupTemplateFactory.instance.getBattleLineupCardSkillTemplateById(_loc3_.skillId1);
         this.normalSkillNameData.text = "     " + _loc4_.desc;
         this.normalSkillNameData.height = this.normalSkillNameData.textField.numLines * 22;
         this.normalSkillNameData.parent.height = this.normalSkillNameData.height;
         var _loc5_:BattleLineupCardSkillTemplate = BattleLineupTemplateFactory.instance.getBattleLineupCardSkillTemplateById(_loc3_.skillId2);
         this.skillNameData.text = "     " + _loc5_.desc;
         this.skillNameData.height = this.skillNameData.textField.numLines * 22;
         this.skillNameData.parent.height = this.skillNameData.height;
         _loc5_ = BattleLineupTemplateFactory.instance.getBattleLineupCardSkillTemplateById(_loc3_.leaderSkillId);
         this.leaderTxt.text = "[" + _loc5_.name + "]";
         this.setLeaderTxtColor(int(_loc5_.id % 10));
         this.helpTxt.height = 0;
         while(this.deckVBox.numChildren > 0)
         {
            this.deckVBox.removeChildAt(0);
         }
         var _loc6_:Array = CardTemplateFactory.instance.getAllDeckDetailInfo(param1.base.cardId);
         _loc7_ = 0;
         while(_loc7_ < _loc6_.length)
         {
            _loc8_ = this.createDeckTxt(_loc6_[_loc7_],param1.base.cardId,_loc7_ != 0);
            this.deckVBox.addChild(_loc8_);
            _loc7_++;
         }
         if(GameGloble.actorModel.battleCardModel.getBattleCardFullInfo(param1.base.uid) == null)
         {
            this.rightFrame.visible = false;
         }
         else if(_loc6_.length == 0)
         {
            this.rightFrame.visible = false;
         }
         else
         {
            this.rightFrame.visible = true;
         }
         this.refreshHealthInfluence(param1.base.health,param2);
      }
      
      private function chooseColorByFeature(param1:BattleLineupCardFeatureTemp) : String
      {
         var _loc2_:String = "#ffffff";
         var _loc3_:int = int(param1.id % 10);
         return QualityUtil.getLevelColor(_loc3_);
      }
      
      private function setLeaderTxtColor(param1:int) : void
      {
         var _loc2_:String = "#ffffff";
         if(param1 <= 1)
         {
            _loc2_ = "#ffffff";
         }
         else if(param1 == 2)
         {
            _loc2_ = "#74c362";
         }
         else if(param1 == 3)
         {
            _loc2_ = "#70FCFB";
         }
         else if(param1 == 4)
         {
            _loc2_ = "#ff66ff";
         }
         else if(param1 == 5)
         {
            _loc2_ = "#ff9900";
         }
         else
         {
            _loc2_ = "#ffff00";
         }
         this.leaderTxt.SetStyle("color",_loc2_);
      }
      
      public function updateWithEnemyCard(param1:Dto_EnemyCardInfo) : void
      {
         var _loc7_:int = 0;
         var _loc8_:Canvas = null;
         this.getEnemyActiveDeckList(param1.cardId);
         var _loc2_:BattleLineupCardTemp = SettingsModel.instance.battleCardSettings.getBattleCardTempById(param1.cardId);
         this.nameTxt.text = _loc2_.name;
         this.nameTxt.SetStyle("color",CardQuality.getQuiltyColor(param1.quality));
         if(param1.rank != 0)
         {
            this.qualityData.text = "+" + param1.rank;
            this.qualityData.SetStyle("color",CardQuality.getQuiltyColor(param1.quality));
            this.qualityImg.source = UrlManager.getUrl(UrlManager.Url_IMG_CARD,"quality_" + param1.quality + ".png");
            this.qualityImg.visible = true;
         }
         else
         {
            this.qualityData.text = "";
            this.qualityImg.visible = false;
         }
         if(_loc2_.type == BattleCardSettings.BATTLE_CARD_TYPE_PLANT)
         {
            this.levelData.text = param1.level.toString() + "级";
         }
         else
         {
            this.levelData.text = "";
         }
         this.setStar(_loc2_.star,_loc2_.awakeLevel);
         this.setStrengthLv(0);
         this.txtRarityData.parent.height = 0;
         this.shiledBar.parent.height = 0;
         this.shiledBar.visible = false;
         this.hpData.parent.height = 0;
         this.hpData.parent.visible = false;
         this.healthData.parent.height = 0;
         var _loc3_:BattleLineupCardSkillTemplate = BattleLineupTemplateFactory.instance.getBattleLineupCardSkillTemplateById(_loc2_.skillId1);
         this.normalSkillNameData.text = "     " + _loc3_.desc;
         this.normalSkillNameData.height = this.normalSkillNameData.textField.numLines * 22;
         this.normalSkillNameData.parent.height = this.normalSkillNameData.height;
         var _loc4_:BattleLineupCardSkillTemplate = BattleLineupTemplateFactory.instance.getBattleLineupCardSkillTemplateById(_loc2_.skillId2);
         this.skillNameData.text = "      " + _loc4_.desc;
         this.skillNameData.height = this.skillNameData.textField.numLines * 20;
         this.skillNameData.parent.height = this.skillNameData.height;
         _loc4_ = BattleLineupTemplateFactory.instance.getBattleLineupCardSkillTemplateById(_loc2_.leaderSkillId);
         this.leaderTxt.text = "[" + _loc4_.name + "]";
         this.setLeaderTxtColor(int(_loc4_.id % 10));
         while(this.deckVBox.numChildren > 0)
         {
            this.deckVBox.removeChildAt(0);
         }
         var _loc5_:Array = CardTemplateFactory.instance.getAllDeckDetailInfo(param1.cardId);
         var _loc6_:int = 0;
         _loc7_ = 0;
         while(_loc7_ < _loc5_.length)
         {
            if(this.m_activeDeckList.indexOf(_loc5_[_loc7_].deckId) >= 0)
            {
               _loc8_ = this.createDeckTxt(_loc5_[_loc7_],param1.cardId,_loc7_ != 0);
               this.deckVBox.addChild(_loc8_);
               _loc6_++;
            }
            _loc7_++;
         }
         if(_loc6_ == 0)
         {
            this.rightFrame.visible = false;
         }
         else
         {
            this.rightFrame.visible = true;
         }
      }
      
      public function updateWithFightCard(param1:Dto_FightCardInfo, param2:int = -1) : void
      {
         var _loc3_:BattleLineupCardTemp = SettingsModel.instance.battleCardSettings.getBattleCardTempById(param1.cardId);
         this.nameTxt.text = _loc3_.name;
         this.nameTxt.SetStyle("color",CardQuality.getQuiltyColor(param1.quality));
         if(param1.rank != 0)
         {
            this.qualityData.text = "+" + param1.rank;
            this.qualityData.SetStyle("color",CardQuality.getQuiltyColor(param1.quality));
            this.qualityImg.source = UrlManager.getUrl(UrlManager.Url_IMG_CARD,"quality_" + param1.quality + ".png");
            this.qualityImg.visible = true;
         }
         else
         {
            this.qualityData.text = "";
            this.qualityImg.visible = false;
         }
         if(_loc3_.type == BattleCardSettings.BATTLE_CARD_TYPE_PLANT)
         {
            this.levelData.text = param1.level.toString() + "级";
         }
         else
         {
            this.levelData.text = "";
         }
         this.setStar(_loc3_.star,_loc3_.awakeLevel);
         this.setStrengthLv(param1.forgeLevel);
         this.txtRarityData.text = _loc3_.rarity.toString();
         this.hpData.parent.height = 30;
         if(param1.shield.toNumber() > 0)
         {
            this.shiledBar.visible = true;
            this.shiledData.parent.height = 20;
            this.shiledData.text = param1.shield.toString() + "/" + param1.maxShield.toString();
            this.shiledBar.setPercent(param1.shield.toNumber() / param1.maxShield.toNumber());
         }
         else
         {
            this.shiledBar.visible = false;
            this.shiledData.parent.height = 0;
         }
         this.hpData.parent.visible = true;
         this.hpData.parent.height = 30;
         this.updateHp(param1.hp.toNumber(),param1.maxHp.toNumber());
         var _loc4_:BattleLineupCardSkillTemplate = BattleLineupTemplateFactory.instance.getBattleLineupCardSkillTemplateById(_loc3_.skillId1);
         this.normalSkillNameData.text = "      " + _loc4_.desc;
         this.normalSkillNameData.height = this.normalSkillNameData.textField.numLines * 20;
         this.normalSkillNameData.parent.height = this.normalSkillNameData.height;
         var _loc5_:BattleLineupCardSkillTemplate = BattleLineupTemplateFactory.instance.getBattleLineupCardSkillTemplateById(_loc3_.skillId2);
         this.skillNameData.text = "      " + _loc5_.desc;
         this.skillNameData.height = this.skillNameData.textField.numLines * 20;
         this.skillNameData.parent.height = this.skillNameData.height;
         _loc5_ = BattleLineupTemplateFactory.instance.getBattleLineupCardSkillTemplateById(_loc3_.leaderSkillId);
         this.leaderTxt.text = "[" + _loc5_.name + "]";
         this.setLeaderTxtColor(int(_loc5_.id % 10));
         this.rightFrame.visible = false;
         this.refreshHealthInfluence(param1.health,param2);
      }
      
      public function updateHp(param1:Number, param2:Number) : void
      {
         this.hpData.text = UtilsManager.converNum(param1,1,9999999) + "/" + UtilsManager.converNum(param2,1,9999999);
         this.hpBar.setPercent(param1 / param2);
      }
      
      public function setStrengthLv(param1:int) : void
      {
         var _loc2_:String = null;
         if(param1 == 0)
         {
            this.strengthData.text = "";
            this.strengthImg.visible = false;
         }
         else
         {
            _loc2_ = FontHKHB["BATTLE_CARD_FORGE_L" + param1];
            this.strengthData.text = _loc2_;
            this.strengthImg.visible = true;
         }
      }
      
      protected function getHealthData(param1:int) : String
      {
         var _loc2_:String = "<font color=\'#{0}\'>{1}</font>/100";
         var _loc3_:uint = BattleCardStatus.getCardHealthColor(param1);
         return StringUtil.substitute(_loc2_,_loc3_.toString(16),param1);
      }
      
      public function updatePower(param1:Array) : void
      {
         var _loc3_:Dto_CardPower = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:String = null;
         var _loc2_:Dictionary = new Dictionary();
         for each(_loc3_ in param1)
         {
            _loc2_[_loc3_.ele] = _loc3_;
         }
         _loc4_ = "";
         _loc5_ = "";
         _loc6_ = "";
         _loc11_ = 0;
         _loc12_ = 0;
         _loc13_ = 0;
         _loc14_ = ConstGlobal.PROP_SHOW_ORDER.length;
         _loc15_ = 0;
         while(_loc15_ < _loc14_)
         {
            _loc7_ = ConstGlobal.PROP_SHOW_ORDER[_loc15_];
            if(_loc2_.hasOwnProperty(_loc7_))
            {
               _loc3_ = _loc2_[_loc7_];
               _loc8_ = FontHKHB["BATTLE_POWER_" + _loc7_];
               _loc4_ += _loc8_ + "\n";
               _loc9_ = (_loc11_ = Number(!!_loc3_.hasValue ? Number(_loc3_.value.toNumber()) : Number(0))) > 0 ? _loc11_.toString() : "--";
               _loc10_ = (_loc12_ = Number(!!_loc3_.hasSpeed ? Number(_loc3_.speed.toNumber()) : Number(0))) > 0 ? _loc12_.toString() : "--";
               if(_loc7_ == E_PowerEle.E_PowerEle_total)
               {
                  _loc16_ = "#EBB00C";
                  if(_loc2_.hasOwnProperty(E_PowerEle.E_PowerEle_health))
                  {
                     _loc16_ = "#FF0000";
                  }
                  _loc9_ = "".concat("<font color=\'",_loc16_,"\'>",_loc9_,"</font>");
                  _loc10_ = "".concat("<font color=\'EBB00C\'>",_loc10_,"</font>");
               }
               else
               {
                  _loc9_ = "".concat("<font size=\'12\'>",_loc9_,"</font>");
                  _loc10_ = "".concat("<font size=\'12\'>",_loc10_,"</font>");
               }
               _loc5_ = _loc5_.concat(_loc9_,"\n");
               _loc6_ = _loc6_.concat(_loc10_,"\n");
               _loc13_ += 20;
            }
            _loc15_++;
         }
         this.m_txtPropertyName.text = _loc4_;
         this.m_txtPropertyName.height = _loc13_;
         this.m_txtPropertySpeed.text = _loc6_;
         this.m_txtPropertySpeed.height = _loc13_;
         this.m_txtPropertyFight.text = _loc5_;
         this.m_txtPropertyFight.height = _loc13_;
         this.m_propertyContainer.height = _loc13_ + 20;
      }
      
      public function createDeckTxt(param1:CardDeckDetailInfo, param2:int, param3:Boolean = true) : Canvas
      {
         var _loc5_:Boolean = false;
         var _loc11_:Image = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var _loc15_:Array = null;
         var _loc16_:int = 0;
         var _loc17_:BattleLineupCardTemp = null;
         var _loc18_:SimpleCardItem = null;
         var _loc4_:Canvas = new Canvas();
         if(this.m_activeDeckList.indexOf(param1.deckId) >= 0)
         {
            _loc5_ = true;
         }
         else
         {
            _loc5_ = false;
         }
         if(param3)
         {
            (_loc11_ = new Image()).source = AssetManager.GetClass("skin_battle_cutOff");
            _loc11_.width = 215;
            _loc4_.addChild(_loc11_);
            _loc11_.x = 0;
         }
         var _loc6_:Text;
         (_loc6_ = new Text()).styleName = ".TXT_14_Green";
         _loc6_.SetStyle("color","#ffffff");
         _loc6_.SetStyle("textShadowStrength","8");
         _loc6_.SetStyle("textShadowColor","#0");
         _loc6_.SetStyle("fontSize","15");
         _loc6_.width = 220;
         _loc4_.addChild(_loc6_);
         _loc6_.y = 10;
         var _loc7_:HBox;
         (_loc7_ = new HBox()).width = 220;
         _loc7_.y = 5;
         _loc7_.x = 85;
         _loc4_.addChild(_loc7_);
         var _loc8_:Text;
         (_loc8_ = new Text()).styleName = ".TXT_14_Green";
         _loc8_.SetStyle("color","#ffffff");
         _loc8_.SetStyle("textShadowStrength","8");
         _loc8_.SetStyle("textShadowColor","#0");
         _loc8_.SetStyle("fontSize","13");
         _loc8_.width = 220;
         _loc4_.addChild(_loc8_);
         _loc8_.y = 45;
         var _loc9_:BattleLineupCardTemp = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateById(param2);
         var _loc10_:CardDeckShowTemplateCE = CardTemplateFactory.instance.getCardDeckShowTemplate(param1.deckId);
         if(_loc9_ && _loc10_)
         {
            if(_loc5_)
            {
               _loc6_.text = "<font color=\'#ff9900\'>[" + _loc10_.name + "]</font>";
            }
            else
            {
               _loc6_.text = "<font color=\'#999999\'>[" + _loc10_.name + "]</font>";
            }
            _loc12_ = "";
            _loc13_ = "";
            _loc14_ = 0;
            _loc15_ = param1.componentPlants.concat();
            _loc15_.splice(_loc15_.indexOf(_loc9_.tdId),1);
            _loc15_.unshift(_loc9_.tdId);
            _loc16_ = 0;
            while(_loc16_ < _loc15_.length)
            {
               if(_loc17_ = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateByTdPlantId(_loc15_[_loc16_]))
               {
                  if(_loc14_ > 0 && _loc14_ % 3 == 0)
                  {
                     _loc13_ += "\n";
                  }
                  if(_loc14_ % 3 != 0)
                  {
                     _loc13_ += " ";
                  }
                  (_loc18_ = new SimpleCardItem()).setCardId(_loc15_[_loc16_],_loc16_ == 0);
                  _loc7_.addChild(_loc18_);
                  if(GameGloble.actorModel.battleCardModel.hasCardInBattleListByTdId(_loc15_[_loc16_]))
                  {
                     _loc13_ += "<font color=\'#00ff00\'>" + _loc17_.name + "</font>";
                     _loc18_.filters = [];
                  }
                  else
                  {
                     _loc13_ += "<font color=\'#999999\'>" + _loc17_.name + "</font>";
                     _loc18_.filters = [FilterManager.getGaryFilter()];
                  }
                  _loc14_++;
               }
               _loc16_++;
            }
            _loc14_ = 0;
            _loc16_ = 0;
            while(_loc16_ < param1.attributePromote.length)
            {
               if(param1.attributePromote[_loc16_] > 0)
               {
                  if(_loc14_ > 0 && _loc14_ % 3 == 0)
                  {
                     _loc13_ += "\n";
                  }
                  if(_loc14_ % 3 != 0)
                  {
                     _loc12_ += " ";
                  }
                  if(_loc5_)
                  {
                     _loc12_ += "<font color=\'#fe9292\'>" + CardGlobals.CARD_DECK_SKILL_DESC_LIST[_loc16_] + "+" + param1.attributePromote[_loc16_] + "</font>";
                  }
                  else
                  {
                     _loc12_ += "<font color=\'#999999\'>" + CardGlobals.CARD_DECK_SKILL_DESC_LIST[_loc16_] + "+" + param1.attributePromote[_loc16_] + "</font>";
                  }
                  _loc14_++;
               }
               _loc16_++;
            }
            _loc12_ += "\n";
            _loc14_ = 0;
            _loc16_ = 0;
            while(_loc16_ < param1.featureIds.length)
            {
               if(param1.featureIds[_loc16_] != 0)
               {
                  if(_loc14_ > 0 && _loc14_ % 3 == 0)
                  {
                     _loc13_ += "\n";
                  }
                  if(_loc14_ % 3 != 0)
                  {
                     _loc12_ += " ";
                  }
                  if(_loc5_)
                  {
                     _loc12_ += "<font color=\'#fe9292\'>" + SettingsModel.instance.battleCardFeatureSettings.getCardFeatureTempById(param1.featureIds[_loc16_]).getSimpleDescWithValue() + "</font>";
                  }
                  else
                  {
                     _loc12_ += "<font color=\'#999999\'>" + SettingsModel.instance.battleCardFeatureSettings.getCardFeatureTempById(param1.featureIds[_loc16_]).getSimpleDescWithValue() + "</font>";
                  }
                  _loc14_++;
               }
               _loc16_++;
            }
            _loc8_.text = _loc12_;
         }
         return _loc4_;
      }
      
      public function setStar(param1:int, param2:int) : void
      {
         var _loc3_:Image = null;
         var _loc4_:Image = null;
         var _loc5_:int = 0;
         while(this.starBox.numChildren > 0)
         {
            this.starBox.removeChildAt(0);
         }
         if(param2 == 0)
         {
            _loc5_ = 0;
            while(_loc5_ < param1)
            {
               _loc3_ = new Image();
               _loc3_.source = AssetManager.GetClass("Card_star");
               _loc3_.x = this.lessW * _loc5_;
               this.starBox.addChild(_loc3_);
               _loc5_++;
            }
         }
         else
         {
            _loc5_ = 0;
            while(_loc5_ < param2)
            {
               (_loc4_ = new Image()).source = AssetManager.GetClass("Card_month");
               _loc4_.x = this.lessW * _loc5_;
               this.starBox.addChild(_loc4_);
               _loc5_++;
            }
         }
      }
      
      public function showHealthDown(param1:Boolean) : void
      {
         if(param1)
         {
            this.healthImg.visible = true;
         }
         else
         {
            this.healthImg.visible = false;
         }
      }
      
      public function get text() : Object
      {
         return super.data;
      }
      
      public function set text(param1:Object) : void
      {
         data = param1;
      }
      
      private function getActiveDeckList(param1:Int64) : void
      {
         var _loc2_:CommEmbattleProxy = null;
         var _loc3_:BattleLineupModel = null;
         if(GameGloble.injector.hasMapping(CommEmbattleProxy))
         {
            _loc2_ = GameGloble.injector.getInstance(CommEmbattleProxy);
            if(_loc2_.embattleType > 0)
            {
               this.m_activeDeckList = GameGloble.actorModel.battleCardModel.getActiveDecks(param1,_loc2_.embattleType);
               return;
            }
         }
         if(GameGloble.injector.hasMapping(BattleLineupModel))
         {
            _loc3_ = GameGloble.injector.getInstance(BattleLineupModel);
            if(_loc3_ && _loc3_.embattleType > 0)
            {
               this.m_activeDeckList = GameGloble.actorModel.battleCardModel.getActiveDecks(param1,_loc3_.embattleType);
               return;
            }
         }
         if(EmbattleModel.getInstance().embattleMode > 0)
         {
            this.m_activeDeckList = GameGloble.actorModel.battleCardModel.getActiveDecks(param1,EmbattleModel.getInstance().embattleMode);
            return;
         }
         this.m_activeDeckList = GameGloble.actorModel.battleCardModel.getActiveDecks(param1,EmbattleConst.MODE_HOME);
      }
      
      private function getEnemyActiveDeckList(param1:int) : void
      {
         var _loc2_:CommEmbattleProxy = null;
         if(GameGloble.injector.hasMapping(CommEmbattleProxy))
         {
            _loc2_ = GameGloble.injector.getInstance(CommEmbattleProxy);
            this.m_activeDeckList = _loc2_.getActiveDeckIds(param1);
         }
      }
   }
}
