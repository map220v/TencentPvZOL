package com.qq.modules.map.model.templates.ce
{
   public class MapCellPropTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _skin:Number;
      
      public function MapCellPropTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._skin = param1.skin;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get skin() : Number
      {
         return this._skin;
      }
   }
}
