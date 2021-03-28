package com.qq.modules.fuben.model.templates.ce
{
   public class FubenChapterForUnionRankRewardTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _regionStart:Number;
      
      protected var _regionEnd:Number;
      
      protected var _reward:String;
      
      protected var _rateReward:String;
      
      public function FubenChapterForUnionRankRewardTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._regionStart = param1.regionStart;
         this._regionEnd = param1.regionEnd;
         this._reward = param1.reward;
         this._rateReward = param1.rateReward;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get regionStart() : Number
      {
         return this._regionStart;
      }
      
      public function get regionEnd() : Number
      {
         return this._regionEnd;
      }
      
      public function get reward() : String
      {
         return this._reward;
      }
      
      public function get rateReward() : String
      {
         return this._rateReward;
      }
   }
}
