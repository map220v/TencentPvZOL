package com.qq.modules.dummy.model.templates.ce
{
   public class DummySkillUpdateTemplateCE
   {
       
      
      protected var _rarity:Number;
      
      protected var _id:Number;
      
      protected var _needItemStr:String;
      
      public function DummySkillUpdateTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._rarity = param1.rarity;
         this._id = param1.id;
         this._needItemStr = param1.needItemStr;
      }
      
      public function get rarity() : Number
      {
         return this._rarity;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get needItemStr() : String
      {
         return this._needItemStr;
      }
   }
}
