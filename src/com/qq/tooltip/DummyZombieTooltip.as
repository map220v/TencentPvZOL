package com.qq.tooltip
{
   import asgui.containers.Canvas;
   import asgui.containers.VBox;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.Text;
   import asgui.core.IToolTip;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   import com.qq.modules.bag.ItemQualityType;
   import com.qq.modules.dummy.model.DummyZombieInfo;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.UrlManager;
   import tencent.base.utils.StringUtil;
   
   public class DummyZombieTooltip extends QCanvas implements IToolTip
   {
       
      
      public var nameTxt:Label;
      
      public var qualityImg:Image;
      
      public var qualityData:Label;
      
      public var levelData:Label;
      
      public var starBox:Canvas;
      
      public var powerName:Label;
      
      public var powerData:Label;
      
      public var normalSkillNameData:Text;
      
      public var normalSkillName:Label;
      
      public var skillNameData:Text;
      
      public var skillName:Label;
      
      public var txtRarityName:Label;
      
      public var txtRarityData:Label;
      
      public var leftFrame:QCanvas;
      
      private var vBox:VBox;
      
      private var _skillDescTemplate:String = "       {0}<font color=\'#00FF00\'>【{1}({2}级)】</font>";
      
      protected var lessW:int = 25;
      
      public function DummyZombieTooltip()
      {
         super();
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
         var _loc6_:Canvas = this.createCav();
         this.vBox.addChild(_loc6_);
         this.normalSkillName = this.creatLabel("主动技：",".TXT_15_White","#EBB00C");
         this.normalSkillName.width = 50;
         _loc6_.addChild(this.normalSkillName);
         this.normalSkillNameData = new Text();
         this.normalSkillNameData.styleName = ".TXT_15_White";
         this.normalSkillNameData.height = 40;
         this.normalSkillNameData.width = 180;
         _loc6_.addChild(this.normalSkillNameData);
         var _loc7_:Canvas = this.createCav();
         this.vBox.addChild(_loc7_);
         this.skillName = this.creatLabel("被动技：",".TXT_15_White","#EBB00C");
         this.skillName.width = 50;
         _loc7_.addChild(this.skillName);
         this.skillNameData = new Text();
         this.skillNameData.text = "";
         this.skillNameData.styleName = ".TXT_15_White";
         this.skillNameData.width = 180;
         _loc7_.addChild(this.skillNameData);
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
      
      public function update(param1:DummyZombieInfo) : void
      {
         var _loc2_:String = null;
         if(param1 == null)
         {
            return;
         }
         this.nameTxt.text = param1.name;
         this.nameTxt.SetStyle("color",ItemQualityType.getQualityColor(param1.quiltyType));
         if(param1.quitlyLv != 0)
         {
            this.qualityData.text = "+" + param1.quitlyLv;
            this.qualityData.SetStyle("color",ItemQualityType.getQualityColor(param1.quiltyType));
            this.qualityImg.source = UrlManager.getUrl(UrlManager.Url_IMG_CARD,"quality_" + param1.quiltyType + ".png");
            this.qualityImg.visible = true;
         }
         else
         {
            this.qualityData.text = "";
            this.qualityImg.visible = false;
         }
         if(param1.getTemplate().isEnemy)
         {
            this.levelData.text = "";
         }
         else
         {
            this.levelData.text = param1.level + "级";
         }
         this.setStar(param1.star);
         this.txtRarityData.text = param1.rarity.toString();
         this.normalSkillNameData.textField.width = 180;
         _loc2_ = StringUtil.substitute(this._skillDescTemplate,param1.activeSkillDesc,param1.activeSkillName,param1.activeSkillLevel);
         this.normalSkillNameData.text = _loc2_;
         this.normalSkillNameData.height = (this.normalSkillNameData.textField.numLines + 1) * 22;
         this.normalSkillNameData.parent.height = this.normalSkillNameData.height;
         this.skillNameData.textField.width = 180;
         _loc2_ = StringUtil.substitute(this._skillDescTemplate,param1.passiveSkillDesc,param1.passiveSkillName,param1.passiveSkillLevel);
         this.skillNameData.text = _loc2_;
         this.skillNameData.height = (this.skillNameData.textField.numLines + 1) * 22;
         this.skillNameData.parent.height = this.skillNameData.height;
      }
      
      public function setStar(param1:int) : void
      {
         var _loc2_:Image = null;
         var _loc3_:String = null;
         while(this.starBox.numChildren > 0)
         {
            this.starBox.removeChildAt(0);
         }
         if(param1 >= 6)
         {
            _loc3_ = "Card_month";
            param1 -= 5;
         }
         else
         {
            _loc3_ = "Card_star";
         }
         var _loc4_:int = 0;
         while(_loc4_ < param1)
         {
            _loc2_ = new Image();
            _loc2_.source = AssetManager.GetClass(_loc3_);
            _loc2_.x = this.lessW * _loc4_;
            this.starBox.addChild(_loc2_);
            _loc4_++;
         }
      }
      
      public function get text() : Object
      {
         return super.data;
      }
      
      public function set text(param1:Object) : void
      {
         data = param1;
         var _loc2_:DummyZombieInfo = data as DummyZombieInfo;
         this.update(_loc2_);
      }
   }
}
