package com.qq.modules.city.model.templates.ce
{
   public class BuildingTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _desc:String;
      
      protected var _unlockRoleLv:Number;
      
      protected var _order:Number;
      
      public function BuildingTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._desc = param1.desc;
         this._unlockRoleLv = param1.unlockRoleLv;
         this._order = param1.order;
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
      
      public function get unlockRoleLv() : Number
      {
         return this._unlockRoleLv;
      }
      
      public function get order() : Number
      {
         return this._order;
      }
   }
}
