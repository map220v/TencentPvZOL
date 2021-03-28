package com.qq.modules.card.model.templates.ce
{
   public class CardForgeTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _cardId:Number;
      
      protected var _forgeLevel:Number;
      
      protected var _forgeCost:Number;
      
      protected var _addAtk:Number;
      
      protected var _addDef:Number;
      
      protected var _addHp:Number;
      
      protected var _addShield:Number;
      
      protected var _addAbility:Number;
      
      public function CardForgeTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._cardId = param1.cardId;
         this._forgeLevel = param1.forgeLevel;
         this._forgeCost = param1.forgeCost;
         this._addAtk = param1.addAtk;
         this._addDef = param1.addDef;
         this._addHp = param1.addHp;
         this._addShield = param1.addShield;
         this._addAbility = param1.addAbility;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get cardId() : Number
      {
         return this._cardId;
      }
      
      public function get forgeLevel() : Number
      {
         return this._forgeLevel;
      }
      
      public function get forgeCost() : Number
      {
         return this._forgeCost;
      }
      
      public function get addAtk() : Number
      {
         return this._addAtk;
      }
      
      public function get addDef() : Number
      {
         return this._addDef;
      }
      
      public function get addHp() : Number
      {
         return this._addHp;
      }
      
      public function get addShield() : Number
      {
         return this._addShield;
      }
      
      public function get addAbility() : Number
      {
         return this._addAbility;
      }
   }
}
