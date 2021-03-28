package com.tencent.protobuf
{
   public class Binary64
   {
       
      
      public var low:uint;
      
      var internalHigh:uint;
      
      public function Binary64(param1:uint = 0, param2:uint = 0)
      {
         super();
         this.low = param1;
         this.internalHigh = param2;
      }
      
      final function div(param1:uint) : uint
      {
         var _loc2_:uint = 0;
         _loc2_ = this.internalHigh % param1;
         var _loc3_:uint = (this.low % param1 + _loc2_ * 6) % param1;
         this.internalHigh /= param1;
         var _loc4_:Number = (_loc2_ * Number(4294967296) + this.low) / param1;
         this.internalHigh += _loc4_ / 4294967296;
         this.low = _loc4_;
         return _loc3_;
      }
      
      final function mul(param1:uint) : void
      {
         var _loc2_:Number = Number(this.low) * param1;
         this.internalHigh = _loc2_ / 4294967296 + Number(this.internalHigh) * param1;
         this.low = _loc2_;
      }
      
      final function add(param1:uint) : void
      {
         var _loc2_:Number = Number(this.low) + param1;
         this.internalHigh = _loc2_ / 4294967296 + this.internalHigh;
         this.low = _loc2_;
      }
      
      final function bitwiseNot() : void
      {
         this.low = ~this.low;
         this.internalHigh = ~this.internalHigh;
      }
   }
}
