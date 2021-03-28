package com.qq.modules.equipment.model.templates.ce
{
   public class EquipmentBeadTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _cost:Number;
      
      protected var _count:Number;
      
      public function EquipmentBeadTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._cost = param1.cost;
         this._count = param1.count;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get cost() : Number
      {
         return this._cost;
      }
      
      public function get count() : Number
      {
         return this._count;
      }
   }
}
