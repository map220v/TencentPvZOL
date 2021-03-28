package com.qq.modules.td.data.game.unit.ce
{
   import com.qq.utils.data.PData;
   
   public class TDZombieTemplateCE extends TDBasicTemplate
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _desc:String;
      
      protected var _catalog:Number;
      
      protected var _bodySize:Number;
      
      protected var _AIMode:String;
      
      protected var _resName:String;
      
      protected var _dyingHP:Number;
      
      protected var _frameRate:Number;
      
      protected var _moveSpeed:PData;
      
      protected var _moveFloatPercent:Number;
      
      protected var _attackHeight:String;
      
      protected var _attackValue:PData;
      
      protected var _defenceValue:String;
      
      protected var _params:String;
      
      protected var _duration:Number;
      
      protected var _charredType:Number;
      
      protected var _actionList:String;
      
      protected var _hp:PData;
      
      protected var _enterActionIDs:String;
      
      protected var _dyingDuration:Number;
      
      protected var _deathActionIDs:String;
      
      protected var _dropPartAnimName:String;
      
      protected var _dropPartTypeList:String;
      
      protected var _initHideBones:String;
      
      protected var _dropPartNameList:String;
      
      protected var _dropPartRelatedPartList:String;
      
      protected var _dropPartRelatedPartShowList:String;
      
      protected var _dropPartArmorList:String;
      
      protected var _extraAssetName:String;
      
      protected var _extraAssetBoneName:String;
      
      protected var _extraAssetRelatedBone:String;
      
      protected var _extraAssetDefaultAnim:String;
      
      protected var _extraAssetOffset:String;
      
      protected var _armorBone:String;
      
      protected var _armorAllPartName:String;
      
      protected var _armorReplaceBone:String;
      
      protected var _armorExitBoneNameList:String;
      
      protected var _armorNoExitBoneNameList:String;
      
      protected var _lootPercent:String;
      
      protected var _armorHp:PData;
      
      protected var _isDropArmorImmediately:Number;
      
      protected var _armorPackageName:String;
      
      protected var _armorTexture:String;
      
      protected var _armorTotalState:String;
      
      protected var _armorIsIron:Number;
      
      protected var _effectResName:String;
      
      protected var _isBlit:Number;
      
      protected var _notPreview:Number;
      
      protected var _itemResIDList:String;
      
      protected var _rowOffsetTop:Number;
      
      protected var _rowOffsetBottom:Number;
      
      protected var _notKillByLawnMower:Number;
      
      protected var _initBuffListStr:String;
      
      protected var _needShade:Number;
      
      protected var _introduction:String;
      
      protected var _stageID:Number;
      
      protected var _butterPosInfo:String;
      
      protected var _endlessTDScore:Number;
      
      public function TDZombieTemplateCE()
      {
         super();
      }
      
      override public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._desc = param1.desc;
         this._catalog = param1.catalog;
         this._bodySize = param1.bodySize;
         this._AIMode = param1.AIMode;
         this._resName = param1.resName;
         this._dyingHP = param1.dyingHP;
         this._frameRate = param1.frameRate;
         this._moveSpeed = new PData();
         this._moveSpeed.set(param1.moveSpeed);
         this._moveFloatPercent = param1.moveFloatPercent;
         this._attackHeight = param1.attackHeight;
         this._attackValue = new PData();
         this._attackValue.set(param1.attackValue);
         this._defenceValue = param1.defenceValue;
         this._params = param1.params;
         this._duration = param1.duration;
         this._charredType = param1.charredType;
         this._actionList = param1.actionList;
         this._hp = new PData();
         this._hp.set(param1.hp);
         this._enterActionIDs = param1.enterActionIDs;
         this._dyingDuration = param1.dyingDuration;
         this._deathActionIDs = param1.deathActionIDs;
         this._dropPartAnimName = param1.dropPartAnimName;
         this._dropPartTypeList = param1.dropPartTypeList;
         this._initHideBones = param1.initHideBones;
         this._dropPartNameList = param1.dropPartNameList;
         this._dropPartRelatedPartList = param1.dropPartRelatedPartList;
         this._dropPartRelatedPartShowList = param1.dropPartRelatedPartShowList;
         this._dropPartArmorList = param1.dropPartArmorList;
         this._extraAssetName = param1.extraAssetName;
         this._extraAssetBoneName = param1.extraAssetBoneName;
         this._extraAssetRelatedBone = param1.extraAssetRelatedBone;
         this._extraAssetDefaultAnim = param1.extraAssetDefaultAnim;
         this._extraAssetOffset = param1.extraAssetOffset;
         this._armorBone = param1.armorBone;
         this._armorAllPartName = param1.armorAllPartName;
         this._armorReplaceBone = param1.armorReplaceBone;
         this._armorExitBoneNameList = param1.armorExitBoneNameList;
         this._armorNoExitBoneNameList = param1.armorNoExitBoneNameList;
         this._lootPercent = param1.lootPercent;
         this._armorHp = new PData();
         this._armorHp.set(param1.armorHp);
         this._isDropArmorImmediately = param1.isDropArmorImmediately;
         this._armorPackageName = param1.armorPackageName;
         this._armorTexture = param1.armorTexture;
         this._armorTotalState = param1.armorTotalState;
         this._armorIsIron = param1.armorIsIron;
         this._effectResName = param1.effectResName;
         this._isBlit = param1.isBlit;
         this._notPreview = param1.notPreview;
         this._itemResIDList = param1.itemResIDList;
         this._rowOffsetTop = param1.rowOffsetTop;
         this._rowOffsetBottom = param1.rowOffsetBottom;
         this._notKillByLawnMower = param1.notKillByLawnMower;
         this._initBuffListStr = param1.initBuffListStr;
         this._needShade = param1.needShade;
         this._introduction = param1.introduction;
         this._stageID = param1.stageID;
         this._butterPosInfo = param1.butterPosInfo;
         this._endlessTDScore = param1.endlessTDScore;
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
      
      public function get catalog() : Number
      {
         return this._catalog;
      }
      
      public function get bodySize() : Number
      {
         return this._bodySize;
      }
      
      public function get AIMode() : String
      {
         return this._AIMode;
      }
      
      public function get resName() : String
      {
         return this._resName;
      }
      
      public function get dyingHP() : Number
      {
         return this._dyingHP;
      }
      
      public function get frameRate() : Number
      {
         return this._frameRate;
      }
      
      public function get moveSpeed() : Number
      {
         return this._moveSpeed.get();
      }
      
      public function get moveFloatPercent() : Number
      {
         return this._moveFloatPercent;
      }
      
      public function get attackHeight() : String
      {
         return this._attackHeight;
      }
      
      public function get attackValue() : Number
      {
         return this._attackValue.get();
      }
      
      public function get defenceValue() : String
      {
         return this._defenceValue;
      }
      
      public function get params() : String
      {
         return this._params;
      }
      
      public function get duration() : Number
      {
         return this._duration;
      }
      
      public function get charredType() : Number
      {
         return this._charredType;
      }
      
      public function get actionList() : String
      {
         return this._actionList;
      }
      
      public function get hp() : Number
      {
         return this._hp.get();
      }
      
      public function get enterActionIDs() : String
      {
         return this._enterActionIDs;
      }
      
      public function get dyingDuration() : Number
      {
         return this._dyingDuration;
      }
      
      public function get deathActionIDs() : String
      {
         return this._deathActionIDs;
      }
      
      public function get dropPartAnimName() : String
      {
         return this._dropPartAnimName;
      }
      
      public function get dropPartTypeList() : String
      {
         return this._dropPartTypeList;
      }
      
      public function get initHideBones() : String
      {
         return this._initHideBones;
      }
      
      public function get dropPartNameList() : String
      {
         return this._dropPartNameList;
      }
      
      public function get dropPartRelatedPartList() : String
      {
         return this._dropPartRelatedPartList;
      }
      
      public function get dropPartRelatedPartShowList() : String
      {
         return this._dropPartRelatedPartShowList;
      }
      
      public function get dropPartArmorList() : String
      {
         return this._dropPartArmorList;
      }
      
      public function get extraAssetName() : String
      {
         return this._extraAssetName;
      }
      
      public function get extraAssetBoneName() : String
      {
         return this._extraAssetBoneName;
      }
      
      public function get extraAssetRelatedBone() : String
      {
         return this._extraAssetRelatedBone;
      }
      
      public function get extraAssetDefaultAnim() : String
      {
         return this._extraAssetDefaultAnim;
      }
      
      public function get extraAssetOffset() : String
      {
         return this._extraAssetOffset;
      }
      
      public function get armorBone() : String
      {
         return this._armorBone;
      }
      
      public function get armorAllPartName() : String
      {
         return this._armorAllPartName;
      }
      
      public function get armorReplaceBone() : String
      {
         return this._armorReplaceBone;
      }
      
      public function get armorExitBoneNameList() : String
      {
         return this._armorExitBoneNameList;
      }
      
      public function get armorNoExitBoneNameList() : String
      {
         return this._armorNoExitBoneNameList;
      }
      
      public function get lootPercent() : String
      {
         return this._lootPercent;
      }
      
      public function get armorHp() : Number
      {
         return this._armorHp.get();
      }
      
      public function get isDropArmorImmediately() : Number
      {
         return this._isDropArmorImmediately;
      }
      
      public function get armorPackageName() : String
      {
         return this._armorPackageName;
      }
      
      public function get armorTexture() : String
      {
         return this._armorTexture;
      }
      
      public function get armorTotalState() : String
      {
         return this._armorTotalState;
      }
      
      public function get armorIsIron() : Number
      {
         return this._armorIsIron;
      }
      
      public function get effectResName() : String
      {
         return this._effectResName;
      }
      
      public function get isBlit() : Number
      {
         return this._isBlit;
      }
      
      public function get notPreview() : Number
      {
         return this._notPreview;
      }
      
      public function get itemResIDList() : String
      {
         return this._itemResIDList;
      }
      
      public function get rowOffsetTop() : Number
      {
         return this._rowOffsetTop;
      }
      
      public function get rowOffsetBottom() : Number
      {
         return this._rowOffsetBottom;
      }
      
      public function get notKillByLawnMower() : Number
      {
         return this._notKillByLawnMower;
      }
      
      public function get initBuffListStr() : String
      {
         return this._initBuffListStr;
      }
      
      public function get needShade() : Number
      {
         return this._needShade;
      }
      
      public function get introduction() : String
      {
         return this._introduction;
      }
      
      public function get stageID() : Number
      {
         return this._stageID;
      }
      
      public function get butterPosInfo() : String
      {
         return this._butterPosInfo;
      }
      
      public function get endlessTDScore() : Number
      {
         return this._endlessTDScore;
      }
   }
}
