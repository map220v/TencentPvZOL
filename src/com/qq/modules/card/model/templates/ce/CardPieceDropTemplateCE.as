package com.qq.modules.card.model.templates.ce
{
   public class CardPieceDropTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _pieceName:String;
      
      protected var _originalDrop:String;
      
      protected var _dropDesc:String;
      
      public function CardPieceDropTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._pieceName = param1.pieceName;
         this._originalDrop = param1.originalDrop;
         this._dropDesc = param1.dropDesc;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get pieceName() : String
      {
         return this._pieceName;
      }
      
      public function get originalDrop() : String
      {
         return this._originalDrop;
      }
      
      public function get dropDesc() : String
      {
         return this._dropDesc;
      }
   }
}
