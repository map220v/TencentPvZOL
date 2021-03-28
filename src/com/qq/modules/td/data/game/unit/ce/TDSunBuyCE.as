package com.qq.modules.td.data.game.unit.ce
{
   public class TDSunBuyCE extends TDBasicTemplate
   {
       
      
      protected var _id:Number;
      
      protected var _count:Number;
      
      protected var _cost:Number;
      
      public function TDSunBuyCE()
      {
         super();
      }
      
      override public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._count = param1.count;
         this._cost = param1.cost;
         super.load(param1);
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get count() : Number
      {
         return this._count;
      }
      
      public function get cost() : Number
      {
         return this._cost;
      }
   }
}
