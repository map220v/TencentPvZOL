package com.tencent.protobuf
{
   public final class UInt64 extends Binary64
   {
       
      
      public function UInt64(param1:uint = 0, param2:uint = 0)
      {
         super(param1,param2);
      }
      
      public static function fromNumber(param1:Number) : UInt64
      {
         return new UInt64(param1,Math.floor(param1 / 4294967296));
      }
      
      public static function parseUInt64(param1:String, param2:uint = 0) : UInt64
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         if(param2 == 0)
         {
            if(param1.search(/^0x/) == 0)
            {
               param2 = 16;
               _loc3_ = 2;
            }
            else
            {
               param2 = 10;
            }
         }
         if(param2 < 2 || param2 > 36)
         {
            throw new ArgumentError();
         }
         param1 = param1.toLowerCase();
         var _loc4_:UInt64 = new UInt64();
         while(_loc3_ < param1.length)
         {
            if((_loc5_ = param1.charCodeAt(_loc3_)) >= "0".charCodeAt() && _loc5_ <= "9".charCodeAt())
            {
               _loc5_ -= "0".charCodeAt();
            }
            else
            {
               if(!(_loc5_ >= "a".charCodeAt() && _loc5_ <= "z".charCodeAt()))
               {
                  throw new ArgumentError();
               }
               _loc5_ -= "a".charCodeAt();
            }
            if(_loc5_ >= param2)
            {
               throw new ArgumentError();
            }
            _loc4_.mul(param2);
            _loc4_.add(_loc5_);
            _loc3_++;
         }
         return _loc4_;
      }
      
      public final function set high(param1:uint) : void
      {
         internalHigh = param1;
      }
      
      public final function get high() : uint
      {
         return internalHigh;
      }
      
      public final function toNumber() : Number
      {
         return this.high * 4294967296 + low;
      }
      
      public final function toString(param1:uint = 10) : String
      {
         var _loc4_:uint = 0;
         if(param1 < 2 || param1 > 36)
         {
            throw new ArgumentError();
         }
         if(this.high == 0)
         {
            return low.toString(param1);
         }
         var _loc2_:Array = [];
         var _loc3_:UInt64 = new UInt64(low,this.high);
         do
         {
            _loc4_ = _loc3_.div(param1);
            _loc2_.push((_loc4_ < 10 ? "0" : "a").charCodeAt() + _loc4_);
         }
         while(_loc3_.high != 0);
         
         return _loc3_.low.toString(param1) + String.fromCharCode.apply(String,_loc2_.reverse());
      }
   }
}
