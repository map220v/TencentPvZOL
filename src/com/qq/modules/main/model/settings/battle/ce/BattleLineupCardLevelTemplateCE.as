package com.qq.modules.main.model.settings.battle.ce
{
   public class BattleLineupCardLevelTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _level:Number;
      
      protected var _exp:Number;
      
      protected var _totalExp:Number;
      
      protected var _needLevel:Number;
      
      public function BattleLineupCardLevelTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._level = param1.level;
         this._exp = param1.exp;
         this._totalExp = param1.totalExp;
         this._needLevel = param1.needLevel;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get level() : Number
      {
         return this._level;
      }
      
      public function get exp() : Number
      {
         return this._exp;
      }
      
      public function get totalExp() : Number
      {
         return this._totalExp;
      }
      
      public function get needLevel() : Number
      {
         return this._needLevel;
      }
   }
}
