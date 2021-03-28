package com.qq.modules.map.model.templates.ce
{
   public class MapLevelTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _levelMin:Number;
      
      protected var _name:String;
      
      protected var _desc:String;
      
      protected var _buffDesc:String;
      
      protected var _levelMinForOldUser:Number;
      
      public function MapLevelTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._levelMin = param1.levelMin;
         this._name = param1.name;
         this._desc = param1.desc;
         this._buffDesc = param1.buffDesc;
         this._levelMinForOldUser = param1.levelMinForOldUser;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get levelMin() : Number
      {
         return this._levelMin;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function get buffDesc() : String
      {
         return this._buffDesc;
      }
      
      public function get levelMinForOldUser() : Number
      {
         return this._levelMinForOldUser;
      }
   }
}
