package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_MeleeMyInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_MeleeMyInfo";
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MeleeMyInfo.rank","rank",1 << 3 | WireType.VARINT);
      
      public static const WINCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MeleeMyInfo.winCount","winCount",2 << 3 | WireType.VARINT);
      
      public static const LOSECOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MeleeMyInfo.loseCount","loseCount",3 << 3 | WireType.VARINT);
      
      public static const SCORETODAY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MeleeMyInfo.scoreToday","scoreToday",4 << 3 | WireType.VARINT);
      
      public static const WINSTREAKCOUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_MeleeMyInfo.winStreakCount","winStreakCount",5 << 3 | WireType.VARINT);
      
      public static const WINSTREAKCOUNTRECORD:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_MeleeMyInfo.winStreakCountRecord","winStreakCountRecord",6 << 3 | WireType.VARINT);
      
      public static const ISAUTOFIGHT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_MeleeMyInfo.isAutoFight","isAutoFight",7 << 3 | WireType.VARINT);
      
      public static const INSPIRETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MeleeMyInfo.inspireTimes","inspireTimes",8 << 3 | WireType.VARINT);
      
      public static const ISJOINFIGHT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_MeleeMyInfo.isJoinFight","isJoinFight",9 << 3 | WireType.VARINT);
      
      public static const HASTAKEREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_MeleeMyInfo.hasTakeReward","hasTakeReward",10 << 3 | WireType.VARINT);
       
      
      private var rank$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var winCount$field:uint;
      
      private var loseCount$field:uint;
      
      private var scoreToday$field:uint;
      
      private var winStreakCount$field:int;
      
      private var winStreakCountRecord$field:int;
      
      private var isAutoFight$field:Boolean;
      
      private var inspireTimes$field:uint;
      
      private var isJoinFight$field:Boolean;
      
      private var hasTakeReward$field:Boolean;
      
      public function Dto_MeleeMyInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_MeleeMyInfo.$MessageID;
      }
      
      public function clearRank() : void
      {
         this.hasField$0 &= 4294967294;
         this.rank$field = new uint();
      }
      
      public function get hasRank() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set rank(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.rank$field = param1;
      }
      
      public function get rank() : uint
      {
         return this.rank$field;
      }
      
      public function clearWinCount() : void
      {
         this.hasField$0 &= 4294967293;
         this.winCount$field = new uint();
      }
      
      public function get hasWinCount() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set winCount(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.winCount$field = param1;
      }
      
      public function get winCount() : uint
      {
         return this.winCount$field;
      }
      
      public function clearLoseCount() : void
      {
         this.hasField$0 &= 4294967291;
         this.loseCount$field = new uint();
      }
      
      public function get hasLoseCount() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set loseCount(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.loseCount$field = param1;
      }
      
      public function get loseCount() : uint
      {
         return this.loseCount$field;
      }
      
      public function clearScoreToday() : void
      {
         this.hasField$0 &= 4294967287;
         this.scoreToday$field = new uint();
      }
      
      public function get hasScoreToday() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set scoreToday(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.scoreToday$field = param1;
      }
      
      public function get scoreToday() : uint
      {
         return this.scoreToday$field;
      }
      
      public function clearWinStreakCount() : void
      {
         this.hasField$0 &= 4294967279;
         this.winStreakCount$field = new int();
      }
      
      public function get hasWinStreakCount() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set winStreakCount(param1:int) : void
      {
         this.hasField$0 |= 16;
         this.winStreakCount$field = param1;
      }
      
      public function get winStreakCount() : int
      {
         return this.winStreakCount$field;
      }
      
      public function clearWinStreakCountRecord() : void
      {
         this.hasField$0 &= 4294967263;
         this.winStreakCountRecord$field = new int();
      }
      
      public function get hasWinStreakCountRecord() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set winStreakCountRecord(param1:int) : void
      {
         this.hasField$0 |= 32;
         this.winStreakCountRecord$field = param1;
      }
      
      public function get winStreakCountRecord() : int
      {
         return this.winStreakCountRecord$field;
      }
      
      public function clearIsAutoFight() : void
      {
         this.hasField$0 &= 4294967231;
         this.isAutoFight$field = new Boolean();
      }
      
      public function get hasIsAutoFight() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set isAutoFight(param1:Boolean) : void
      {
         this.hasField$0 |= 64;
         this.isAutoFight$field = param1;
      }
      
      public function get isAutoFight() : Boolean
      {
         return this.isAutoFight$field;
      }
      
      public function clearInspireTimes() : void
      {
         this.hasField$0 &= 4294967167;
         this.inspireTimes$field = new uint();
      }
      
      public function get hasInspireTimes() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set inspireTimes(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.inspireTimes$field = param1;
      }
      
      public function get inspireTimes() : uint
      {
         return this.inspireTimes$field;
      }
      
      public function clearIsJoinFight() : void
      {
         this.hasField$0 &= 4294967039;
         this.isJoinFight$field = new Boolean();
      }
      
      public function get hasIsJoinFight() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set isJoinFight(param1:Boolean) : void
      {
         this.hasField$0 |= 256;
         this.isJoinFight$field = param1;
      }
      
      public function get isJoinFight() : Boolean
      {
         return this.isJoinFight$field;
      }
      
      public function clearHasTakeReward() : void
      {
         this.hasField$0 &= 4294966783;
         this.hasTakeReward$field = new Boolean();
      }
      
      public function get hasHasTakeReward() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set hasTakeReward(param1:Boolean) : void
      {
         this.hasField$0 |= 512;
         this.hasTakeReward$field = param1;
      }
      
      public function get hasTakeReward() : Boolean
      {
         return this.hasTakeReward$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.rank$field);
         }
         if(this.hasWinCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.winCount$field);
         }
         if(this.hasLoseCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.loseCount$field);
         }
         if(this.hasScoreToday)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.scoreToday$field);
         }
         if(this.hasWinStreakCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_INT32(param1,this.winStreakCount$field);
         }
         if(this.hasWinStreakCountRecord)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_INT32(param1,this.winStreakCountRecord$field);
         }
         if(this.hasIsAutoFight)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_BOOL(param1,this.isAutoFight$field);
         }
         if(this.hasInspireTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.inspireTimes$field);
         }
         if(this.hasIsJoinFight)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_BOOL(param1,this.isJoinFight$field);
         }
         if(this.hasHasTakeReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_BOOL(param1,this.hasTakeReward$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc13_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc13_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc13_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeMyInfo.rank cannot be set twice.");
                  }
                  _loc3_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeMyInfo.winCount cannot be set twice.");
                  }
                  _loc4_++;
                  this.winCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeMyInfo.loseCount cannot be set twice.");
                  }
                  _loc5_++;
                  this.loseCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeMyInfo.scoreToday cannot be set twice.");
                  }
                  _loc6_++;
                  this.scoreToday = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeMyInfo.winStreakCount cannot be set twice.");
                  }
                  _loc7_++;
                  this.winStreakCount = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeMyInfo.winStreakCountRecord cannot be set twice.");
                  }
                  _loc8_++;
                  this.winStreakCountRecord = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeMyInfo.isAutoFight cannot be set twice.");
                  }
                  _loc9_++;
                  this.isAutoFight = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeMyInfo.inspireTimes cannot be set twice.");
                  }
                  _loc10_++;
                  this.inspireTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeMyInfo.isJoinFight cannot be set twice.");
                  }
                  _loc11_++;
                  this.isJoinFight = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MeleeMyInfo.hasTakeReward cannot be set twice.");
                  }
                  _loc12_++;
                  this.hasTakeReward = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc13_);
                  break;
            }
         }
      }
   }
}
