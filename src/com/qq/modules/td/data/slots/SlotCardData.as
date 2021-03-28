package com.qq.modules.td.data.slots
{
   public class SlotCardData
   {
       
      
      private var _type:int;
      
      private var _count:int;
      
      public function SlotCardData(param1:int, param2:int)
      {
         super();
         this._type = param1;
         this._count = param2;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set count(param1:int) : void
      {
         this._count = param1;
      }
      
      public function get count() : int
      {
         return this._count;
      }
   }
}
