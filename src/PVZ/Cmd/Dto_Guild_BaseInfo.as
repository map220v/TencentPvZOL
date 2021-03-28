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
   
   public final class Dto_Guild_BaseInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Guild_BaseInfo";
      
      public static const GUILDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_Guild_BaseInfo.guildId","guildId",1 << 3 | WireType.VARINT);
      
      public static const GUILDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Guild_BaseInfo.guildName","guildName",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_BaseInfo.level","level",3 << 3 | WireType.VARINT);
      
      public static const MEMBERNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_BaseInfo.memberNum","memberNum",4 << 3 | WireType.VARINT);
      
      public static const MEMBERMAX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_BaseInfo.memberMax","memberMax",5 << 3 | WireType.VARINT);
      
      public static const LEADERID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_Guild_BaseInfo.leaderId","leaderId",6 << 3 | WireType.VARINT);
      
      public static const LEADERNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Guild_BaseInfo.leaderName","leaderName",7 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const MANIFESTO:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Guild_BaseInfo.manifesto","manifesto",8 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const FLAGINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Guild_BaseInfo.flagInfo","flagInfo",9 << 3 | WireType.LENGTH_DELIMITED,Dto_Guild_FlagInfo);
       
      
      private var guildId$field:Int64;
      
      private var guildName$field:String;
      
      private var level$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var memberNum$field:uint;
      
      private var memberMax$field:uint;
      
      private var leaderId$field:Int64;
      
      private var leaderName$field:String;
      
      private var manifesto$field:String;
      
      private var flagInfo$field:Dto_Guild_FlagInfo;
      
      public function Dto_Guild_BaseInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Guild_BaseInfo.$MessageID;
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
      
      public function clearLevel() : void
      {
         this.hasField$0 &= 4294967294;
         this.level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.level$field = param1;
      }
      
      public function get level() : uint
      {
         return this.level$field;
      }
      
      public function clearMemberNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.memberNum$field = new uint();
      }
      
      public function get hasMemberNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set memberNum(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.memberNum$field = param1;
      }
      
      public function get memberNum() : uint
      {
         return this.memberNum$field;
      }
      
      public function clearMemberMax() : void
      {
         this.hasField$0 &= 4294967291;
         this.memberMax$field = new uint();
      }
      
      public function get hasMemberMax() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set memberMax(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.memberMax$field = param1;
      }
      
      public function get memberMax() : uint
      {
         return this.memberMax$field;
      }
      
      public function clearLeaderId() : void
      {
         this.leaderId$field = null;
      }
      
      public function get hasLeaderId() : Boolean
      {
         return this.leaderId$field != null;
      }
      
      public function set leaderId(param1:Int64) : void
      {
         this.leaderId$field = param1;
      }
      
      public function get leaderId() : Int64
      {
         return this.leaderId$field;
      }
      
      public function clearLeaderName() : void
      {
         this.leaderName$field = null;
      }
      
      public function get hasLeaderName() : Boolean
      {
         return this.leaderName$field != null;
      }
      
      public function set leaderName(param1:String) : void
      {
         this.leaderName$field = param1;
      }
      
      public function get leaderName() : String
      {
         return this.leaderName$field;
      }
      
      public function clearManifesto() : void
      {
         this.manifesto$field = null;
      }
      
      public function get hasManifesto() : Boolean
      {
         return this.manifesto$field != null;
      }
      
      public function set manifesto(param1:String) : void
      {
         this.manifesto$field = param1;
      }
      
      public function get manifesto() : String
      {
         return this.manifesto$field;
      }
      
      public function clearFlagInfo() : void
      {
         this.flagInfo$field = null;
      }
      
      public function get hasFlagInfo() : Boolean
      {
         return this.flagInfo$field != null;
      }
      
      public function set flagInfo(param1:Dto_Guild_FlagInfo) : void
      {
         this.flagInfo$field = param1;
      }
      
      public function get flagInfo() : Dto_Guild_FlagInfo
      {
         return this.flagInfo$field;
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
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasMemberNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.memberNum$field);
         }
         if(this.hasMemberMax)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.memberMax$field);
         }
         if(this.hasLeaderId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_INT64(param1,this.leaderId$field);
         }
         if(this.hasLeaderName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_STRING(param1,this.leaderName$field);
         }
         if(this.hasManifesto)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_STRING(param1,this.manifesto$field);
         }
         if(this.hasFlagInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_MESSAGE(param1,this.flagInfo$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc12_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc12_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc12_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_BaseInfo.guildId cannot be set twice.");
                  }
                  _loc3_++;
                  this.guildId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_BaseInfo.guildName cannot be set twice.");
                  }
                  _loc4_++;
                  this.guildName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_BaseInfo.level cannot be set twice.");
                  }
                  _loc5_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_BaseInfo.memberNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.memberNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_BaseInfo.memberMax cannot be set twice.");
                  }
                  _loc7_++;
                  this.memberMax = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_BaseInfo.leaderId cannot be set twice.");
                  }
                  _loc8_++;
                  this.leaderId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_BaseInfo.leaderName cannot be set twice.");
                  }
                  _loc9_++;
                  this.leaderName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_BaseInfo.manifesto cannot be set twice.");
                  }
                  _loc10_++;
                  this.manifesto = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_BaseInfo.flagInfo cannot be set twice.");
                  }
                  _loc11_++;
                  this.flagInfo = new Dto_Guild_FlagInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.flagInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc12_);
                  break;
            }
         }
      }
   }
}
