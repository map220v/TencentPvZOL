package com.qq.modules.map.model.templates.ce
{
   public class MapMineInfoTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _carCount:Number;
      
      protected var _timeLimit:Number;
      
      public function MapMineInfoTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._carCount = param1.carCount;
         this._timeLimit = param1.timeLimit;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get carCount() : Number
      {
         return this._carCount;
      }
      
      public function get timeLimit() : Number
      {
         return this._timeLimit;
      }
   }
}
