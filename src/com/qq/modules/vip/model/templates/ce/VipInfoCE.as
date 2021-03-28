package com.qq.modules.vip.model.templates.ce
{
   public class VipInfoCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _level:Number;
      
      protected var _price:Number;
      
      protected var _day:Number;
      
      protected var _continueDay:Number;
      
      protected var _weekReward:String;
      
      protected var _continueString:String;
      
      protected var _vipType:Number;
      
      protected var _giftString:String;
      
      protected var _privilegeString:String;
      
      public function VipInfoCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._level = param1.level;
         this._price = param1.price;
         this._day = param1.day;
         this._continueDay = param1.continueDay;
         this._weekReward = param1.weekReward;
         this._continueString = param1.continueString;
         this._vipType = param1.vipType;
         this._giftString = param1.giftString;
         this._privilegeString = param1.privilegeString;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : Number
      {
         return this._level;
      }
      
      public function get price() : Number
      {
         return this._price;
      }
      
      public function get day() : Number
      {
         return this._day;
      }
      
      public function get continueDay() : Number
      {
         return this._continueDay;
      }
      
      public function get weekReward() : String
      {
         return this._weekReward;
      }
      
      public function get continueString() : String
      {
         return this._continueString;
      }
      
      public function get vipType() : Number
      {
         return this._vipType;
      }
      
      public function get giftString() : String
      {
         return this._giftString;
      }
      
      public function get privilegeString() : String
      {
         return this._privilegeString;
      }
   }
}
