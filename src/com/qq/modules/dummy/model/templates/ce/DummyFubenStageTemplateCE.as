package com.qq.modules.dummy.model.templates.ce
{
   public class DummyFubenStageTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _mode:Number;
      
      protected var _chaperID:Number;
      
      protected var _stageID:Number;
      
      protected var _name:String;
      
      protected var _openMinLv:Number;
      
      protected var _needEnergy:Number;
      
      protected var _lootItemStr:String;
      
      protected var _fightLimit:Number;
      
      protected var _icon:Number;
      
      public function DummyFubenStageTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._mode = param1.mode;
         this._chaperID = param1.chaperID;
         this._stageID = param1.stageID;
         this._name = param1.name;
         this._openMinLv = param1.openMinLv;
         this._needEnergy = param1.needEnergy;
         this._lootItemStr = param1.lootItemStr;
         this._fightLimit = param1.fightLimit;
         this._icon = param1.icon;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get mode() : Number
      {
         return this._mode;
      }
      
      public function get chaperID() : Number
      {
         return this._chaperID;
      }
      
      public function get stageID() : Number
      {
         return this._stageID;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get openMinLv() : Number
      {
         return this._openMinLv;
      }
      
      public function get needEnergy() : Number
      {
         return this._needEnergy;
      }
      
      public function get lootItemStr() : String
      {
         return this._lootItemStr;
      }
      
      public function get fightLimit() : Number
      {
         return this._fightLimit;
      }
      
      public function get icon() : Number
      {
         return this._icon;
      }
   }
}
