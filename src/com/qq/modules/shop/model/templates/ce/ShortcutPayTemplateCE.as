package com.qq.modules.shop.model.templates.ce
{
   public class ShortcutPayTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      public function ShortcutPayTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
   }
}
