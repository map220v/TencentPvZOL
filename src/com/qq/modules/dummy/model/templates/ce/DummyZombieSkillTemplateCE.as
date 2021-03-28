package com.qq.modules.dummy.model.templates.ce
{
   public class DummyZombieSkillTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _activeSkillId:Number;
      
      protected var _baseSkillID:Number;
      
      protected var _activeSkillInfoID:Number;
      
      protected var _name:String;
      
      protected var _desc:String;
      
      protected var _effectDesc:String;
      
      protected var _rarity:Number;
      
      protected var _fixBaseValue:Number;
      
      protected var _fixGrowValue:Number;
      
      protected var _percentBaseValue:Number;
      
      protected var _percentGrowValue:Number;
      
      protected var _buffParam:String;
      
      public function DummyZombieSkillTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._activeSkillId = param1.activeSkillId;
         this._baseSkillID = param1.baseSkillID;
         this._activeSkillInfoID = param1.activeSkillInfoID;
         this._name = param1.name;
         this._desc = param1.desc;
         this._effectDesc = param1.effectDesc;
         this._rarity = param1.rarity;
         this._fixBaseValue = param1.fixBaseValue;
         this._fixGrowValue = param1.fixGrowValue;
         this._percentBaseValue = param1.percentBaseValue;
         this._percentGrowValue = param1.percentGrowValue;
         this._buffParam = param1.buffParam;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get activeSkillId() : Number
      {
         return this._activeSkillId;
      }
      
      public function get baseSkillID() : Number
      {
         return this._baseSkillID;
      }
      
      public function get activeSkillInfoID() : Number
      {
         return this._activeSkillInfoID;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function get effectDesc() : String
      {
         return this._effectDesc;
      }
      
      public function get rarity() : Number
      {
         return this._rarity;
      }
      
      public function get fixBaseValue() : Number
      {
         return this._fixBaseValue;
      }
      
      public function get fixGrowValue() : Number
      {
         return this._fixGrowValue;
      }
      
      public function get percentBaseValue() : Number
      {
         return this._percentBaseValue;
      }
      
      public function get percentGrowValue() : Number
      {
         return this._percentGrowValue;
      }
      
      public function get buffParam() : String
      {
         return this._buffParam;
      }
   }
}
