package com.qq.modules.dummy.model.templates.ce
{
   public class DummyBuyFubenEnemgyTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _price:Number;
      
      protected var _itemNum:Number;
      
      public function DummyBuyFubenEnemgyTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._price = param1.price;
         this._itemNum = param1.itemNum;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get price() : Number
      {
         return this._price;
      }
      
      public function get itemNum() : Number
      {
         return this._itemNum;
      }
   }
}
