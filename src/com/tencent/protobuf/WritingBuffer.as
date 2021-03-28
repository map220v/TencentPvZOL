package com.tencent.protobuf
{
   import flash.errors.*;
   import flash.utils.*;
   
   public final class WritingBuffer extends ByteArray
   {
       
      
      private const slices:Vector.<uint> = new Vector.<uint>();
      
      public function WritingBuffer()
      {
         super();
         endian = Endian.LITTLE_ENDIAN;
      }
      
      public function beginBlock() : uint
      {
         this.slices.push(position);
         var _loc1_:uint = this.slices.length;
         this.slices.length += 2;
         this.slices.push(position);
         return _loc1_;
      }
      
      public function endBlock(param1:uint) : void
      {
         this.slices.push(position);
         var _loc2_:uint = this.slices[param1 + 2];
         this.slices[param1] = position;
         WriteUtils.write$TYPE_UINT32(this,position - _loc2_);
         this.slices[param1 + 1] = position;
         this.slices.push(position);
      }
      
      public function toNormal(param1:IDataOutput) : void
      {
         var _loc4_:uint = 0;
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         while(_loc2_ < this.slices.length)
         {
            _loc4_ = this.slices[_loc2_];
            _loc2_++;
            if(_loc4_ > _loc3_)
            {
               param1.writeBytes(this,_loc3_,_loc4_ - _loc3_);
            }
            else if(_loc4_ < _loc3_)
            {
               throw new IllegalOperationError();
            }
            _loc3_ = this.slices[_loc2_];
            _loc2_++;
         }
         param1.writeBytes(this,_loc3_);
      }
   }
}
