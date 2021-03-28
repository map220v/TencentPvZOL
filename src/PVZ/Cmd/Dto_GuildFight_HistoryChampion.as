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
   
   public final class Dto_GuildFight_HistoryChampion extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_GuildFight_HistoryChampion";
      
      public static const SEASON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_HistoryChampion.season","season",1 << 3 | WireType.VARINT);
      
      public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_HistoryChampion.time","time",2 << 3 | WireType.VARINT);
      
      public static const ZONEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_HistoryChampion.zoneId","zoneId",3 << 3 | WireType.VARINT);
      
      public static const GUILDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_GuildFight_HistoryChampion.guildId","guildId",4 << 3 | WireType.VARINT);
      
      public static const GUILDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_GuildFight_HistoryChampion.guildName","guildName",5 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const JOINNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_HistoryChampion.joinNum","joinNum",6 << 3 | WireType.VARINT);
      
      public static const TOTALNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_HistoryChampion.TotalNum","totalNum",7 << 3 | WireType.VARINT);
      
      public static const TOTALPOWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_HistoryChampion.TotalPower","totalPower",8 << 3 | WireType.VARINT);
       
      
      private var season$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var time$field:uint;
      
      private var zoneId$field:uint;
      
      private var guildId$field:Int64;
      
      private var guildName$field:String;
      
      private var joinNum$field:uint;
      
      private var TotalNum$field:uint;
      
      private var TotalPower$field:uint;
      
      public function Dto_GuildFight_HistoryChampion()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_GuildFight_HistoryChampion.$MessageID;
      }
      
      public function clearSeason() : void
      {
         this.hasField$0 &= 4294967294;
         this.season$field = new uint();
      }
      
      public function get hasSeason() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set season(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.season$field = param1;
      }
      
      public function get season() : uint
      {
         return this.season$field;
      }
      
      public function clearTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.time$field = new uint();
      }
      
      public function get hasTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set time(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.time$field = param1;
      }
      
      public function get time() : uint
      {
         return this.time$field;
      }
      
      public function clearZoneId() : void
      {
         this.hasField$0 &= 4294967291;
         this.zoneId$field = new uint();
      }
      
      public function get hasZoneId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set zoneId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.zoneId$field = param1;
      }
      
      public function get zoneId() : uint
      {
         return this.zoneId$field;
      }
      
      public function clearGuildId() : void
      {
         this.guildId$field = null;
      }
      
      public function get hasGuildId() : Boolean
      {
         return this.guildId$field != null;
      }
      
      public function set guildId(param1:Int64) : void
      {
         this.guildId$field = param1;
      }
      
      public function get guildId() : Int64
      {
         return this.guildId$field;
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
      
      public function clearJoinNum() : void
      {
         this.hasField$0 &= 4294967287;
         this.joinNum$field = new uint();
      }
      
      public function get hasJoinNum() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set joinNum(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.joinNum$field = param1;
      }
      
      public function get joinNum() : uint
      {
         return this.joinNum$field;
      }
      
      public function clearTotalNum() : void
      {
         this.hasField$0 &= 4294967279;
         this.TotalNum$field = new uint();
      }
      
      public function get hasTotalNum() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set totalNum(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.TotalNum$field = param1;
      }
      
      public function get totalNum() : uint
      {
         return this.TotalNum$field;
      }
      
      public function clearTotalPower() : void
      {
         this.hasField$0 &= 4294967263;
         this.TotalPower$field = new uint();
      }
      
      public function get hasTotalPower() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set totalPower(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.TotalPower$field = param1;
      }
      
      public function get totalPower() : uint
      {
         return this.TotalPower$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasSeason)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.season$field);
         }
         if(this.hasTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.time$field);
         }
         if(this.hasZoneId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.zoneId$field);
         }
         if(this.hasGuildId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_INT64(param1,this.guildId$field);
         }
         if(this.hasGuildName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_STRING(param1,this.guildName$field);
         }
         if(this.hasJoinNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.joinNum$field);
         }
         if(this.hasTotalNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.TotalNum$field);
         }
         if(this.hasTotalPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.TotalPower$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc11_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc11_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc11_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_HistoryChampion.season cannot be set twice.");
                  }
                  _loc3_++;
                  this.season = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_HistoryChampion.time cannot be set twice.");
                  }
                  _loc4_++;
                  this.time = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_HistoryChampion.zoneId cannot be set twice.");
                  }
                  _loc5_++;
                  this.zoneId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_HistoryChampion.guildId cannot be set twice.");
                  }
                  _loc6_++;
                  this.guildId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_HistoryChampion.guildName cannot be set twice.");
                  }
                  _loc7_++;
                  this.guildName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_HistoryChampion.joinNum cannot be set twice.");
                  }
                  _loc8_++;
                  this.joinNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_HistoryChampion.totalNum cannot be set twice.");
                  }
                  _loc9_++;
                  this.totalNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_HistoryChampion.totalPower cannot be set twice.");
                  }
                  _loc10_++;
                  this.totalPower = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc11_);
                  break;
            }
         }
      }
   }
}
