package com.qq.modules.card.model.templates.ce
{
   public class CardDeckAttributeTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _attack:Number;
      
      protected var _defense:Number;
      
      protected var _hp:Number;
      
      protected var _skill:Number;
      
      public function CardDeckAttributeTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._attack = param1.attack;
         this._defense = param1.defense;
         this._hp = param1.hp;
         this._skill = param1.skill;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get attack() : Number
      {
         return this._attack;
      }
      
      public function get defense() : Number
      {
         return this._defense;
      }
      
      public function get hp() : Number
      {
         return this._hp;
      }
      
      public function get skill() : Number
      {
         return this._skill;
      }
   }
}
