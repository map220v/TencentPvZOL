package com.tencent.protobuf
{
   public final class ZigZag
   {
       
      
      public function ZigZag()
      {
         super();
      }
      
      public static function encode32(param1:int) : int
      {
         return param1 << 1 ^ param1 >> 31;
      }
      
      public static function decode32(param1:int) : int
      {
         return param1 >>> 1 ^ -(param1 & 1);
      }
      
      public static function encode64low(param1:uint, param2:int) : uint
      {
         return param1 << 1 ^ param2 >> 31;
      }
      
      public static function encode64high(param1:uint, param2:int) : int
      {
         return param1 >>> 31 ^ param2 << 1 ^ param2 >> 31;
      }
      
      public static function decode64low(param1:uint, param2:int) : uint
      {
         return param2 << 31 ^ param1 >>> 1 ^ -(param1 & 1);
      }
      
      public static function decode64high(param1:uint, param2:int) : int
      {
         return param2 >>> 1 ^ -(param1 & 1);
      }
   }
}
