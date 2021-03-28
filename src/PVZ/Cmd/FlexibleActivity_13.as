package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class FlexibleActivity_13 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_13";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_13.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const SUBTYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.FlexibleActivity_13.subType","subType",2 << 3 | WireType.VARINT,E_13_SubType);
      
      public static const CONDITIONREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_13.conditionReward","conditionReward",3 << 3 | WireType.LENGTH_DELIMITED,Dto_FlexibleActivityCondtionReward);
      
      public static const TAKEREWARDTIME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.FlexibleActivity_13.takeRewardTime","takeRewardTime",4 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const FLEXIBLEVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_13.flexibleValue","flexibleValue",5 << 3 | WireType.VARINT);
      
      public static const LASTTAKETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_13.lastTakeTime","lastTakeTime",6 << 3 | WireType.VARINT);
      
      public static const LASTREWARDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_13.lastRewardId","lastRewardId",7 << 3 | WireType.VARINT);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var subType$field:int;
      
      public var conditionReward:Array;
      
      private var takeRewardTime$field:String;
      
      private var flexibleValue$field:uint;
      
      private var lastTakeTime$field:uint;
      
      private var lastRewardId$field:uint;
      
      public function FlexibleActivity_13()
      {
         this.conditionReward = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_13.$MessageID;
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
      
      public function clearSubType() : void
      {
         this.hasField$0 &= 4294967293;
         this.subType$field = new int();
      }
      
      public function get hasSubType() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set subType(param1:int) : void
      {
         this.hasField$0 |= 2;
         this.subType$field = param1;
      }
      
      public function get subType() : int
      {
         return this.subType$field;
      }
      
      public function clearTakeRewardTime() : void
      {
         this.takeRewardTime$field = null;
      }
      
      public function get hasTakeRewardTime() : Boolean
      {
         return this.takeRewardTime$field != null;
      }
      
      public function set takeRewardTime(param1:String) : void
      {
         this.takeRewardTime$field = param1;
      }
      
      public function get takeRewardTime() : String
      {
         return this.takeRewardTime$field;
      }
      
      public function clearFlexibleValue() : void
      {
         this.hasField$0 &= 4294967291;
         this.flexibleValue$field = new uint();
      }
      
      public function get hasFlexibleValue() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set flexibleValue(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.flexibleValue$field = param1;
      }
      
      public function get flexibleValue() : uint
      {
         return this.flexibleValue$field;
      }
      
      public function clearLastTakeTime() : void
      {
         this.hasField$0 &= 4294967287;
         this.lastTakeTime$field = new uint();
      }
      
      public function get hasLastTakeTime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set lastTakeTime(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.lastTakeTime$field = param1;
      }
      
      public function get lastTakeTime() : uint
      {
         return this.lastTakeTime$field;
      }
      
      public function clearLastRewardId() : void
      {
         this.hasField$0 &= 4294967279;
         this.lastRewardId$field = new uint();
      }
      
      public function get hasLastRewardId() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set lastRewardId(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.lastRewardId$field = param1;
      }
      
      public function get lastRewardId() : uint
      {
         return this.lastRewardId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         if(this.hasSubType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_ENUM(param1,this.subType$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.conditionReward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.conditionReward[_loc2_]);
            _loc2_++;
         }
         if(this.hasTakeRewardTime)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_STRING(param1,this.takeRewardTime$field);
         }
         if(this.hasFlexibleValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.flexibleValue$field);
         }
         if(this.hasLastTakeTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.lastTakeTime$field);
         }
         if(this.hasLastRewardId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.lastRewardId$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: FlexibleActivity_13.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_13.subType cannot be set twice.");
                  }
                  _loc4_++;
                  this.subType = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 3:
                  this.conditionReward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FlexibleActivityCondtionReward()));
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_13.takeRewardTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.takeRewardTime = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_13.flexibleValue cannot be set twice.");
                  }
                  _loc6_++;
                  this.flexibleValue = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_13.lastTakeTime cannot be set twice.");
                  }
                  _loc7_++;
                  this.lastTakeTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_13.lastRewardId cannot be set twice.");
                  }
                  _loc8_++;
                  this.lastRewardId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
