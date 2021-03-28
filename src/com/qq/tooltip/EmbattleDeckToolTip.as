package com.qq.tooltip
{
   import asgui.containers.Canvas;
   import asgui.containers.HBox;
   import asgui.containers.VBox;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.Text;
   import asgui.core.IToolTip;
   import asgui.resources.AssetManager;
   import com.qq.GameGloble;
   import com.qq.display.QCanvas;
   import com.qq.display.SimpleCardItem;
   import com.qq.managers.FilterManager;
   import com.qq.modules.card.CardGlobals;
   import com.qq.modules.card.model.templates.CardDeckDetailInfo;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.card.model.templates.ce.CardDeckShowTemplateCE;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.battle.BattleLineupTemplateFactory;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.templates.font.FontHKHB;
   import tencent.base.utils.ArrayUtil;
   
   public class EmbattleDeckToolTip extends QCanvas implements IToolTip
   {
       
      
      public var deckBox:VBox;
      
      public function EmbattleDeckToolTip(param1:Class = null)
      {
         super(EmbattleDeckToolTipMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 230;
         this.styleName = "ToolTip";
         this.deckBox = new VBox();
         this.deckBox.width = 220;
         addChild(this.deckBox);
      }
      
      public function setInfo(param1:Array, param2:Array) : void
      {
         var _loc6_:Array = null;
         var _loc7_:CardDeckDetailInfo = null;
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         var _loc10_:Canvas = null;
         while(this.deckBox.numChildren > 0)
         {
            this.deckBox.removeChildAt(0);
         }
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc6_ = CardTemplateFactory.instance.getAllDeckDetailInfo(param1[_loc4_]);
            for each(_loc7_ in _loc6_)
            {
               _loc8_ = true;
               for each(_loc9_ in _loc7_.componentPlants)
               {
                  if(param2.indexOf(_loc9_) < 0)
                  {
                     _loc8_ = false;
                     break;
                  }
               }
               if(_loc8_)
               {
                  if(_loc3_.indexOf(_loc7_.deckId) < 0)
                  {
                     _loc3_.push(_loc7_.deckId);
                  }
               }
            }
            _loc4_++;
         }
         var _loc5_:Label;
         (_loc5_ = new Label()).styleName = ".TXT_HKHB_13_Yellow";
         _loc5_.SetStyle("fontSize","16");
         _loc5_.width = 150;
         if(_loc3_.length > 0)
         {
            _loc5_.text = FontHKHB.CARD_DECK_ACTIVED;
            _loc5_.SetStyle("color","#FFF668");
         }
         else
         {
            _loc5_.text = FontHKHB.CARD_DECK_NO_ACTIVE;
            _loc5_.SetStyle("color","#FFFFFF");
         }
         this.deckBox.addChild(_loc5_);
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc10_ = this.createDeckTxt(_loc3_[_loc4_]);
            this.deckBox.addChild(_loc10_);
            _loc4_++;
         }
      }
      
      public function createDeckTxt(param1:int) : Canvas
      {
         var _loc10_:CardDeckDetailInfo = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:BattleLineupCardTemp = null;
         var _loc16_:SimpleCardItem = null;
         var _loc2_:Canvas = new Canvas();
         var _loc3_:Image = new Image();
         _loc3_.source = AssetManager.GetClass("skin_battle_cutOff");
         _loc3_.width = 215;
         _loc2_.addChild(_loc3_);
         _loc3_.x = 0;
         var _loc4_:Text;
         (_loc4_ = new Text()).styleName = ".TXT_14_Green";
         _loc4_.SetStyle("color","#ffffff");
         _loc4_.SetStyle("textShadowStrength","8");
         _loc4_.SetStyle("textShadowColor","#0");
         _loc4_.SetStyle("fontSize","15");
         _loc4_.width = 220;
         _loc2_.addChild(_loc4_);
         _loc4_.y = 10;
         var _loc5_:HBox;
         (_loc5_ = new HBox()).width = 220;
         _loc5_.y = 5;
         _loc5_.x = 85;
         _loc2_.addChild(_loc5_);
         var _loc6_:Text;
         (_loc6_ = new Text()).styleName = ".TXT_14_Green";
         _loc6_.SetStyle("color","#ffffff");
         _loc6_.SetStyle("textShadowStrength","8");
         _loc6_.SetStyle("textShadowColor","#0");
         _loc6_.SetStyle("fontSize","13");
         _loc6_.width = 220;
         _loc2_.addChild(_loc6_);
         _loc6_.y = 45;
         var _loc7_:CardDeckShowTemplateCE = CardTemplateFactory.instance.getCardDeckShowTemplate(param1);
         var _loc8_:Array = ArrayUtil.convertToInt(_loc7_.cardIds.split(","));
         var _loc9_:Array = CardTemplateFactory.instance.getAllDeckDetailInfo(int(_loc8_[0] / 10) * 10 + 1);
         for each(_loc10_ in _loc9_)
         {
            if(_loc10_.deckId == param1)
            {
               _loc4_.text = "<font color=\'#ff9900\'>[" + _loc7_.name + "]</font>";
               _loc11_ = "";
               _loc12_ = "";
               _loc13_ = 0;
               _loc14_ = 0;
               while(_loc14_ < _loc8_.length)
               {
                  if(_loc15_ = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateByTdPlantId(_loc8_[_loc14_]))
                  {
                     if(_loc13_ > 0 && _loc13_ % 3 == 0)
                     {
                        _loc12_ += "\n";
                     }
                     if(_loc13_ % 3 != 0)
                     {
                        _loc12_ += " ";
                     }
                     (_loc16_ = new SimpleCardItem()).setCardId(_loc8_[_loc14_],false);
                     _loc5_.addChild(_loc16_);
                     if(GameGloble.actorModel.battleCardModel.hasCardInBattleListByTdId(_loc8_[_loc14_]))
                     {
                        _loc12_ += "<font color=\'#00ff00\'>" + _loc15_.name + "</font>";
                        _loc16_.filters = [];
                     }
                     else
                     {
                        _loc12_ += "<font color=\'#999999\'>" + _loc15_.name + "</font>";
                        _loc16_.filters = [FilterManager.getGaryFilter()];
                     }
                     _loc13_++;
                  }
                  _loc14_++;
               }
               _loc13_ = 0;
               _loc14_ = 0;
               while(_loc14_ < _loc10_.attributePromote.length)
               {
                  if(_loc10_.attributePromote[_loc14_] > 0)
                  {
                     if(_loc13_ > 0 && _loc13_ % 3 == 0)
                     {
                        _loc12_ += "\n";
                     }
                     if(_loc13_ % 3 != 0)
                     {
                        _loc11_ += " ";
                     }
                     _loc11_ += "<font color=\'#fe9292\'>" + CardGlobals.CARD_DECK_SKILL_DESC_LIST[_loc14_] + "+" + _loc10_.attributePromote[_loc14_] + "</font>";
                     _loc13_++;
                  }
                  _loc14_++;
               }
               _loc11_ += "\n";
               _loc13_ = 0;
               _loc14_ = 0;
               while(_loc14_ < _loc10_.featureIds.length)
               {
                  if(_loc10_.featureIds[_loc14_] != 0)
                  {
                     if(_loc13_ > 0 && _loc13_ % 3 == 0)
                     {
                        _loc12_ += "\n";
                     }
                     if(_loc13_ % 3 != 0)
                     {
                        _loc11_ += " ";
                     }
                     _loc11_ += "<font color=\'#fe9292\'>" + SettingsModel.instance.battleCardFeatureSettings.getCardFeatureTempById(_loc10_.featureIds[_loc14_]).getSimpleDescWithValue() + "</font>";
                     _loc13_++;
                  }
                  _loc14_++;
               }
               _loc6_.text = _loc11_;
               break;
            }
         }
         return _loc2_;
      }
      
      public function get text() : Object
      {
         return super.data;
      }
      
      public function set text(param1:Object) : void
      {
         data = param1;
      }
   }
}
