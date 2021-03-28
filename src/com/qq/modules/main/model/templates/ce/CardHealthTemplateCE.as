package com.qq.modules.main.model.templates.ce
{
   public class CardHealthTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _lowHp:Number;
      
      protected var _powRate:Number;
      
      public function CardHealthTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._lowHp = param1.lowHp;
         this._powRate = param1.powRate;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get lowHp() : Number
      {
         return this._lowHp;
      }
      
      public function get powRate() : Number
      {
         return this._powRate;
      }
   }
}
