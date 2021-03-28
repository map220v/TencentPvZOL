package com.qq.modules.topKing.model.templates.ce
{
   public class TopKingCoinBetInfoCE
   {
       
      
      protected var _id:Number;
      
      protected var _minLvRequired:Number;
      
      protected var _maxBetNum:Number;
      
      public function TopKingCoinBetInfoCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._minLvRequired = param1.minLvRequired;
         this._maxBetNum = param1.maxBetNum;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get minLvRequired() : Number
      {
         return this._minLvRequired;
      }
      
      public function get maxBetNum() : Number
      {
         return this._maxBetNum;
      }
   }
}
