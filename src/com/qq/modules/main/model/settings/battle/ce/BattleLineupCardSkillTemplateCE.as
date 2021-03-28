package com.qq.modules.main.model.settings.battle.ce
{
   public class BattleLineupCardSkillTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _desc:String;
      
      protected var _animId:Number;
      
      public function BattleLineupCardSkillTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._desc = param1.desc;
         this._animId = param1.animId;
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
      
      public function get animId() : Number
      {
         return this._animId;
      }
   }
}
