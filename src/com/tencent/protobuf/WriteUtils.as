package com.tencent.protobuf
{
   import flash.errors.IOError;
   import flash.utils.ByteArray;
   
   public final class WriteUtils
   {
       
      
      public function WriteUtils()
      {
         super();
      }
      
      private static function writeSingleUnknown(param1:WritingBuffer, param2:uint, param3:*) : void
      {
         WriteUtils.write$TYPE_UINT32(param1,param2);
         switch(param2 & 7)
         {
            case WireType.VARINT:
               WriteUtils.write$TYPE_UINT64(param1,param3);
               break;
            case WireType.FIXED_64_BIT:
               WriteUtils.write$TYPE_FIXED64(param1,param3);
               break;
            case WireType.LENGTH_DELIMITED:
               WriteUtils.write$TYPE_BYTES(param1,param3);
               break;
            case WireType.FIXED_32_BIT:
               WriteUtils.write$TYPE_FIXED32(param1,param3);
               break;
            default:
               throw new IOError("Invalid wire type: " + (param2 & 7));
         }
      }
      
      public static function writeUnknownPair(param1:WritingBuffer, param2:uint, param3:*) : void
      {
         var _loc5_:* = undefined;
         var _loc4_:Array;
         if(_loc4_ = param3 as Array)
         {
            for each(_loc5_ in _loc4_)
            {
               writeSingleUnknown(param1,param2,_loc5_);
            }
         }
         else
         {
            writeSingleUnknown(param1,param2,param3);
         }
      }
      
      private static function writeVarint64(param1:WritingBuffer, param2:uint, param3:uint) : void
      {
         var _loc4_:uint = 0;
         if(param3 == 0)
         {
            write$TYPE_UINT32(param1,param2);
         }
         else
         {
            _loc4_ = 0;
            while(_loc4_ < 4)
            {
               param1.writeByte(param2 & 127 | 128);
               param2 >>>= 7;
               _loc4_++;
            }
            if((param3 & 268435455 << 3) == 0)
            {
               param1.writeByte(param3 << 4 | param2);
            }
            else
            {
               param1.writeByte((param3 << 4 | param2) & 127 | 128);
               write$TYPE_UINT32(param1,param3 >>> 3);
            }
         }
      }
      
      public static function writeTag(param1:WritingBuffer, param2:uint, param3:uint) : void
      {
         write$TYPE_UINT32(param1,param3 << 3 | param2);
      }
      
      public static function write$TYPE_DOUBLE(param1:WritingBuffer, param2:Number) : void
      {
         param1.writeDouble(param2);
      }
      
      public static function write$TYPE_FLOAT(param1:WritingBuffer, param2:Number) : void
      {
         param1.writeFloat(param2);
      }
      
      public static function write$TYPE_INT64(param1:WritingBuffer, param2:Int64) : void
      {
         writeVarint64(param1,param2.low,param2.high);
      }
      
      public static function write$TYPE_UINT64(param1:WritingBuffer, param2:UInt64) : void
      {
         writeVarint64(param1,param2.low,param2.high);
      }
      
      public static function write$TYPE_INT32(param1:WritingBuffer, param2:int) : void
      {
         if(param2 < 0)
         {
            writeVarint64(param1,param2,4294967295);
         }
         else
         {
            write$TYPE_UINT32(param1,param2);
         }
      }
      
      public static function write$TYPE_FIXED64(param1:WritingBuffer, param2:UInt64) : void
      {
         param1.writeUnsignedInt(param2.low);
         param1.writeUnsignedInt(param2.high);
      }
      
      public static function write$TYPE_FIXED32(param1:WritingBuffer, param2:uint) : void
      {
         param1.writeUnsignedInt(param2);
      }
      
      public static function write$TYPE_BOOL(param1:WritingBuffer, param2:Boolean) : void
      {
         param1.writeByte(!!param2 ? 1 : 0);
      }
      
      public static function write$TYPE_STRING(param1:WritingBuffer, param2:String) : void
      {
         var _loc3_:uint = param1.beginBlock();
         param1.writeUTFBytes(param2);
         param1.endBlock(_loc3_);
      }
      
      public static function write$TYPE_BYTES(param1:WritingBuffer, param2:ByteArray) : void
      {
         write$TYPE_UINT32(param1,param2.length);
         param1.writeBytes(param2);
      }
      
      public static function write$TYPE_UINT32(param1:WritingBuffer, param2:uint) : void
      {
         while(param2 >= 128)
         {
            param1.writeByte(param2 & 127 | 128);
            param2 >>>= 7;
         }
         param1.writeByte(param2);
      }
      
      public static function write$TYPE_ENUM(param1:WritingBuffer, param2:int) : void
      {
         write$TYPE_INT32(param1,param2);
      }
      
      public static function write$TYPE_SFIXED32(param1:WritingBuffer, param2:int) : void
      {
         param1.writeInt(param2);
      }
      
      public static function write$TYPE_SFIXED64(param1:WritingBuffer, param2:Int64) : void
      {
         param1.writeUnsignedInt(param2.low);
         param1.writeInt(param2.high);
      }
      
      public static function write$TYPE_SINT32(param1:WritingBuffer, param2:int) : void
      {
         write$TYPE_UINT32(param1,ZigZag.encode32(param2));
      }
      
      public static function write$TYPE_SINT64(param1:WritingBuffer, param2:Int64) : void
      {
         writeVarint64(param1,ZigZag.encode64low(param2.low,param2.high),ZigZag.encode64high(param2.low,param2.high));
      }
      
      public static function write$TYPE_MESSAGE(param1:WritingBuffer, param2:Message) : void
      {
         var _loc3_:uint = param1.beginBlock();
         param2.writeToBuffer(param1);
         param1.endBlock(_loc3_);
      }
      
      public static function writePackedRepeated(param1:WritingBuffer, param2:Function, param3:Array) : void
      {
         var _loc4_:uint = param1.beginBlock();
         var _loc5_:uint = 0;
         while(_loc5_ < param3.length)
         {
            param2(param1,param3[_loc5_]);
            _loc5_++;
         }
         param1.endBlock(_loc4_);
      }
   }
}
