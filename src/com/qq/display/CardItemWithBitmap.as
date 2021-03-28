package com.qq.display
{
   import asgui.containers.Canvas;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.GameGloble;
   import com.qq.constant.BattleCardStatus;
   import com.qq.constant.CardQuality;
   import com.qq.modules.bag.ItemQualityType;
   import com.qq.modules.card.model.templates.CardChestAvatarTemp;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.card.model.vo.CardItemVO;
   import com.qq.modules.dummy.model.DummyZombieInfo;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.battle.BattleLineupTemplateFactory;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.GraphicsUtils;
   import com.qq.utils.QualityUtil;
   import com.qq.utils.UrlManager;
   import com.qq.utils.UtilsManager;
   import com.tencent.protobuf.Int64;
   import flash.display.Sprite;
   
   public class CardItemWithBitmap extends BaseCardItem
   {
       
      
      public var img_bj:Image;
      
      public var img_card:Image;
      
      public var img_QuiltyLv_BG:Image;
      
      public var img_QuiltyLv_Top_BG:Image;
      
      public var txt_lv:Label;
      
      public var txt_StrengthLv:Label;
      
      public var img_Strength_BG:Image;
      
      public var box_star:Canvas;
      
      public var txt_QuiltyLevel:Label;
      
      public var img_embattle:Image;
      
      public var txt_embattle:Label;
      
      public var img_selected:Image;
      
      public var cardFullInfo:CardItemVO;
      
      public var dummyZombieInfo:DummyZombieInfo;
      
      private var _autoToolTip:Boolean = false;
      
      protected var lessW:int = 10;
      
      protected var starW:int = 17;
      
      protected var star_x:int = 10;
      
      protected var monthW:int = 17;
      
      public function CardItemWithBitmap(param1:Class = null)
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
         var _loc1_:Sprite = new Sprite();
         GraphicsUtils.drawRect(_loc1_,0,0,width,66,0,1);
         this.img_card = new Image();
         this.img_card.y = 3;
         this.img_card.width = width;
         this.img_card.height = height;
         addChild(this.img_card);
         addChild(_loc1_);
         this.img_card.mask = _loc1_;
         this.img_Strength_BG = new Image();
         this.img_Strength_BG.x = 1;
         this.img_Strength_BG.y = 12;
         this.img_Strength_BG.mouseChildren = false;
         this.img_Strength_BG.mouseEnabled = false;
         this.img_Strength_BG.visible = false;
         this.img_Strength_BG.source = AssetManager.GetClass("Card_Strength_BG");
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
         this.txt_lv.height = 20;
         this.txt_lv.bottom = 17;
         this.txt_lv.width = 53;
         this.txt_lv.SetStyle("textAlign","right");
         this.txt_lv.SetStyle("color","#9bff73");
         this.txt_StrengthLv = new Label();
         addChild(this.txt_StrengthLv);
         this.txt_StrengthLv.SetStyle("textAlign","left");
         this.txt_StrengthLv.SetStyle("fontSize","11");
         this.txt_StrengthLv.top = 21;
         this.txt_StrengthLv.left = 5;
         this.txt_StrengthLv.height = 32;
         this.txt_StrengthLv.width = 14;
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
         this.img_selected = new Image();
         addChild(this.img_selected);
         this.img_selected.source = AssetManager.GetClass("Card_selected");
         this.img_selected.x = -3;
         this.img_selected.y = -3;
         this.img_selected.visible = false;
         this.img_selected.mouseChildren = false;
         this.img_selected.mouseEnabled = false;
         this.img_embattle = new Image();
         addChild(this.img_embattle);
         this.img_embattle.ifRemovePreChildWhenChangeSource = true;
         this.img_embattle.source = AssetManager.GetClass("Card_bj_enbattle");
         this.img_embattle.x = this.width - this.img_embattle.width + 5;
         this.img_embattle.y = -5;
         this.txt_embattle = new Label();
         addChild(this.txt_embattle);
         this.txt_embattle.x = this.width - this.img_embattle.width + 7;
         this.txt_embattle.y = -5;
         this.txt_embattle.text = "上阵";
         this.txt_embattle.styleName = ".TXT_HKHB_13_White";
         this.txt_embattle.SetStyle("textShadowAlpha","0");
         this.txt_embattle.SetStyle("fontSize","11");
         this.setEmbattle(false);
         scrollRectEnabled = false;
      }
      
      override public function setDummyData(param1:DummyZombieInfo) : void
      {
         this.dummyZombieInfo = param1;
         if(this.dummyZombieInfo == null)
         {
            this.img_card.visible = false;
            this.setLevel(-1);
            this.setQuality(ItemQualityType.NORMAL_TYPE);
            this.setQuiltyLvNum(-1,-1);
            this.setStar(-1,-1);
         }
         else
         {
            this.img_card.source = UrlManager.getUrl(UrlManager.Url_Card_icon,param1.iconID + "_0.png");
            this.img_card.visible = true;
            this.setLevel(param1.level);
            this.setQuality(param1.quiltyType);
            this.setQuiltyLvNum(param1.quiltyType,param1.quitlyLv);
            this.setStar(param1.star,0);
         }
      }
      
      override public function setData(param1:CardItemVO, param2:BattleLineupCardTemp = null) : void
      {
         this.cardFullInfo = param1;
         this.setLevel(param1.level);
         this.setQuality(param1.quality);
         this.setQuiltyLv(param1);
         this.setStrengthLv(param1.forgeLevel);
         this.setDataByCardId(param1.cardId,param1.avatarId);
      }
      
      override public function setDataBySetting(param1:BattleLineupCardTemp) : void
      {
         this.setDataByCardId(param1.id);
      }
      
      public function setDataByCardId(param1:int, param2:int = 0) : void
      {
         var _loc4_:CardChestAvatarTemp = null;
         var _loc5_:BattleLineupCardTemp = null;
         var _loc3_:BattleLineupCardTemp = SettingsModel.instance.battleCardSettings.getBattleCardTempById(param1);
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
            this.img_card.source = UrlManager.getUrl(UrlManager.Url_Card_icon,_loc3_.icon + "_" + _loc4_.id + ".png");
         }
         else
         {
            this.img_card.source = UrlManager.getUrl(UrlManager.Url_Card_icon,_loc3_.icon + "_0.png");
         }
         this.setStar(_loc3_.star,_loc3_.awakeLevel);
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
            case BattleCardStatus.FORMATION_OUT:
               this.setEmbattle(true);
               this.txt_embattle.text = "出征";
               this.img_embattle.source = AssetManager.GetClass("Card_bj_enbattle");
               break;
            case BattleCardStatus.FORMATION_NO:
               this.setEmbattle(false);
         }
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
      
      override public function set selected(param1:Boolean) : void
      {
         this.img_selected.visible = param1;
      }
      
      override public function get selected() : Boolean
      {
         return this.img_selected.visible;
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
         this.img_bj.source = AssetManager.GetClass("Card_bj_quality_" + param1);
         this.img_QuiltyLv_BG.source = AssetManager.GetClass("Card_bj_QualityLv_" + param1);
         this.img_QuiltyLv_Top_BG.source = AssetManager.GetClass("Card_Top_bj_QualityLv_" + param1);
         this.txt_QuiltyLevel.SetStyle("color",_loc2_);
      }
      
      override public function setLevel(param1:int) : void
      {
         if(param1 == -1)
         {
            this.txt_lv.text = "";
         }
         else
         {
            this.txt_lv.text = "lv." + param1;
         }
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
         var _loc3_:String = null;
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
         if(param1 > 0)
         {
            _loc3_ = QualityUtil.getQualityName(param1);
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
         else
         {
            this.txt_QuiltyLevel.toolTip = null;
         }
      }
      
      override public function setStar(param1:int, param2:int) : void
      {
         var _loc3_:Image = null;
         var _loc4_:Image = null;
         var _loc5_:int = 0;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         if(param2 == 0)
         {
            while(this.box_star.numChildren > 0)
            {
               this.box_star.removeChildAt(0);
            }
            if(param1 >= 6)
            {
               _loc8_ = "Card_month";
               _loc5_ = param1 - 5;
            }
            else
            {
               _loc8_ = "Card_star";
               _loc5_ = param1;
            }
            _loc9_ = 0;
            while(_loc9_ < _loc5_)
            {
               _loc3_ = new Image();
               _loc3_.source = AssetManager.GetClass(_loc8_);
               _loc3_.x = this.lessW * _loc9_;
               this.box_star.addChild(_loc3_);
               _loc9_++;
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
               (_loc4_ = new Image()).source = AssetManager.GetClass("Card_month");
               this.box_star.addChild(_loc4_);
            }
            _loc5_ = param2;
         }
         var _loc6_:int = (this.box_star.width - this.lessW * _loc5_) * 0.5;
         if(_loc5_ == 1)
         {
            _loc6_ = (this.box_star.width - this.monthW) * 0.5;
         }
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            (_loc4_ = this.box_star.getChildAt(_loc7_) as Image).x = _loc6_ + this.lessW * _loc7_;
            _loc7_++;
         }
      }
   }
}
