package com.qq.modules.buy.model.templates.ce
{
   public class BuyMallTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _itemId:Number;
      
      protected var _diamondBuy:Number;
      
      protected var _price:Number;
      
      protected var _icon:String;
      
      protected var _desc:String;
      
      protected var _iRecommand:Number;
      
      protected var _order:Number;
      
      public function BuyMallTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._itemId = param1.itemId;
         this._diamondBuy = param1.diamondBuy;
         this._price = param1.price;
         this._icon = param1.icon;
         this._desc = param1.desc;
         this._iRecommand = param1.iRecommand;
         this._order = param1.order;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get itemId() : Number
      {
         return this._itemId;
      }
      
      public function get diamondBuy() : Number
      {
         return this._diamondBuy;
      }
      
      public function get price() : Number
      {
         return this._price;
      }
      
      public function get icon() : String
      {
         return this._icon;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function get iRecommand() : Number
      {
         return this._iRecommand;
      }
      
      public function get order() : Number
      {
         return this._order;
      }
   }
}
