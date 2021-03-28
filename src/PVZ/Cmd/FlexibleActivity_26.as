package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class FlexibleActivity_26 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_26";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_26.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const GROUP:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_26.group","group",2 << 3 | WireType.LENGTH_DELIMITED,Dto_RewardGroup);
      
      public static const BREAKCOST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_26.breakCost","breakCost",3 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const RESETCOST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_26.resetCost","resetCost",4 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const FREERESETCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_26.freeResetCount","freeResetCount",5 << 3 | WireType.VARINT);
      
      public static const JOINREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_26.joinReward","joinReward",6 << 3 | WireType.LENGTH_DELIMITED,Dto_JoinReward);
      
      public static const DAILYREWARD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_26.dailyReward","dailyReward",7 << 3 | WireType.LENGTH_DELIMITED,Dto_DailyReward);
      
      public static const TIMESTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_26.timestamp","timestamp",101 << 3 | WireType.VARINT);
      
      public static const RESETCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_26.resetCount","resetCount",102 << 3 | WireType.VARINT);
      
      public static const BREAKCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_26.breakCount","breakCount",103 << 3 | WireType.VARINT);
      
      public static const SELECTREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_26.selectReward","selectReward",104 << 3 | WireType.LENGTH_DELIMITED,Dto_SelectReward);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var group:Array;
      
      public var breakCost:Array;
      
      public var resetCost:Array;
      
      private var freeResetCount$field:uint;
      
      public var joinReward:Array;
      
      private var dailyReward$field:Dto_DailyReward;
      
      private var timestamp$field:uint;
      
      private var resetCount$field:uint;
      
      private var breakCount$field:uint;
      
      public var selectReward:Array;
      
      public function FlexibleActivity_26()
      {
         this.group = [];
         this.breakCost = [];
         this.resetCost = [];
         this.joinReward = [];
         this.selectReward = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_26.$MessageID;
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
      
      public function clearFreeResetCount() : void
      {
         this.hasField$0 &= 4294967293;
         this.freeResetCount$field = new uint();
      }
      
      public function get hasFreeResetCount() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set freeResetCount(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.freeResetCount$field = param1;
      }
      
      public function get freeResetCount() : uint
      {
         return this.freeResetCount$field;
      }
      
      public function clearDailyReward() : void
      {
         this.dailyReward$field = null;
      }
      
      public function get hasDailyReward() : Boolean
      {
         return this.dailyReward$field != null;
      }
      
      public function set dailyReward(param1:Dto_DailyReward) : void
      {
         this.dailyReward$field = param1;
      }
      
      public function get dailyReward() : Dto_DailyReward
      {
         return this.dailyReward$field;
      }
      
      public function clearTimestamp() : void
      {
         this.hasField$0 &= 4294967291;
         this.timestamp$field = new uint();
      }
      
      public function get hasTimestamp() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set timestamp(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.timestamp$field = param1;
      }
      
      public function get timestamp() : uint
      {
         return this.timestamp$field;
      }
      
      public function clearResetCount() : void
      {
         this.hasField$0 &= 4294967287;
         this.resetCount$field = new uint();
      }
      
      public function get hasResetCount() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set resetCount(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.resetCount$field = param1;
      }
      
      public function get resetCount() : uint
      {
         return this.resetCount$field;
      }
      
      public function clearBreakCount() : void
      {
         this.hasField$0 &= 4294967279;
         this.breakCount$field = new uint();
      }
      
      public function get hasBreakCount() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set breakCount(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.breakCount$field = param1;
      }
      
      public function get breakCount() : uint
      {
         return this.breakCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc7_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.group.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.group[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.breakCost.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.breakCost[_loc3_]);
            _loc3_++;
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.resetCost.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.resetCost[_loc4_]);
            _loc4_++;
         }
         if(this.hasFreeResetCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.freeResetCount$field);
         }
         var _loc5_:uint = 0;
         while(_loc5_ < this.joinReward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.joinReward[_loc5_]);
            _loc5_++;
         }
         if(this.hasDailyReward)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.dailyReward$field);
         }
         if(this.hasTimestamp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,101);
            WriteUtils.write$TYPE_UINT32(param1,this.timestamp$field);
         }
         if(this.hasResetCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,102);
            WriteUtils.write$TYPE_UINT32(param1,this.resetCount$field);
         }
         if(this.hasBreakCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,103);
            WriteUtils.write$TYPE_UINT32(param1,this.breakCount$field);
         }
         var _loc6_:uint = 0;
         while(_loc6_ < this.selectReward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,104);
            WriteUtils.write$TYPE_MESSAGE(param1,this.selectReward[_loc6_]);
            _loc6_++;
         }
         for(_loc7_ in this)
         {
            super.writeUnknown(param1,_loc7_);
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
                     throw new IOError("Bad data format: FlexibleActivity_26.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.group.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_RewardGroup()));
                  break;
               case 3:
                  this.breakCost.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 4:
                  this.resetCost.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 5:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_26.freeResetCount cannot be set twice.");
                  }
                  _loc4_++;
                  this.freeResetCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  this.joinReward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_JoinReward()));
                  break;
               case 7:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_26.dailyReward cannot be set twice.");
                  }
                  _loc5_++;
                  this.dailyReward = new Dto_DailyReward();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.dailyReward);
                  break;
               case 101:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_26.timestamp cannot be set twice.");
                  }
                  _loc6_++;
                  this.timestamp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 102:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_26.resetCount cannot be set twice.");
                  }
                  _loc7_++;
                  this.resetCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 103:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_26.breakCount cannot be set twice.");
                  }
                  _loc8_++;
                  this.breakCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 104:
                  this.selectReward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_SelectReward()));
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
