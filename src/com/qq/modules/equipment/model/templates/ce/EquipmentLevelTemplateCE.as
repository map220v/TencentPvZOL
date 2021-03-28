package com.qq.modules.equipment.model.templates.ce
{
   public class EquipmentLevelTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _type:Number;
      
      protected var _level:Number;
      
      protected var _superUpgrade:Number;
      
      protected var _name:String;
      
      protected var _needExp:Number;
      
      protected var _costEnergy:Number;
      
      protected var _originalProperty:String;
      
      public function EquipmentLevelTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._type = param1.type;
         this._level = param1.level;
         this._superUpgrade = param1.superUpgrade;
         this._name = param1.name;
         this._needExp = param1.needExp;
         this._costEnergy = param1.costEnergy;
         this._originalProperty = param1.originalProperty;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get type() : Number
      {
         return this._type;
      }
      
      public function get level() : Number
      {
         return this._level;
      }
      
      public function get superUpgrade() : Number
      {
         return this._superUpgrade;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get needExp() : Number
      {
         return this._needExp;
      }
      
      public function get costEnergy() : Number
      {
         return this._costEnergy;
      }
      
      public function get originalProperty() : String
      {
         return this._originalProperty;
      }
   }
}
