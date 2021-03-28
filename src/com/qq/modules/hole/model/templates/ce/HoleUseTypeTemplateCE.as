package com.qq.modules.hole.model.templates.ce
{
   public class HoleUseTypeTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _useItemID:Number;
      
      protected var _costTime:Number;
      
      protected var _rewardRate:Number;
      
      protected var _robTime:Number;
      
      protected var _rewardItemID:Number;
      
      public function HoleUseTypeTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._useItemID = param1.useItemID;
         this._costTime = param1.costTime;
         this._rewardRate = param1.rewardRate;
         this._robTime = param1.robTime;
         this._rewardItemID = param1.rewardItemID;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get useItemID() : Number
      {
         return this._useItemID;
      }
      
      public function get costTime() : Number
      {
         return this._costTime;
      }
      
      public function get rewardRate() : Number
      {
         return this._rewardRate;
      }
      
      public function get robTime() : Number
      {
         return this._robTime;
      }
      
      public function get rewardItemID() : Number
      {
         return this._rewardItemID;
      }
   }
}
