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
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class FlexibleActivity_1002 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_1002";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1002.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const CONDITIONREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_1002.conditionReward","conditionReward",2 << 3 | WireType.LENGTH_DELIMITED,Dto_FlexibleActivityCondtionReward);
      
      public static const CYCLE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.FlexibleActivity_1002.cycle","cycle",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const SUBTYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.FlexibleActivity_1002.subType","subType",4 << 3 | WireType.VARINT,E_1002_SubType);
      
      public static const VALIDDAY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1002.validDay","validDay",8 << 3 | WireType.VARINT);
      
      public static const ACCOMPLISHED:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1002.accomplished","accomplished",5 << 3 | WireType.VARINT);
      
      public static const REWARDTAKEN:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1002.rewardTaken","rewardTaken",6 << 3 | WireType.VARINT);
      
      public static const LASTREFRESHTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1002.lastRefreshTime","lastRefreshTime",7 << 3 | WireType.VARINT);
      
      public static const LASTLOGINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1002.lastLoginTime","lastLoginTime",9 << 3 | WireType.VARINT);
      
      public static const GETACTIVITYTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1002.getActivityTime","getActivityTime",10 << 3 | WireType.VARINT);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var conditionReward:Array;
      
      private var cycle$field:String;
      
      private var subType$field:int;
      
      private var validDay$field:uint;
      
      private var accomplished$field:uint;
      
      public var rewardTaken:Array;
      
      private var lastRefreshTime$field:uint;
      
      private var lastLoginTime$field:uint;
      
      private var getActivityTime$field:uint;
      
      public function FlexibleActivity_1002()
      {
         this.conditionReward = [];
         this.rewardTaken = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_1002.$MessageID;
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
      
      public function clearCycle() : void
      {
         this.cycle$field = null;
      }
      
      public function get hasCycle() : Boolean
      {
         return this.cycle$field != null;
      }
      
      public function set cycle(param1:String) : void
      {
         this.cycle$field = param1;
      }
      
      public function get cycle() : String
      {
         return this.cycle$field;
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
      
      public function clearValidDay() : void
      {
         this.hasField$0 &= 4294967291;
         this.validDay$field = new uint();
      }
      
      public function get hasValidDay() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set validDay(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.validDay$field = param1;
      }
      
      public function get validDay() : uint
      {
         return this.validDay$field;
      }
      
      public function clearAccomplished() : void
      {
         this.hasField$0 &= 4294967287;
         this.accomplished$field = new uint();
      }
      
      public function get hasAccomplished() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set accomplished(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.accomplished$field = param1;
      }
      
      public function get accomplished() : uint
      {
         return this.accomplished$field;
      }
      
      public function clearLastRefreshTime() : void
      {
         this.hasField$0 &= 4294967279;
         this.lastRefreshTime$field = new uint();
      }
      
      public function get hasLastRefreshTime() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set lastRefreshTime(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.lastRefreshTime$field = param1;
      }
      
      public function get lastRefreshTime() : uint
      {
         return this.lastRefreshTime$field;
      }
      
      public function clearLastLoginTime() : void
      {
         this.hasField$0 &= 4294967263;
         this.lastLoginTime$field = new uint();
      }
      
      public function get hasLastLoginTime() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set lastLoginTime(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.lastLoginTime$field = param1;
      }
      
      public function get lastLoginTime() : uint
      {
         return this.lastLoginTime$field;
      }
      
      public function clearGetActivityTime() : void
      {
         this.hasField$0 &= 4294967231;
         this.getActivityTime$field = new uint();
      }
      
      public function get hasGetActivityTime() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set getActivityTime(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.getActivityTime$field = param1;
      }
      
      public function get getActivityTime() : uint
      {
         return this.getActivityTime$field;
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
         while(_loc2_ < this.conditionReward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.conditionReward[_loc2_]);
            _loc2_++;
         }
         if(this.hasCycle)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.cycle$field);
         }
         if(this.hasSubType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_ENUM(param1,this.subType$field);
         }
         if(this.hasValidDay)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.validDay$field);
         }
         if(this.hasAccomplished)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.accomplished$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.rewardTaken.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.rewardTaken[_loc3_]);
            _loc3_++;
         }
         if(this.hasLastRefreshTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.lastRefreshTime$field);
         }
         if(this.hasLastLoginTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.lastLoginTime$field);
         }
         if(this.hasGetActivityTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.getActivityTime$field);
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc11_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc11_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc11_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1002.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.conditionReward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FlexibleActivityCondtionReward()));
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1002.cycle cannot be set twice.");
                  }
                  _loc4_++;
                  this.cycle = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1002.subType cannot be set twice.");
                  }
                  _loc5_++;
                  this.subType = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 8:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1002.validDay cannot be set twice.");
                  }
                  _loc6_++;
                  this.validDay = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1002.accomplished cannot be set twice.");
                  }
                  _loc7_++;
                  this.accomplished = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if((_loc11_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.rewardTaken);
                  }
                  else
                  {
                     this.rewardTaken.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1002.lastRefreshTime cannot be set twice.");
                  }
                  _loc8_++;
                  this.lastRefreshTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1002.lastLoginTime cannot be set twice.");
                  }
                  _loc9_++;
                  this.lastLoginTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1002.getActivityTime cannot be set twice.");
                  }
                  _loc10_++;
                  this.getActivityTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc11_);
                  break;
            }
         }
      }
   }
}
