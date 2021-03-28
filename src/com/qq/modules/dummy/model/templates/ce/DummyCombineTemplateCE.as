package com.qq.modules.dummy.model.templates.ce
{
   public class DummyCombineTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _combineStr:String;
      
      public function DummyCombineTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._combineStr = param1.combineStr;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get combineStr() : String
      {
         return this._combineStr;
      }
   }
}
