package com.qq.modules.main.model.settings.battle.ce
{
   public class BattleLineupCardTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _tdId:Number;
      
      protected var _name:String;
      
      protected var _onUse:Number;
      
      protected var _type:Number;
      
      protected var _subType:Number;
      
      protected var _skillId1:Number;
      
      protected var _skillId2:Number;
      
      protected var _leaderSkillId:Number;
      
      protected var _showType:Number;
      
      protected var _fruitType:Number;
      
      protected var _rarity:Number;
      
      protected var _awakeLevel:Number;
      
      protected var _quality:Number;
      
      protected var _star:Number;
      
      protected var _maxLv:Number;
      
      protected var _feature:String;
      
      protected var _des:String;
      
      protected var _initialAttack:Number;
      
      protected var _initialDefense:Number;
      
      protected var _initialHp:Number;
      
      protected var _initialShield:Number;
      
      protected var _initialAbility:Number;
      
      protected var _growAttack:Number;
      
      protected var _growDefense:Number;
      
      protected var _growHp:Number;
      
      protected var _growShield:Number;
      
      protected var _growAbility:Number;
      
      protected var _initialHit:Number;
      
      protected var _initialDodge:Number;
      
      protected var _initialCritical:Number;
      
      protected var _initialTough:Number;
      
      protected var _growHit:Number;
      
      protected var _growDodge:Number;
      
      protected var _growCritical:Number;
      
      protected var _growTough:Number;
      
      protected var _initialImmune:Number;
      
      protected var _growImmune:Number;
      
      protected var _recycleItemString:String;
      
      protected var _recycleCardLevelNeeded:Number;
      
      protected var _skillDefense:Number;
      
      protected var _skillStrength:Number;
      
      protected var _icon:Number;
      
      protected var _planClassName:String;
      
      protected var _hideBone:String;
      
      public function BattleLineupCardTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._tdId = param1.tdId;
         this._name = param1.name;
         this._onUse = param1.onUse;
         this._type = param1.type;
         this._subType = param1.subType;
         this._skillId1 = param1.skillId1;
         this._skillId2 = param1.skillId2;
         this._leaderSkillId = param1.leaderSkillId;
         this._showType = param1.showType;
         this._fruitType = param1.fruitType;
         this._rarity = param1.rarity;
         this._awakeLevel = param1.awakeLevel;
         this._quality = param1.quality;
         this._star = param1.star;
         this._maxLv = param1.maxLv;
         this._feature = param1.feature;
         this._des = param1.des;
         this._initialAttack = param1.initialAttack;
         this._initialDefense = param1.initialDefense;
         this._initialHp = param1.initialHp;
         this._initialShield = param1.initialShield;
         this._initialAbility = param1.initialAbility;
         this._growAttack = param1.growAttack;
         this._growDefense = param1.growDefense;
         this._growHp = param1.growHp;
         this._growShield = param1.growShield;
         this._growAbility = param1.growAbility;
         this._initialHit = param1.initialHit;
         this._initialDodge = param1.initialDodge;
         this._initialCritical = param1.initialCritical;
         this._initialTough = param1.initialTough;
         this._growHit = param1.growHit;
         this._growDodge = param1.growDodge;
         this._growCritical = param1.growCritical;
         this._growTough = param1.growTough;
         this._initialImmune = param1.initialImmune;
         this._growImmune = param1.growImmune;
         this._recycleItemString = param1.recycleItemString;
         this._recycleCardLevelNeeded = param1.recycleCardLevelNeeded;
         this._skillDefense = param1.skillDefense;
         this._skillStrength = param1.skillStrength;
         this._icon = param1.icon;
         this._planClassName = param1.planClassName;
         this._hideBone = param1.hideBone;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get tdId() : Number
      {
         return this._tdId;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get onUse() : Number
      {
         return this._onUse;
      }
      
      public function get type() : Number
      {
         return this._type;
      }
      
      public function get subType() : Number
      {
         return this._subType;
      }
      
      public function get skillId1() : Number
      {
         return this._skillId1;
      }
      
      public function get skillId2() : Number
      {
         return this._skillId2;
      }
      
      public function get leaderSkillId() : Number
      {
         return this._leaderSkillId;
      }
      
      public function get showType() : Number
      {
         return this._showType;
      }
      
      public function get fruitType() : Number
      {
         return this._fruitType;
      }
      
      public function get rarity() : Number
      {
         return this._rarity;
      }
      
      public function get awakeLevel() : Number
      {
         return this._awakeLevel;
      }
      
      public function get quality() : Number
      {
         return this._quality;
      }
      
      public function get star() : Number
      {
         return this._star;
      }
      
      public function get maxLv() : Number
      {
         return this._maxLv;
      }
      
      public function get feature() : String
      {
         return this._feature;
      }
      
      public function get des() : String
      {
         return this._des;
      }
      
      public function get initialAttack() : Number
      {
         return this._initialAttack;
      }
      
      public function get initialDefense() : Number
      {
         return this._initialDefense;
      }
      
      public function get initialHp() : Number
      {
         return this._initialHp;
      }
      
      public function get initialShield() : Number
      {
         return this._initialShield;
      }
      
      public function get initialAbility() : Number
      {
         return this._initialAbility;
      }
      
      public function get growAttack() : Number
      {
         return this._growAttack;
      }
      
      public function get growDefense() : Number
      {
         return this._growDefense;
      }
      
      public function get growHp() : Number
      {
         return this._growHp;
      }
      
      public function get growShield() : Number
      {
         return this._growShield;
      }
      
      public function get growAbility() : Number
      {
         return this._growAbility;
      }
      
      public function get initialHit() : Number
      {
         return this._initialHit;
      }
      
      public function get initialDodge() : Number
      {
         return this._initialDodge;
      }
      
      public function get initialCritical() : Number
      {
         return this._initialCritical;
      }
      
      public function get initialTough() : Number
      {
         return this._initialTough;
      }
      
      public function get growHit() : Number
      {
         return this._growHit;
      }
      
      public function get growDodge() : Number
      {
         return this._growDodge;
      }
      
      public function get growCritical() : Number
      {
         return this._growCritical;
      }
      
      public function get growTough() : Number
      {
         return this._growTough;
      }
      
      public function get initialImmune() : Number
      {
         return this._initialImmune;
      }
      
      public function get growImmune() : Number
      {
         return this._growImmune;
      }
      
      public function get recycleItemString() : String
      {
         return this._recycleItemString;
      }
      
      public function get recycleCardLevelNeeded() : Number
      {
         return this._recycleCardLevelNeeded;
      }
      
      public function get skillDefense() : Number
      {
         return this._skillDefense;
      }
      
      public function get skillStrength() : Number
      {
         return this._skillStrength;
      }
      
      public function get icon() : Number
      {
         return this._icon;
      }
      
      public function get planClassName() : String
      {
         return this._planClassName;
      }
      
      public function get hideBone() : String
      {
         return this._hideBone;
      }
   }
}
