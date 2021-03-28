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
   
   public final class Dto_SlotMachineReward extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_SlotMachineReward";
      
      public static const RESULTTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SlotMachineReward.resultType","resultType",1 << 3 | WireType.VARINT);
      
      public static const REWARDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SlotMachineReward.rewardid","rewardid",2 << 3 | WireType.VARINT);
      
      public static const CREDIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SlotMachineReward.credit","credit",3 << 3 | WireType.VARINT);
      
      public static const RATIO:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SlotMachineReward.ratio","ratio",4 << 3 | WireType.VARINT);
       
      
      private var resultType$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var rewardid$field:uint;
      
      private var credit$field:uint;
      
      private var ratio$field:uint;
      
      public function Dto_SlotMachineReward()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_SlotMachineReward.$MessageID;
      }
      
      public function clearResultType() : void
      {
         this.hasField$0 &= 4294967294;
         this.resultType$field = new uint();
      }
      
      public function get hasResultType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set resultType(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.resultType$field = param1;
      }
      
      public function get resultType() : uint
      {
         return this.resultType$field;
      }
      
      public function clearRewardid() : void
      {
         this.hasField$0 &= 4294967293;
         this.rewardid$field = new uint();
      }
      
      public function get hasRewardid() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set rewardid(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.rewardid$field = param1;
      }
      
      public function get rewardid() : uint
      {
         return this.rewardid$field;
      }
      
      public function clearCredit() : void
      {
         this.hasField$0 &= 4294967291;
         this.credit$field = new uint();
      }
      
      public function get hasCredit() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set credit(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.credit$field = param1;
      }
      
      public function get credit() : uint
      {
         return this.credit$field;
      }
      
      public function clearRatio() : void
      {
         this.hasField$0 &= 4294967287;
         this.ratio$field = new uint();
      }
      
      public function get hasRatio() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set ratio(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.ratio$field = param1;
      }
      
      public function get ratio() : uint
      {
         return this.ratio$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasResultType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.resultType$field);
         }
         if(this.hasRewardid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.rewardid$field);
         }
         if(this.hasCredit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.credit$field);
         }
         if(this.hasRatio)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.ratio$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc7_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SlotMachineReward.resultType cannot be set twice.");
                  }
                  _loc3_++;
                  this.resultType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SlotMachineReward.rewardid cannot be set twice.");
                  }
                  _loc4_++;
                  this.rewardid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SlotMachineReward.credit cannot be set twice.");
                  }
                  _loc5_++;
                  this.credit = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SlotMachineReward.ratio cannot be set twice.");
                  }
                  _loc6_++;
                  this.ratio = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
