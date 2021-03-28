package com.qq.modules.dummy.model.templates.ce
{
   public class DummyActiveSkillInfoTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _needItems:String;
      
      protected var _needDummyStar:Number;
      
      protected var _needSkillLv:Number;
      
      protected var _maxSkill:Number;
      
      protected var _baseValue:Number;
      
      protected var _growValue:Number;
      
      public function DummyActiveSkillInfoTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._needItems = param1.needItems;
         this._needDummyStar = param1.needDummyStar;
         this._needSkillLv = param1.needSkillLv;
         this._maxSkill = param1.maxSkill;
         this._baseValue = param1.baseValue;
         this._growValue = param1.growValue;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get needItems() : String
      {
         return this._needItems;
      }
      
      public function get needDummyStar() : Number
      {
         return this._needDummyStar;
      }
      
      public function get needSkillLv() : Number
      {
         return this._needSkillLv;
      }
      
      public function get maxSkill() : Number
      {
         return this._maxSkill;
      }
      
      public function get baseValue() : Number
      {
         return this._baseValue;
      }
      
      public function get growValue() : Number
      {
         return this._growValue;
      }
   }
}
