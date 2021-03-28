package com.qq.modules.card.model.templates
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.card.CardGlobals;
   import com.qq.modules.card.model.templates.ce.CardDeckAttributeTemplateCE;
   import com.qq.modules.card.model.templates.ce.CardDeckShowTemplateCE;
   import com.qq.modules.card.model.templates.ce.CardPuzzlePriceTemplateCE;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.battle.BattleLineupTemplateFactory;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.utils.db.ClientDBTableName;
   import org.as3commons.logging.api.getLogger;
   import tencent.base.utils.ArrayUtil;
   
   public class CardTemplateFactory
   {
      
      private static var _instance:CardTemplateFactory;
       
      
      private var _maxAvatarForgeLv:int = -1;
      
      private var cacheCardUpgradeTemplate:Vector.<CardUpgradeTemplate>;
      
      private var cacheCardForgeTemplate:Vector.<CardForgeTemplate>;
      
      private var cacheCardForgeChanceTemplate:Vector.<CardForgeChanceTemplate>;
      
      private var cacheCardChestAvatarTemps:Vector.<CardChestAvatarTemp>;
      
      private var cacheCardChestForgeAvatarTemps:Vector.<CardChestForgeAvatarTemp>;
      
      private var cacheCardPuzzleTemplate:Vector.<CardPuzzleTemplate>;
      
      private var cacheCardPieceTemplate:Vector.<CardPieceTemplate>;
      
      private var cacheCardPriceTemplate:Vector.<CardPuzzlePriceTemplateCE>;
      
      private var cacheCardPieceDropTemplate:Vector.<CardPieceDropTemplate>;
      
      private var cacheCardDeckDetailTemplate:Vector.<CardDeckDetailTemplate>;
      
      private var cacheCardDeckShowTemplate:Vector.<CardDeckShowTemplateCE>;
      
      private var cacheCardDeckAttributeTemplate:Vector.<CardDeckAttributeTemplateCE>;
      
      public function CardTemplateFactory()
      {
         super();
      }
      
      public static function get instance() : CardTemplateFactory
      {
         if(_instance == null)
         {
            _instance = new CardTemplateFactory();
         }
         return _instance;
      }
      
      public function getCardUpgradeTemplateById(param1:int) : CardUpgradeTemplate
      {
         var _loc2_:int = 0;
         this.build();
         var _loc3_:int = this.cacheCardUpgradeTemplate.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.cacheCardUpgradeTemplate[_loc2_].id == param1)
            {
               return this.cacheCardUpgradeTemplate[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getCardForgeTemplate(param1:int, param2:int) : CardForgeTemplate
      {
         var _loc3_:int = 0;
         this.build();
         var _loc4_:int = this.cacheCardForgeTemplate.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(this.cacheCardForgeTemplate[_loc3_].cardId == param1 && this.cacheCardForgeTemplate[_loc3_].forgeLevel == param2)
            {
               return this.cacheCardForgeTemplate[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getCardPuzzleTemplate(param1:int, param2:int) : CardPuzzleTemplate
      {
         var _loc3_:CardPuzzleTemplate = null;
         this.build();
         for each(_loc3_ in this.cacheCardPuzzleTemplate)
         {
            if(_loc3_.quality == param1 && _loc3_.rank == param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function getCardPuzzleTemplateListByQuilty(param1:int) : Array
      {
         var _loc3_:CardPuzzleTemplate = null;
         this.build();
         var _loc2_:Array = new Array();
         for each(_loc3_ in this.cacheCardPuzzleTemplate)
         {
            if(_loc3_.quality == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function getCardPieceTemplate(param1:int) : CardPieceTemplate
      {
         var _loc2_:CardPieceTemplate = null;
         this.build();
         for each(_loc2_ in this.cacheCardPieceTemplate)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getPieceDropTemplate(param1:int) : CardPieceDropTemplate
      {
         var _loc2_:CardPieceDropTemplate = null;
         this.build();
         for each(_loc2_ in this.cacheCardPieceDropTemplate)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getForgeRate(param1:int, param2:int) : int
      {
         var _loc4_:CardForgeChanceTemplate = null;
         this.build();
         var _loc3_:int = 0;
         for each(_loc4_ in this.cacheCardForgeChanceTemplate)
         {
            if(_loc4_.forgeCardStarLv == param1 && _loc4_.costItemID == param2)
            {
               _loc3_ += _loc4_.successChance;
            }
         }
         return _loc3_;
      }
      
      public function getForgeSucceedChance(param1:int, param2:Array) : int
      {
         var _loc4_:int = 0;
         var _loc5_:CardForgeChanceTemplate = null;
         this.build();
         var _loc3_:int = 0;
         for each(_loc4_ in param2)
         {
            for each(_loc5_ in this.cacheCardForgeChanceTemplate)
            {
               if(_loc5_.forgeCardStarLv == param1 && _loc5_.costItemID == _loc4_)
               {
                  _loc3_ += _loc5_.successChance;
                  if(_loc3_ >= 10000)
                  {
                     return 10000;
                  }
               }
            }
         }
         return _loc3_;
      }
      
      public function getPlantAvatarByAvatarId(param1:uint) : CardChestAvatarTemp
      {
         var _loc2_:int = 0;
         var _loc4_:CardChestAvatarTemp = null;
         this.build();
         var _loc3_:int = this.cacheCardChestAvatarTemps.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((_loc4_ = this.cacheCardChestAvatarTemps[_loc2_]).id == param1)
            {
               return _loc4_;
            }
            _loc2_++;
         }
         getLogger().error("获取avatar衣柜信息出错，无法找到指定的avatarId: " + param1);
         return null;
      }
      
      public function getPlantAvatarsByPlantId(param1:uint) : Vector.<CardChestAvatarTemp>
      {
         var i:int = 0;
         var tdPlantId:uint = param1;
         this.build();
         var length:int = this.cacheCardChestAvatarTemps.length;
         var arr:Vector.<CardChestAvatarTemp> = new Vector.<CardChestAvatarTemp>();
         i = 0;
         while(i < length)
         {
            if(this.cacheCardChestAvatarTemps[i].tdPlantId == tdPlantId)
            {
               arr.push(this.cacheCardChestAvatarTemps[i]);
            }
            i++;
         }
         arr.sort(function(param1:CardChestAvatarTemp, param2:CardChestAvatarTemp):int
         {
            return param1.id < param2.id ? -1 : 1;
         });
         return arr;
      }
      
      public function getPlantAvatarByTdPlantId(param1:uint) : CardChestAvatarTemp
      {
         this.build();
         var _loc2_:Vector.<CardChestAvatarTemp> = this.getPlantAvatarsByPlantId(param1);
         if(_loc2_.length > 0)
         {
            return _loc2_[0];
         }
         return null;
      }
      
      public function getPlantDefaultAvatarID(param1:uint) : int
      {
         var _loc2_:CardChestAvatarTemp = this.getPlantAvatarByTdPlantId(param1);
         if(_loc2_)
         {
            return _loc2_.id;
         }
         return 0;
      }
      
      public function getDefaultAvatarIDByIconId(param1:int) : int
      {
         var _loc2_:BattleLineupCardTemp = SettingsModel.instance.battleCardSettings.getBattleCardTempByIconId(param1);
         if(!_loc2_)
         {
            return 0;
         }
         return this.getPlantDefaultAvatarID(_loc2_.tdId);
      }
      
      public function getAvatarForgeByLevel(param1:uint, param2:uint) : CardChestForgeAvatarTemp
      {
         var _loc4_:int = 0;
         var _loc6_:CardChestForgeAvatarTemp = null;
         var _loc7_:CardChestForgeAvatarTemp = null;
         this.build();
         if(this._maxAvatarForgeLv != -1 && param2 > this._maxAvatarForgeLv)
         {
            return null;
         }
         var _loc3_:CardChestAvatarTemp = this.getPlantAvatarByAvatarId(param1);
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc5_:int = this.cacheCardChestForgeAvatarTemps.length;
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            if((_loc6_ = this.cacheCardChestForgeAvatarTemps[_loc4_]).type == _loc3_.forgeType && _loc6_.level == param2)
            {
               return this.cacheCardChestForgeAvatarTemps[_loc4_];
            }
            _loc4_++;
         }
         if(this._maxAvatarForgeLv == -1)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc5_)
            {
               if((_loc7_ = this.cacheCardChestForgeAvatarTemps[_loc4_]).type == _loc3_.forgeType)
               {
                  ++this._maxAvatarForgeLv;
               }
               _loc4_++;
            }
         }
         else
         {
            getLogger().error("获取avatar衣柜强化信息出错，无法找到指定的avatarId|forgeLevel :  " + _loc3_.forgeType + "|" + param2);
         }
         return null;
      }
      
      public function getPuzzlePrice(param1:int) : int
      {
         var _loc2_:CardPuzzlePriceTemplateCE = null;
         for each(_loc2_ in this.cacheCardPriceTemplate)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_.price;
            }
         }
         return 0;
      }
      
      public function getPuzzlePriceTemplate(param1:int) : CardPuzzlePriceTemplateCE
      {
         var _loc2_:CardPuzzlePriceTemplateCE = null;
         for each(_loc2_ in this.cacheCardPriceTemplate)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getCardDeckDetailTemplate(param1:int, param2:int) : CardDeckDetailTemplate
      {
         var _loc4_:CardDeckDetailTemplate = null;
         this.build();
         var _loc3_:BattleLineupCardTemp = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateById(param1);
         if(_loc3_)
         {
            for each(_loc4_ in this.cacheCardDeckDetailTemplate)
            {
               if(_loc4_.cardId == _loc3_.tdId && _loc4_.deckId == param2)
               {
                  return _loc4_;
               }
            }
         }
         return null;
      }
      
      public function getCardDeckShowTemplate(param1:int) : CardDeckShowTemplateCE
      {
         var _loc2_:CardDeckShowTemplateCE = null;
         this.build();
         for each(_loc2_ in this.cacheCardDeckShowTemplate)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getCardDeckIds(param1:int) : Array
      {
         var _loc3_:CardDeckDetailTemplate = null;
         this.build();
         var _loc2_:Array = [];
         for each(_loc3_ in this.cacheCardDeckDetailTemplate)
         {
            if(_loc3_.cardId == param1)
            {
               _loc2_.push(_loc3_.deckId);
            }
         }
         return _loc2_;
      }
      
      public function getAllDeckFeatures(param1:int) : Array
      {
         var _loc4_:CardDeckDetailTemplate = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         this.build();
         var _loc2_:Array = [];
         var _loc3_:BattleLineupCardTemp = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateById(param1);
         if(_loc3_)
         {
            for each(_loc4_ in this.cacheCardDeckDetailTemplate)
            {
               if(_loc4_.cardId == _loc3_.tdId)
               {
                  _loc5_ = _loc4_.getFeatureList();
                  for each(_loc6_ in _loc5_)
                  {
                     if(_loc2_.indexOf(_loc6_) < 0)
                     {
                        _loc2_.push(_loc6_);
                     }
                  }
               }
            }
         }
         return _loc2_;
      }
      
      public function getAllDeckDetailInfo(param1:int) : Array
      {
         var _loc3_:Array = null;
         var _loc4_:CardDeckDetailTemplate = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:CardDeckShowTemplateCE = null;
         var _loc8_:CardDeckDetailInfo = null;
         var _loc9_:int = 0;
         this.build();
         var _loc2_:BattleLineupCardTemp = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateById(param1);
         if(_loc2_)
         {
            _loc3_ = [];
            for each(_loc4_ in this.cacheCardDeckDetailTemplate)
            {
               if(_loc4_.cardId == _loc2_.tdId)
               {
                  _loc3_.push(_loc4_.deckId);
               }
            }
            _loc5_ = [];
            for each(_loc6_ in _loc3_)
            {
               if(_loc7_ = this.getCardDeckShowTemplate(_loc6_))
               {
                  (_loc8_ = new CardDeckDetailInfo()).cardId = param1;
                  _loc8_.deckId = _loc6_;
                  _loc8_.componentPlants = ArrayUtil.convertToInt(_loc7_.cardIds.split(","));
                  _loc4_ = this.getCardDeckDetailTemplate(param1,_loc6_);
                  _loc9_ = 1;
                  while(_loc9_ <= CardGlobals.CARD_DECK_SKILL_DESC_LIST.length)
                  {
                     _loc8_.attributePromote.push(_loc4_.getAttributePromotion(_loc9_));
                     _loc9_++;
                  }
                  _loc8_.featureIds = ArrayUtil.convertToInt(_loc4_.getFeatureList());
                  _loc5_.push(_loc8_);
               }
            }
            return _loc5_;
         }
         return [];
      }
      
      public function getDeckAttrLevel(param1:int, param2:int) : int
      {
         var _loc4_:CardDeckAttributeTemplateCE = null;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         this.build();
         var _loc3_:Array = [];
         for each(_loc4_ in this.cacheCardDeckAttributeTemplate)
         {
            _loc6_ = [_loc4_.attack,_loc4_.defense,_loc4_.hp,_loc4_.skill];
            _loc3_.push(_loc6_);
         }
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            if(param1 <= _loc3_[_loc5_][param2 - 1])
            {
               return _loc5_ + 1;
            }
            _loc5_++;
         }
         return 1;
      }
      
      public function hasActiveSomeDeck(param1:Array) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:BattleLineupCardTemp = null;
         var _loc7_:Array = null;
         var _loc8_:CardDeckDetailInfo = null;
         var _loc9_:Boolean = false;
         var _loc10_:int = 0;
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         for each(_loc4_ in param1)
         {
            if(_loc6_ = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateById(_loc4_))
            {
               if(_loc3_.indexOf(_loc6_.tdId) < 0)
               {
                  _loc3_.push(_loc6_.tdId);
               }
            }
         }
         _loc5_ = 0;
         loop1:
         while(_loc5_ < param1.length)
         {
            _loc7_ = CardTemplateFactory.instance.getAllDeckDetailInfo(param1[_loc5_]);
            var _loc11_:int = 0;
            var _loc12_:* = _loc7_;
            do
            {
               for each(_loc8_ in _loc12_)
               {
                  _loc9_ = true;
                  for each(_loc10_ in _loc8_.componentPlants)
                  {
                     if(_loc3_.indexOf(_loc10_) < 0)
                     {
                        _loc9_ = false;
                        break;
                     }
                  }
               }
               _loc5_++;
               continue loop1;
            }
            while(!_loc9_);
            
            return true;
         }
         return false;
      }
      
      private function build() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Array = null;
         var _loc3_:Vector.<CardChestAvatarTemp> = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:CardChestAvatarTemp = null;
         if(this.cacheCardChestForgeAvatarTemps == null)
         {
            this.cacheCardChestForgeAvatarTemps = Vector.<CardChestForgeAvatarTemp>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.CardChestForgeAvatarTemp,CardChestForgeAvatarTemp));
         }
         if(this.cacheCardUpgradeTemplate == null)
         {
            this.cacheCardUpgradeTemplate = Vector.<CardUpgradeTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.CardUpgradeTemplate,CardUpgradeTemplate));
         }
         if(this.cacheCardForgeTemplate == null)
         {
            this.cacheCardForgeTemplate = Vector.<CardForgeTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.CardForgeTemplate,CardForgeTemplate));
         }
         if(this.cacheCardForgeChanceTemplate == null)
         {
            this.cacheCardForgeChanceTemplate = Vector.<CardForgeChanceTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.CardForgeChanceTemplate,CardForgeChanceTemplate));
         }
         if(this.cacheCardChestAvatarTemps == null)
         {
            this.cacheCardChestAvatarTemps = Vector.<CardChestAvatarTemp>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.CardChestAvatarTemp,CardChestAvatarTemp));
            _loc2_ = [];
            _loc4_ = this.cacheCardChestAvatarTemps.length;
            _loc1_ = 0;
            while(_loc1_ < _loc4_)
            {
               _loc5_ = this.cacheCardChestAvatarTemps[_loc1_].tdPlantId;
               if(_loc2_[_loc5_] == null)
               {
                  _loc2_[_loc5_] = new Vector.<CardChestAvatarTemp>();
               }
               _loc3_ = _loc2_[_loc5_];
               _loc3_.push(this.cacheCardChestAvatarTemps[_loc1_]);
               _loc1_++;
            }
            for each(_loc3_ in _loc2_)
            {
               _loc1_ = 0;
               while(_loc1_ < _loc3_.length)
               {
                  (_loc6_ = _loc3_[_loc1_]).updateCardVisibleBySameTdIdTemplates(_loc3_);
                  _loc1_++;
               }
            }
         }
         if(this.cacheCardPuzzleTemplate == null)
         {
            this.cacheCardPuzzleTemplate = Vector.<CardPuzzleTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.CardPuzzleTemplate,CardPuzzleTemplate));
         }
         if(this.cacheCardPieceTemplate == null)
         {
            this.cacheCardPieceTemplate = Vector.<CardPieceTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.CardPieceTemplate,CardPieceTemplate));
         }
         if(this.cacheCardPriceTemplate == null)
         {
            this.cacheCardPriceTemplate = Vector.<CardPuzzlePriceTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.CardPuzzlePriceTemplate,CardPuzzlePriceTemplateCE));
         }
         if(this.cacheCardPieceDropTemplate == null)
         {
            this.cacheCardPieceDropTemplate = Vector.<CardPieceDropTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.CardPieceDropTemplate,CardPieceDropTemplate));
         }
         if(this.cacheCardDeckDetailTemplate == null)
         {
            this.cacheCardDeckDetailTemplate = Vector.<CardDeckDetailTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_CARD_DECK_DETAIL,CardDeckDetailTemplate));
         }
         if(this.cacheCardDeckShowTemplate == null)
         {
            this.cacheCardDeckShowTemplate = Vector.<CardDeckShowTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_CARD_DECK_SHOW,CardDeckShowTemplateCE));
         }
         if(this.cacheCardDeckAttributeTemplate == null)
         {
            this.cacheCardDeckAttributeTemplate = Vector.<CardDeckAttributeTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_CARD_DECK_ATTR,CardDeckAttributeTemplateCE));
         }
      }
   }
}
