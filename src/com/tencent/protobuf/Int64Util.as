package com.tencent.protobuf
{
   public class Int64Util
   {
       
      
      public function Int64Util()
      {
         super();
      }
      
      public static function isEqual(param1:Int64, param2:Int64) : Boolean
      {
         if(param1 == null || param2 == null)
         {
            return false;
         }
         if(param1.high == param2.high && param1.low == param2.low)
         {
            return true;
         }
         return false;
      }
   }
}
