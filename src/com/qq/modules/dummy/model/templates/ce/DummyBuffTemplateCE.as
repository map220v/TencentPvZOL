package com.qq.modules.dummy.model.templates.ce
{
   public class DummyBuffTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _desc:String;
      
      protected var _valueType:Number;
      
      protected var _baseValue:Number;
      
      protected var _growValue:Number;
      
      protected var _effectId:Number;
      
      public function DummyBuffTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._desc = param1.desc;
         this._valueType = param1.valueType;
         this._baseValue = param1.baseValue;
         this._growValue = param1.growValue;
         this._effectId = param1.effectId;
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
      
      public function get valueType() : Number
      {
         return this._valueType;
      }
      
      public function get baseValue() : Number
      {
         return this._baseValue;
      }
      
      public function get growValue() : Number
      {
         return this._growValue;
      }
      
      public function get effectId() : Number
      {
         return this._effectId;
      }
   }
}
