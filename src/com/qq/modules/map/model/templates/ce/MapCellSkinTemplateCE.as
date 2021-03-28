package com.qq.modules.map.model.templates.ce
{
   public class MapCellSkinTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _x:Number;
      
      protected var _y:Number;
      
      protected var _width:Number;
      
      protected var _height:Number;
      
      protected var _src:String;
      
      public function MapCellSkinTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._x = param1.x;
         this._y = param1.y;
         this._width = param1.width;
         this._height = param1.height;
         this._src = param1.src;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this._y;
      }
      
      public function get width() : Number
      {
         return this._width;
      }
      
      public function get height() : Number
      {
         return this._height;
      }
      
      public function get src() : String
      {
         return this._src;
      }
   }
}
