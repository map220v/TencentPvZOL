package com.qq.modules.luckystar.model.templates.ce
{
   public class LuckyStarItemsTemplateCE
   {
       
      
      protected var _id1:Number;
      
      protected var _id2:Number;
      
      protected var _diamondWorth:Number;
      
      protected var _rewardItems:String;
      
      public function LuckyStarItemsTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id1 = param1.id1;
         this._id2 = param1.id2;
         this._diamondWorth = param1.diamondWorth;
         this._rewardItems = param1.rewardItems;
      }
      
      public function get id1() : Number
      {
         return this._id1;
      }
      
      public function get id2() : Number
      {
         return this._id2;
      }
      
      public function get diamondWorth() : Number
      {
         return this._diamondWorth;
      }
      
      public function get rewardItems() : String
      {
         return this._rewardItems;
      }
   }
}
