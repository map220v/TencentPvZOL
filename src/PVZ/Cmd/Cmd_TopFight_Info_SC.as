package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_TopFight_Info_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_TopFight_Info_SC";
      
      public static const SEASONID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TopFight_Info_SC.seasonId","seasonId",1 << 3 | WireType.VARINT);
      
      public static const OPENING:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_TopFight_Info_SC.opening","opening",2 << 3 | WireType.VARINT);
      
      public static const JOINED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_TopFight_Info_SC.joined","joined",3 << 3 | WireType.VARINT);
      
      public static const BEGINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TopFight_Info_SC.beginTime","beginTime",4 << 3 | WireType.VARINT);
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TopFight_Info_SC.stageId","stageId",5 << 3 | WireType.VARINT);
      
      public static const ROUNDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TopFight_Info_SC.roundId","roundId",6 << 3 | WireType.VARINT);
      
      public static const ROUNDFINISHED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_TopFight_Info_SC.roundFinished","roundFinished",7 << 3 | WireType.VARINT);
      
      public static const ROLEINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_TopFight_Info_SC.roleInfo","roleInfo",8 << 3 | WireType.LENGTH_DELIMITED,Dto_TopFightRoleInfo);
      
      public static const STAGEINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_TopFight_Info_SC.stageInfo","stageInfo",9 << 3 | WireType.LENGTH_DELIMITED,Dto_TopFightStageInfo);
      
      public static const CHAMPIONINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_TopFight_Info_SC.championInfo","championInfo",10 << 3 | WireType.LENGTH_DELIMITED,Dto_TopFightRoleInfo);
      
      public static const REWARDSTAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TopFight_Info_SC.rewardStageId","rewardStageId",11 << 3 | WireType.VARINT);
      
      public static const HASTAKENREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_TopFight_Info_SC.hasTakenReward","hasTakenReward",12 << 3 | WireType.VARINT);
      
      public static const ROLENUMPERZONE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TopFight_Info_SC.roleNumPerZone","roleNumPerZone",13 << 3 | WireType.VARINT);
      
      public static const DISABLED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_TopFight_Info_SC.disabled","disabled",14 << 3 | WireType.VARINT);
      
      public static const BETINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_TopFight_Info_SC.betInfo","betInfo",15 << 3 | WireType.LENGTH_DELIMITED,Dto_TopFightStageBetInfo);
       
      
      private var seasonId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var opening$field:Boolean;
      
      private var joined$field:Boolean;
      
      private var beginTime$field:uint;
      
      private var stageId$field:uint;
      
      private var roundId$field:uint;
      
      private var roundFinished$field:Boolean;
      
      public var roleInfo:Array;
      
      public var stageInfo:Array;
      
      private var championInfo$field:Dto_TopFightRoleInfo;
      
      private var rewardStageId$field:uint;
      
      private var hasTakenReward$field:Boolean;
      
      private var roleNumPerZone$field:uint;
      
      private var disabled$field:Boolean;
      
      public var betInfo:Array;
      
      public function Cmd_TopFight_Info_SC()
      {
         this.roleInfo = [];
         this.stageInfo = [];
         this.betInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_TopFight_Info_SC.$MessageID;
      }
      
      public function clearSeasonId() : void
      {
         this.hasField$0 &= 4294967294;
         this.seasonId$field = new uint();
      }
      
      public function get hasSeasonId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set seasonId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.seasonId$field = param1;
      }
      
      public function get seasonId() : uint
      {
         return this.seasonId$field;
      }
      
      public function clearOpening() : void
      {
         this.hasField$0 &= 4294967293;
         this.opening$field = new Boolean();
      }
      
      public function get hasOpening() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set opening(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.opening$field = param1;
      }
      
      public function get opening() : Boolean
      {
         return this.opening$field;
      }
      
      public function clearJoined() : void
      {
         this.hasField$0 &= 4294967291;
         this.joined$field = new Boolean();
      }
      
      public function get hasJoined() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set joined(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.joined$field = param1;
      }
      
      public function get joined() : Boolean
      {
         return this.joined$field;
      }
      
      public function clearBeginTime() : void
      {
         this.hasField$0 &= 4294967287;
         this.beginTime$field = new uint();
      }
      
      public function get hasBeginTime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set beginTime(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.beginTime$field = param1;
      }
      
      public function get beginTime() : uint
      {
         return this.beginTime$field;
      }
      
      public function clearStageId() : void
      {
         this.hasField$0 &= 4294967279;
         this.stageId$field = new uint();
      }
      
      public function get hasStageId() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set stageId(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.stageId$field = param1;
      }
      
      public function get stageId() : uint
      {
         return this.stageId$field;
      }
      
      public function clearRoundId() : void
      {
         this.hasField$0 &= 4294967263;
         this.roundId$field = new uint();
      }
      
      public function get hasRoundId() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set roundId(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.roundId$field = param1;
      }
      
      public function get roundId() : uint
      {
         return this.roundId$field;
      }
      
      public function clearRoundFinished() : void
      {
         this.hasField$0 &= 4294967231;
         this.roundFinished$field = new Boolean();
      }
      
      public function get hasRoundFinished() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set roundFinished(param1:Boolean) : void
      {
         this.hasField$0 |= 64;
         this.roundFinished$field = param1;
      }
      
      public function get roundFinished() : Boolean
      {
         return this.roundFinished$field;
      }
      
      public function clearChampionInfo() : void
      {
         this.championInfo$field = null;
      }
      
      public function get hasChampionInfo() : Boolean
      {
         return this.championInfo$field != null;
      }
      
      public function set championInfo(param1:Dto_TopFightRoleInfo) : void
      {
         this.championInfo$field = param1;
      }
      
      public function get championInfo() : Dto_TopFightRoleInfo
      {
         return this.championInfo$field;
      }
      
      public function clearRewardStageId() : void
      {
         this.hasField$0 &= 4294967167;
         this.rewardStageId$field = new uint();
      }
      
      public function get hasRewardStageId() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set rewardStageId(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.rewardStageId$field = param1;
      }
      
      public function get rewardStageId() : uint
      {
         return this.rewardStageId$field;
      }
      
      public function clearHasTakenReward() : void
      {
         this.hasField$0 &= 4294967039;
         this.hasTakenReward$field = new Boolean();
      }
      
      public function get hasHasTakenReward() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set hasTakenReward(param1:Boolean) : void
      {
         this.hasField$0 |= 256;
         this.hasTakenReward$field = param1;
      }
      
      public function get hasTakenReward() : Boolean
      {
         return this.hasTakenReward$field;
      }
      
      public function clearRoleNumPerZone() : void
      {
         this.hasField$0 &= 4294966783;
         this.roleNumPerZone$field = new uint();
      }
      
      public function get hasRoleNumPerZone() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set roleNumPerZone(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.roleNumPerZone$field = param1;
      }
      
      public function get roleNumPerZone() : uint
      {
         return this.roleNumPerZone$field;
      }
      
      public function clearDisabled() : void
      {
         this.hasField$0 &= 4294966271;
         this.disabled$field = new Boolean();
      }
      
      public function get hasDisabled() : Boolean
      {
         return (this.hasField$0 & 1024) != 0;
      }
      
      public function set disabled(param1:Boolean) : void
      {
         this.hasField$0 |= 1024;
         this.disabled$field = param1;
      }
      
      public function get disabled() : Boolean
      {
         return this.disabled$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = undefined;
         if(this.hasSeasonId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.seasonId$field);
         }
         if(this.hasOpening)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.opening$field);
         }
         if(this.hasJoined)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.joined$field);
         }
         if(this.hasBeginTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.beginTime$field);
         }
         if(this.hasStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.stageId$field);
         }
         if(this.hasRoundId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.roundId$field);
         }
         if(this.hasRoundFinished)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_BOOL(param1,this.roundFinished$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.roleInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.roleInfo[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.stageInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_MESSAGE(param1,this.stageInfo[_loc3_]);
            _loc3_++;
         }
         if(this.hasChampionInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,10);
            WriteUtils.write$TYPE_MESSAGE(param1,this.championInfo$field);
         }
         if(this.hasRewardStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.rewardStageId$field);
         }
         if(this.hasHasTakenReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_BOOL(param1,this.hasTakenReward$field);
         }
         if(this.hasRoleNumPerZone)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,13);
            WriteUtils.write$TYPE_UINT32(param1,this.roleNumPerZone$field);
         }
         if(this.hasDisabled)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,14);
            WriteUtils.write$TYPE_BOOL(param1,this.disabled$field);
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.betInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,15);
            WriteUtils.write$TYPE_MESSAGE(param1,this.betInfo[_loc4_]);
            _loc4_++;
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc15_:uint = 0;
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
         var _loc13_:uint = 0;
         var _loc14_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc15_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc15_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_Info_SC.seasonId cannot be set twice.");
                  }
                  _loc3_++;
                  this.seasonId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_Info_SC.opening cannot be set twice.");
                  }
                  _loc4_++;
                  this.opening = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_Info_SC.joined cannot be set twice.");
                  }
                  _loc5_++;
                  this.joined = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_Info_SC.beginTime cannot be set twice.");
                  }
                  _loc6_++;
                  this.beginTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_Info_SC.stageId cannot be set twice.");
                  }
                  _loc7_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_Info_SC.roundId cannot be set twice.");
                  }
                  _loc8_++;
                  this.roundId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_Info_SC.roundFinished cannot be set twice.");
                  }
                  _loc9_++;
                  this.roundFinished = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 8:
                  this.roleInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_TopFightRoleInfo()));
                  break;
               case 9:
                  this.stageInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_TopFightStageInfo()));
                  break;
               case 10:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_Info_SC.championInfo cannot be set twice.");
                  }
                  _loc10_++;
                  this.championInfo = new Dto_TopFightRoleInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.championInfo);
                  break;
               case 11:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_Info_SC.rewardStageId cannot be set twice.");
                  }
                  _loc11_++;
                  this.rewardStageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_Info_SC.hasTakenReward cannot be set twice.");
                  }
                  _loc12_++;
                  this.hasTakenReward = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 13:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_Info_SC.roleNumPerZone cannot be set twice.");
                  }
                  _loc13_++;
                  this.roleNumPerZone = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 14:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_Info_SC.disabled cannot be set twice.");
                  }
                  _loc14_++;
                  this.disabled = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 15:
                  this.betInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_TopFightStageBetInfo()));
                  break;
               default:
                  super.readUnknown(param1,_loc15_);
                  break;
            }
         }
      }
   }
}
