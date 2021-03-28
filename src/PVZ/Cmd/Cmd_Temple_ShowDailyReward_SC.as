package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Temple_ShowDailyReward_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Temple_ShowDailyReward_SC";
      
      public static const REWARDSTAT:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Cmd_Temple_ShowDailyReward_SC.rewardStat","rewardStat",1 << 3 | WireType.VARINT,TempleRewardStat);
      
      public static const SPECIALREWARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Temple_ShowDailyReward_SC.specialRewards","specialRewards",2 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const ITEMREWARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Temple_ShowDailyReward_SC.itemRewards","itemRewards",3 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const CAPTURETEMPLELIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Temple_ShowDailyReward_SC.captureTempleList","captureTempleList",4 << 3 | WireType.LENGTH_DELIMITED,Dto_CaptureTempleType);
      
      public static const TAKENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Temple_ShowDailyReward_SC.takeNum","takeNum",5 << 3 | WireType.VARINT);
      
      public static const MAXTAKENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Temple_ShowDailyReward_SC.maxTakeNum","maxTakeNum",6 << 3 | WireType.VARINT);
      
      public static const CAPTUREREWARDNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Temple_ShowDailyReward_SC.captureRewardNum","captureRewardNum",7 << 3 | WireType.VARINT);
       
      
      private var rewardStat$field:int;
      
      private var hasField$0:uint = 0;
      
      public var specialRewards:Array;
      
      public var itemRewards:Array;
      
      public var captureTempleList:Array;
      
      private var takeNum$field:uint;
      
      private var maxTakeNum$field:uint;
      
      private var captureRewardNum$field:uint;
      
      public function Cmd_Temple_ShowDailyReward_SC()
      {
         this.specialRewards = [];
         this.itemRewards = [];
         this.captureTempleList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Temple_ShowDailyReward_SC.$MessageID;
      }
      
      public function clearRewardStat() : void
      {
         this.hasField$0 &= 4294967294;
         this.rewardStat$field = new int();
      }
      
      public function get hasRewardStat() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set rewardStat(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.rewardStat$field = param1;
      }
      
      public function get rewardStat() : int
      {
         return this.rewardStat$field;
      }
      
      public function clearTakeNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.takeNum$field = new uint();
      }
      
      public function get hasTakeNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set takeNum(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.takeNum$field = param1;
      }
      
      public function get takeNum() : uint
      {
         return this.takeNum$field;
      }
      
      public function clearMaxTakeNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.maxTakeNum$field = new uint();
      }
      
      public function get hasMaxTakeNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set maxTakeNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.maxTakeNum$field = param1;
      }
      
      public function get maxTakeNum() : uint
      {
         return this.maxTakeNum$field;
      }
      
      public function clearCaptureRewardNum() : void
      {
         this.hasField$0 &= 4294967287;
         this.captureRewardNum$field = new uint();
      }
      
      public function get hasCaptureRewardNum() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set captureRewardNum(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.captureRewardNum$field = param1;
      }
      
      public function get captureRewardNum() : uint
      {
         return this.captureRewardNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = undefined;
         if(this.hasRewardStat)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_ENUM(param1,this.rewardStat$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.specialRewards.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.specialRewards[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.itemRewards.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.itemRewards[_loc3_]);
            _loc3_++;
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.captureTempleList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.captureTempleList[_loc4_]);
            _loc4_++;
         }
         if(this.hasTakeNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.takeNum$field);
         }
         if(this.hasMaxTakeNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.maxTakeNum$field);
         }
         if(this.hasCaptureRewardNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.captureRewardNum$field);
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
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
                     throw new IOError("Bad data format: Cmd_Temple_ShowDailyReward_SC.rewardStat cannot be set twice.");
                  }
                  _loc3_++;
                  this.rewardStat = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 2:
                  this.specialRewards.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 3:
                  this.itemRewards.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 4:
                  this.captureTempleList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_CaptureTempleType()));
                  break;
               case 5:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Temple_ShowDailyReward_SC.takeNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.takeNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Temple_ShowDailyReward_SC.maxTakeNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.maxTakeNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Temple_ShowDailyReward_SC.captureRewardNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.captureRewardNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
