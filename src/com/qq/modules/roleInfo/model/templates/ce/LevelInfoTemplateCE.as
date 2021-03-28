package com.qq.modules.roleInfo.model.templates.ce
{
   public class LevelInfoTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _needExp:Number;
      
      protected var _battleCardMax:Number;
      
      protected var _energyMax:Number;
      
      protected var _bankLimit:Number;
      
      protected var _energyReward:String;
      
      public function LevelInfoTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._needExp = param1.needExp;
         this._battleCardMax = param1.battleCardMax;
         this._energyMax = param1.energyMax;
         this._bankLimit = param1.bankLimit;
         this._energyReward = param1.energyReward;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get needExp() : Number
      {
         return this._needExp;
      }
      
      public function get battleCardMax() : Number
      {
         return this._battleCardMax;
      }
      
      public function get energyMax() : Number
      {
         return this._energyMax;
      }
      
      public function get bankLimit() : Number
      {
         return this._bankLimit;
      }
      
      public function get energyReward() : String
      {
         return this._energyReward;
      }
   }
}
