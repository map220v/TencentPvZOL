package com.qq.modules.map.model.templates.ce
{
   public class MapTempleRewardTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _type:Number;
      
      protected var _count:Number;
      
      protected var _originalReward:String;
      
      public function MapTempleRewardTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._type = param1.type;
         this._count = param1.count;
         this._originalReward = param1.originalReward;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get type() : Number
      {
         return this._type;
      }
      
      public function get count() : Number
      {
         return this._count;
      }
      
      public function get originalReward() : String
      {
         return this._originalReward;
      }
   }
}
