package com.qq.modules.card.model.templates.ce
{
   public class CardPieceTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _originalPos:String;
      
      public function CardPieceTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._originalPos = param1.originalPos;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get originalPos() : String
      {
         return this._originalPos;
      }
   }
}
