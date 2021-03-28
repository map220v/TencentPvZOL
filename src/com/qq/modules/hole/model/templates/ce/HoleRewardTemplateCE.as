package com.qq.modules.hole.model.templates.ce
{
   public class HoleRewardTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _reward:Number;
      
      public function HoleRewardTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._reward = param1.reward;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get reward() : Number
      {
         return this._reward;
      }
   }
}
