package com.qq.modules.dummy.model.templates.ce
{
   public class DummyEquipmentLevelTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _needItems:String;
      
      public function DummyEquipmentLevelTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._needItems = param1.needItems;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get needItems() : String
      {
         return this._needItems;
      }
   }
}
