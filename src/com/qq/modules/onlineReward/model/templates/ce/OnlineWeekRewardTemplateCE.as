package com.qq.modules.onlineReward.model.templates.ce
{
   public class OnlineWeekRewardTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _time:Number;
      
      protected var _rewardItem:String;
      
      public function OnlineWeekRewardTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._time = param1.time;
         this._rewardItem = param1.rewardItem;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get time() : Number
      {
         return this._time;
      }
      
      public function get rewardItem() : String
      {
         return this._rewardItem;
      }
   }
}
