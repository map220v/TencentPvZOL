package com.qq.modules.dummy.model.templates.ce
{
   public class DummyLevelTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _exp:Number;
      
      protected var _needRoleLevel:Number;
      
      public function DummyLevelTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._exp = param1.exp;
         this._needRoleLevel = param1.needRoleLevel;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get exp() : Number
      {
         return this._exp;
      }
      
      public function get needRoleLevel() : Number
      {
         return this._needRoleLevel;
      }
   }
}
