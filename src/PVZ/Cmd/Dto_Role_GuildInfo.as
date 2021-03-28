package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_INT64;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Role_GuildInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Role_GuildInfo";
      
      public static const GUILDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_Role_GuildInfo.guildId","guildId",1 << 3 | WireType.VARINT);
      
      public static const GUILDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Role_GuildInfo.guildName","guildName",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const INVITEDCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Role_GuildInfo.invitedCount","invitedCount",3 << 3 | WireType.VARINT);
      
      public static const LASTQUITTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Role_GuildInfo.lastQuitTime","lastQuitTime",4 << 3 | WireType.VARINT);
      
      public static const APPLYLIST:RepeatedFieldDescriptor$TYPE_INT64 = new RepeatedFieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_Role_GuildInfo.applyList","applyList",5 << 3 | WireType.VARINT);
      
      public static const GUILDPOSITION:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_Role_GuildInfo.guildPosition","guildPosition",6 << 3 | WireType.VARINT);
      
      public static const CONTRIB:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Role_GuildInfo.contrib","contrib",7 << 3 | WireType.VARINT);
      
      public static const FERTILIZERTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Role_GuildInfo.fertilizerTimes","fertilizerTimes",10 << 3 | WireType.VARINT);
      
      public static const GUILDLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Role_GuildInfo.guildLevel","guildLevel",11 << 3 | WireType.VARINT);
      
      public static const COHESION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Role_GuildInfo.cohesion","cohesion",12 << 3 | WireType.VARINT);
      
      public static const DAYCONTRIBCOIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Role_GuildInfo.dayContribCoin","dayContribCoin",13 << 3 | WireType.VARINT);
       
      
      private var guildId$field:Int64;
      
      private var guildName$field:String;
      
      private var invitedCount$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var lastQuitTime$field:uint;
      
      public var applyList:Array;
      
      private var guildPosition$field:int;
      
      private var contrib$field:uint;
      
      private var fertilizerTimes$field:uint;
      
      private var guildLevel$field:uint;
      
      private var cohesion$field:uint;
      
      private var dayContribCoin$field:uint;
      
      public function Dto_Role_GuildInfo()
      {
         this.applyList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Role_GuildInfo.$MessageID;
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
      
      public function clearInvitedCount() : void
      {
         this.hasField$0 &= 4294967294;
         this.invitedCount$field = new uint();
      }
      
      public function get hasInvitedCount() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set invitedCount(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.invitedCount$field = param1;
      }
      
      public function get invitedCount() : uint
      {
         return this.invitedCount$field;
      }
      
      public function clearLastQuitTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.lastQuitTime$field = new uint();
      }
      
      public function get hasLastQuitTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set lastQuitTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.lastQuitTime$field = param1;
      }
      
      public function get lastQuitTime() : uint
      {
         return this.lastQuitTime$field;
      }
      
      public function clearGuildPosition() : void
      {
         this.hasField$0 &= 4294967291;
         this.guildPosition$field = new int();
      }
      
      public function get hasGuildPosition() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set guildPosition(param1:int) : void
      {
         this.hasField$0 |= 4;
         this.guildPosition$field = param1;
      }
      
      public function get guildPosition() : int
      {
         return this.guildPosition$field;
      }
      
      public function clearContrib() : void
      {
         this.hasField$0 &= 4294967287;
         this.contrib$field = new uint();
      }
      
      public function get hasContrib() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set contrib(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.contrib$field = param1;
      }
      
      public function get contrib() : uint
      {
         return this.contrib$field;
      }
      
      public function clearFertilizerTimes() : void
      {
         this.hasField$0 &= 4294967279;
         this.fertilizerTimes$field = new uint();
      }
      
      public function get hasFertilizerTimes() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set fertilizerTimes(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.fertilizerTimes$field = param1;
      }
      
      public function get fertilizerTimes() : uint
      {
         return this.fertilizerTimes$field;
      }
      
      public function clearGuildLevel() : void
      {
         this.hasField$0 &= 4294967263;
         this.guildLevel$field = new uint();
      }
      
      public function get hasGuildLevel() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set guildLevel(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.guildLevel$field = param1;
      }
      
      public function get guildLevel() : uint
      {
         return this.guildLevel$field;
      }
      
      public function clearCohesion() : void
      {
         this.hasField$0 &= 4294967231;
         this.cohesion$field = new uint();
      }
      
      public function get hasCohesion() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set cohesion(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.cohesion$field = param1;
      }
      
      public function get cohesion() : uint
      {
         return this.cohesion$field;
      }
      
      public function clearDayContribCoin() : void
      {
         this.hasField$0 &= 4294967167;
         this.dayContribCoin$field = new uint();
      }
      
      public function get hasDayContribCoin() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set dayContribCoin(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.dayContribCoin$field = param1;
      }
      
      public function get dayContribCoin() : uint
      {
         return this.dayContribCoin$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
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
         if(this.hasInvitedCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.invitedCount$field);
         }
         if(this.hasLastQuitTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.lastQuitTime$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.applyList.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_INT64(param1,this.applyList[_loc2_]);
            _loc2_++;
         }
         if(this.hasGuildPosition)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_INT32(param1,this.guildPosition$field);
         }
         if(this.hasContrib)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.contrib$field);
         }
         if(this.hasFertilizerTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.fertilizerTimes$field);
         }
         if(this.hasGuildLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.guildLevel$field);
         }
         if(this.hasCohesion)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_UINT32(param1,this.cohesion$field);
         }
         if(this.hasDayContribCoin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,13);
            WriteUtils.write$TYPE_UINT32(param1,this.dayContribCoin$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Dto_Role_GuildInfo.guildId cannot be set twice.");
                  }
                  _loc3_++;
                  this.guildId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Role_GuildInfo.guildName cannot be set twice.");
                  }
                  _loc4_++;
                  this.guildName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Role_GuildInfo.invitedCount cannot be set twice.");
                  }
                  _loc5_++;
                  this.invitedCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Role_GuildInfo.lastQuitTime cannot be set twice.");
                  }
                  _loc6_++;
                  this.lastQuitTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if((_loc13_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_INT64,this.applyList);
                  }
                  else
                  {
                     this.applyList.push(ReadUtils.read$TYPE_INT64(param1));
                  }
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Role_GuildInfo.guildPosition cannot be set twice.");
                  }
                  _loc7_++;
                  this.guildPosition = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Role_GuildInfo.contrib cannot be set twice.");
                  }
                  _loc8_++;
                  this.contrib = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Role_GuildInfo.fertilizerTimes cannot be set twice.");
                  }
                  _loc9_++;
                  this.fertilizerTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Role_GuildInfo.guildLevel cannot be set twice.");
                  }
                  _loc10_++;
                  this.guildLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Role_GuildInfo.cohesion cannot be set twice.");
                  }
                  _loc11_++;
                  this.cohesion = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 13:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Role_GuildInfo.dayContribCoin cannot be set twice.");
                  }
                  _loc12_++;
                  this.dayContribCoin = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc13_);
                  break;
            }
         }
      }
   }
}
