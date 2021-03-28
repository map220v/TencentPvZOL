package com.qq.modules.main.model.templates.ce
{
   public class PrivilegeInfoCE
   {
       
      
      protected var _id:Number;
      
      protected var _type:Number;
      
      protected var _name:String;
      
      protected var _desc:String;
      
      protected var _unit:String;
      
      public function PrivilegeInfoCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._type = param1.type;
         this._name = param1.name;
         this._desc = param1.desc;
         this._unit = param1.unit;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get type() : Number
      {
         return this._type;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function get unit() : String
      {
         return this._unit;
      }
   }
}
