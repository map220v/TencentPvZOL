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
   
   public final class Cmd_GuildFight_SetKnockout_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_GuildFight_SetKnockout_SC";
      
      public static const MYGUILDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_GuildFight_SetKnockout_SC.myGuildId","myGuildId",1 << 3 | WireType.VARINT);
      
      public static const MYGUILDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_GuildFight_SetKnockout_SC.myGuildName","myGuildName",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const MYGUILDFLAGINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GuildFight_SetKnockout_SC.myGuildFlagInfo","myGuildFlagInfo",3 << 3 | WireType.LENGTH_DELIMITED,Dto_Guild_FlagInfo);
      
      public static const UPWAYROLENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFight_SetKnockout_SC.upWayRoleNum","upWayRoleNum",4 << 3 | WireType.VARINT);
      
      public static const MIDDLEWAYROLENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFight_SetKnockout_SC.middleWayRoleNum","middleWayRoleNum",5 << 3 | WireType.VARINT);
      
      public static const DOWNWAYROLENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFight_SetKnockout_SC.downWayRoleNum","downWayRoleNum",6 << 3 | WireType.VARINT);
      
      public static const CYCLES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFight_SetKnockout_SC.cycles","cycles",7 << 3 | WireType.VARINT);
      
      public static const ISLEFT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_GuildFight_SetKnockout_SC.isLeft","isLeft",8 << 3 | WireType.VARINT);
      
      public static const MYWAY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFight_SetKnockout_SC.myWay","myWay",9 << 3 | WireType.VARINT);
      
      public static const OTHERGUILDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_GuildFight_SetKnockout_SC.otherGuildId","otherGuildId",10 << 3 | WireType.VARINT);
      
      public static const OTHERGUILDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_GuildFight_SetKnockout_SC.otherGuildName","otherGuildName",11 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const OTHERGUILDFLAGINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GuildFight_SetKnockout_SC.otherGuildflagInfo","otherGuildflagInfo",12 << 3 | WireType.LENGTH_DELIMITED,Dto_Guild_FlagInfo);
       
      
      private var myGuildId$field:Int64;
      
      private var myGuildName$field:String;
      
      private var myGuildFlagInfo$field:Dto_Guild_FlagInfo;
      
      private var upWayRoleNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var middleWayRoleNum$field:uint;
      
      private var downWayRoleNum$field:uint;
      
      private var cycles$field:uint;
      
      private var isLeft$field:Boolean;
      
      private var myWay$field:uint;
      
      private var otherGuildId$field:Int64;
      
      private var otherGuildName$field:String;
      
      private var otherGuildflagInfo$field:Dto_Guild_FlagInfo;
      
      public function Cmd_GuildFight_SetKnockout_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_GuildFight_SetKnockout_SC.$MessageID;
      }
      
      public function clearMyGuildId() : void
      {
         this.myGuildId$field = null;
      }
      
      public function get hasMyGuildId() : Boolean
      {
         return this.myGuildId$field != null;
      }
      
      public function set myGuildId(param1:Int64) : void
      {
         this.myGuildId$field = param1;
      }
      
      public function get myGuildId() : Int64
      {
         return this.myGuildId$field;
      }
      
      public function clearMyGuildName() : void
      {
         this.myGuildName$field = null;
      }
      
      public function get hasMyGuildName() : Boolean
      {
         return this.myGuildName$field != null;
      }
      
      public function set myGuildName(param1:String) : void
      {
         this.myGuildName$field = param1;
      }
      
      public function get myGuildName() : String
      {
         return this.myGuildName$field;
      }
      
      public function clearMyGuildFlagInfo() : void
      {
         this.myGuildFlagInfo$field = null;
      }
      
      public function get hasMyGuildFlagInfo() : Boolean
      {
         return this.myGuildFlagInfo$field != null;
      }
      
      public function set myGuildFlagInfo(param1:Dto_Guild_FlagInfo) : void
      {
         this.myGuildFlagInfo$field = param1;
      }
      
      public function get myGuildFlagInfo() : Dto_Guild_FlagInfo
      {
         return this.myGuildFlagInfo$field;
      }
      
      public function clearUpWayRoleNum() : void
      {
         this.hasField$0 &= 4294967294;
         this.upWayRoleNum$field = new uint();
      }
      
      public function get hasUpWayRoleNum() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set upWayRoleNum(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.upWayRoleNum$field = param1;
      }
      
      public function get upWayRoleNum() : uint
      {
         return this.upWayRoleNum$field;
      }
      
      public function clearMiddleWayRoleNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.middleWayRoleNum$field = new uint();
      }
      
      public function get hasMiddleWayRoleNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set middleWayRoleNum(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.middleWayRoleNum$field = param1;
      }
      
      public function get middleWayRoleNum() : uint
      {
         return this.middleWayRoleNum$field;
      }
      
      public function clearDownWayRoleNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.downWayRoleNum$field = new uint();
      }
      
      public function get hasDownWayRoleNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set downWayRoleNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.downWayRoleNum$field = param1;
      }
      
      public function get downWayRoleNum() : uint
      {
         return this.downWayRoleNum$field;
      }
      
      public function clearCycles() : void
      {
         this.hasField$0 &= 4294967287;
         this.cycles$field = new uint();
      }
      
      public function get hasCycles() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set cycles(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.cycles$field = param1;
      }
      
      public function get cycles() : uint
      {
         return this.cycles$field;
      }
      
      public function clearIsLeft() : void
      {
         this.hasField$0 &= 4294967279;
         this.isLeft$field = new Boolean();
      }
      
      public function get hasIsLeft() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set isLeft(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.isLeft$field = param1;
      }
      
      public function get isLeft() : Boolean
      {
         return this.isLeft$field;
      }
      
      public function clearMyWay() : void
      {
         this.hasField$0 &= 4294967263;
         this.myWay$field = new uint();
      }
      
      public function get hasMyWay() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set myWay(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.myWay$field = param1;
      }
      
      public function get myWay() : uint
      {
         return this.myWay$field;
      }
      
      public function clearOtherGuildId() : void
      {
         this.otherGuildId$field = null;
      }
      
      public function get hasOtherGuildId() : Boolean
      {
         return this.otherGuildId$field != null;
      }
      
      public function set otherGuildId(param1:Int64) : void
      {
         this.otherGuildId$field = param1;
      }
      
      public function get otherGuildId() : Int64
      {
         return this.otherGuildId$field;
      }
      
      public function clearOtherGuildName() : void
      {
         this.otherGuildName$field = null;
      }
      
      public function get hasOtherGuildName() : Boolean
      {
         return this.otherGuildName$field != null;
      }
      
      public function set otherGuildName(param1:String) : void
      {
         this.otherGuildName$field = param1;
      }
      
      public function get otherGuildName() : String
      {
         return this.otherGuildName$field;
      }
      
      public function clearOtherGuildflagInfo() : void
      {
         this.otherGuildflagInfo$field = null;
      }
      
      public function get hasOtherGuildflagInfo() : Boolean
      {
         return this.otherGuildflagInfo$field != null;
      }
      
      public function set otherGuildflagInfo(param1:Dto_Guild_FlagInfo) : void
      {
         this.otherGuildflagInfo$field = param1;
      }
      
      public function get otherGuildflagInfo() : Dto_Guild_FlagInfo
      {
         return this.otherGuildflagInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasMyGuildId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.myGuildId$field);
         }
         if(this.hasMyGuildName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.myGuildName$field);
         }
         if(this.hasMyGuildFlagInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.myGuildFlagInfo$field);
         }
         if(this.hasUpWayRoleNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.upWayRoleNum$field);
         }
         if(this.hasMiddleWayRoleNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.middleWayRoleNum$field);
         }
         if(this.hasDownWayRoleNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.downWayRoleNum$field);
         }
         if(this.hasCycles)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.cycles$field);
         }
         if(this.hasIsLeft)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_BOOL(param1,this.isLeft$field);
         }
         if(this.hasMyWay)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.myWay$field);
         }
         if(this.hasOtherGuildId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_INT64(param1,this.otherGuildId$field);
         }
         if(this.hasOtherGuildName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,11);
            WriteUtils.write$TYPE_STRING(param1,this.otherGuildName$field);
         }
         if(this.hasOtherGuildflagInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,12);
            WriteUtils.write$TYPE_MESSAGE(param1,this.otherGuildflagInfo$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc15_:uint = 0;
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
         while(param1.bytesAvailable > param2)
         {
            _loc15_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc15_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_SetKnockout_SC.myGuildId cannot be set twice.");
                  }
                  _loc3_++;
                  this.myGuildId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_SetKnockout_SC.myGuildName cannot be set twice.");
                  }
                  _loc4_++;
                  this.myGuildName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_SetKnockout_SC.myGuildFlagInfo cannot be set twice.");
                  }
                  _loc5_++;
                  this.myGuildFlagInfo = new Dto_Guild_FlagInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.myGuildFlagInfo);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_SetKnockout_SC.upWayRoleNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.upWayRoleNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_SetKnockout_SC.middleWayRoleNum cannot be set twice.");
                  }
                  _loc7_++;
                  this.middleWayRoleNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_SetKnockout_SC.downWayRoleNum cannot be set twice.");
                  }
                  _loc8_++;
                  this.downWayRoleNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_SetKnockout_SC.cycles cannot be set twice.");
                  }
                  _loc9_++;
                  this.cycles = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_SetKnockout_SC.isLeft cannot be set twice.");
                  }
                  _loc10_++;
                  this.isLeft = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_SetKnockout_SC.myWay cannot be set twice.");
                  }
                  _loc11_++;
                  this.myWay = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_SetKnockout_SC.otherGuildId cannot be set twice.");
                  }
                  _loc12_++;
                  this.otherGuildId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_SetKnockout_SC.otherGuildName cannot be set twice.");
                  }
                  _loc13_++;
                  this.otherGuildName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 12:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_SetKnockout_SC.otherGuildflagInfo cannot be set twice.");
                  }
                  _loc14_++;
                  this.otherGuildflagInfo = new Dto_Guild_FlagInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.otherGuildflagInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc15_);
                  break;
            }
         }
      }
   }
}
