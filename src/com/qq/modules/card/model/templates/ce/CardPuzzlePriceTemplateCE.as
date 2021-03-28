package com.qq.modules.card.model.templates.ce
{
   public class CardPuzzlePriceTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _price:Number;
      
      public function CardPuzzlePriceTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._price = param1.price;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get price() : Number
      {
         return this._price;
      }
   }
}
