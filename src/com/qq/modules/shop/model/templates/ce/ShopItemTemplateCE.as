package com.qq.modules.shop.model.templates.ce
{
   public class ShopItemTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _desc:String;
      
      protected var _flag:Number;
      
      protected var _pageType:Number;
      
      protected var _order:Number;
      
      protected var _itemID:Number;
      
      protected var _price:Number;
      
      protected var _useGold:Number;
      
      protected var _needVIP:Number;
      
      public function ShopItemTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._desc = param1.desc;
         this._flag = param1.flag;
         this._pageType = param1.pageType;
         this._order = param1.order;
         this._itemID = param1.itemID;
         this._price = param1.price;
         this._useGold = param1.useGold;
         this._needVIP = param1.needVIP;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function get flag() : Number
      {
         return this._flag;
      }
      
      public function get pageType() : Number
      {
         return this._pageType;
      }
      
      public function get order() : Number
      {
         return this._order;
      }
      
      public function get itemID() : Number
      {
         return this._itemID;
      }
      
      public function get price() : Number
      {
         return this._price;
      }
      
      public function get useGold() : Number
      {
         return this._useGold;
      }
      
      public function get needVIP() : Number
      {
         return this._needVIP;
      }
   }
}
