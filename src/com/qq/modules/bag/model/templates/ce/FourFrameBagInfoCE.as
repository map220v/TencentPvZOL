package com.qq.modules.bag.model.templates.ce
{
   public class FourFrameBagInfoCE
   {
       
      
      protected var _id:Number;
      
      protected var _itemID1:Number;
      
      protected var _itemNum1:Number;
      
      protected var _itemID2:Number;
      
      protected var _itemNum2:Number;
      
      protected var _itemID3:Number;
      
      protected var _itemNum3:Number;
      
      protected var _itemID4:Number;
      
      protected var _itemNum4:Number;
      
      protected var _itemID5:Number;
      
      protected var _itemNum5:Number;
      
      public function FourFrameBagInfoCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._itemID1 = param1.itemID1;
         this._itemNum1 = param1.itemNum1;
         this._itemID2 = param1.itemID2;
         this._itemNum2 = param1.itemNum2;
         this._itemID3 = param1.itemID3;
         this._itemNum3 = param1.itemNum3;
         this._itemID4 = param1.itemID4;
         this._itemNum4 = param1.itemNum4;
         this._itemID5 = param1.itemID5;
         this._itemNum5 = param1.itemNum5;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get itemID1() : Number
      {
         return this._itemID1;
      }
      
      public function get itemNum1() : Number
      {
         return this._itemNum1;
      }
      
      public function get itemID2() : Number
      {
         return this._itemID2;
      }
      
      public function get itemNum2() : Number
      {
         return this._itemNum2;
      }
      
      public function get itemID3() : Number
      {
         return this._itemID3;
      }
      
      public function get itemNum3() : Number
      {
         return this._itemNum3;
      }
      
      public function get itemID4() : Number
      {
         return this._itemID4;
      }
      
      public function get itemNum4() : Number
      {
         return this._itemNum4;
      }
      
      public function get itemID5() : Number
      {
         return this._itemID5;
      }
      
      public function get itemNum5() : Number
      {
         return this._itemNum5;
      }
   }
}
