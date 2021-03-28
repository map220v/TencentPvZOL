package com.qq.modules.luckystar.model.templates.ce
{
   public class LuckyStarDayBuyTemplateCE
   {
       
      
      protected var _id1:Number;
      
      protected var _id2:Number;
      
      protected var _rewardItems:String;
      
      protected var _isGoldenDiamond:Number;
      
      protected var _orgPrice:Number;
      
      protected var _nowPrice:Number;
      
      protected var _limitMaxAmount:Number;
      
      public function LuckyStarDayBuyTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id1 = param1.id1;
         this._id2 = param1.id2;
         this._rewardItems = param1.rewardItems;
         this._isGoldenDiamond = param1.isGoldenDiamond;
         this._orgPrice = param1.orgPrice;
         this._nowPrice = param1.nowPrice;
         this._limitMaxAmount = param1.limitMaxAmount;
      }
      
      public function get id1() : Number
      {
         return this._id1;
      }
      
      public function get id2() : Number
      {
         return this._id2;
      }
      
      public function get rewardItems() : String
      {
         return this._rewardItems;
      }
      
      public function get isGoldenDiamond() : Number
      {
         return this._isGoldenDiamond;
      }
      
      public function get orgPrice() : Number
      {
         return this._orgPrice;
      }
      
      public function get nowPrice() : Number
      {
         return this._nowPrice;
      }
      
      public function get limitMaxAmount() : Number
      {
         return this._limitMaxAmount;
      }
   }
}
