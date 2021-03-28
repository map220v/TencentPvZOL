package com.qq.modules.td.data.game.unit.ce
{
   public class TDStrengthenTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _cost:Number;
      
      protected var _scoreRatio:Number;
      
      public function TDStrengthenTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._cost = param1.cost;
         this._scoreRatio = param1.scoreRatio;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get cost() : Number
      {
         return this._cost;
      }
      
      public function get scoreRatio() : Number
      {
         return this._scoreRatio;
      }
   }
}
