package com.qq.modules.speed.model.templates.ce
{
   public class SpeedEquipmentTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _level:Number;
      
      protected var _speed:Number;
      
      public function SpeedEquipmentTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._level = param1.level;
         this._speed = param1.speed;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get level() : Number
      {
         return this._level;
      }
      
      public function get speed() : Number
      {
         return this._speed;
      }
   }
}
