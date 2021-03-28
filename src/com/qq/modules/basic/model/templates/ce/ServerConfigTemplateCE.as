package com.qq.modules.basic.model.templates.ce
{
   public class ServerConfigTemplateCE
   {
       
      
      protected var _id:String;
      
      protected var _value:String;
      
      public function ServerConfigTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._value = param1.value;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get value() : String
      {
         return this._value;
      }
   }
}
