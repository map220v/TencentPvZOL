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
   
   public final class Cmd_OfflineReward_GetInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_OfflineReward_GetInfo_SC";
      
      public static const REWARDSTARTTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_OfflineReward_GetInfo_SC.rewardStartTime","rewardStartTime",1 << 3 | WireType.VARINT);
      
      public static const REWARDENDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_OfflineReward_GetInfo_SC.rewardEndTime","rewardEndTime",2 << 3 | WireType.VARINT);
      
      public static const LOGINDAYS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_OfflineReward_GetInfo_SC.loginDays","loginDays",3 << 3 | WireType.VARINT);
      
      public static const REWARDSTAT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_OfflineReward_GetInfo_SC.rewardStat","rewardStat",4 << 3 | WireType.LENGTH_DELIMITED,Dto_OfflineRewardStat);
      
      public static const DAILYQUESTREWARDSTAT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_OfflineReward_GetInfo_SC.dailyQuestRewardStat","dailyQuestRewardStat",5 << 3 | WireType.LENGTH_DELIMITED,Dto_OfflineRewardStat);
      
      public static const DAILYQUESTFINISHNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_OfflineReward_GetInfo_SC.dailyQuestFinishNum","dailyQuestFinishNum",6 << 3 | WireType.VARINT);
       
      
      private var rewardStartTime$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var rewardEndTime$field:uint;
      
      private var loginDays$field:uint;
      
      public var rewardStat:Array;
      
      public var dailyQuestRewardStat:Array;
      
      private var dailyQuestFinishNum$field:uint;
      
      public function Cmd_OfflineReward_GetInfo_SC()
      {
         this.rewardStat = [];
         this.dailyQuestRewardStat = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_OfflineReward_GetInfo_SC.$MessageID;
      }
      
      public function clearRewardStartTime() : void
      {
         this.hasField$0 &= 4294967294;
         this.rewardStartTime$field = new uint();
      }
      
      public function get hasRewardStartTime() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set rewardStartTime(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.rewardStartTime$field = param1;
      }
      
      public function get rewardStartTime() : uint
      {
         return this.rewardStartTime$field;
      }
      
      public function clearRewardEndTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.rewardEndTime$field = new uint();
      }
      
      public function get hasRewardEndTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set rewardEndTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.rewardEndTime$field = param1;
      }
      
      public function get rewardEndTime() : uint
      {
         return this.rewardEndTime$field;
      }
      
      public function clearLoginDays() : void
      {
         this.hasField$0 &= 4294967291;
         this.loginDays$field = new uint();
      }
      
      public function get hasLoginDays() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set loginDays(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.loginDays$field = param1;
      }
      
      public function get loginDays() : uint
      {
         return this.loginDays$field;
      }
      
      public function clearDailyQuestFinishNum() : void
      {
         this.hasField$0 &= 4294967287;
         this.dailyQuestFinishNum$field = new uint();
      }
      
      public function get hasDailyQuestFinishNum() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set dailyQuestFinishNum(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.dailyQuestFinishNum$field = param1;
      }
      
      public function get dailyQuestFinishNum() : uint
      {
         return this.dailyQuestFinishNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasRewardStartTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.rewardStartTime$field);
         }
         if(this.hasRewardEndTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.rewardEndTime$field);
         }
         if(this.hasLoginDays)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.loginDays$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.rewardStat.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewardStat[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.dailyQuestRewardStat.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.dailyQuestRewardStat[_loc3_]);
            _loc3_++;
         }
         if(this.hasDailyQuestFinishNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.dailyQuestFinishNum$field);
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
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
                     throw new IOError("Bad data format: Cmd_OfflineReward_GetInfo_SC.rewardStartTime cannot be set twice.");
                  }
                  _loc3_++;
                  this.rewardStartTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_OfflineReward_GetInfo_SC.rewardEndTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.rewardEndTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_OfflineReward_GetInfo_SC.loginDays cannot be set twice.");
                  }
                  _loc5_++;
                  this.loginDays = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  this.rewardStat.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_OfflineRewardStat()));
                  break;
               case 5:
                  this.dailyQuestRewardStat.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_OfflineRewardStat()));
                  break;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_OfflineReward_GetInfo_SC.dailyQuestFinishNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.dailyQuestFinishNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
