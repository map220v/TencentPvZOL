package com.qq.modules.td.data.game.unit.ce
{
   public class TDBulletTemplateCE extends TDBasicTemplate
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _resName:String;
      
      protected var _frameRate:Number;
      
      protected var _actionList:String;
      
      protected var _boomAction:String;
      
      protected var _moveSpeed:Number;
      
      protected var _params:String;
      
      protected var _isHitFlight:Number;
      
      protected var _isHitObj:Number;
      
      protected var _isAOE:Number;
      
      protected var _isMulRow:Number;
      
      protected var _hitEffectIDs:String;
      
      protected var _fireEffectID:Number;
      
      protected var _isBlit:Number;
      
      protected var _initBuffListStr:String;
      
      protected var _needShade:Number;
      
      protected var _isShadowLocateByRoad:Number;
      
      protected var _shadowOffSetY:Number;
      
      protected var _hitBuff:Number;
      
      protected var _needSplash:Number;
      
      public function TDBulletTemplateCE()
      {
         super();
      }
      
      override public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._resName = param1.resName;
         this._frameRate = param1.frameRate;
         this._actionList = param1.actionList;
         this._boomAction = param1.boomAction;
         this._moveSpeed = param1.moveSpeed;
         this._params = param1.params;
         this._isHitFlight = param1.isHitFlight;
         this._isHitObj = param1.isHitObj;
         this._isAOE = param1.isAOE;
         this._isMulRow = param1.isMulRow;
         this._hitEffectIDs = param1.hitEffectIDs;
         this._fireEffectID = param1.fireEffectID;
         this._isBlit = param1.isBlit;
         this._initBuffListStr = param1.initBuffListStr;
         this._needShade = param1.needShade;
         this._isShadowLocateByRoad = param1.isShadowLocateByRoad;
         this._shadowOffSetY = param1.shadowOffSetY;
         this._hitBuff = param1.hitBuff;
         this._needSplash = param1.needSplash;
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
      
      public function get resName() : String
      {
         return this._resName;
      }
      
      public function get frameRate() : Number
      {
         return this._frameRate;
      }
      
      public function get actionList() : String
      {
         return this._actionList;
      }
      
      public function get boomAction() : String
      {
         return this._boomAction;
      }
      
      public function get moveSpeed() : Number
      {
         return this._moveSpeed;
      }
      
      public function get params() : String
      {
         return this._params;
      }
      
      public function get isHitFlight() : Number
      {
         return this._isHitFlight;
      }
      
      public function get isHitObj() : Number
      {
         return this._isHitObj;
      }
      
      public function get isAOE() : Number
      {
         return this._isAOE;
      }
      
      public function get isMulRow() : Number
      {
         return this._isMulRow;
      }
      
      public function get hitEffectIDs() : String
      {
         return this._hitEffectIDs;
      }
      
      public function get fireEffectID() : Number
      {
         return this._fireEffectID;
      }
      
      public function get isBlit() : Number
      {
         return this._isBlit;
      }
      
      public function get initBuffListStr() : String
      {
         return this._initBuffListStr;
      }
      
      public function get needShade() : Number
      {
         return this._needShade;
      }
      
      public function get isShadowLocateByRoad() : Number
      {
         return this._isShadowLocateByRoad;
      }
      
      public function get shadowOffSetY() : Number
      {
         return this._shadowOffSetY;
      }
      
      public function get hitBuff() : Number
      {
         return this._hitBuff;
      }
      
      public function get needSplash() : Number
      {
         return this._needSplash;
      }
   }
}
