package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_HoodleReward extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_HoodleReward";
      
      public static const REWARDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_HoodleReward.rewardId","rewardId",1 << 3 | WireType.VARINT);
      
      public static const TICKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_HoodleReward.ticket","ticket",2 << 3 | WireType.VARINT);
      
      public static const ITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_HoodleReward.items","items",3 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const TAKETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_HoodleReward.takeTime","takeTime",4 << 3 | WireType.VARINT);
       
      
      private var rewardId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var ticket$field:uint;
      
      public var items:Array;
      
      private var takeTime$field:uint;
      
      public function Dto_HoodleReward()
      {
         this.items = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_HoodleReward.$MessageID;
      }
      
      public function clearRewardId() : void
      {
         this.hasField$0 &= 4294967294;
         this.rewardId$field = new uint();
      }
      
      public function get hasRewardId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set rewardId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.rewardId$field = param1;
      }
      
      public function get rewardId() : uint
      {
         return this.rewardId$field;
      }
      
      public function clearTicket() : void
      {
         this.hasField$0 &= 4294967293;
         this.ticket$field = new uint();
      }
      
      public function get hasTicket() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set ticket(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.ticket$field = param1;
      }
      
      public function get ticket() : uint
      {
         return this.ticket$field;
      }
      
      public function clearTakeTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.takeTime$field = new uint();
      }
      
      public function get hasTakeTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set takeTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.takeTime$field = param1;
      }
      
      public function get takeTime() : uint
      {
         return this.takeTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasRewardId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.rewardId$field);
         }
         if(this.hasTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.ticket$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.items.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.items[_loc2_]);
            _loc2_++;
         }
         if(this.hasTakeTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.takeTime$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Dto_HoodleReward.rewardId cannot be set twice.");
                  }
                  _loc3_++;
                  this.rewardId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_HoodleReward.ticket cannot be set twice.");
                  }
                  _loc4_++;
                  this.ticket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  this.items.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_HoodleReward.takeTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.takeTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
