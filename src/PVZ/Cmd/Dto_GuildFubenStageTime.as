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
   
   public final class Dto_GuildFubenStageTime extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_GuildFubenStageTime";
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFubenStageTime.rank","rank",1 << 3 | WireType.VARINT);
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_GuildFubenStageTime.roleid","roleid",2 << 3 | WireType.VARINT);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_GuildFubenStageTime.rolename","rolename",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFubenStageTime.level","level",4 << 3 | WireType.VARINT);
      
      public static const TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_GuildFubenStageTime.time","time",5 << 3 | WireType.VARINT);
      
      public static const GUILDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_GuildFubenStageTime.guildid","guildid",6 << 3 | WireType.VARINT);
      
      public static const GUILDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_GuildFubenStageTime.guildname","guildname",7 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const FORMATION:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_GuildFubenStageTime.formation","formation",8 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFubenStageFormation);
       
      
      private var rank$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var roleid$field:Int64;
      
      private var rolename$field:String;
      
      private var level$field:uint;
      
      private var time$field:Int64;
      
      private var guildid$field:Int64;
      
      private var guildname$field:String;
      
      public var formation:Array;
      
      public function Dto_GuildFubenStageTime()
      {
         this.formation = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_GuildFubenStageTime.$MessageID;
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
      
      public function clearRolename() : void
      {
         this.rolename$field = null;
      }
      
      public function get hasRolename() : Boolean
      {
         return this.rolename$field != null;
      }
      
      public function set rolename(param1:String) : void
      {
         this.rolename$field = param1;
      }
      
      public function get rolename() : String
      {
         return this.rolename$field;
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
      
      public function clearTime() : void
      {
         this.time$field = null;
      }
      
      public function get hasTime() : Boolean
      {
         return this.time$field != null;
      }
      
      public function set time(param1:Int64) : void
      {
         this.time$field = param1;
      }
      
      public function get time() : Int64
      {
         return this.time$field;
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
      
      public function clearGuildname() : void
      {
         this.guildname$field = null;
      }
      
      public function get hasGuildname() : Boolean
      {
         return this.guildname$field != null;
      }
      
      public function set guildname(param1:String) : void
      {
         this.guildname$field = param1;
      }
      
      public function get guildname() : String
      {
         return this.guildname$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.rank$field);
         }
         if(this.hasRoleid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.roleid$field);
         }
         if(this.hasRolename)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.rolename$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_INT64(param1,this.time$field);
         }
         if(this.hasGuildid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_INT64(param1,this.guildid$field);
         }
         if(this.hasGuildname)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_STRING(param1,this.guildname$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.formation.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.formation[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Dto_GuildFubenStageTime.rank cannot be set twice.");
                  }
                  _loc3_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFubenStageTime.roleid cannot be set twice.");
                  }
                  _loc4_++;
                  this.roleid = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFubenStageTime.rolename cannot be set twice.");
                  }
                  _loc5_++;
                  this.rolename = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFubenStageTime.level cannot be set twice.");
                  }
                  _loc6_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFubenStageTime.time cannot be set twice.");
                  }
                  _loc7_++;
                  this.time = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFubenStageTime.guildid cannot be set twice.");
                  }
                  _loc8_++;
                  this.guildid = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFubenStageTime.guildname cannot be set twice.");
                  }
                  _loc9_++;
                  this.guildname = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 8:
                  this.formation.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_GuildFubenStageFormation()));
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
