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
   
   public final class Dto_GuildFubenUsedTime extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_GuildFubenUsedTime";
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFubenUsedTime.rank","rank",1 << 3 | WireType.VARINT);
      
      public static const GUILDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_GuildFubenUsedTime.guildid","guildid",2 << 3 | WireType.VARINT);
      
      public static const GUILDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_GuildFubenUsedTime.guildname","guildname",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const FIGHTPOWER:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_GuildFubenUsedTime.fightPower","fightPower",4 << 3 | WireType.VARINT);
      
      public static const USEDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFubenUsedTime.usedtime","usedtime",5 << 3 | WireType.VARINT);
       
      
      private var rank$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var guildid$field:Int64;
      
      private var guildname$field:String;
      
      private var fightPower$field:Int64;
      
      private var usedtime$field:uint;
      
      public function Dto_GuildFubenUsedTime()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_GuildFubenUsedTime.$MessageID;
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
      
      public function clearFightPower() : void
      {
         this.fightPower$field = null;
      }
      
      public function get hasFightPower() : Boolean
      {
         return this.fightPower$field != null;
      }
      
      public function set fightPower(param1:Int64) : void
      {
         this.fightPower$field = param1;
      }
      
      public function get fightPower() : Int64
      {
         return this.fightPower$field;
      }
      
      public function clearUsedtime() : void
      {
         this.hasField$0 &= 4294967293;
         this.usedtime$field = new uint();
      }
      
      public function get hasUsedtime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set usedtime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.usedtime$field = param1;
      }
      
      public function get usedtime() : uint
      {
         return this.usedtime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.rank$field);
         }
         if(this.hasGuildid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.guildid$field);
         }
         if(this.hasGuildname)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.guildname$field);
         }
         if(this.hasFightPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_INT64(param1,this.fightPower$field);
         }
         if(this.hasUsedtime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.usedtime$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFubenUsedTime.rank cannot be set twice.");
                  }
                  _loc3_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFubenUsedTime.guildid cannot be set twice.");
                  }
                  _loc4_++;
                  this.guildid = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFubenUsedTime.guildname cannot be set twice.");
                  }
                  _loc5_++;
                  this.guildname = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFubenUsedTime.fightPower cannot be set twice.");
                  }
                  _loc6_++;
                  this.fightPower = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFubenUsedTime.usedtime cannot be set twice.");
                  }
                  _loc7_++;
                  this.usedtime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
