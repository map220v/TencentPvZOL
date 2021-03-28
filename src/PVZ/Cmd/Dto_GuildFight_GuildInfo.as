package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_GuildFight_GuildInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_GuildFight_GuildInfo";
      
      public static const GUILDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_GuildFight_GuildInfo.guildId","guildId",1 << 3 | WireType.VARINT);
      
      public static const GUILDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_GuildFight_GuildInfo.guildName","guildName",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const GUILDLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_GuildInfo.guildLevel","guildLevel",3 << 3 | WireType.VARINT);
      
      public static const JOINNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_GuildInfo.joinNum","joinNum",4 << 3 | WireType.VARINT);
      
      public static const TOTALNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_GuildInfo.totalNum","totalNum",5 << 3 | WireType.VARINT);
      
      public static const TOTALPOWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_GuildInfo.totalPower","totalPower",6 << 3 | WireType.VARINT);
      
      public static const CREDITS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_GuildInfo.credits","credits",7 << 3 | WireType.VARINT);
      
      public static const FINALISTSTATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_GuildInfo.finalistState","finalistState",8 << 3 | WireType.VARINT);
      
      public static const ISWIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_GuildFight_GuildInfo.isWin","isWin",20 << 3 | WireType.VARINT);
      
      public static const CLASHID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_GuildInfo.clashId","clashId",21 << 3 | WireType.VARINT);
      
      public static const WINNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_GuildInfo.winNum","winNum",30 << 3 | WireType.VARINT);
      
      public static const BETNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_GuildInfo.betNum","betNum",31 << 3 | WireType.VARINT);
      
      public static const GUILDFLAGINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_GuildFight_GuildInfo.guildFlagInfo","guildFlagInfo",40 << 3 | WireType.LENGTH_DELIMITED,Dto_Guild_FlagInfo);
       
      
      private var guildId$field:Int64;
      
      private var guildName$field:String;
      
      private var guildLevel$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var joinNum$field:uint;
      
      private var totalNum$field:uint;
      
      private var totalPower$field:uint;
      
      private var credits$field:uint;
      
      private var finalistState$field:uint;
      
      private var isWin$field:Boolean;
      
      private var clashId$field:uint;
      
      private var winNum$field:uint;
      
      private var betNum$field:uint;
      
      private var guildFlagInfo$field:Dto_Guild_FlagInfo;
      
      public function Dto_GuildFight_GuildInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_GuildFight_GuildInfo.$MessageID;
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
      
      public function clearGuildLevel() : void
      {
         this.hasField$0 &= 4294967294;
         this.guildLevel$field = new uint();
      }
      
      public function get hasGuildLevel() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set guildLevel(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.guildLevel$field = param1;
      }
      
      public function get guildLevel() : uint
      {
         return this.guildLevel$field;
      }
      
      public function clearJoinNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.joinNum$field = new uint();
      }
      
      public function get hasJoinNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set joinNum(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.joinNum$field = param1;
      }
      
      public function get joinNum() : uint
      {
         return this.joinNum$field;
      }
      
      public function clearTotalNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.totalNum$field = new uint();
      }
      
      public function get hasTotalNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set totalNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.totalNum$field = param1;
      }
      
      public function get totalNum() : uint
      {
         return this.totalNum$field;
      }
      
      public function clearTotalPower() : void
      {
         this.hasField$0 &= 4294967287;
         this.totalPower$field = new uint();
      }
      
      public function get hasTotalPower() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set totalPower(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.totalPower$field = param1;
      }
      
      public function get totalPower() : uint
      {
         return this.totalPower$field;
      }
      
      public function clearCredits() : void
      {
         this.hasField$0 &= 4294967279;
         this.credits$field = new uint();
      }
      
      public function get hasCredits() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set credits(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.credits$field = param1;
      }
      
      public function get credits() : uint
      {
         return this.credits$field;
      }
      
      public function clearFinalistState() : void
      {
         this.hasField$0 &= 4294967263;
         this.finalistState$field = new uint();
      }
      
      public function get hasFinalistState() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set finalistState(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.finalistState$field = param1;
      }
      
      public function get finalistState() : uint
      {
         return this.finalistState$field;
      }
      
      public function clearIsWin() : void
      {
         this.hasField$0 &= 4294967231;
         this.isWin$field = new Boolean();
      }
      
      public function get hasIsWin() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set isWin(param1:Boolean) : void
      {
         this.hasField$0 |= 64;
         this.isWin$field = param1;
      }
      
      public function get isWin() : Boolean
      {
         return this.isWin$field;
      }
      
      public function clearClashId() : void
      {
         this.hasField$0 &= 4294967167;
         this.clashId$field = new uint();
      }
      
      public function get hasClashId() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set clashId(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.clashId$field = param1;
      }
      
      public function get clashId() : uint
      {
         return this.clashId$field;
      }
      
      public function clearWinNum() : void
      {
         this.hasField$0 &= 4294967039;
         this.winNum$field = new uint();
      }
      
      public function get hasWinNum() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set winNum(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.winNum$field = param1;
      }
      
      public function get winNum() : uint
      {
         return this.winNum$field;
      }
      
      public function clearBetNum() : void
      {
         this.hasField$0 &= 4294966783;
         this.betNum$field = new uint();
      }
      
      public function get hasBetNum() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set betNum(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.betNum$field = param1;
      }
      
      public function get betNum() : uint
      {
         return this.betNum$field;
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
         if(this.hasGuildLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.guildLevel$field);
         }
         if(this.hasJoinNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.joinNum$field);
         }
         if(this.hasTotalNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.totalNum$field);
         }
         if(this.hasTotalPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.totalPower$field);
         }
         if(this.hasCredits)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.credits$field);
         }
         if(this.hasFinalistState)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.finalistState$field);
         }
         if(this.hasIsWin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,20);
            WriteUtils.write$TYPE_BOOL(param1,this.isWin$field);
         }
         if(this.hasClashId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,21);
            WriteUtils.write$TYPE_UINT32(param1,this.clashId$field);
         }
         if(this.hasWinNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,30);
            WriteUtils.write$TYPE_UINT32(param1,this.winNum$field);
         }
         if(this.hasBetNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,31);
            WriteUtils.write$TYPE_UINT32(param1,this.betNum$field);
         }
         if(this.hasGuildFlagInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,40);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guildFlagInfo$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc16_:uint = 0;
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
         while(param1.bytesAvailable > param2)
         {
            _loc16_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc16_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_GuildInfo.guildId cannot be set twice.");
                  }
                  _loc3_++;
                  this.guildId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_GuildInfo.guildName cannot be set twice.");
                  }
                  _loc4_++;
                  this.guildName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_GuildInfo.guildLevel cannot be set twice.");
                  }
                  _loc5_++;
                  this.guildLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_GuildInfo.joinNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.joinNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_GuildInfo.totalNum cannot be set twice.");
                  }
                  _loc7_++;
                  this.totalNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_GuildInfo.totalPower cannot be set twice.");
                  }
                  _loc8_++;
                  this.totalPower = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_GuildInfo.credits cannot be set twice.");
                  }
                  _loc9_++;
                  this.credits = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_GuildInfo.finalistState cannot be set twice.");
                  }
                  _loc10_++;
                  this.finalistState = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 20:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_GuildInfo.isWin cannot be set twice.");
                  }
                  _loc11_++;
                  this.isWin = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 21:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_GuildInfo.clashId cannot be set twice.");
                  }
                  _loc12_++;
                  this.clashId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 30:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_GuildInfo.winNum cannot be set twice.");
                  }
                  _loc13_++;
                  this.winNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 31:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_GuildInfo.betNum cannot be set twice.");
                  }
                  _loc14_++;
                  this.betNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 40:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_GuildInfo.guildFlagInfo cannot be set twice.");
                  }
                  _loc15_++;
                  this.guildFlagInfo = new Dto_Guild_FlagInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.guildFlagInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc16_);
                  break;
            }
         }
      }
   }
}
