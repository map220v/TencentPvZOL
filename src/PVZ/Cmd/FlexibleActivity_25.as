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
   
   public final class FlexibleActivity_25 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_25";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_25.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const PAYREWARDITEM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_25.payRewardItem","payRewardItem",2 << 3 | WireType.LENGTH_DELIMITED,Dto_PayRewardItem);
      
      public static const FREERANDOMTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_25.freeRandomTimes","freeRandomTimes",3 << 3 | WireType.VARINT);
      
      public static const PAYRANDOMTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_25.payRandomTimes","payRandomTimes",4 << 3 | WireType.VARINT);
      
      public static const PAYRANDOMCOST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_25.payRandomCost","payRandomCost",5 << 3 | WireType.VARINT);
      
      public static const TIMESTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_25.timestamp","timestamp",101 << 3 | WireType.VARINT);
      
      public static const REWARDITEM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_25.rewardItem","rewardItem",102 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var payRewardItem:Array;
      
      private var freeRandomTimes$field:uint;
      
      private var payRandomTimes$field:uint;
      
      private var payRandomCost$field:uint;
      
      private var timestamp$field:uint;
      
      public var rewardItem:Array;
      
      public function FlexibleActivity_25()
      {
         this.payRewardItem = [];
         this.rewardItem = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_25.$MessageID;
      }
      
      public function clearActivityId() : void
      {
         this.hasField$0 &= 4294967294;
         this.activityId$field = new uint();
      }
      
      public function get hasActivityId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set activityId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.activityId$field = param1;
      }
      
      public function get activityId() : uint
      {
         return this.activityId$field;
      }
      
      public function clearFreeRandomTimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.freeRandomTimes$field = new uint();
      }
      
      public function get hasFreeRandomTimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set freeRandomTimes(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.freeRandomTimes$field = param1;
      }
      
      public function get freeRandomTimes() : uint
      {
         return this.freeRandomTimes$field;
      }
      
      public function clearPayRandomTimes() : void
      {
         this.hasField$0 &= 4294967291;
         this.payRandomTimes$field = new uint();
      }
      
      public function get hasPayRandomTimes() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set payRandomTimes(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.payRandomTimes$field = param1;
      }
      
      public function get payRandomTimes() : uint
      {
         return this.payRandomTimes$field;
      }
      
      public function clearPayRandomCost() : void
      {
         this.hasField$0 &= 4294967287;
         this.payRandomCost$field = new uint();
      }
      
      public function get hasPayRandomCost() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set payRandomCost(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.payRandomCost$field = param1;
      }
      
      public function get payRandomCost() : uint
      {
         return this.payRandomCost$field;
      }
      
      public function clearTimestamp() : void
      {
         this.hasField$0 &= 4294967279;
         this.timestamp$field = new uint();
      }
      
      public function get hasTimestamp() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set timestamp(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.timestamp$field = param1;
      }
      
      public function get timestamp() : uint
      {
         return this.timestamp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.payRewardItem.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.payRewardItem[_loc2_]);
            _loc2_++;
         }
         if(this.hasFreeRandomTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.freeRandomTimes$field);
         }
         if(this.hasPayRandomTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.payRandomTimes$field);
         }
         if(this.hasPayRandomCost)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.payRandomCost$field);
         }
         if(this.hasTimestamp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,101);
            WriteUtils.write$TYPE_UINT32(param1,this.timestamp$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.rewardItem.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,102);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewardItem[_loc3_]);
            _loc3_++;
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
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
                     throw new IOError("Bad data format: FlexibleActivity_25.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.payRewardItem.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_PayRewardItem()));
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_25.freeRandomTimes cannot be set twice.");
                  }
                  _loc4_++;
                  this.freeRandomTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_25.payRandomTimes cannot be set twice.");
                  }
                  _loc5_++;
                  this.payRandomTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_25.payRandomCost cannot be set twice.");
                  }
                  _loc6_++;
                  this.payRandomCost = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 101:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_25.timestamp cannot be set twice.");
                  }
                  _loc7_++;
                  this.timestamp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 102:
                  this.rewardItem.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
