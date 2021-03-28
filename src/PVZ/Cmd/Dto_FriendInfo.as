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
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_FriendInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FriendInfo";
      
      public static const TYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FriendInfo.type","type",1 << 3 | WireType.VARINT);
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_FriendInfo.roleId","roleId",2 << 3 | WireType.VARINT);
      
      public static const ZONEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FriendInfo.zoneId","zoneId",3 << 3 | WireType.VARINT);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FriendInfo.name","name",4 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const FACEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FriendInfo.faceId","faceId",5 << 3 | WireType.VARINT);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FriendInfo.rank","rank",6 << 3 | WireType.VARINT);
      
      public static const ROLELEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FriendInfo.roleLevel","roleLevel",7 << 3 | WireType.VARINT);
      
      public static const PLANTINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FriendInfo.plantInfo","plantInfo",8 << 3 | WireType.LENGTH_DELIMITED,Dto_PlantInfo);
      
      public static const PASSTDNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FriendInfo.passTDNum","passTDNum",9 << 3 | WireType.VARINT);
      
      public static const STATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FriendInfo.status","status",10 << 3 | WireType.VARINT);
      
      public static const HELPPLANT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FriendInfo.helpPlant","helpPlant",11 << 3 | WireType.LENGTH_DELIMITED,Dto_CardFullInfo);
      
      public static const LEFTTIMES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FriendInfo.leftTimes","leftTimes",12 << 3 | WireType.LENGTH_DELIMITED,Dto_OperationLeftTimes);
      
      public static const ISFREE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_FriendInfo.isFree","isFree",13 << 3 | WireType.VARINT);
      
      public static const QQFACEURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FriendInfo.qqFaceURL","qqFaceURL",14 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const DIAMOND:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FriendInfo.diamond","diamond",15 << 3 | WireType.LENGTH_DELIMITED,Dto_DiamondInfo);
      
      public static const ISQQFRIEND:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_FriendInfo.isQQFriend","isQQFriend",16 << 3 | WireType.VARINT);
      
      public static const QQNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FriendInfo.qqName","qqName",17 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var type$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var roleId$field:Int64;
      
      private var zoneId$field:uint;
      
      private var name$field:String;
      
      private var faceId$field:uint;
      
      private var rank$field:uint;
      
      private var roleLevel$field:uint;
      
      private var plantInfo$field:Dto_PlantInfo;
      
      private var passTDNum$field:uint;
      
      private var status$field:uint;
      
      private var helpPlant$field:Dto_CardFullInfo;
      
      public var leftTimes:Array;
      
      private var isFree$field:Boolean;
      
      private var qqFaceURL$field:String;
      
      private var diamond$field:Dto_DiamondInfo;
      
      private var isQQFriend$field:Boolean;
      
      private var qqName$field:String;
      
      public function Dto_FriendInfo()
      {
         this.leftTimes = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FriendInfo.$MessageID;
      }
      
      public function clearType() : void
      {
         this.hasField$0 &= 4294967294;
         this.type$field = new uint();
      }
      
      public function get hasType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set type(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.type$field = param1;
      }
      
      public function get type() : uint
      {
         return this.type$field;
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
         this.hasField$0 &= 4294967293;
         this.zoneId$field = new uint();
      }
      
      public function get hasZoneId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set zoneId(param1:uint) : void
      {
         this.hasField$0 |= 2;
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
      
      public function clearFaceId() : void
      {
         this.hasField$0 &= 4294967291;
         this.faceId$field = new uint();
      }
      
      public function get hasFaceId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set faceId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.faceId$field = param1;
      }
      
      public function get faceId() : uint
      {
         return this.faceId$field;
      }
      
      public function clearRank() : void
      {
         this.hasField$0 &= 4294967287;
         this.rank$field = new uint();
      }
      
      public function get hasRank() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set rank(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.rank$field = param1;
      }
      
      public function get rank() : uint
      {
         return this.rank$field;
      }
      
      public function clearRoleLevel() : void
      {
         this.hasField$0 &= 4294967279;
         this.roleLevel$field = new uint();
      }
      
      public function get hasRoleLevel() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set roleLevel(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.roleLevel$field = param1;
      }
      
      public function get roleLevel() : uint
      {
         return this.roleLevel$field;
      }
      
      public function clearPlantInfo() : void
      {
         this.plantInfo$field = null;
      }
      
      public function get hasPlantInfo() : Boolean
      {
         return this.plantInfo$field != null;
      }
      
      public function set plantInfo(param1:Dto_PlantInfo) : void
      {
         this.plantInfo$field = param1;
      }
      
      public function get plantInfo() : Dto_PlantInfo
      {
         return this.plantInfo$field;
      }
      
      public function clearPassTDNum() : void
      {
         this.hasField$0 &= 4294967263;
         this.passTDNum$field = new uint();
      }
      
      public function get hasPassTDNum() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set passTDNum(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.passTDNum$field = param1;
      }
      
      public function get passTDNum() : uint
      {
         return this.passTDNum$field;
      }
      
      public function clearStatus() : void
      {
         this.hasField$0 &= 4294967231;
         this.status$field = new uint();
      }
      
      public function get hasStatus() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set status(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.status$field = param1;
      }
      
      public function get status() : uint
      {
         return this.status$field;
      }
      
      public function clearHelpPlant() : void
      {
         this.helpPlant$field = null;
      }
      
      public function get hasHelpPlant() : Boolean
      {
         return this.helpPlant$field != null;
      }
      
      public function set helpPlant(param1:Dto_CardFullInfo) : void
      {
         this.helpPlant$field = param1;
      }
      
      public function get helpPlant() : Dto_CardFullInfo
      {
         return this.helpPlant$field;
      }
      
      public function clearIsFree() : void
      {
         this.hasField$0 &= 4294967167;
         this.isFree$field = new Boolean();
      }
      
      public function get hasIsFree() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set isFree(param1:Boolean) : void
      {
         this.hasField$0 |= 128;
         this.isFree$field = param1;
      }
      
      public function get isFree() : Boolean
      {
         return this.isFree$field;
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
      
      public function clearDiamond() : void
      {
         this.diamond$field = null;
      }
      
      public function get hasDiamond() : Boolean
      {
         return this.diamond$field != null;
      }
      
      public function set diamond(param1:Dto_DiamondInfo) : void
      {
         this.diamond$field = param1;
      }
      
      public function get diamond() : Dto_DiamondInfo
      {
         return this.diamond$field;
      }
      
      public function clearIsQQFriend() : void
      {
         this.hasField$0 &= 4294967039;
         this.isQQFriend$field = new Boolean();
      }
      
      public function get hasIsQQFriend() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set isQQFriend(param1:Boolean) : void
      {
         this.hasField$0 |= 256;
         this.isQQFriend$field = param1;
      }
      
      public function get isQQFriend() : Boolean
      {
         return this.isQQFriend$field;
      }
      
      public function clearQqName() : void
      {
         this.qqName$field = null;
      }
      
      public function get hasQqName() : Boolean
      {
         return this.qqName$field != null;
      }
      
      public function set qqName(param1:String) : void
      {
         this.qqName$field = param1;
      }
      
      public function get qqName() : String
      {
         return this.qqName$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.type$field);
         }
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasZoneId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.zoneId$field);
         }
         if(this.hasName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_STRING(param1,this.name$field);
         }
         if(this.hasFaceId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.faceId$field);
         }
         if(this.hasRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.rank$field);
         }
         if(this.hasRoleLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.roleLevel$field);
         }
         if(this.hasPlantInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.plantInfo$field);
         }
         if(this.hasPassTDNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.passTDNum$field);
         }
         if(this.hasStatus)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.status$field);
         }
         if(this.hasHelpPlant)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,11);
            WriteUtils.write$TYPE_MESSAGE(param1,this.helpPlant$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.leftTimes.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,12);
            WriteUtils.write$TYPE_MESSAGE(param1,this.leftTimes[_loc2_]);
            _loc2_++;
         }
         if(this.hasIsFree)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,13);
            WriteUtils.write$TYPE_BOOL(param1,this.isFree$field);
         }
         if(this.hasQqFaceURL)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,14);
            WriteUtils.write$TYPE_STRING(param1,this.qqFaceURL$field);
         }
         if(this.hasDiamond)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,15);
            WriteUtils.write$TYPE_MESSAGE(param1,this.diamond$field);
         }
         if(this.hasIsQQFriend)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,16);
            WriteUtils.write$TYPE_BOOL(param1,this.isQQFriend$field);
         }
         if(this.hasQqName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,17);
            WriteUtils.write$TYPE_STRING(param1,this.qqName$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc19_:uint = 0;
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
         var _loc16_:uint = 0;
         var _loc17_:uint = 0;
         var _loc18_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc19_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc19_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendInfo.type cannot be set twice.");
                  }
                  _loc3_++;
                  this.type = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendInfo.roleId cannot be set twice.");
                  }
                  _loc4_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendInfo.zoneId cannot be set twice.");
                  }
                  _loc5_++;
                  this.zoneId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendInfo.name cannot be set twice.");
                  }
                  _loc6_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendInfo.faceId cannot be set twice.");
                  }
                  _loc7_++;
                  this.faceId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendInfo.rank cannot be set twice.");
                  }
                  _loc8_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendInfo.roleLevel cannot be set twice.");
                  }
                  _loc9_++;
                  this.roleLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendInfo.plantInfo cannot be set twice.");
                  }
                  _loc10_++;
                  this.plantInfo = new Dto_PlantInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.plantInfo);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendInfo.passTDNum cannot be set twice.");
                  }
                  _loc11_++;
                  this.passTDNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendInfo.status cannot be set twice.");
                  }
                  _loc12_++;
                  this.status = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendInfo.helpPlant cannot be set twice.");
                  }
                  _loc13_++;
                  this.helpPlant = new Dto_CardFullInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.helpPlant);
                  break;
               case 12:
                  this.leftTimes.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_OperationLeftTimes()));
                  break;
               case 13:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendInfo.isFree cannot be set twice.");
                  }
                  _loc14_++;
                  this.isFree = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 14:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendInfo.qqFaceURL cannot be set twice.");
                  }
                  _loc15_++;
                  this.qqFaceURL = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 15:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendInfo.diamond cannot be set twice.");
                  }
                  _loc16_++;
                  this.diamond = new Dto_DiamondInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.diamond);
                  break;
               case 16:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendInfo.isQQFriend cannot be set twice.");
                  }
                  _loc17_++;
                  this.isQQFriend = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 17:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendInfo.qqName cannot be set twice.");
                  }
                  _loc18_++;
                  this.qqName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc19_);
                  break;
            }
         }
      }
   }
}
