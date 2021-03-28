package com.qq.modules.onlineReward.model.templates.ce
{
   public class OnlineDailyRewardTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _time:Number;
      
      public function OnlineDailyRewardTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._time = param1.time;
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
   }
}
