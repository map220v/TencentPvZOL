package com.qq.modules.card.model.templates.ce
{
   public class CardDeckShowTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _cardIds:String;
      
      protected var _icon:Number;
      
      public function CardDeckShowTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._cardIds = param1.cardIds;
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
      
      public function get cardIds() : String
      {
         return this._cardIds;
      }
      
      public function get icon() : Number
      {
         return this._icon;
      }
   }
}
