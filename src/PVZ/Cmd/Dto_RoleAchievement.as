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
   
   public final class Dto_RoleAchievement extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_RoleAchievement";
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RoleAchievement.rank","rank",1 << 3 | WireType.VARINT);
      
      public static const USERNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_RoleAchievement.username","username",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RoleAchievement.level","level",3 << 3 | WireType.VARINT);
      
      public static const ACHIEVEMENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RoleAchievement.achievement","achievement",4 << 3 | WireType.VARINT);
      
      public static const ACHIEVETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RoleAchievement.achievetime","achievetime",5 << 3 | WireType.VARINT);
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_RoleAchievement.roleid","roleid",6 << 3 | WireType.VARINT);
      
      public static const GUILDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_RoleAchievement.guildid","guildid",7 << 3 | WireType.VARINT);
       
      
      private var rank$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var username$field:String;
      
      private var level$field:uint;
      
      private var achievement$field:uint;
      
      private var achievetime$field:uint;
      
      private var roleid$field:Int64;
      
      private var guildid$field:Int64;
      
      public function Dto_RoleAchievement()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_RoleAchievement.$MessageID;
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
      
      public function clearUsername() : void
      {
         this.username$field = null;
      }
      
      public function get hasUsername() : Boolean
      {
         return this.username$field != null;
      }
      
      public function set username(param1:String) : void
      {
         this.username$field = param1;
      }
      
      public function get username() : String
      {
         return this.username$field;
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
      
      public function clearAchievement() : void
      {
         this.hasField$0 &= 4294967291;
         this.achievement$field = new uint();
      }
      
      public function get hasAchievement() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set achievement(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.achievement$field = param1;
      }
      
      public function get achievement() : uint
      {
         return this.achievement$field;
      }
      
      public function clearAchievetime() : void
      {
         this.hasField$0 &= 4294967287;
         this.achievetime$field = new uint();
      }
      
      public function get hasAchievetime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set achievetime(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.achievetime$field = param1;
      }
      
      public function get achievetime() : uint
      {
         return this.achievetime$field;
      }
      
      public function clearRoleid() : void
      {
         this.roleid$field = null;
      }
      
      public function get hasRoleid() : Boolean
      {
         return this.roleid$field != null;
      }
      
      public function set roleid(param1:Int64) : void
      {
         this.roleid$field = param1;
      }
      
      public function get roleid() : Int64
      {
         return this.roleid$field;
      }
      
      public function clearGuildid() : void
      {
         this.guildid$field = null;
      }
      
      public function get hasGuildid() : Boolean
      {
         return this.guildid$field != null;
      }
      
      public function set guildid(param1:Int64) : void
      {
         this.guildid$field = param1;
      }
      
      public function get guildid() : Int64
      {
         return this.guildid$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.rank$field);
         }
         if(this.hasUsername)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.username$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasAchievement)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.achievement$field);
         }
         if(this.hasAchievetime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.achievetime$field);
         }
         if(this.hasRoleid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_INT64(param1,this.roleid$field);
         }
         if(this.hasGuildid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_INT64(param1,this.guildid$field);
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
                     throw new IOError("Bad data format: Dto_RoleAchievement.rank cannot be set twice.");
                  }
                  _loc3_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RoleAchievement.username cannot be set twice.");
                  }
                  _loc4_++;
                  this.username = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RoleAchievement.level cannot be set twice.");
                  }
                  _loc5_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RoleAchievement.achievement cannot be set twice.");
                  }
                  _loc6_++;
                  this.achievement = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RoleAchievement.achievetime cannot be set twice.");
                  }
                  _loc7_++;
                  this.achievetime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RoleAchievement.roleid cannot be set twice.");
                  }
                  _loc8_++;
                  this.roleid = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RoleAchievement.guildid cannot be set twice.");
                  }
                  _loc9_++;
                  this.guildid = ReadUtils.read$TYPE_INT64(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
