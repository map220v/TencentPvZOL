package com.qq.modules.dummy.model.templates.ce
{
   public class DummyZombieQuiltyTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _maxLV:Number;
      
      protected var _needEquipmentStr:String;
      
      protected var _losslessItemStr:String;
      
      protected var _nextQuiltyID:Number;
      
      protected var _exchangeNeedItemStr:String;
      
      public function DummyZombieQuiltyTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._maxLV = param1.maxLV;
         this._needEquipmentStr = param1.needEquipmentStr;
         this._losslessItemStr = param1.losslessItemStr;
         this._nextQuiltyID = param1.nextQuiltyID;
         this._exchangeNeedItemStr = param1.exchangeNeedItemStr;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get maxLV() : Number
      {
         return this._maxLV;
      }
      
      public function get needEquipmentStr() : String
      {
         return this._needEquipmentStr;
      }
      
      public function get losslessItemStr() : String
      {
         return this._losslessItemStr;
      }
      
      public function get nextQuiltyID() : Number
      {
         return this._nextQuiltyID;
      }
      
      public function get exchangeNeedItemStr() : String
      {
         return this._exchangeNeedItemStr;
      }
   }
}
