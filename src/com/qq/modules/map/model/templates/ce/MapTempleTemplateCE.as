package com.qq.modules.map.model.templates.ce
{
   public class MapTempleTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _type:Number;
      
      protected var _area:Number;
      
      protected var _pos:String;
      
      protected var _previewPos:String;
      
      protected var _name:String;
      
      protected var _desc:String;
      
      protected var _isValid:Number;
      
      public function MapTempleTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._type = param1.type;
         this._area = param1.area;
         this._pos = param1.pos;
         this._previewPos = param1.previewPos;
         this._name = param1.name;
         this._desc = param1.desc;
         this._isValid = param1.isValid;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get type() : Number
      {
         return this._type;
      }
      
      public function get area() : Number
      {
         return this._area;
      }
      
      public function get pos() : String
      {
         return this._pos;
      }
      
      public function get previewPos() : String
      {
         return this._previewPos;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function get isValid() : Number
      {
         return this._isValid;
      }
   }
}
