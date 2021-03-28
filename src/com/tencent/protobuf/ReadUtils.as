package com.tencent.protobuf
{
   import flash.errors.IOError;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public final class ReadUtils
   {
       
      
      public function ReadUtils()
      {
         super();
      }
      
      public static function skip(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:uint = 0;
         switch(param2)
         {
            case WireType.VARINT:
               while(param1.readUnsignedByte() > 128)
               {
               }
               break;
            case WireType.FIXED_64_BIT:
               param1.readInt();
               param1.readInt();
               break;
            case WireType.LENGTH_DELIMITED:
               _loc3_ = read$TYPE_UINT32(param1);
               while(_loc3_ != 0)
               {
                  param1.readByte();
                  _loc3_--;
               }
               break;
            case WireType.FIXED_32_BIT:
               param1.readInt();
               break;
            default:
               throw new IOError("Invalid wire type: " + param2);
         }
      }
      
      public static function read$TYPE_DOUBLE(param1:IDataInput) : Number
      {
         return param1.readDouble();
      }
      
      public static function read$TYPE_FLOAT(param1:IDataInput) : Number
      {
         return param1.readFloat();
      }
      
      public static function read$TYPE_INT64(param1:IDataInput) : Int64
      {
         var _loc3_:uint = 0;
         var _loc2_:Int64 = new Int64();
         var _loc4_:uint = 0;
         while(true)
         {
            _loc3_ = param1.readUnsignedByte();
            if(_loc4_ == 28)
            {
               break;
            }
            if(_loc3_ < 128)
            {
               _loc2_.low |= _loc3_ << _loc4_;
            }
            continue;
            return _loc2_;
         }
         if(_loc3_ >= 128)
         {
            _loc3_ &= 127;
            _loc2_.low |= _loc3_ << _loc4_;
            _loc2_.high = _loc3_ >>> 4;
            _loc4_ = 3;
            while(true)
            {
               _loc3_ = param1.readUnsignedByte();
               if(_loc4_ < 32)
               {
                  if(_loc3_ < 128)
                  {
                     break;
                  }
                  _loc2_.high |= (_loc3_ & 127) << _loc4_;
               }
               _loc4_ += 7;
            }
            _loc2_.high |= _loc3_ << _loc4_;
            return _loc2_;
         }
         _loc2_.low |= _loc3_ << _loc4_;
         _loc2_.high = _loc3_ >>> 4;
         return _loc2_;
      }
      
      public static function read$TYPE_UINT64(param1:IDataInput) : UInt64
      {
         var _loc3_:uint = 0;
         var _loc2_:UInt64 = new UInt64();
         var _loc4_:uint = 0;
         while(true)
         {
            _loc3_ = param1.readUnsignedByte();
            if(_loc4_ == 28)
            {
               break;
            }
            if(_loc3_ < 128)
            {
               _loc2_.low |= _loc3_ << _loc4_;
            }
            continue;
            return _loc2_;
         }
         if(_loc3_ >= 128)
         {
            _loc3_ &= 127;
            _loc2_.low |= _loc3_ << _loc4_;
            _loc2_.high = _loc3_ >>> 4;
            _loc4_ = 3;
            while(true)
            {
               _loc3_ = param1.readUnsignedByte();
               if(_loc4_ < 32)
               {
                  if(_loc3_ < 128)
                  {
                     break;
                  }
                  _loc2_.high |= (_loc3_ & 127) << _loc4_;
               }
               _loc4_ += 7;
            }
            _loc2_.high |= _loc3_ << _loc4_;
            return _loc2_;
         }
         _loc2_.low |= _loc3_ << _loc4_;
         _loc2_.high = _loc3_ >>> 4;
         return _loc2_;
      }
      
      public static function read$TYPE_INT32(param1:IDataInput) : int
      {
         return int(read$TYPE_UINT32(param1));
      }
      
      public static function read$TYPE_FIXED64(param1:IDataInput) : UInt64
      {
         var _loc2_:UInt64 = new UInt64();
         _loc2_.low = param1.readUnsignedInt();
         _loc2_.high = param1.readUnsignedInt();
         return _loc2_;
      }
      
      public static function read$TYPE_FIXED32(param1:IDataInput) : uint
      {
         return param1.readUnsignedInt();
      }
      
      public static function read$TYPE_BOOL(param1:IDataInput) : Boolean
      {
         return read$TYPE_UINT32(param1) != 0;
      }
      
      public static function read$TYPE_STRING(param1:IDataInput) : String
      {
         var _loc2_:uint = read$TYPE_UINT32(param1);
         return param1.readUTFBytes(_loc2_);
      }
      
      public static function read$TYPE_BYTES(param1:IDataInput) : ByteArray
      {
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:uint = read$TYPE_UINT32(param1);
         if(_loc3_ > 0)
         {
            param1.readBytes(_loc2_,0,_loc3_);
         }
         return _loc2_;
      }
      
      public static function read$TYPE_UINT32(param1:IDataInput) : uint
      {
         var _loc4_:uint = 0;
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         while(true)
         {
            _loc4_ = param1.readUnsignedByte();
            if(_loc3_ < 32)
            {
               if(_loc4_ < 128)
               {
                  _loc2_ |= _loc4_ << _loc3_;
               }
               continue;
               break;
            }
            while(param1.readUnsignedByte() >= 128)
            {
            }
            break;
         }
         return _loc2_;
      }
      
      public static function read$TYPE_ENUM(param1:IDataInput) : int
      {
         return read$TYPE_INT32(param1);
      }
      
      public static function read$TYPE_SFIXED32(param1:IDataInput) : int
      {
         return param1.readInt();
      }
      
      public static function read$TYPE_SFIXED64(param1:IDataInput) : Int64
      {
         var _loc2_:Int64 = new Int64();
         _loc2_.low = param1.readUnsignedInt();
         _loc2_.high = param1.readInt();
         return _loc2_;
      }
      
      public static function read$TYPE_SINT32(param1:IDataInput) : int
      {
         return ZigZag.decode32(read$TYPE_UINT32(param1));
      }
      
      public static function read$TYPE_SINT64(param1:IDataInput) : Int64
      {
         var _loc2_:Int64 = null;
         _loc2_ = read$TYPE_INT64(param1);
         var _loc3_:uint = _loc2_.low;
         var _loc4_:uint = _loc2_.high;
         _loc2_.low = ZigZag.decode64low(_loc3_,_loc4_);
         _loc2_.high = ZigZag.decode64high(_loc3_,_loc4_);
         return _loc2_;
      }
      
      public static function read$TYPE_MESSAGE(param1:IDataInput, param2:Message) : Message
      {
         var _loc3_:uint = read$TYPE_UINT32(param1);
         if(param1.bytesAvailable < _loc3_)
         {
            throw new IOError("Invalid message length: " + _loc3_);
         }
         var _loc4_:uint = param1.bytesAvailable - _loc3_;
         param2.readFromSlice(param1,_loc4_);
         if(param1.bytesAvailable != _loc4_)
         {
            throw new IOError("Invalid nested message");
         }
         return param2;
      }
      
      public static function readPackedRepeated(param1:IDataInput, param2:Function, param3:Array) : void
      {
         var _loc4_:uint = read$TYPE_UINT32(param1);
         if(param1.bytesAvailable < _loc4_)
         {
            throw new IOError("Invalid message length: " + _loc4_);
         }
         var _loc5_:uint = param1.bytesAvailable - _loc4_;
         while(param1.bytesAvailable > _loc5_)
         {
            param3.push(param2(param1));
         }
         if(param1.bytesAvailable != _loc5_)
         {
            throw new IOError("Invalid packed repeated data");
         }
      }
   }
}
