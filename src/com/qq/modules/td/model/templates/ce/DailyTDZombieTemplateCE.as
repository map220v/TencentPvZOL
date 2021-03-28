package com.qq.modules.td.model.templates.ce
{
   public class DailyTDZombieTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _type:Number;
      
      protected var _hp:Number;
      
      protected var _speed:Number;
      
      protected var _armor:Number;
      
      protected var _duration:Number;
      
      public function DailyTDZombieTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._type = param1.type;
         this._hp = param1.hp;
         this._speed = param1.speed;
         this._armor = param1.armor;
         this._duration = param1.duration;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get type() : Number
      {
         return this._type;
      }
      
      public function get hp() : Number
      {
         return this._hp;
      }
      
      public function get speed() : Number
      {
         return this._speed;
      }
      
      public function get armor() : Number
      {
         return this._armor;
      }
      
      public function get duration() : Number
      {
         return this._duration;
      }
   }
}
