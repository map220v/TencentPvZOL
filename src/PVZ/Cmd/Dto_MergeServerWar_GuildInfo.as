package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_MergeServerWar_GuildInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_MergeServerWar_GuildInfo";
      
      public static const GUILDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_MergeServerWar_GuildInfo.guildId","guildId",1 << 3 | WireType.VARINT);
      
      public static const GUILDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_MergeServerWar_GuildInfo.guildName","guildName",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const CIRCUSNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MergeServerWar_GuildInfo.circusNum","circusNum",3 << 3 | WireType.VARINT);
      
      public static const PLAYGROUNDNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MergeServerWar_GuildInfo.playGroundNum","playGroundNum",4 << 3 | WireType.VARINT);
      
      public static const TODAYTOTAL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MergeServerWar_GuildInfo.todayTotal","todayTotal",5 << 3 | WireType.VARINT);
      
      public static const ALLTOTAL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_MergeServerWar_GuildInfo.allTotal","allTotal",6 << 3 | WireType.VARINT);
      
      public static const GUILDFLAGINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_MergeServerWar_GuildInfo.guildFlagInfo","guildFlagInfo",7 << 3 | WireType.LENGTH_DELIMITED,Dto_Guild_FlagInfo);
       
      
      private var guildId$field:Int64;
      
      private var guildName$field:String;
      
      private var circusNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var playGroundNum$field:uint;
      
      private var todayTotal$field:uint;
      
      private var allTotal$field:uint;
      
      private var guildFlagInfo$field:Dto_Guild_FlagInfo;
      
      public function Dto_MergeServerWar_GuildInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_MergeServerWar_GuildInfo.$MessageID;
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
      
      public function clearCircusNum() : void
      {
         this.hasField$0 &= 4294967294;
         this.circusNum$field = new uint();
      }
      
      public function get hasCircusNum() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set circusNum(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.circusNum$field = param1;
      }
      
      public function get circusNum() : uint
      {
         return this.circusNum$field;
      }
      
      public function clearPlayGroundNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.playGroundNum$field = new uint();
      }
      
      public function get hasPlayGroundNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set playGroundNum(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.playGroundNum$field = param1;
      }
      
      public function get playGroundNum() : uint
      {
         return this.playGroundNum$field;
      }
      
      public function clearTodayTotal() : void
      {
         this.hasField$0 &= 4294967291;
         this.todayTotal$field = new uint();
      }
      
      public function get hasTodayTotal() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set todayTotal(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.todayTotal$field = param1;
      }
      
      public function get todayTotal() : uint
      {
         return this.todayTotal$field;
      }
      
      public function clearAllTotal() : void
      {
         this.hasField$0 &= 4294967287;
         this.allTotal$field = new uint();
      }
      
      public function get hasAllTotal() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set allTotal(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.allTotal$field = param1;
      }
      
      public function get allTotal() : uint
      {
         return this.allTotal$field;
      }
      
      public function clearGuildFlagInfo() : void
      {
         this.guildFlagInfo$field = null;
      }
      
      public function get hasGuildFlagInfo() : Boolean
      {
         return this.guildFlagInfo$field != null;
      }
      
      public function set guildFlagInfo(param1:Dto_Guild_FlagInfo) : void
      {
         this.guildFlagInfo$field = param1;
      }
      
      public function get guildFlagInfo() : Dto_Guild_FlagInfo
      {
         return this.guildFlagInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasGuildId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.guildId$field);
         }
         if(this.hasGuildName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.guildName$field);
         }
         if(this.hasCircusNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.circusNum$field);
         }
         if(this.hasPlayGroundNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.playGroundNum$field);
         }
         if(this.hasTodayTotal)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.todayTotal$field);
         }
         if(this.hasAllTotal)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.allTotal$field);
         }
         if(this.hasGuildFlagInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guildFlagInfo$field);
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
                     throw new IOError("Bad data format: Dto_MergeServerWar_GuildInfo.guildId cannot be set twice.");
                  }
                  _loc3_++;
                  this.guildId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MergeServerWar_GuildInfo.guildName cannot be set twice.");
                  }
                  _loc4_++;
                  this.guildName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MergeServerWar_GuildInfo.circusNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.circusNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MergeServerWar_GuildInfo.playGroundNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.playGroundNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MergeServerWar_GuildInfo.todayTotal cannot be set twice.");
                  }
                  _loc7_++;
                  this.todayTotal = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MergeServerWar_GuildInfo.allTotal cannot be set twice.");
                  }
                  _loc8_++;
                  this.allTotal = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_MergeServerWar_GuildInfo.guildFlagInfo cannot be set twice.");
                  }
                  _loc9_++;
                  this.guildFlagInfo = new Dto_Guild_FlagInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.guildFlagInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
