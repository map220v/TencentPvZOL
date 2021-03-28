package com.qq.modules.main.model.settings.battle.ce
{
   public class BattleLineupCardStateTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _desc:String;
      
      protected var _buffParam1:String;
      
      protected var _effectId:Number;
      
      public function BattleLineupCardStateTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._desc = param1.desc;
         this._buffParam1 = param1.buffParam1;
         this._effectId = param1.effectId;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function get buffParam1() : String
      {
         return this._buffParam1;
      }
      
      public function get effectId() : Number
      {
         return this._effectId;
      }
   }
}
