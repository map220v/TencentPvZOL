package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_SignIn_Info extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_SignIn_Info";
      
      public static const TOTALSIGNNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SignIn_Info.totalSignNum","totalSignNum",1 << 3 | WireType.VARINT);
      
      public static const REMAINSIGNNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SignIn_Info.remainSignNum","remainSignNum",2 << 3 | WireType.VARINT);
      
      public static const USEDFREETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SignIn_Info.usedfreeTimes","usedfreeTimes",3 << 3 | WireType.VARINT);
      
      public static const USEDVIPFREETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SignIn_Info.usedVipFreeTimes","usedVipFreeTimes",4 << 3 | WireType.VARINT);
      
      public static const BISSIGNED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_SignIn_Info.bIsSigned","bIsSigned",5 << 3 | WireType.VARINT);
       
      
      private var totalSignNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var remainSignNum$field:uint;
      
      private var usedfreeTimes$field:uint;
      
      private var usedVipFreeTimes$field:uint;
      
      private var bIsSigned$field:Boolean;
      
      public function Dto_SignIn_Info()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_SignIn_Info.$MessageID;
      }
      
      public function clearTotalSignNum() : void
      {
         this.hasField$0 &= 4294967294;
         this.totalSignNum$field = new uint();
      }
      
      public function get hasTotalSignNum() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set totalSignNum(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.totalSignNum$field = param1;
      }
      
      public function get totalSignNum() : uint
      {
         return this.totalSignNum$field;
      }
      
      public function clearRemainSignNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.remainSignNum$field = new uint();
      }
      
      public function get hasRemainSignNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set remainSignNum(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.remainSignNum$field = param1;
      }
      
      public function get remainSignNum() : uint
      {
         return this.remainSignNum$field;
      }
      
      public function clearUsedfreeTimes() : void
      {
         this.hasField$0 &= 4294967291;
         this.usedfreeTimes$field = new uint();
      }
      
      public function get hasUsedfreeTimes() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set usedfreeTimes(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.usedfreeTimes$field = param1;
      }
      
      public function get usedfreeTimes() : uint
      {
         return this.usedfreeTimes$field;
      }
      
      public function clearUsedVipFreeTimes() : void
      {
         this.hasField$0 &= 4294967287;
         this.usedVipFreeTimes$field = new uint();
      }
      
      public function get hasUsedVipFreeTimes() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set usedVipFreeTimes(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.usedVipFreeTimes$field = param1;
      }
      
      public function get usedVipFreeTimes() : uint
      {
         return this.usedVipFreeTimes$field;
      }
      
      public function clearBIsSigned() : void
      {
         this.hasField$0 &= 4294967279;
         this.bIsSigned$field = new Boolean();
      }
      
      public function get hasBIsSigned() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set bIsSigned(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.bIsSigned$field = param1;
      }
      
      public function get bIsSigned() : Boolean
      {
         return this.bIsSigned$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasTotalSignNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.totalSignNum$field);
         }
         if(this.hasRemainSignNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.remainSignNum$field);
         }
         if(this.hasUsedfreeTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.usedfreeTimes$field);
         }
         if(this.hasUsedVipFreeTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.usedVipFreeTimes$field);
         }
         if(this.hasBIsSigned)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_BOOL(param1,this.bIsSigned$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SignIn_Info.totalSignNum cannot be set twice.");
                  }
                  _loc3_++;
                  this.totalSignNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SignIn_Info.remainSignNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.remainSignNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SignIn_Info.usedfreeTimes cannot be set twice.");
                  }
                  _loc5_++;
                  this.usedfreeTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SignIn_Info.usedVipFreeTimes cannot be set twice.");
                  }
                  _loc6_++;
                  this.usedVipFreeTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SignIn_Info.bIsSigned cannot be set twice.");
                  }
                  _loc7_++;
                  this.bIsSigned = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
