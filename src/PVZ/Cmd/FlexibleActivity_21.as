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
   
   public final class FlexibleActivity_21 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_21";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_21.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const REWARDPOOL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_21.rewardPool","rewardPool",2 << 3 | WireType.VARINT);
      
      public static const QUESTNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_21.questNum","questNum",3 << 3 | WireType.VARINT);
      
      public static const REWARDWEIGHT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_21.rewardWeight","rewardWeight",4 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const FRESHTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_21.freshTime","freshTime",10 << 3 | WireType.VARINT);
      
      public static const REWARDNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_21.rewardNum","rewardNum",11 << 3 | WireType.VARINT);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var rewardPool$field:uint;
      
      private var questNum$field:uint;
      
      public var rewardWeight:Array;
      
      private var freshTime$field:uint;
      
      private var rewardNum$field:uint;
      
      public function FlexibleActivity_21()
      {
         this.rewardWeight = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_21.$MessageID;
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
      
      public function clearRewardPool() : void
      {
         this.hasField$0 &= 4294967293;
         this.rewardPool$field = new uint();
      }
      
      public function get hasRewardPool() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set rewardPool(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.rewardPool$field = param1;
      }
      
      public function get rewardPool() : uint
      {
         return this.rewardPool$field;
      }
      
      public function clearQuestNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.questNum$field = new uint();
      }
      
      public function get hasQuestNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set questNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.questNum$field = param1;
      }
      
      public function get questNum() : uint
      {
         return this.questNum$field;
      }
      
      public function clearFreshTime() : void
      {
         this.hasField$0 &= 4294967287;
         this.freshTime$field = new uint();
      }
      
      public function get hasFreshTime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set freshTime(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.freshTime$field = param1;
      }
      
      public function get freshTime() : uint
      {
         return this.freshTime$field;
      }
      
      public function clearRewardNum() : void
      {
         this.hasField$0 &= 4294967279;
         this.rewardNum$field = new uint();
      }
      
      public function get hasRewardNum() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set rewardNum(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.rewardNum$field = param1;
      }
      
      public function get rewardNum() : uint
      {
         return this.rewardNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         if(this.hasRewardPool)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.rewardPool$field);
         }
         if(this.hasQuestNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.questNum$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.rewardWeight.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewardWeight[_loc2_]);
            _loc2_++;
         }
         if(this.hasFreshTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.freshTime$field);
         }
         if(this.hasRewardNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.rewardNum$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: FlexibleActivity_21.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_21.rewardPool cannot be set twice.");
                  }
                  _loc4_++;
                  this.rewardPool = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_21.questNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.questNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  this.rewardWeight.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 10:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_21.freshTime cannot be set twice.");
                  }
                  _loc6_++;
                  this.freshTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_21.rewardNum cannot be set twice.");
                  }
                  _loc7_++;
                  this.rewardNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
