package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Uint32Compare extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Uint32Compare";
      
      public static const EQ:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Uint32Compare.eq","eq",1 << 3 | WireType.VARINT);
      
      public static const NE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Uint32Compare.ne","ne",2 << 3 | WireType.VARINT);
      
      public static const LT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Uint32Compare.lt","lt",3 << 3 | WireType.VARINT);
      
      public static const LE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Uint32Compare.le","le",4 << 3 | WireType.VARINT);
      
      public static const GT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Uint32Compare.gt","gt",5 << 3 | WireType.VARINT);
      
      public static const GE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Uint32Compare.ge","ge",6 << 3 | WireType.VARINT);
       
      
      private var eq$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var ne$field:uint;
      
      private var lt$field:uint;
      
      private var le$field:uint;
      
      private var gt$field:uint;
      
      private var ge$field:uint;
      
      public function Dto_Uint32Compare()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Uint32Compare.$MessageID;
      }
      
      public function clearEq() : void
      {
         this.hasField$0 &= 4294967294;
         this.eq$field = new uint();
      }
      
      public function get hasEq() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set eq(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.eq$field = param1;
      }
      
      public function get eq() : uint
      {
         return this.eq$field;
      }
      
      public function clearNe() : void
      {
         this.hasField$0 &= 4294967293;
         this.ne$field = new uint();
      }
      
      public function get hasNe() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set ne(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.ne$field = param1;
      }
      
      public function get ne() : uint
      {
         return this.ne$field;
      }
      
      public function clearLt() : void
      {
         this.hasField$0 &= 4294967291;
         this.lt$field = new uint();
      }
      
      public function get hasLt() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set lt(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.lt$field = param1;
      }
      
      public function get lt() : uint
      {
         return this.lt$field;
      }
      
      public function clearLe() : void
      {
         this.hasField$0 &= 4294967287;
         this.le$field = new uint();
      }
      
      public function get hasLe() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set le(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.le$field = param1;
      }
      
      public function get le() : uint
      {
         return this.le$field;
      }
      
      public function clearGt() : void
      {
         this.hasField$0 &= 4294967279;
         this.gt$field = new uint();
      }
      
      public function get hasGt() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set gt(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.gt$field = param1;
      }
      
      public function get gt() : uint
      {
         return this.gt$field;
      }
      
      public function clearGe() : void
      {
         this.hasField$0 &= 4294967263;
         this.ge$field = new uint();
      }
      
      public function get hasGe() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set ge(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.ge$field = param1;
      }
      
      public function get ge() : uint
      {
         return this.ge$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasEq)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.eq$field);
         }
         if(this.hasNe)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.ne$field);
         }
         if(this.hasLt)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.lt$field);
         }
         if(this.hasLe)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.le$field);
         }
         if(this.hasGt)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.gt$field);
         }
         if(this.hasGe)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.ge$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc9_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc9_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Uint32Compare.eq cannot be set twice.");
                  }
                  _loc3_++;
                  this.eq = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Uint32Compare.ne cannot be set twice.");
                  }
                  _loc4_++;
                  this.ne = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Uint32Compare.lt cannot be set twice.");
                  }
                  _loc5_++;
                  this.lt = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Uint32Compare.le cannot be set twice.");
                  }
                  _loc6_++;
                  this.le = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Uint32Compare.gt cannot be set twice.");
                  }
                  _loc7_++;
                  this.gt = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Uint32Compare.ge cannot be set twice.");
                  }
                  _loc8_++;
                  this.ge = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
