package com.adobe.serialization.json
{
   public class JSONToken
   {
       
      
      private var _type:int;
      
      private var _value:Object;
      
      public function JSONToken(param1:int = -1, param2:Object = null)
      {
         super();
         this._type = param1;
         this._value = param2;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function get value() : Object
      {
         return this._value;
      }
      
      public function set value(param1:Object) : void
      {
         this._value = param1;
      }
   }
}
