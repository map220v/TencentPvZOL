package com.qq.modules.dummy.model.templates.ce
{
   public class DummyZombieStarTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _needPieces:Number;
      
      protected var _percentBuff:Number;
      
      public function DummyZombieStarTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._needPieces = param1.needPieces;
         this._percentBuff = param1.percentBuff;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get needPieces() : Number
      {
         return this._needPieces;
      }
      
      public function get percentBuff() : Number
      {
         return this._percentBuff;
      }
   }
}
