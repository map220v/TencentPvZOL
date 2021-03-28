package com.qq.modules.lab.model.templates.ce
{
   public class LabTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _bottleId:Number;
      
      protected var _level:Number;
      
      protected var _maxLevel:Number;
      
      protected var _name:String;
      
      protected var _type:Number;
      
      protected var _unlockCondition:Number;
      
      protected var _unlockCost:String;
      
      protected var _icon:Number;
      
      protected var _upgradeResult:String;
      
      protected var _resultDescRemark:String;
      
      protected var _upgradeCost:String;
      
      protected var _upgradeLvNeed:Number;
      
      protected var _starLv:Number;
      
      protected var _sort:Number;
      
      public function LabTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._bottleId = param1.bottleId;
         this._level = param1.level;
         this._maxLevel = param1.maxLevel;
         this._name = param1.name;
         this._type = param1.type;
         this._unlockCondition = param1.unlockCondition;
         this._unlockCost = param1.unlockCost;
         this._icon = param1.icon;
         this._upgradeResult = param1.upgradeResult;
         this._resultDescRemark = param1.resultDescRemark;
         this._upgradeCost = param1.upgradeCost;
         this._upgradeLvNeed = param1.upgradeLvNeed;
         this._starLv = param1.starLv;
         this._sort = param1.sort;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get bottleId() : Number
      {
         return this._bottleId;
      }
      
      public function get level() : Number
      {
         return this._level;
      }
      
      public function get maxLevel() : Number
      {
         return this._maxLevel;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get type() : Number
      {
         return this._type;
      }
      
      public function get unlockCondition() : Number
      {
         return this._unlockCondition;
      }
      
      public function get unlockCost() : String
      {
         return this._unlockCost;
      }
      
      public function get icon() : Number
      {
         return this._icon;
      }
      
      public function get upgradeResult() : String
      {
         return this._upgradeResult;
      }
      
      public function get resultDescRemark() : String
      {
         return this._resultDescRemark;
      }
      
      public function get upgradeCost() : String
      {
         return this._upgradeCost;
      }
      
      public function get upgradeLvNeed() : Number
      {
         return this._upgradeLvNeed;
      }
      
      public function get starLv() : Number
      {
         return this._starLv;
      }
      
      public function get sort() : Number
      {
         return this._sort;
      }
   }
}
