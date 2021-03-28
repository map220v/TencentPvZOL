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
   
   public final class Dto_AllServerRankArena_Opponent extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_AllServerRankArena_Opponent";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_AllServerRankArena_Opponent.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const ZONEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AllServerRankArena_Opponent.zoneId","zoneId",2 << 3 | WireType.VARINT);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_AllServerRankArena_Opponent.name","name",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const UIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AllServerRankArena_Opponent.uin","uin",4 << 3 | WireType.VARINT);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AllServerRankArena_Opponent.level","level",5 << 3 | WireType.VARINT);
      
      public static const QQFACEURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_AllServerRankArena_Opponent.qqFaceURL","qqFaceURL",6 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ATTACKWIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AllServerRankArena_Opponent.attackWin","attackWin",7 << 3 | WireType.VARINT);
      
      public static const DEFENCEWIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AllServerRankArena_Opponent.defenceWin","defenceWin",8 << 3 | WireType.VARINT);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AllServerRankArena_Opponent.rank","rank",9 << 3 | WireType.VARINT);
      
      public static const FIGHTPOWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AllServerRankArena_Opponent.fightPower","fightPower",10 << 3 | WireType.VARINT);
       
      
      private var roleId$field:Int64;
      
      private var zoneId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var name$field:String;
      
      private var uin$field:uint;
      
      private var level$field:uint;
      
      private var qqFaceURL$field:String;
      
      private var attackWin$field:uint;
      
      private var defenceWin$field:uint;
      
      private var rank$field:uint;
      
      private var fightPower$field:uint;
      
      public function Dto_AllServerRankArena_Opponent()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_AllServerRankArena_Opponent.$MessageID;
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
      
      public function clearZoneId() : void
      {
         this.hasField$0 &= 4294967294;
         this.zoneId$field = new uint();
      }
      
      public function get hasZoneId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set zoneId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.zoneId$field = param1;
      }
      
      public function get zoneId() : uint
      {
         return this.zoneId$field;
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
      
      public function clearUin() : void
      {
         this.hasField$0 &= 4294967293;
         this.uin$field = new uint();
      }
      
      public function get hasUin() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set uin(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.uin$field = param1;
      }
      
      public function get uin() : uint
      {
         return this.uin$field;
      }
      
      public function clearLevel() : void
      {
         this.hasField$0 &= 4294967291;
         this.level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         this.hasField$0 |= 4;
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
      
      public function clearAttackWin() : void
      {
         this.hasField$0 &= 4294967287;
         this.attackWin$field = new uint();
      }
      
      public function get hasAttackWin() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set attackWin(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.attackWin$field = param1;
      }
      
      public function get attackWin() : uint
      {
         return this.attackWin$field;
      }
      
      public function clearDefenceWin() : void
      {
         this.hasField$0 &= 4294967279;
         this.defenceWin$field = new uint();
      }
      
      public function get hasDefenceWin() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set defenceWin(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.defenceWin$field = param1;
      }
      
      public function get defenceWin() : uint
      {
         return this.defenceWin$field;
      }
      
      public function clearRank() : void
      {
         this.hasField$0 &= 4294967263;
         this.rank$field = new uint();
      }
      
      public function get hasRank() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set rank(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.rank$field = param1;
      }
      
      public function get rank() : uint
      {
         return this.rank$field;
      }
      
      public function clearFightPower() : void
      {
         this.hasField$0 &= 4294967231;
         this.fightPower$field = new uint();
      }
      
      public function get hasFightPower() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set fightPower(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.fightPower$field = param1;
      }
      
      public function get fightPower() : uint
      {
         return this.fightPower$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasZoneId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.zoneId$field);
         }
         if(this.hasName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.name$field);
         }
         if(this.hasUin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.uin$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasQqFaceURL)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_STRING(param1,this.qqFaceURL$field);
         }
         if(this.hasAttackWin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.attackWin$field);
         }
         if(this.hasDefenceWin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.defenceWin$field);
         }
         if(this.hasRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.rank$field);
         }
         if(this.hasFightPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.fightPower$field);
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
                     throw new IOError("Bad data format: Dto_AllServerRankArena_Opponent.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerRankArena_Opponent.zoneId cannot be set twice.");
                  }
                  _loc4_++;
                  this.zoneId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerRankArena_Opponent.name cannot be set twice.");
                  }
                  _loc5_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerRankArena_Opponent.uin cannot be set twice.");
                  }
                  _loc6_++;
                  this.uin = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerRankArena_Opponent.level cannot be set twice.");
                  }
                  _loc7_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerRankArena_Opponent.qqFaceURL cannot be set twice.");
                  }
                  _loc8_++;
                  this.qqFaceURL = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerRankArena_Opponent.attackWin cannot be set twice.");
                  }
                  _loc9_++;
                  this.attackWin = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerRankArena_Opponent.defenceWin cannot be set twice.");
                  }
                  _loc10_++;
                  this.defenceWin = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerRankArena_Opponent.rank cannot be set twice.");
                  }
                  _loc11_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AllServerRankArena_Opponent.fightPower cannot be set twice.");
                  }
                  _loc12_++;
                  this.fightPower = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc13_);
                  break;
            }
         }
      }
   }
}
