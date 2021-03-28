package com.qq.modules.equipment.model.templates.ce
{
   public class EquipmentRankTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _type:Number;
      
      protected var _rank:Number;
      
      protected var _upgradeCount:Number;
      
      protected var _originalMaterial:String;
      
      protected var _costEnergy:Number;
      
      protected var _originalProperty:String;
      
      protected var _levelLimit:Number;
      
      public function EquipmentRankTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._type = param1.type;
         this._rank = param1.rank;
         this._upgradeCount = param1.upgradeCount;
         this._originalMaterial = param1.originalMaterial;
         this._costEnergy = param1.costEnergy;
         this._originalProperty = param1.originalProperty;
         this._levelLimit = param1.levelLimit;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get type() : Number
      {
         return this._type;
      }
      
      public function get rank() : Number
      {
         return this._rank;
      }
      
      public function get upgradeCount() : Number
      {
         return this._upgradeCount;
      }
      
      public function get originalMaterial() : String
      {
         return this._originalMaterial;
      }
      
      public function get costEnergy() : Number
      {
         return this._costEnergy;
      }
      
      public function get originalProperty() : String
      {
         return this._originalProperty;
      }
      
      public function get levelLimit() : Number
      {
         return this._levelLimit;
      }
   }
}
