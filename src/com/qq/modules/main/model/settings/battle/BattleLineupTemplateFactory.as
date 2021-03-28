package com.qq.modules.main.model.settings.battle
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.card.model.templates.CardForgeTemplate;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardBuffTemplateCE;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardStateTemplateCE;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.modules.main.model.vo.AwakePromotionVO;
   import com.qq.utils.db.ClientDBTableName;
   
   public class BattleLineupTemplateFactory
   {
      
      private static var _instance:BattleLineupTemplateFactory;
       
      
      public var cacheBattleLineupCardTemplate:Vector.<BattleLineupCardTemp>;
      
      private var cacheBattleLineupCardSkillTemplate:Vector.<BattleLineupCardSkillTemplate>;
      
      private var cacheBattleLineupCardStateTemplate:Vector.<BattleLineupCardStateTemplateCE>;
      
      private var cacheBattleLineupCardBuffTemplate:Vector.<BattleLineupCardBuffTemplateCE>;
      
      public function BattleLineupTemplateFactory()
      {
         super();
         this.build();
      }
      
      public static function get instance() : BattleLineupTemplateFactory
      {
         if(_instance == null)
         {
            _instance = new BattleLineupTemplateFactory();
         }
         return _instance;
      }
      
      public function getBattleLineupCardTemplateByTdPlantId(param1:int) : BattleLineupCardTemp
      {
         var _loc2_:int = 0;
         var _loc3_:int = this.cacheBattleLineupCardTemplate.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.cacheBattleLineupCardTemplate[_loc2_].tdId == param1)
            {
               return this.cacheBattleLineupCardTemplate[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getBattleLineupCardTemplateById(param1:int) : BattleLineupCardTemp
      {
         var _loc2_:int = 0;
         var _loc3_:int = this.cacheBattleLineupCardTemplate.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.cacheBattleLineupCardTemplate[_loc2_].id == param1)
            {
               return this.cacheBattleLineupCardTemplate[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getBattleLineupCardSkillTemplateById(param1:int) : BattleLineupCardSkillTemplate
      {
         var _loc2_:int = 0;
         var _loc3_:int = this.cacheBattleLineupCardSkillTemplate.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.cacheBattleLineupCardSkillTemplate[_loc2_].id == param1)
            {
               return this.cacheBattleLineupCardSkillTemplate[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getBattleLineupCardStateTemplateById(param1:int) : BattleLineupCardStateTemplateCE
      {
         var _loc2_:int = 0;
         var _loc3_:int = this.cacheBattleLineupCardStateTemplate.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.cacheBattleLineupCardStateTemplate[_loc2_].id == param1)
            {
               return this.cacheBattleLineupCardStateTemplate[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getBattleLineupCardBuffTemplateById(param1:int) : BattleLineupCardBuffTemplateCE
      {
         var _loc2_:int = 0;
         var _loc3_:int = this.cacheBattleLineupCardBuffTemplate.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.cacheBattleLineupCardBuffTemplate[_loc2_].id == param1)
            {
               return this.cacheBattleLineupCardBuffTemplate[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getBattleLineupCardAwakePromotion(param1:int, param2:int) : Vector.<AwakePromotionVO>
      {
         var _loc9_:BattleLineupCardTemp = null;
         var _loc10_:BattleLineupCardTemp = null;
         var _loc11_:BattleLineupCardTemp = null;
         var _loc12_:int = 0;
         var _loc13_:AwakePromotionVO = null;
         var _loc14_:uint = 0;
         var _loc15_:CardForgeTemplate = null;
         var _loc3_:Array = ["initialAttack","initialDefense","initialHp","initialAbility"];
         var _loc4_:Array = ["攻击","防御","生命","技力"];
         var _loc5_:Vector.<AwakePromotionVO> = new Vector.<AwakePromotionVO>();
         var _loc6_:BattleLineupCardTemp = this.getBattleLineupCardTemplateById(param1);
         var _loc7_:Array = [];
         var _loc8_:Array = [];
         for each(_loc9_ in this.cacheBattleLineupCardTemplate)
         {
            if(_loc9_.tdId == _loc6_.tdId)
            {
               if(_loc9_.awakeLevel > 0)
               {
                  _loc8_.push(_loc9_);
               }
               else
               {
                  _loc7_.push(_loc9_);
               }
            }
         }
         if(param2 == 1)
         {
            if(_loc7_.length > 0 && _loc8_.length > 0)
            {
               _loc10_ = _loc7_[_loc7_.length - 1];
               _loc11_ = _loc8_[0];
            }
         }
         else if(_loc8_.length >= param2)
         {
            _loc10_ = _loc8_[param2 - 2];
            _loc11_ = _loc8_[param2 - 1];
         }
         if(_loc10_ && _loc11_)
         {
            _loc12_ = 0;
            while(_loc12_ < _loc3_.length)
            {
               (_loc13_ = new AwakePromotionVO()).attributeKey = _loc3_[_loc12_];
               _loc13_.attributeName = _loc4_[_loc12_];
               if(param2 == 1)
               {
                  if(_loc15_ = CardTemplateFactory.instance.getCardForgeTemplate(param1,5))
                  {
                     if(_loc12_ == 0)
                     {
                        _loc14_ = _loc15_.addAtk;
                     }
                     else if(_loc12_ == 1)
                     {
                        _loc14_ = _loc15_.addDef;
                     }
                     else if(_loc12_ == 2)
                     {
                        _loc14_ = _loc15_.addHp;
                     }
                     else
                     {
                        _loc14_ = _loc15_.addAbility;
                     }
                  }
                  _loc13_.promoteValue = int((_loc11_[_loc3_[_loc12_]] - _loc10_[_loc3_[_loc12_]] - _loc14_) / 100);
               }
               else
               {
                  _loc13_.promoteValue = int((_loc11_[_loc3_[_loc12_]] - _loc10_[_loc3_[_loc12_]]) / 100);
               }
               _loc5_.push(_loc13_);
               _loc12_++;
            }
            return _loc5_;
         }
         return null;
      }
      
      public function getBattleLineupCardAwakeFeatures(param1:int, param2:int) : Vector.<int>
      {
         var _loc7_:BattleLineupCardTemp = null;
         var _loc8_:BattleLineupCardTemp = null;
         var _loc9_:BattleLineupCardTemp = null;
         var _loc10_:Array = null;
         var _loc11_:Array = null;
         var _loc12_:String = null;
         var _loc13_:Boolean = false;
         var _loc14_:String = null;
         var _loc3_:Vector.<int> = new Vector.<int>();
         var _loc4_:BattleLineupCardTemp = this.getBattleLineupCardTemplateById(param1);
         var _loc5_:Array = [];
         var _loc6_:Array = [];
         for each(_loc7_ in this.cacheBattleLineupCardTemplate)
         {
            if(_loc7_.tdId == _loc4_.tdId)
            {
               if(_loc7_.awakeLevel > 0)
               {
                  _loc6_.push(_loc7_);
               }
               else
               {
                  _loc5_.push(_loc7_);
               }
            }
         }
         if(param2 == 1)
         {
            if(_loc5_.length > 0 && _loc6_.length > 0)
            {
               _loc8_ = _loc5_[_loc5_.length - 1];
               _loc9_ = _loc6_[0];
            }
         }
         else if(_loc6_.length >= param2)
         {
            _loc8_ = _loc6_[param2 - 2];
            _loc9_ = _loc6_[param2 - 1];
         }
         if(_loc8_ && _loc9_)
         {
            _loc10_ = _loc8_.features;
            _loc11_ = _loc9_.features;
            for each(_loc12_ in _loc11_)
            {
               _loc13_ = false;
               for each(_loc14_ in _loc10_)
               {
                  if(_loc14_ == _loc12_)
                  {
                     _loc13_ = true;
                     break;
                  }
               }
               if(!_loc13_)
               {
                  _loc3_.push(parseInt(_loc12_));
               }
            }
         }
         return _loc3_;
      }
      
      public function getBattleLineupCardByAwakeId(param1:int) : BattleLineupCardTemp
      {
         var _loc2_:BattleLineupCardTemp = null;
         for each(_loc2_ in this.cacheBattleLineupCardTemplate)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function build() : void
      {
         if(this.cacheBattleLineupCardTemplate == null)
         {
            this.cacheBattleLineupCardTemplate = Vector.<BattleLineupCardTemp>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.BattleLineupCardTemplate,BattleLineupCardTemp));
         }
         if(this.cacheBattleLineupCardSkillTemplate == null)
         {
            this.cacheBattleLineupCardSkillTemplate = Vector.<BattleLineupCardSkillTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.BattleLineupCardSkillTemplate,BattleLineupCardSkillTemplate));
         }
         if(this.cacheBattleLineupCardStateTemplate == null)
         {
            this.cacheBattleLineupCardStateTemplate = Vector.<BattleLineupCardStateTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.BattleLineupCardStateTemplate,BattleLineupCardStateTemplateCE));
         }
         if(this.cacheBattleLineupCardBuffTemplate == null)
         {
            this.cacheBattleLineupCardBuffTemplate = Vector.<BattleLineupCardBuffTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.BattleLineupCardBuffTemplate,BattleLineupCardBuffTemplateCE));
         }
      }
   }
}
