package com.qq.modules.dummy.model.templates.ce
{
   public class DummyZombieCallTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _needItemStr:String;
      
      protected var _needDiamondStr:String;
      
      protected var _getItemStr:String;
      
      protected var _dropItemStr:String;
      
      protected var _freeCD:Number;
      
      protected var _maxExtractCount:Number;
      
      protected var _desc:String;
      
      public function DummyZombieCallTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._needItemStr = param1.needItemStr;
         this._needDiamondStr = param1.needDiamondStr;
         this._getItemStr = param1.getItemStr;
         this._dropItemStr = param1.dropItemStr;
         this._freeCD = param1.freeCD;
         this._maxExtractCount = param1.maxExtractCount;
         this._desc = param1.desc;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get needItemStr() : String
      {
         return this._needItemStr;
      }
      
      public function get needDiamondStr() : String
      {
         return this._needDiamondStr;
      }
      
      public function get getItemStr() : String
      {
         return this._getItemStr;
      }
      
      public function get dropItemStr() : String
      {
         return this._dropItemStr;
      }
      
      public function get freeCD() : Number
      {
         return this._freeCD;
      }
      
      public function get maxExtractCount() : Number
      {
         return this._maxExtractCount;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
   }
}
