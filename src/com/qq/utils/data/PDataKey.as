package com.qq.utils.data
{
   public class PDataKey
   {
       
      
      public var id:int;
      
      public var key:Number;
      
      public function PDataKey(param1:int, param2:Number)
      {
         super();
         this.id = param1;
         this.key = param2;
      }
      
      public function toString() : String
      {
         return "id:" + this.id + ",key:" + this.key;
      }
   }
}
