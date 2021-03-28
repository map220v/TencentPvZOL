package com.qq.modules.equipment.model.templates.ce
{
   public class EquipmentPartTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _rank:Number;
      
      protected var _name:String;
      
      protected var _level:Number;
      
      protected var _firstReward:Number;
      
      protected var _dailyReward:Number;
      
      protected var _originalMaterial:String;
      
      protected var _cost:Number;
      
      protected var _limit:Number;
      
      protected var _needVIP:Number;
      
      public function EquipmentPartTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._rank = param1.rank;
         this._name = param1.name;
         this._level = param1.level;
         this._firstReward = param1.firstReward;
         this._dailyReward = param1.dailyReward;
         this._originalMaterial = param1.originalMaterial;
         this._cost = param1.cost;
         this._limit = param1.limit;
         this._needVIP = param1.needVIP;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get rank() : Number
      {
         return this._rank;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : Number
      {
         return this._level;
      }
      
      public function get firstReward() : Number
      {
         return this._firstReward;
      }
      
      public function get dailyReward() : Number
      {
         return this._dailyReward;
      }
      
      public function get originalMaterial() : String
      {
         return this._originalMaterial;
      }
      
      public function get cost() : Number
      {
         return this._cost;
      }
      
      public function get limit() : Number
      {
         return this._limit;
      }
      
      public function get needVIP() : Number
      {
         return this._needVIP;
      }
   }
}
