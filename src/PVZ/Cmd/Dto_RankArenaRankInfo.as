package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_RankArenaRankInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_RankArenaRankInfo";
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RankArenaRankInfo.rank","rank",1 << 3 | WireType.VARINT);
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_RankArenaRankInfo.roleId","roleId",2 << 3 | WireType.VARINT);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_RankArenaRankInfo.roleName","roleName",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ROLELEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RankArenaRankInfo.roleLevel","roleLevel",4 << 3 | WireType.VARINT);
      
      public static const FIGHTPOWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RankArenaRankInfo.fightPower","fightPower",5 << 3 | WireType.VARINT);
      
      public static const CHALLENGEWINCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RankArenaRankInfo.challengeWinCount","challengeWinCount",6 << 3 | WireType.VARINT);
      
      public static const DEFENCEWINCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RankArenaRankInfo.defenceWinCount","defenceWinCount",7 << 3 | WireType.VARINT);
       
      
      private var rank$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var roleId$field:Int64;
      
      private var roleName$field:String;
      
      private var roleLevel$field:uint;
      
      private var fightPower$field:uint;
      
      private var challengeWinCount$field:uint;
      
      private var defenceWinCount$field:uint;
      
      public function Dto_RankArenaRankInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_RankArenaRankInfo.$MessageID;
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
      
      public function clearRoleId() : void
      {
         this.roleId$field = null;
      }
      
      public function get hasRoleId() : Boolean
      {
         return this.roleId$field != null;
      }
      
      public function set roleId(param1:Int64) : void
      {
         this.roleId$field = param1;
      }
      
      public function get roleId() : Int64
      {
         return this.roleId$field;
      }
      
      public function clearRoleName() : void
      {
         this.roleName$field = null;
      }
      
      public function get hasRoleName() : Boolean
      {
         return this.roleName$field != null;
      }
      
      public function set roleName(param1:String) : void
      {
         this.roleName$field = param1;
      }
      
      public function get roleName() : String
      {
         return this.roleName$field;
      }
      
      public function clearRoleLevel() : void
      {
         this.hasField$0 &= 4294967293;
         this.roleLevel$field = new uint();
      }
      
      public function get hasRoleLevel() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set roleLevel(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.roleLevel$field = param1;
      }
      
      public function get roleLevel() : uint
      {
         return this.roleLevel$field;
      }
      
      public function clearFightPower() : void
      {
         this.hasField$0 &= 4294967291;
         this.fightPower$field = new uint();
      }
      
      public function get hasFightPower() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set fightPower(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.fightPower$field = param1;
      }
      
      public function get fightPower() : uint
      {
         return this.fightPower$field;
      }
      
      public function clearChallengeWinCount() : void
      {
         this.hasField$0 &= 4294967287;
         this.challengeWinCount$field = new uint();
      }
      
      public function get hasChallengeWinCount() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set challengeWinCount(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.challengeWinCount$field = param1;
      }
      
      public function get challengeWinCount() : uint
      {
         return this.challengeWinCount$field;
      }
      
      public function clearDefenceWinCount() : void
      {
         this.hasField$0 &= 4294967279;
         this.defenceWinCount$field = new uint();
      }
      
      public function get hasDefenceWinCount() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set defenceWinCount(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.defenceWinCount$field = param1;
      }
      
      public function get defenceWinCount() : uint
      {
         return this.defenceWinCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.rank$field);
         }
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.roleName$field);
         }
         if(this.hasRoleLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.roleLevel$field);
         }
         if(this.hasFightPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.fightPower$field);
         }
         if(this.hasChallengeWinCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.challengeWinCount$field);
         }
         if(this.hasDefenceWinCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.defenceWinCount$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc10_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc10_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc10_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankArenaRankInfo.rank cannot be set twice.");
                  }
                  _loc3_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankArenaRankInfo.roleId cannot be set twice.");
                  }
                  _loc4_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankArenaRankInfo.roleName cannot be set twice.");
                  }
                  _loc5_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankArenaRankInfo.roleLevel cannot be set twice.");
                  }
                  _loc6_++;
                  this.roleLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankArenaRankInfo.fightPower cannot be set twice.");
                  }
                  _loc7_++;
                  this.fightPower = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankArenaRankInfo.challengeWinCount cannot be set twice.");
                  }
                  _loc8_++;
                  this.challengeWinCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankArenaRankInfo.defenceWinCount cannot be set twice.");
                  }
                  _loc9_++;
                  this.defenceWinCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
