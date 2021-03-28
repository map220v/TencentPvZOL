package com.qq.modules.equipment.model.templates.ce
{
   public class EquipmentItemTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _rank:Number;
      
      protected var _position:Number;
      
      protected var _equipType:Number;
      
      protected var _plantType:Number;
      
      protected var _originalMaterial:String;
      
      protected var _originalProperty:String;
      
      public function EquipmentItemTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._rank = param1.rank;
         this._position = param1.position;
         this._equipType = param1.equipType;
         this._plantType = param1.plantType;
         this._originalMaterial = param1.originalMaterial;
         this._originalProperty = param1.originalProperty;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get rank() : Number
      {
         return this._rank;
      }
      
      public function get position() : Number
      {
         return this._position;
      }
      
      public function get equipType() : Number
      {
         return this._equipType;
      }
      
      public function get plantType() : Number
      {
         return this._plantType;
      }
      
      public function get originalMaterial() : String
      {
         return this._originalMaterial;
      }
      
      public function get originalProperty() : String
      {
         return this._originalProperty;
      }
   }
}
