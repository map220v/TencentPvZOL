package com.qq.display
{
   import PVZ.Cmd.Dto_ItemInfo;
   import asgui.containers.Canvas;
   import asgui.controls.Alert;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.managers.ToolTipManager;
   import asgui.resources.AssetManager;
   import asgui.serialization.base64.Base64Util;
   import com.qq.GameGloble;
   import com.qq.constant.BattleCardStatus;
   import com.qq.constant.CardQuality;
   import com.qq.modules.bag.view.components.BagItemTooltip;
   import com.qq.modules.card.model.templates.CardChestAvatarTemp;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.card.model.vo.CardItemVO;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.battle.BattleLineupTemplateFactory;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.templates.font.FontNormal;
   import com.qq.tooltip.ItemTooltip;
   import com.qq.tooltip.PlantCardToolTip;
   import com.qq.utils.GraphicsUtils;
   import com.qq.utils.QualityUtil;
   import com.qq.utils.UtilsManager;
   import com.tencent.protobuf.Int64;
   import flash.display.Sprite;
   import flash.filters.ColorMatrixFilter;
   import flash.utils.ByteArray;
   import tencent.base.utils.ColorMatrix;
   
   public class CardItem extends BaseCardItem
   {
       
      
      protected var img_bj:Image;
      
      protected var img_card:CardIcon;
      
      protected var img_QuiltyLv_BG:Image;
      
      protected var img_QuiltyLv_Top_BG:Image;
      
      public var txt_lv:Label;
      
      protected var txt_StrengthLv:Label;
      
      protected var img_Strength_BG:Image;
      
      public var box_star:Canvas;
      
      protected var txt_QuiltyLevel:Label;
      
      protected var txt_star:Label;
      
      protected var img_embattle:Image;
      
      protected var txt_embattle:Label;
      
      protected var img_selected:Image;
      
      public var cardFullInfo:CardItemVO;
      
      protected var cardBasicInfo:BattleLineupCardTemp;
      
      protected var masker:Sprite;
      
      protected var _autoToolTip:Boolean = false;
      
      public var cardSizeType:int = 0;
      
      protected var lessW:int = 10;
      
      protected var starW:int = 17;
      
      protected var star_x:int = 10;
      
      protected var txt_star_x:int = 30;
      
      protected var monthW:int = 25;
      
      public function CardItem(param1:Class = null)
      {
         super(param1);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 70;
         this.height = 90;
         this.img_bj = new Image();
         addChild(this.img_bj);
         this.img_card = new CardIcon();
         addChild(this.img_card);
         this.img_Strength_BG = new Image();
         this.img_Strength_BG.x = 1;
         this.img_Strength_BG.y = 12;
         this.img_Strength_BG.mouseChildren = false;
         this.img_Strength_BG.mouseEnabled = false;
         this.img_Strength_BG.visible = false;
         this.img_Strength_BG.source = AssetManager.GetClass(this.getSourceRealName("Card_Strength_BG"));
         addChild(this.img_Strength_BG);
         this.img_QuiltyLv_BG = new Image();
         this.img_QuiltyLv_BG.x = 1;
         this.img_QuiltyLv_BG.y = 1;
         this.img_QuiltyLv_BG.mouseChildren = false;
         this.img_QuiltyLv_BG.mouseEnabled = false;
         addChild(this.img_QuiltyLv_BG);
         this.img_QuiltyLv_Top_BG = new Image();
         this.img_QuiltyLv_Top_BG.x = 3;
         this.img_QuiltyLv_Top_BG.y = 2;
         this.img_QuiltyLv_Top_BG.mouseChildren = false;
         this.img_QuiltyLv_Top_BG.mouseEnabled = false;
         addChild(this.img_QuiltyLv_Top_BG);
         this.txt_lv = new Label();
         addChild(this.txt_lv);
         this.txt_lv.right = 7;
         this.txt_lv.bottom = 17;
         this.txt_lv.width = 53;
         this.txt_lv.height = 24;
         this.txt_lv.SetStyle("textAlign","right");
         this.txt_lv.SetStyle("color","#9bff73");
         this.txt_StrengthLv = new Label();
         addChild(this.txt_StrengthLv);
         this.txt_StrengthLv.SetStyle("textAlign","left");
         this.txt_StrengthLv.SetStyle("fontSize","11");
         this.txt_StrengthLv.top = 21;
         this.txt_StrengthLv.left = 5;
         this.txt_StrengthLv.height = 32;
         this.txt_StrengthLv.width = 32;
         this.txt_QuiltyLevel = new Label();
         this.txt_QuiltyLevel.left = 4;
         this.txt_QuiltyLevel.top = 3;
         this.txt_QuiltyLevel.width = 25;
         this.txt_QuiltyLevel.height = 17;
         addChild(this.txt_QuiltyLevel);
         this.box_star = new Canvas();
         addChild(this.box_star);
         this.box_star.left = 5;
         this.box_star.right = 5;
         this.box_star.width = this.width - this.box_star.left - this.box_star.right;
         this.box_star.height = 20;
         this.box_star.bottom = 3;
         this.txt_star = new Label();
         this.txt_star.width = 40;
         addChild(this.txt_star);
         this.txt_star.left = 50;
         this.masker = new Sprite();
         this.masker.mouseChildren = false;
         this.masker.mouseEnabled = false;
         GraphicsUtils.drawRect(this.masker,0,0,width,height,0,0.5);
         this.masker.visible = false;
         addChild(this.masker);
         this.img_selected = new Image();
         addChild(this.img_selected);
         this.img_selected.source = AssetManager.GetClass("Card_selected");
         this.img_selected.x = -3;
         this.img_selected.y = -3;
         this.img_selected.visible = false;
         this.img_selected.mouseChildren = false;
         this.img_selected.mouseEnabled = false;
         this.img_embattle = new Image();
         $addChild(this.img_embattle);
         this.img_embattle.ifRemovePreChildWhenChangeSource = true;
         this.img_embattle.source = AssetManager.GetClass("Card_bj_enbattle");
         this.img_embattle.x = this.width - this.img_embattle.width + 5;
         this.img_embattle.y = -5;
         this.txt_embattle = new Label();
         $addChild(this.txt_embattle);
         this.txt_embattle.x = this.width - this.img_embattle.width + 7;
         this.txt_embattle.y = -5;
         this.txt_embattle.text = "上阵";
         this.txt_embattle.styleName = ".TXT_HKHB_13_White";
         this.txt_embattle.SetStyle("textShadowAlpha","0");
         this.txt_embattle.SetStyle("fontSize","11");
         this.setEmbattle(false);
         cacheAsBitmap = true;
         this.scrollRectEnabled = true;
      }
      
      public function resetView() : void
      {
         this.setAutoToolTip(false);
         this.setBagCardItem(0);
         this.setBagEquipItem(null);
         this.img_card.source = null;
         this.setData(null,null);
         this.selected = false;
         this.txt_lv.text = "";
         this.setStrengthLv(0);
         this.setEmbattle(false);
         this.setStar(0,0);
      }
      
      public function isHideMasker(param1:Boolean) : void
      {
         this.masker.visible = !param1;
      }
      
      public function setDataEasy(param1:CardItemVO) : void
      {
         var _loc2_:BattleLineupCardTemp = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateById(param1.cardId);
         this.setData(param1,_loc2_);
      }
      
      public function setAutoToolTip(param1:Boolean) : void
      {
         if(this._autoToolTip == param1)
         {
            return;
         }
         this._autoToolTip = param1;
         if(!this.cardFullInfo)
         {
            return;
         }
         if(param1)
         {
            this.toolTip = this.cardFullInfo;
            this.toolTipClass = PlantCardToolTip;
         }
         else
         {
            ToolTipManager.DestroyToolTip();
         }
      }
      
      public function setBagCardItem(param1:int) : void
      {
         if(param1 != 0)
         {
            ToolTipManager.RegisterToolTip(this,param1.toString(),ItemTooltip);
         }
         else
         {
            ToolTipManager.DestroyToolTip();
         }
      }
      
      public function setBagEquipItem(param1:Dto_ItemInfo) : void
      {
         var _loc2_:ByteArray = null;
         var _loc3_:String = null;
         if(param1 != null)
         {
            _loc2_ = new ByteArray();
            param1.writeTo(_loc2_);
            _loc3_ = Base64Util.encode(_loc2_);
            ToolTipManager.RegisterToolTip(this,"dto_" + _loc3_,BagItemTooltip);
         }
         else
         {
            ToolTipManager.DestroyToolTip();
         }
      }
      
      override public function setData(param1:CardItemVO, param2:BattleLineupCardTemp = null) : void
      {
         this.cardFullInfo = param1;
         this.cardBasicInfo = param2;
         if(this.cardFullInfo == null || this.cardBasicInfo == null)
         {
            this.setAutoToolTip(false);
            return;
         }
         if(this._autoToolTip)
         {
            this.setAutoToolTip(false);
            this.setAutoToolTip(true);
         }
         this.setLevel(param1.level);
         this.setQuality(param1.quality);
         this.setQuiltyLv(param1);
         this.setStrengthLv(param1.forgeLevel);
         this.setDataByCardId(param1.cardId,param1.avatarId);
      }
      
      public function setDataByCardId(param1:int, param2:int = 0) : void
      {
         var _loc4_:CardChestAvatarTemp = null;
         var _loc5_:BattleLineupCardTemp = null;
         var _loc3_:BattleLineupCardTemp = SettingsModel.instance.battleCardSettings.getBattleCardTempById(param1);
         this.setDataBySetting(_loc3_);
         if(param2 == 0)
         {
            if((_loc5_ = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateById(param1)) != null)
            {
               _loc4_ = CardTemplateFactory.instance.getPlantAvatarByTdPlantId(_loc5_.tdId);
            }
         }
         else
         {
            _loc4_ = CardTemplateFactory.instance.getPlantAvatarByAvatarId(param2);
         }
         if(_loc4_ != null)
         {
            this.setAvatar(_loc4_);
         }
      }
      
      override public function setDataBySetting(param1:BattleLineupCardTemp) : void
      {
         this.setCardIcon(CardItemFactory.getIconURL(param1.icon));
         this.setStar(param1.star,param1.awakeLevel);
      }
      
      public function setAvatar(param1:CardChestAvatarTemp) : void
      {
         this.img_card.setAvatar(param1);
      }
      
      override public function set selected(param1:Boolean) : void
      {
         this.img_selected.visible = param1;
      }
      
      override public function get selected() : Boolean
      {
         return this.img_selected.visible;
      }
      
      public function setCardIcon(param1:Object, param2:Boolean = false) : void
      {
         this.img_card.source = param1;
         if(param2)
         {
            this.img_card.scrollRectEnabled = true;
            this.img_card.x = 10;
            this.img_card.y = 14;
         }
         else
         {
            this.img_card.setCardIcon(param1 as String);
            this.img_card.filters = null;
         }
      }
      
      override public function setQuality(param1:int) : void
      {
         var _loc2_:String = null;
         if(param1 > CardQuality.COLOR || param1 < CardQuality.WHITE)
         {
            param1 = CardQuality.WHITE;
         }
         switch(param1)
         {
            case CardQuality.WHITE:
               _loc2_ = "#ffffff";
               break;
            case CardQuality.GREEN:
               _loc2_ = "#9bff73";
               break;
            case CardQuality.BLUE:
               _loc2_ = "#c3fbff";
               break;
            case CardQuality.PURPLE:
               _loc2_ = "#ffcde1";
               break;
            case CardQuality.ORANGE:
               _loc2_ = "#fb891a";
               break;
            case CardQuality.GOLD:
               _loc2_ = "#ffffc5";
               break;
            case CardQuality.COLOR:
               _loc2_ = "#ffffc5";
         }
         this.img_bj.source = AssetManager.GetClass(this.getSourceRealName("Card_bj_quality_" + param1));
         this.img_QuiltyLv_BG.source = AssetManager.GetClass("Card_bj_QualityLv_" + param1);
         this.img_QuiltyLv_Top_BG.source = AssetManager.GetClass("Card_Top_bj_QualityLv_" + param1);
         this.txt_QuiltyLevel.SetStyle("color",_loc2_);
      }
      
      override public function setLevel(param1:int) : void
      {
         this.txt_lv.text = "lv." + param1;
      }
      
      override public function setStrengthLv(param1:int) : void
      {
         var _loc2_:String = null;
         if(param1 == 0)
         {
            this.txt_StrengthLv.text = "";
            this.img_Strength_BG.visible = false;
            this.txt_StrengthLv.toolTip = null;
         }
         else
         {
            _loc2_ = "";
            switch(param1)
            {
               case 1:
                  _loc2_ = "Ⅰ";
                  break;
               case 2:
                  _loc2_ = "Ⅱ";
                  break;
               case 3:
                  _loc2_ = "Ⅲ";
                  break;
               case 4:
                  _loc2_ = "Ⅳ";
                  break;
               case 5:
                  _loc2_ = "Ⅴ";
                  break;
               case 6:
                  _loc2_ = "Ⅵ";
            }
            this.txt_StrengthLv.text = _loc2_;
            this.img_Strength_BG.visible = true;
            this.txt_StrengthLv.toolTip = FontNormal.CARD_ForgeLevel + "+" + param1;
         }
      }
      
      public function setNum(param1:int) : void
      {
         if(param1 == 0)
         {
            this.txt_lv.text = "";
         }
         else
         {
            this.txt_lv.SetStyle("color","#FFFFFF");
            this.txt_lv.text = "+" + param1;
         }
         this.img_QuiltyLv_BG.visible = false;
         this.img_QuiltyLv_Top_BG.visible = false;
         this.txt_QuiltyLevel.visible = false;
         this.txt_QuiltyLevel.toolTip = null;
      }
      
      override public function setQuiltyLv(param1:CardItemVO) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.setQuiltyLvNum(param1.quality,param1.rank);
      }
      
      override public function setQuiltyLvNum(param1:int, param2:int) : void
      {
         var _loc4_:String = null;
         var _loc5_:* = null;
         if(param2 > 0)
         {
            this.img_QuiltyLv_Top_BG.visible = false;
            this.img_QuiltyLv_BG.visible = true;
            this.txt_QuiltyLevel.text = "+" + param2;
         }
         else
         {
            this.img_QuiltyLv_Top_BG.visible = true;
            this.img_QuiltyLv_BG.visible = true;
            this.txt_QuiltyLevel.text = "  ";
         }
         var _loc3_:String = QualityUtil.getQualityName(param1);
         if(param2 > 0)
         {
            _loc5_ = UtilsManager.num2Chinese(param2) + "阶";
            _loc4_ = _loc3_ + _loc5_;
         }
         else
         {
            _loc4_ = _loc3_ + FontNormal.CARD_RANK;
         }
         this.txt_QuiltyLevel.toolTip = _loc4_;
      }
      
      override public function setEmbattle(param1:Boolean) : void
      {
         this.txt_embattle.visible = param1;
         if(param1)
         {
            this.txt_embattle.text = "上阵";
         }
         this.img_embattle.visible = param1;
      }
      
      override public function setCardStatus(param1:int, param2:Int64) : void
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         switch(param1)
         {
            case BattleCardStatus.FORMATION_HOME:
               this.setEmbattle(true);
               this.txt_embattle.text = "上阵";
               if(param2)
               {
                  _loc3_ = GameGloble.actorModel.battleCardModel.getBattleTeamIdBycardUid(param2);
                  if(_loc3_ != 0)
                  {
                     _loc4_ = _loc3_.toString().substr(-1,1);
                     this.txt_embattle.text = "阵 " + _loc4_;
                  }
               }
               this.img_embattle.source = AssetManager.GetClass("Card_bj_enbattle");
               break;
            case BattleCardStatus.FORMATION_DEFENCE:
               this.setEmbattle(true);
               this.txt_embattle.text = "防守";
               this.img_embattle.source = AssetManager.GetClass("Card_bj_defence");
               break;
            case BattleCardStatus.FORMATION_OUT:
               this.setEmbattle(true);
               this.txt_embattle.text = "出征";
               this.img_embattle.source = AssetManager.GetClass("Card_bj_enbattle");
               break;
            case BattleCardStatus.FORMATION_NO:
               this.setEmbattle(false);
               break;
            default:
               Alert.Show("设置卡牌状态错误, 无法识别制定的状态类型id");
         }
      }
      
      override public function setStar(param1:int, param2:int) : void
      {
         var _loc3_:Image = null;
         var _loc4_:Image = null;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         if(param2 == 0)
         {
            while(this.box_star.numChildren > 0)
            {
               this.box_star.removeChildAt(0);
            }
            if(param1 >= 6)
            {
               if(this.box_star.numChildren == 0)
               {
                  _loc3_ = new Image();
                  _loc3_.source = AssetManager.GetClass(this.getSourceRealName("Card_star"));
                  this.box_star.addChild(_loc3_);
               }
               else if(this.box_star.numChildren > 1)
               {
                  while(this.box_star.numChildren > 1)
                  {
                     this.box_star.removeChildAt(0);
                  }
                  _loc3_ = this.box_star.getChildAt(0) as Image;
               }
               _loc3_.x = this.star_x;
               this.txt_star.x = this.txt_star_x;
               this.txt_star.text = "x" + param1;
            }
            else
            {
               while(this.box_star.numChildren > param1)
               {
                  this.box_star.removeChildAt(0);
               }
               while(this.box_star.numChildren < param1)
               {
                  _loc3_ = new Image();
                  _loc3_.source = AssetManager.GetClass(this.getSourceRealName("Card_star"));
                  this.box_star.addChild(_loc3_);
               }
               _loc5_ = (this.box_star.width - this.lessW * param1) * 0.5;
               if(param1 == 1)
               {
                  _loc5_ = (this.box_star.width - this.starW) * 0.5;
               }
               _loc6_ = 0;
               while(_loc6_ < param1)
               {
                  _loc3_ = this.box_star.getChildAt(_loc6_) as Image;
                  _loc3_.x = _loc5_ + this.lessW * _loc6_;
                  _loc6_++;
               }
            }
         }
         else
         {
            while(this.box_star.numChildren > 0)
            {
               this.box_star.removeChildAt(0);
            }
            while(this.box_star.numChildren < param2)
            {
               (_loc4_ = new Image()).source = AssetManager.GetClass(this.getSourceRealName("Card_month"));
               this.box_star.addChild(_loc4_);
            }
            _loc5_ = (this.box_star.width - this.lessW * param2) * 0.5;
            if(param2 == 1)
            {
               _loc5_ = (this.box_star.width - this.monthW) * 0.5;
            }
            _loc6_ = 0;
            while(_loc6_ < param2)
            {
               (_loc4_ = this.box_star.getChildAt(_loc6_) as Image).x = _loc5_ + this.lessW * _loc6_;
               _loc6_++;
            }
         }
      }
      
      protected function getSourceRealName(param1:String) : String
      {
         if(this.cardSizeType == 1)
         {
            return param1 + "_mid";
         }
         return param1;
      }
      
      public function updateHPFilter() : void
      {
         if(this.cardFullInfo && Number(this.cardFullInfo.currentHp && this.cardFullInfo.currentHp.toNumber()) == 0)
         {
            this.setBlackFiler(true);
         }
         else
         {
            this.setBlackFiler(false);
         }
      }
      
      public function setBlackFiler(param1:Boolean) : void
      {
         var _loc2_:ColorMatrixFilter = null;
         var _loc3_:tencent.base.utils.ColorMatrix = null;
         if(param1)
         {
            _loc2_ = new ColorMatrixFilter();
            _loc3_ = new tencent.base.utils.ColorMatrix();
            _loc3_.adjustSaturation(-100);
            _loc3_.adjustBrightness(-30);
            _loc2_.matrix = _loc3_;
            this.filters = [_loc2_];
         }
         else
         {
            this.filters = [];
         }
      }
      
      public function setBGVisiable(param1:Boolean) : void
      {
         if(this.img_bj != null)
         {
            this.img_bj.visible = param1;
         }
      }
      
      override public function Dispose() : void
      {
         this.img_selected.Dispose();
         this.img_embattle.Dispose();
         this.txt_embattle.Dispose();
         super.Dispose();
      }
   }
}
