package com.qq.modules.bag.model.templates.ce
{
   public class BagItemTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _desc:String;
      
      protected var _icon:String;
      
      protected var _minLvRequired:Number;
      
      protected var _type:Number;
      
      protected var _subType:Number;
      
      protected var _quality:Number;
      
      protected var _stackNum:Number;
      
      protected var _isUse:Number;
      
      protected var _isMulUse:Number;
      
      protected var _isCanSell:Number;
      
      protected var _sellPrice:Number;
      
      protected var _isCanShow:Number;
      
      protected var _cardItemId:String;
      
      protected var _gainWay:String;
      
      protected var _useEffect:String;
      
      protected var _mainType:Number;
      
      protected var _isAddict:Number;
      
      protected var _needPassword:Number;
      
      public function BagItemTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._desc = param1.desc;
         this._icon = param1.icon;
         this._minLvRequired = param1.minLvRequired;
         this._type = param1.type;
         this._subType = param1.subType;
         this._quality = param1.quality;
         this._stackNum = param1.stackNum;
         this._isUse = param1.isUse;
         this._isMulUse = param1.isMulUse;
         this._isCanSell = param1.isCanSell;
         this._sellPrice = param1.sellPrice;
         this._isCanShow = param1.isCanShow;
         this._cardItemId = param1.cardItemId;
         this._gainWay = param1.gainWay;
         this._useEffect = param1.useEffect;
         this._mainType = param1.mainType;
         this._isAddict = param1.isAddict;
         this._needPassword = param1.needPassword;
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
      
      public function get icon() : String
      {
         return this._icon;
      }
      
      public function get minLvRequired() : Number
      {
         return this._minLvRequired;
      }
      
      public function get type() : Number
      {
         return this._type;
      }
      
      public function get subType() : Number
      {
         return this._subType;
      }
      
      public function get quality() : Number
      {
         return this._quality;
      }
      
      public function get stackNum() : Number
      {
         return this._stackNum;
      }
      
      public function get isUse() : Number
      {
         return this._isUse;
      }
      
      public function get isMulUse() : Number
      {
         return this._isMulUse;
      }
      
      public function get isCanSell() : Number
      {
         return this._isCanSell;
      }
      
      public function get sellPrice() : Number
      {
         return this._sellPrice;
      }
      
      public function get isCanShow() : Number
      {
         return this._isCanShow;
      }
      
      public function get cardItemId() : String
      {
         return this._cardItemId;
      }
      
      public function get gainWay() : String
      {
         return this._gainWay;
      }
      
      public function get useEffect() : String
      {
         return this._useEffect;
      }
      
      public function get mainType() : Number
      {
         return this._mainType;
      }
      
      public function get isAddict() : Number
      {
         return this._isAddict;
      }
      
      public function get needPassword() : Number
      {
         return this._needPassword;
      }
   }
}
