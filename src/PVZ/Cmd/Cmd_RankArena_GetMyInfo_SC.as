package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_RankArena_GetMyInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_RankArena_GetMyInfo_SC";
      
      public static const RECORDERS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_RankArena_GetMyInfo_SC.recorders","recorders",1 << 3 | WireType.LENGTH_DELIMITED,Dto_RankArenaRecorder);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_RankArena_GetMyInfo_SC.rank","rank",2 << 3 | WireType.VARINT);
      
      public static const ATTACKWINCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_RankArena_GetMyInfo_SC.attackWinCount","attackWinCount",3 << 3 | WireType.VARINT);
      
      public static const DEFENCEWINCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_RankArena_GetMyInfo_SC.defenceWinCount","defenceWinCount",4 << 3 | WireType.VARINT);
      
      public static const LEFTCHALLENGENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_RankArena_GetMyInfo_SC.leftChallengeNum","leftChallengeNum",5 << 3 | WireType.VARINT);
      
      public static const LEFTPAYCHALLENGENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_RankArena_GetMyInfo_SC.leftPayChallengeNum","leftPayChallengeNum",6 << 3 | WireType.VARINT);
      
      public static const LEFTCOOLDOWN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_RankArena_GetMyInfo_SC.leftCoolDown","leftCoolDown",7 << 3 | WireType.VARINT);
      
      public static const ISSTARTED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_RankArena_GetMyInfo_SC.isStarted","isStarted",8 << 3 | WireType.VARINT);
      
      public static const FIGHTPOWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_RankArena_GetMyInfo_SC.fightPower","fightPower",9 << 3 | WireType.VARINT);
      
      public static const OPPONENT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_RankArena_GetMyInfo_SC.opponent","opponent",10 << 3 | WireType.LENGTH_DELIMITED,Dto_RankArenaOpponent);
      
      public static const TOPROLE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_RankArena_GetMyInfo_SC.topRole","topRole",11 << 3 | WireType.LENGTH_DELIMITED,Dto_RankArenaOpponent);
      
      public static const CURRENTRANKREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_RankArena_GetMyInfo_SC.currentRankReward","currentRankReward",12 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const CANTAKEREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_RankArena_GetMyInfo_SC.canTakeReward","canTakeReward",13 << 3 | WireType.VARINT);
       
      
      public var recorders:Array;
      
      private var rank$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var attackWinCount$field:uint;
      
      private var defenceWinCount$field:uint;
      
      private var leftChallengeNum$field:uint;
      
      private var leftPayChallengeNum$field:uint;
      
      private var leftCoolDown$field:uint;
      
      private var isStarted$field:Boolean;
      
      private var fightPower$field:uint;
      
      public var opponent:Array;
      
      public var topRole:Array;
      
      public var currentRankReward:Array;
      
      private var canTakeReward$field:Boolean;
      
      public function Cmd_RankArena_GetMyInfo_SC()
      {
         this.recorders = [];
         this.opponent = [];
         this.topRole = [];
         this.currentRankReward = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_RankArena_GetMyInfo_SC.$MessageID;
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
      
      public function clearAttackWinCount() : void
      {
         this.hasField$0 &= 4294967293;
         this.attackWinCount$field = new uint();
      }
      
      public function get hasAttackWinCount() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set attackWinCount(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.attackWinCount$field = param1;
      }
      
      public function get attackWinCount() : uint
      {
         return this.attackWinCount$field;
      }
      
      public function clearDefenceWinCount() : void
      {
         this.hasField$0 &= 4294967291;
         this.defenceWinCount$field = new uint();
      }
      
      public function get hasDefenceWinCount() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set defenceWinCount(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.defenceWinCount$field = param1;
      }
      
      public function get defenceWinCount() : uint
      {
         return this.defenceWinCount$field;
      }
      
      public function clearLeftChallengeNum() : void
      {
         this.hasField$0 &= 4294967287;
         this.leftChallengeNum$field = new uint();
      }
      
      public function get hasLeftChallengeNum() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set leftChallengeNum(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.leftChallengeNum$field = param1;
      }
      
      public function get leftChallengeNum() : uint
      {
         return this.leftChallengeNum$field;
      }
      
      public function clearLeftPayChallengeNum() : void
      {
         this.hasField$0 &= 4294967279;
         this.leftPayChallengeNum$field = new uint();
      }
      
      public function get hasLeftPayChallengeNum() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set leftPayChallengeNum(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.leftPayChallengeNum$field = param1;
      }
      
      public function get leftPayChallengeNum() : uint
      {
         return this.leftPayChallengeNum$field;
      }
      
      public function clearLeftCoolDown() : void
      {
         this.hasField$0 &= 4294967263;
         this.leftCoolDown$field = new uint();
      }
      
      public function get hasLeftCoolDown() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set leftCoolDown(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.leftCoolDown$field = param1;
      }
      
      public function get leftCoolDown() : uint
      {
         return this.leftCoolDown$field;
      }
      
      public function clearIsStarted() : void
      {
         this.hasField$0 &= 4294967231;
         this.isStarted$field = new Boolean();
      }
      
      public function get hasIsStarted() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set isStarted(param1:Boolean) : void
      {
         this.hasField$0 |= 64;
         this.isStarted$field = param1;
      }
      
      public function get isStarted() : Boolean
      {
         return this.isStarted$field;
      }
      
      public function clearFightPower() : void
      {
         this.hasField$0 &= 4294967167;
         this.fightPower$field = new uint();
      }
      
      public function get hasFightPower() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set fightPower(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.fightPower$field = param1;
      }
      
      public function get fightPower() : uint
      {
         return this.fightPower$field;
      }
      
      public function clearCanTakeReward() : void
      {
         this.hasField$0 &= 4294967039;
         this.canTakeReward$field = new Boolean();
      }
      
      public function get hasCanTakeReward() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set canTakeReward(param1:Boolean) : void
      {
         this.hasField$0 |= 256;
         this.canTakeReward$field = param1;
      }
      
      public function get canTakeReward() : Boolean
      {
         return this.canTakeReward$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc6_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.recorders.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.recorders[_loc2_]);
            _loc2_++;
         }
         if(this.hasRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.rank$field);
         }
         if(this.hasAttackWinCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.attackWinCount$field);
         }
         if(this.hasDefenceWinCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.defenceWinCount$field);
         }
         if(this.hasLeftChallengeNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.leftChallengeNum$field);
         }
         if(this.hasLeftPayChallengeNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.leftPayChallengeNum$field);
         }
         if(this.hasLeftCoolDown)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.leftCoolDown$field);
         }
         if(this.hasIsStarted)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_BOOL(param1,this.isStarted$field);
         }
         if(this.hasFightPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.fightPower$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.opponent.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,10);
            WriteUtils.write$TYPE_MESSAGE(param1,this.opponent[_loc3_]);
            _loc3_++;
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.topRole.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,11);
            WriteUtils.write$TYPE_MESSAGE(param1,this.topRole[_loc4_]);
            _loc4_++;
         }
         var _loc5_:uint = 0;
         while(_loc5_ < this.currentRankReward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,12);
            WriteUtils.write$TYPE_MESSAGE(param1,this.currentRankReward[_loc5_]);
            _loc5_++;
         }
         if(this.hasCanTakeReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,13);
            WriteUtils.write$TYPE_BOOL(param1,this.canTakeReward$field);
         }
         for(_loc6_ in this)
         {
            super.writeUnknown(param1,_loc6_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc12_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc12_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc12_ >> 3)
            {
               case 1:
                  this.recorders.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_RankArenaRecorder()));
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_RankArena_GetMyInfo_SC.rank cannot be set twice.");
                  }
                  _loc3_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_RankArena_GetMyInfo_SC.attackWinCount cannot be set twice.");
                  }
                  _loc4_++;
                  this.attackWinCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_RankArena_GetMyInfo_SC.defenceWinCount cannot be set twice.");
                  }
                  _loc5_++;
                  this.defenceWinCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_RankArena_GetMyInfo_SC.leftChallengeNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.leftChallengeNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_RankArena_GetMyInfo_SC.leftPayChallengeNum cannot be set twice.");
                  }
                  _loc7_++;
                  this.leftPayChallengeNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_RankArena_GetMyInfo_SC.leftCoolDown cannot be set twice.");
                  }
                  _loc8_++;
                  this.leftCoolDown = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_RankArena_GetMyInfo_SC.isStarted cannot be set twice.");
                  }
                  _loc9_++;
                  this.isStarted = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 9:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_RankArena_GetMyInfo_SC.fightPower cannot be set twice.");
                  }
                  _loc10_++;
                  this.fightPower = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  this.opponent.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_RankArenaOpponent()));
                  break;
               case 11:
                  this.topRole.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_RankArenaOpponent()));
                  break;
               case 12:
                  this.currentRankReward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 13:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_RankArena_GetMyInfo_SC.canTakeReward cannot be set twice.");
                  }
                  _loc11_++;
                  this.canTakeReward = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc12_);
                  break;
            }
         }
      }
   }
}
