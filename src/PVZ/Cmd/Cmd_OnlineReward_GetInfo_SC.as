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
   
   public final class Cmd_OnlineReward_GetInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_OnlineReward_GetInfo_SC";
      
      public static const DAILYONLINETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_OnlineReward_GetInfo_SC.dailyOnlineTime","dailyOnlineTime",1 << 3 | WireType.VARINT);
      
      public static const WEEKLYONLINETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_OnlineReward_GetInfo_SC.weeklyOnlineTime","weeklyOnlineTime",2 << 3 | WireType.VARINT);
      
      public static const LASTLOGINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_OnlineReward_GetInfo_SC.lastLoginTime","lastLoginTime",3 << 3 | WireType.VARINT);
      
      public static const LASTDAILYREWARDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_OnlineReward_GetInfo_SC.lastDailyRewardTime","lastDailyRewardTime",4 << 3 | WireType.VARINT);
      
      public static const NEXTDAILYREWARDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_OnlineReward_GetInfo_SC.nextDailyRewardID","nextDailyRewardID",5 << 3 | WireType.VARINT);
      
      public static const LASTWEEKREWARDLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_OnlineReward_GetInfo_SC.lastWeekRewardList","lastWeekRewardList",6 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const LASTWEEKREWARDSTAT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_OnlineReward_GetInfo_SC.lastWeekRewardStat","lastWeekRewardStat",7 << 3 | WireType.VARINT);
      
      public static const DAILYREWARDLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_OnlineReward_GetInfo_SC.dailyRewardList","dailyRewardList",8 << 3 | WireType.LENGTH_DELIMITED,Dto_OnlineReward);
       
      
      private var dailyOnlineTime$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var weeklyOnlineTime$field:uint;
      
      private var lastLoginTime$field:uint;
      
      private var lastDailyRewardTime$field:uint;
      
      private var nextDailyRewardID$field:uint;
      
      public var lastWeekRewardList:Array;
      
      private var lastWeekRewardStat$field:uint;
      
      public var dailyRewardList:Array;
      
      public function Cmd_OnlineReward_GetInfo_SC()
      {
         this.lastWeekRewardList = [];
         this.dailyRewardList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_OnlineReward_GetInfo_SC.$MessageID;
      }
      
      public function clearDailyOnlineTime() : void
      {
         this.hasField$0 &= 4294967294;
         this.dailyOnlineTime$field = new uint();
      }
      
      public function get hasDailyOnlineTime() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set dailyOnlineTime(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.dailyOnlineTime$field = param1;
      }
      
      public function get dailyOnlineTime() : uint
      {
         return this.dailyOnlineTime$field;
      }
      
      public function clearWeeklyOnlineTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.weeklyOnlineTime$field = new uint();
      }
      
      public function get hasWeeklyOnlineTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set weeklyOnlineTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.weeklyOnlineTime$field = param1;
      }
      
      public function get weeklyOnlineTime() : uint
      {
         return this.weeklyOnlineTime$field;
      }
      
      public function clearLastLoginTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.lastLoginTime$field = new uint();
      }
      
      public function get hasLastLoginTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set lastLoginTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.lastLoginTime$field = param1;
      }
      
      public function get lastLoginTime() : uint
      {
         return this.lastLoginTime$field;
      }
      
      public function clearLastDailyRewardTime() : void
      {
         this.hasField$0 &= 4294967287;
         this.lastDailyRewardTime$field = new uint();
      }
      
      public function get hasLastDailyRewardTime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set lastDailyRewardTime(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.lastDailyRewardTime$field = param1;
      }
      
      public function get lastDailyRewardTime() : uint
      {
         return this.lastDailyRewardTime$field;
      }
      
      public function clearNextDailyRewardID() : void
      {
         this.hasField$0 &= 4294967279;
         this.nextDailyRewardID$field = new uint();
      }
      
      public function get hasNextDailyRewardID() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set nextDailyRewardID(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.nextDailyRewardID$field = param1;
      }
      
      public function get nextDailyRewardID() : uint
      {
         return this.nextDailyRewardID$field;
      }
      
      public function clearLastWeekRewardStat() : void
      {
         this.hasField$0 &= 4294967263;
         this.lastWeekRewardStat$field = new uint();
      }
      
      public function get hasLastWeekRewardStat() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set lastWeekRewardStat(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.lastWeekRewardStat$field = param1;
      }
      
      public function get lastWeekRewardStat() : uint
      {
         return this.lastWeekRewardStat$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasDailyOnlineTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.dailyOnlineTime$field);
         }
         if(this.hasWeeklyOnlineTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.weeklyOnlineTime$field);
         }
         if(this.hasLastLoginTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.lastLoginTime$field);
         }
         if(this.hasLastDailyRewardTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.lastDailyRewardTime$field);
         }
         if(this.hasNextDailyRewardID)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.nextDailyRewardID$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.lastWeekRewardList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.lastWeekRewardList[_loc2_]);
            _loc2_++;
         }
         if(this.hasLastWeekRewardStat)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.lastWeekRewardStat$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.dailyRewardList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.dailyRewardList[_loc3_]);
            _loc3_++;
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
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
                     throw new IOError("Bad data format: Cmd_OnlineReward_GetInfo_SC.dailyOnlineTime cannot be set twice.");
                  }
                  _loc3_++;
                  this.dailyOnlineTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_OnlineReward_GetInfo_SC.weeklyOnlineTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.weeklyOnlineTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_OnlineReward_GetInfo_SC.lastLoginTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.lastLoginTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_OnlineReward_GetInfo_SC.lastDailyRewardTime cannot be set twice.");
                  }
                  _loc6_++;
                  this.lastDailyRewardTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_OnlineReward_GetInfo_SC.nextDailyRewardID cannot be set twice.");
                  }
                  _loc7_++;
                  this.nextDailyRewardID = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  this.lastWeekRewardList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_OnlineReward_GetInfo_SC.lastWeekRewardStat cannot be set twice.");
                  }
                  _loc8_++;
                  this.lastWeekRewardStat = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  this.dailyRewardList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_OnlineReward()));
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
