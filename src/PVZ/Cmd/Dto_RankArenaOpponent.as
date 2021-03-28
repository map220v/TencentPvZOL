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
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_RankArenaOpponent extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_RankArenaOpponent";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_RankArenaOpponent.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_RankArenaOpponent.name","name",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const FACEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RankArenaOpponent.faceId","faceId",3 << 3 | WireType.VARINT);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RankArenaOpponent.level","level",4 << 3 | WireType.VARINT);
      
      public static const QQFACEURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_RankArenaOpponent.qqFaceURL","qqFaceURL",5 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ATTACKWINCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RankArenaOpponent.attackWinCount","attackWinCount",6 << 3 | WireType.VARINT);
      
      public static const DEFENCEWINCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RankArenaOpponent.defenceWinCount","defenceWinCount",7 << 3 | WireType.VARINT);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RankArenaOpponent.rank","rank",8 << 3 | WireType.VARINT);
      
      public static const GUILDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_RankArenaOpponent.guildName","guildName",9 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const GUILDICONCOLORID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RankArenaOpponent.guildIconColorId","guildIconColorId",10 << 3 | WireType.VARINT);
      
      public static const GUILDICONSURFACEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RankArenaOpponent.guildIconSurfaceId","guildIconSurfaceId",11 << 3 | WireType.VARINT);
      
      public static const GUILDICONSIGNID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RankArenaOpponent.guildIconSignId","guildIconSignId",12 << 3 | WireType.VARINT);
      
      public static const GUILDICONSURFACECOLORID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RankArenaOpponent.guildIconSurfaceColorId","guildIconSurfaceColorId",13 << 3 | WireType.VARINT);
      
      public static const FIGHTPOWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RankArenaOpponent.fightPower","fightPower",14 << 3 | WireType.VARINT);
      
      public static const CURRENTRANKREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_RankArenaOpponent.currentRankReward","currentRankReward",15 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      private var roleId$field:Int64;
      
      private var name$field:String;
      
      private var faceId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var level$field:uint;
      
      private var qqFaceURL$field:String;
      
      private var attackWinCount$field:uint;
      
      private var defenceWinCount$field:uint;
      
      private var rank$field:uint;
      
      private var guildName$field:String;
      
      private var guildIconColorId$field:uint;
      
      private var guildIconSurfaceId$field:uint;
      
      private var guildIconSignId$field:uint;
      
      private var guildIconSurfaceColorId$field:uint;
      
      private var fightPower$field:uint;
      
      public var currentRankReward:Array;
      
      public function Dto_RankArenaOpponent()
      {
         this.currentRankReward = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_RankArenaOpponent.$MessageID;
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
      
      public function clearName() : void
      {
         this.name$field = null;
      }
      
      public function get hasName() : Boolean
      {
         return this.name$field != null;
      }
      
      public function set name(param1:String) : void
      {
         this.name$field = param1;
      }
      
      public function get name() : String
      {
         return this.name$field;
      }
      
      public function clearFaceId() : void
      {
         this.hasField$0 &= 4294967294;
         this.faceId$field = new uint();
      }
      
      public function get hasFaceId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set faceId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.faceId$field = param1;
      }
      
      public function get faceId() : uint
      {
         return this.faceId$field;
      }
      
      public function clearLevel() : void
      {
         this.hasField$0 &= 4294967293;
         this.level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.level$field = param1;
      }
      
      public function get level() : uint
      {
         return this.level$field;
      }
      
      public function clearQqFaceURL() : void
      {
         this.qqFaceURL$field = null;
      }
      
      public function get hasQqFaceURL() : Boolean
      {
         return this.qqFaceURL$field != null;
      }
      
      public function set qqFaceURL(param1:String) : void
      {
         this.qqFaceURL$field = param1;
      }
      
      public function get qqFaceURL() : String
      {
         return this.qqFaceURL$field;
      }
      
      public function clearAttackWinCount() : void
      {
         this.hasField$0 &= 4294967291;
         this.attackWinCount$field = new uint();
      }
      
      public function get hasAttackWinCount() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set attackWinCount(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.attackWinCount$field = param1;
      }
      
      public function get attackWinCount() : uint
      {
         return this.attackWinCount$field;
      }
      
      public function clearDefenceWinCount() : void
      {
         this.hasField$0 &= 4294967287;
         this.defenceWinCount$field = new uint();
      }
      
      public function get hasDefenceWinCount() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set defenceWinCount(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.defenceWinCount$field = param1;
      }
      
      public function get defenceWinCount() : uint
      {
         return this.defenceWinCount$field;
      }
      
      public function clearRank() : void
      {
         this.hasField$0 &= 4294967279;
         this.rank$field = new uint();
      }
      
      public function get hasRank() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set rank(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.rank$field = param1;
      }
      
      public function get rank() : uint
      {
         return this.rank$field;
      }
      
      public function clearGuildName() : void
      {
         this.guildName$field = null;
      }
      
      public function get hasGuildName() : Boolean
      {
         return this.guildName$field != null;
      }
      
      public function set guildName(param1:String) : void
      {
         this.guildName$field = param1;
      }
      
      public function get guildName() : String
      {
         return this.guildName$field;
      }
      
      public function clearGuildIconColorId() : void
      {
         this.hasField$0 &= 4294967263;
         this.guildIconColorId$field = new uint();
      }
      
      public function get hasGuildIconColorId() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set guildIconColorId(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.guildIconColorId$field = param1;
      }
      
      public function get guildIconColorId() : uint
      {
         return this.guildIconColorId$field;
      }
      
      public function clearGuildIconSurfaceId() : void
      {
         this.hasField$0 &= 4294967231;
         this.guildIconSurfaceId$field = new uint();
      }
      
      public function get hasGuildIconSurfaceId() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set guildIconSurfaceId(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.guildIconSurfaceId$field = param1;
      }
      
      public function get guildIconSurfaceId() : uint
      {
         return this.guildIconSurfaceId$field;
      }
      
      public function clearGuildIconSignId() : void
      {
         this.hasField$0 &= 4294967167;
         this.guildIconSignId$field = new uint();
      }
      
      public function get hasGuildIconSignId() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set guildIconSignId(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.guildIconSignId$field = param1;
      }
      
      public function get guildIconSignId() : uint
      {
         return this.guildIconSignId$field;
      }
      
      public function clearGuildIconSurfaceColorId() : void
      {
         this.hasField$0 &= 4294967039;
         this.guildIconSurfaceColorId$field = new uint();
      }
      
      public function get hasGuildIconSurfaceColorId() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set guildIconSurfaceColorId(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.guildIconSurfaceColorId$field = param1;
      }
      
      public function get guildIconSurfaceColorId() : uint
      {
         return this.guildIconSurfaceColorId$field;
      }
      
      public function clearFightPower() : void
      {
         this.hasField$0 &= 4294966783;
         this.fightPower$field = new uint();
      }
      
      public function get hasFightPower() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set fightPower(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.fightPower$field = param1;
      }
      
      public function get fightPower() : uint
      {
         return this.fightPower$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.name$field);
         }
         if(this.hasFaceId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.faceId$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasQqFaceURL)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_STRING(param1,this.qqFaceURL$field);
         }
         if(this.hasAttackWinCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.attackWinCount$field);
         }
         if(this.hasDefenceWinCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.defenceWinCount$field);
         }
         if(this.hasRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.rank$field);
         }
         if(this.hasGuildName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_STRING(param1,this.guildName$field);
         }
         if(this.hasGuildIconColorId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.guildIconColorId$field);
         }
         if(this.hasGuildIconSurfaceId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.guildIconSurfaceId$field);
         }
         if(this.hasGuildIconSignId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_UINT32(param1,this.guildIconSignId$field);
         }
         if(this.hasGuildIconSurfaceColorId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,13);
            WriteUtils.write$TYPE_UINT32(param1,this.guildIconSurfaceColorId$field);
         }
         if(this.hasFightPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,14);
            WriteUtils.write$TYPE_UINT32(param1,this.fightPower$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.currentRankReward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,15);
            WriteUtils.write$TYPE_MESSAGE(param1,this.currentRankReward[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc17_:uint = 0;
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
         var _loc15_:uint = 0;
         var _loc16_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc17_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc17_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankArenaOpponent.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankArenaOpponent.name cannot be set twice.");
                  }
                  _loc4_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankArenaOpponent.faceId cannot be set twice.");
                  }
                  _loc5_++;
                  this.faceId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankArenaOpponent.level cannot be set twice.");
                  }
                  _loc6_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankArenaOpponent.qqFaceURL cannot be set twice.");
                  }
                  _loc7_++;
                  this.qqFaceURL = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankArenaOpponent.attackWinCount cannot be set twice.");
                  }
                  _loc8_++;
                  this.attackWinCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankArenaOpponent.defenceWinCount cannot be set twice.");
                  }
                  _loc9_++;
                  this.defenceWinCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankArenaOpponent.rank cannot be set twice.");
                  }
                  _loc10_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankArenaOpponent.guildName cannot be set twice.");
                  }
                  _loc11_++;
                  this.guildName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankArenaOpponent.guildIconColorId cannot be set twice.");
                  }
                  _loc12_++;
                  this.guildIconColorId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankArenaOpponent.guildIconSurfaceId cannot be set twice.");
                  }
                  _loc13_++;
                  this.guildIconSurfaceId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankArenaOpponent.guildIconSignId cannot be set twice.");
                  }
                  _loc14_++;
                  this.guildIconSignId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 13:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankArenaOpponent.guildIconSurfaceColorId cannot be set twice.");
                  }
                  _loc15_++;
                  this.guildIconSurfaceColorId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 14:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RankArenaOpponent.fightPower cannot be set twice.");
                  }
                  _loc16_++;
                  this.fightPower = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 15:
                  this.currentRankReward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               default:
                  super.readUnknown(param1,_loc17_);
                  break;
            }
         }
      }
   }
}
