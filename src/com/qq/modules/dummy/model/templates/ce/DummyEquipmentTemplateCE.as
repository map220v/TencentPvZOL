package com.qq.modules.dummy.model.templates.ce
{
   public class DummyEquipmentTemplateCE
   {
       
      
      protected var _type:Number;
      
      protected var _quilty:Number;
      
      protected var _name:String;
      
      protected var _baseAttack:Number;
      
      protected var _baseDefense:Number;
      
      protected var _baseHp:Number;
      
      protected var _baseAbilty:Number;
      
      protected var _baseHit:Number;
      
      protected var _baseDodge:Number;
      
      protected var _baseCritical:Number;
      
      protected var _baseTough:Number;
      
      protected var _growAttack:Number;
      
      protected var _growDefense:Number;
      
      protected var _growHp:Number;
      
      protected var _growAbilty:Number;
      
      protected var _growHit:Number;
      
      protected var _growDodge:Number;
      
      protected var _growCritical:Number;
      
      protected var _growTough:Number;
      
      protected var _needItems:String;
      
      public function DummyEquipmentTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._type = param1.type;
         this._quilty = param1.quilty;
         this._name = param1.name;
         this._baseAttack = param1.baseAttack;
         this._baseDefense = param1.baseDefense;
         this._baseHp = param1.baseHp;
         this._baseAbilty = param1.baseAbilty;
         this._baseHit = param1.baseHit;
         this._baseDodge = param1.baseDodge;
         this._baseCritical = param1.baseCritical;
         this._baseTough = param1.baseTough;
         this._growAttack = param1.growAttack;
         this._growDefense = param1.growDefense;
         this._growHp = param1.growHp;
         this._growAbilty = param1.growAbilty;
         this._growHit = param1.growHit;
         this._growDodge = param1.growDodge;
         this._growCritical = param1.growCritical;
         this._growTough = param1.growTough;
         this._needItems = param1.needItems;
      }
      
      public function get type() : Number
      {
         return this._type;
      }
      
      public function get quilty() : Number
      {
         return this._quilty;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get baseAttack() : Number
      {
         return this._baseAttack;
      }
      
      public function get baseDefense() : Number
      {
         return this._baseDefense;
      }
      
      public function get baseHp() : Number
      {
         return this._baseHp;
      }
      
      public function get baseAbilty() : Number
      {
         return this._baseAbilty;
      }
      
      public function get baseHit() : Number
      {
         return this._baseHit;
      }
      
      public function get baseDodge() : Number
      {
         return this._baseDodge;
      }
      
      public function get baseCritical() : Number
      {
         return this._baseCritical;
      }
      
      public function get baseTough() : Number
      {
         return this._baseTough;
      }
      
      public function get growAttack() : Number
      {
         return this._growAttack;
      }
      
      public function get growDefense() : Number
      {
         return this._growDefense;
      }
      
      public function get growHp() : Number
      {
         return this._growHp;
      }
      
      public function get growAbilty() : Number
      {
         return this._growAbilty;
      }
      
      public function get growHit() : Number
      {
         return this._growHit;
      }
      
      public function get growDodge() : Number
      {
         return this._growDodge;
      }
      
      public function get growCritical() : Number
      {
         return this._growCritical;
      }
      
      public function get growTough() : Number
      {
         return this._growTough;
      }
      
      public function get needItems() : String
      {
         return this._needItems;
      }
   }
}
