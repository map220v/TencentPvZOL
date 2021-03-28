package com.qq.modules.main.model.settings.battle.ce
{
   public class BattleLineupCardFeatureTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _type:Number;
      
      protected var _sign:Number;
      
      protected var _value:Number;
      
      protected var _valueType:Number;
      
      protected var _desc:String;
      
      protected var _simpleDesc:String;
      
      protected var _quality:Number;
      
      protected var _icon:Number;
      
      public function BattleLineupCardFeatureTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._type = param1.type;
         this._sign = param1.sign;
         this._value = param1.value;
         this._valueType = param1.valueType;
         this._desc = param1.desc;
         this._simpleDesc = param1.simpleDesc;
         this._quality = param1.quality;
         this._icon = param1.icon;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get type() : Number
      {
         return this._type;
      }
      
      public function get sign() : Number
      {
         return this._sign;
      }
      
      public function get value() : Number
      {
         return this._value;
      }
      
      public function get valueType() : Number
      {
         return this._valueType;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function get simpleDesc() : String
      {
         return this._simpleDesc;
      }
      
      public function get quality() : Number
      {
         return this._quality;
      }
      
      public function get icon() : Number
      {
         return this._icon;
      }
   }
}
