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
   
   public final class Dto_CaptureTempleType extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_CaptureTempleType";
      
      public static const TEMPLETYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CaptureTempleType.templeType","templeType",1 << 3 | WireType.VARINT);
      
      public static const CAPTURETEMPLENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CaptureTempleType.captureTempleNum","captureTempleNum",2 << 3 | WireType.VARINT);
      
      public static const REWARDMAXSTACKNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CaptureTempleType.rewardMaxStackNum","rewardMaxStackNum",3 << 3 | WireType.VARINT);
       
      
      private var templeType$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var captureTempleNum$field:uint;
      
      private var rewardMaxStackNum$field:uint;
      
      public function Dto_CaptureTempleType()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_CaptureTempleType.$MessageID;
      }
      
      public function clearTempleType() : void
      {
         this.hasField$0 &= 4294967294;
         this.templeType$field = new uint();
      }
      
      public function get hasTempleType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set templeType(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.templeType$field = param1;
      }
      
      public function get templeType() : uint
      {
         return this.templeType$field;
      }
      
      public function clearCaptureTempleNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.captureTempleNum$field = new uint();
      }
      
      public function get hasCaptureTempleNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set captureTempleNum(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.captureTempleNum$field = param1;
      }
      
      public function get captureTempleNum() : uint
      {
         return this.captureTempleNum$field;
      }
      
      public function clearRewardMaxStackNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.rewardMaxStackNum$field = new uint();
      }
      
      public function get hasRewardMaxStackNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set rewardMaxStackNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.rewardMaxStackNum$field = param1;
      }
      
      public function get rewardMaxStackNum() : uint
      {
         return this.rewardMaxStackNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasTempleType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.templeType$field);
         }
         if(this.hasCaptureTempleNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.captureTempleNum$field);
         }
         if(this.hasRewardMaxStackNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.rewardMaxStackNum$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CaptureTempleType.templeType cannot be set twice.");
                  }
                  _loc3_++;
                  this.templeType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CaptureTempleType.captureTempleNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.captureTempleNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CaptureTempleType.rewardMaxStackNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.rewardMaxStackNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
