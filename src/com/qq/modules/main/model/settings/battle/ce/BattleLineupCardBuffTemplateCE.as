package com.qq.modules.main.model.settings.battle.ce
{
   public class BattleLineupCardBuffTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _effect:String;
      
      protected var _icon:String;
      
      protected var _align:Number;
      
      protected var _onlyEff:Number;
      
      public function BattleLineupCardBuffTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._effect = param1.effect;
         this._icon = param1.icon;
         this._align = param1.align;
         this._onlyEff = param1.onlyEff;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get effect() : String
      {
         return this._effect;
      }
      
      public function get icon() : String
      {
         return this._icon;
      }
      
      public function get align() : Number
      {
         return this._align;
      }
      
      public function get onlyEff() : Number
      {
         return this._onlyEff;
      }
   }
}
