package com.qq.modules.equipment.model.templates.ce
{
   public class EquipmentPoolTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _rank:Number;
      
      protected var _level:Number;
      
      protected var _capability:Number;
      
      protected var _recover:Number;
      
      protected var _needExp:Number;
      
      protected var _needPartID:Number;
      
      public function EquipmentPoolTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._rank = param1.rank;
         this._level = param1.level;
         this._capability = param1.capability;
         this._recover = param1.recover;
         this._needExp = param1.needExp;
         this._needPartID = param1.needPartID;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get rank() : Number
      {
         return this._rank;
      }
      
      public function get level() : Number
      {
         return this._level;
      }
      
      public function get capability() : Number
      {
         return this._capability;
      }
      
      public function get recover() : Number
      {
         return this._recover;
      }
      
      public function get needExp() : Number
      {
         return this._needExp;
      }
      
      public function get needPartID() : Number
      {
         return this._needPartID;
      }
   }
}
