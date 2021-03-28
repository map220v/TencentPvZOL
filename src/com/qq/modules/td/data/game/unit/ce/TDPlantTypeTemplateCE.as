package com.qq.modules.td.data.game.unit.ce
{
   import com.qq.utils.data.PData;
   
   public class TDPlantTypeTemplateCE extends TDBasicTemplate
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _desc:String;
      
      protected var _AIMode:String;
      
      protected var _unLockIndex:Number;
      
      protected var _resName:String;
      
      protected var _frameRate:Number;
      
      protected var _initHideBones:String;
      
      protected var _actionList:String;
      
      protected var _specialActionName:String;
      
      protected var _specialSkillParam:String;
      
      protected var _bottomBone:String;
      
      protected var _staticActionName:String;
      
      protected var _firePosInfo:String;
      
      protected var _params:String;
      
      protected var _isAttackFlight:Number;
      
      protected var _isAttackObj:Number;
      
      protected var _attackType:Number;
      
      protected var _damageValue:PData;
      
      protected var _damageValueForShielded:PData;
      
      protected var _specialSkillDamageValue:PData;
      
      protected var _specialSkillDamageValueForShielded:PData;
      
      protected var _duration:PData;
      
      protected var _bulletType:Number;
      
      protected var _hp:PData;
      
      protected var _price:PData;
      
      protected var _cardRefreshDuration:PData;
      
      protected var _bgID:Number;
      
      protected var _iconID:Number;
      
      protected var _icon2ID:Number;
      
      protected var _useSunOrNight:Number;
      
      protected var _sortIndex:Number;
      
      protected var _series:Number;
      
      protected var _level:Number;
      
      protected var _usefulness:Number;
      
      protected var _bodyHeight:Number;
      
      protected var _roadTileState:Number;
      
      protected var _forbidTileState:Number;
      
      protected var _prePlantType:Number;
      
      protected var _damageType:Number;
      
      protected var _bombEffectID:Number;
      
      protected var _catalog:Number;
      
      protected var _isBlit:Number;
      
      protected var _initBuffListStr:String;
      
      protected var _isSeaPlant:Number;
      
      protected var _needShade:Number;
      
      protected var _introduction:String;
      
      protected var _itemResIDList:String;
      
      protected var _cardHideBone:String;
      
      protected var _forgeCostRatio:Number;
      
      protected var _endlessTDScoreRatio:Number;
      
      protected var _costWater:Number;
      
      protected var _costTicket:Number;
      
      protected var _costDiamond:Number;
      
      public function TDPlantTypeTemplateCE()
      {
         super();
      }
      
      override public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._desc = param1.desc;
         this._AIMode = param1.AIMode;
         this._unLockIndex = param1.unLockIndex;
         this._resName = param1.resName;
         this._frameRate = param1.frameRate;
         this._initHideBones = param1.initHideBones;
         this._actionList = param1.actionList;
         this._specialActionName = param1.specialActionName;
         this._specialSkillParam = param1.specialSkillParam;
         this._bottomBone = param1.bottomBone;
         this._staticActionName = param1.staticActionName;
         this._firePosInfo = param1.firePosInfo;
         this._params = param1.params;
         this._isAttackFlight = param1.isAttackFlight;
         this._isAttackObj = param1.isAttackObj;
         this._attackType = param1.attackType;
         this._damageValue = new PData();
         this._damageValue.set(param1.damageValue);
         this._damageValueForShielded = new PData();
         this._damageValueForShielded.set(param1.damageValueForShielded);
         this._specialSkillDamageValue = new PData();
         this._specialSkillDamageValue.set(param1.specialSkillDamageValue);
         this._specialSkillDamageValueForShielded = new PData();
         this._specialSkillDamageValueForShielded.set(param1.specialSkillDamageValueForShielded);
         this._duration = new PData();
         this._duration.set(param1.duration);
         this._bulletType = param1.bulletType;
         this._hp = new PData();
         this._hp.set(param1.hp);
         this._price = new PData();
         this._price.set(param1.price);
         this._cardRefreshDuration = new PData();
         this._cardRefreshDuration.set(param1.cardRefreshDuration);
         this._bgID = param1.bgID;
         this._iconID = param1.iconID;
         this._icon2ID = param1.icon2ID;
         this._useSunOrNight = param1.useSunOrNight;
         this._sortIndex = param1.sortIndex;
         this._series = param1.series;
         this._level = param1.level;
         this._usefulness = param1.usefulness;
         this._bodyHeight = param1.bodyHeight;
         this._roadTileState = param1.roadTileState;
         this._forbidTileState = param1.forbidTileState;
         this._prePlantType = param1.prePlantType;
         this._damageType = param1.damageType;
         this._bombEffectID = param1.bombEffectID;
         this._catalog = param1.catalog;
         this._isBlit = param1.isBlit;
         this._initBuffListStr = param1.initBuffListStr;
         this._isSeaPlant = param1.isSeaPlant;
         this._needShade = param1.needShade;
         this._introduction = param1.introduction;
         this._itemResIDList = param1.itemResIDList;
         this._cardHideBone = param1.cardHideBone;
         this._forgeCostRatio = param1.forgeCostRatio;
         this._endlessTDScoreRatio = param1.endlessTDScoreRatio;
         this._costWater = param1.costWater;
         this._costTicket = param1.costTicket;
         this._costDiamond = param1.costDiamond;
         super.load(param1);
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function get AIMode() : String
      {
         return this._AIMode;
      }
      
      public function get unLockIndex() : Number
      {
         return this._unLockIndex;
      }
      
      public function get resName() : String
      {
         return this._resName;
      }
      
      public function get frameRate() : Number
      {
         return this._frameRate;
      }
      
      public function get initHideBones() : String
      {
         return this._initHideBones;
      }
      
      public function get actionList() : String
      {
         return this._actionList;
      }
      
      public function get specialActionName() : String
      {
         return this._specialActionName;
      }
      
      public function get specialSkillParam() : String
      {
         return this._specialSkillParam;
      }
      
      public function get bottomBone() : String
      {
         return this._bottomBone;
      }
      
      public function get staticActionName() : String
      {
         return this._staticActionName;
      }
      
      public function get firePosInfo() : String
      {
         return this._firePosInfo;
      }
      
      public function get params() : String
      {
         return this._params;
      }
      
      public function get isAttackFlight() : Number
      {
         return this._isAttackFlight;
      }
      
      public function get isAttackObj() : Number
      {
         return this._isAttackObj;
      }
      
      public function get attackType() : Number
      {
         return this._attackType;
      }
      
      public function get damageValue() : Number
      {
         return this._damageValue.get();
      }
      
      public function get damageValueForShielded() : Number
      {
         return this._damageValueForShielded.get();
      }
      
      public function get specialSkillDamageValue() : Number
      {
         return this._specialSkillDamageValue.get();
      }
      
      public function get specialSkillDamageValueForShielded() : Number
      {
         return this._specialSkillDamageValueForShielded.get();
      }
      
      public function get duration() : Number
      {
         return this._duration.get();
      }
      
      public function get bulletType() : Number
      {
         return this._bulletType;
      }
      
      public function get hp() : Number
      {
         return this._hp.get();
      }
      
      public function get price() : Number
      {
         return this._price.get();
      }
      
      public function get cardRefreshDuration() : Number
      {
         return this._cardRefreshDuration.get();
      }
      
      public function get bgID() : Number
      {
         return this._bgID;
      }
      
      public function get iconID() : Number
      {
         return this._iconID;
      }
      
      public function get icon2ID() : Number
      {
         return this._icon2ID;
      }
      
      public function get useSunOrNight() : Number
      {
         return this._useSunOrNight;
      }
      
      public function get sortIndex() : Number
      {
         return this._sortIndex;
      }
      
      public function get series() : Number
      {
         return this._series;
      }
      
      public function get level() : Number
      {
         return this._level;
      }
      
      public function get usefulness() : Number
      {
         return this._usefulness;
      }
      
      public function get bodyHeight() : Number
      {
         return this._bodyHeight;
      }
      
      public function get roadTileState() : Number
      {
         return this._roadTileState;
      }
      
      public function get forbidTileState() : Number
      {
         return this._forbidTileState;
      }
      
      public function get prePlantType() : Number
      {
         return this._prePlantType;
      }
      
      public function get damageType() : Number
      {
         return this._damageType;
      }
      
      public function get bombEffectID() : Number
      {
         return this._bombEffectID;
      }
      
      public function get catalog() : Number
      {
         return this._catalog;
      }
      
      public function get isBlit() : Number
      {
         return this._isBlit;
      }
      
      public function get initBuffListStr() : String
      {
         return this._initBuffListStr;
      }
      
      public function get isSeaPlant() : Number
      {
         return this._isSeaPlant;
      }
      
      public function get needShade() : Number
      {
         return this._needShade;
      }
      
      public function get introduction() : String
      {
         return this._introduction;
      }
      
      public function get itemResIDList() : String
      {
         return this._itemResIDList;
      }
      
      public function get cardHideBone() : String
      {
         return this._cardHideBone;
      }
      
      public function get forgeCostRatio() : Number
      {
         return this._forgeCostRatio;
      }
      
      public function get endlessTDScoreRatio() : Number
      {
         return this._endlessTDScoreRatio;
      }
      
      public function get costWater() : Number
      {
         return this._costWater;
      }
      
      public function get costTicket() : Number
      {
         return this._costTicket;
      }
      
      public function get costDiamond() : Number
      {
         return this._costDiamond;
      }
   }
}
