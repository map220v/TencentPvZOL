package com.qq.modules.card.model.templates.ce
{
   public class CardDeckDetailTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _cardId:Number;
      
      protected var _deckId:Number;
      
      protected var _feature:String;
      
      protected var _skill:Number;
      
      protected var _attribute:String;
      
      public function CardDeckDetailTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._cardId = param1.cardId;
         this._deckId = param1.deckId;
         this._feature = param1.feature;
         this._skill = param1.skill;
         this._attribute = param1.attribute;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get cardId() : Number
      {
         return this._cardId;
      }
      
      public function get deckId() : Number
      {
         return this._deckId;
      }
      
      public function get feature() : String
      {
         return this._feature;
      }
      
      public function get skill() : Number
      {
         return this._skill;
      }
      
      public function get attribute() : String
      {
         return this._attribute;
      }
   }
}
