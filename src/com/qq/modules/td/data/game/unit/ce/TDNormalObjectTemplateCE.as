package com.qq.modules.td.data.game.unit.ce
{
   public class TDNormalObjectTemplateCE extends TDBasicTemplate
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _resName:String;
      
      protected var _frameRate:Number;
      
      protected var _AIMode:String;
      
      protected var _actionList:String;
      
      protected var _params:String;
      
      protected var _isSort:Number;
      
      protected var _isBlit:Number;
      
      protected var _isBlock:Number;
      
      protected var _hp:Number;
      
      protected var _beAttack:Number;
      
      protected var _isCanMove:Number;
      
      protected var _rowOffsetTop:Number;
      
      protected var _rowOffsetBottom:Number;
      
      protected var _itemResIDList:String;
      
      protected var _initBuffListStr:String;
      
      protected var _initHideBones:String;
      
      protected var _needShade:Number;
      
      protected var _needSplash:Number;
      
      public function TDNormalObjectTemplateCE()
      {
         super();
      }
      
      override public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._resName = param1.resName;
         this._frameRate = param1.frameRate;
         this._AIMode = param1.AIMode;
         this._actionList = param1.actionList;
         this._params = param1.params;
         this._isSort = param1.isSort;
         this._isBlit = param1.isBlit;
         this._isBlock = param1.isBlock;
         this._hp = param1.hp;
         this._beAttack = param1.beAttack;
         this._isCanMove = param1.isCanMove;
         this._rowOffsetTop = param1.rowOffsetTop;
         this._rowOffsetBottom = param1.rowOffsetBottom;
         this._itemResIDList = param1.itemResIDList;
         this._initBuffListStr = param1.initBuffListStr;
         this._initHideBones = param1.initHideBones;
         this._needShade = param1.needShade;
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
      
      public function get AIMode() : String
      {
         return this._AIMode;
      }
      
      public function get actionList() : String
      {
         return this._actionList;
      }
      
      public function get params() : String
      {
         return this._params;
      }
      
      public function get isSort() : Number
      {
         return this._isSort;
      }
      
      public function get isBlit() : Number
      {
         return this._isBlit;
      }
      
      public function get isBlock() : Number
      {
         return this._isBlock;
      }
      
      public function get hp() : Number
      {
         return this._hp;
      }
      
      public function get beAttack() : Number
      {
         return this._beAttack;
      }
      
      public function get isCanMove() : Number
      {
         return this._isCanMove;
      }
      
      public function get rowOffsetTop() : Number
      {
         return this._rowOffsetTop;
      }
      
      public function get rowOffsetBottom() : Number
      {
         return this._rowOffsetBottom;
      }
      
      public function get itemResIDList() : String
      {
         return this._itemResIDList;
      }
      
      public function get initBuffListStr() : String
      {
         return this._initBuffListStr;
      }
      
      public function get initHideBones() : String
      {
         return this._initHideBones;
      }
      
      public function get needShade() : Number
      {
         return this._needShade;
      }
      
      public function get needSplash() : Number
      {
         return this._needSplash;
      }
   }
}
