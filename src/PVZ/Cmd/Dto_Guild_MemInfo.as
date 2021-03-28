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
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Guild_MemInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Guild_MemInfo";
      
      public static const MEMBERID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_Guild_MemInfo.memberId","memberId",1 << 3 | WireType.VARINT);
      
      public static const MEMBERNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Guild_MemInfo.memberName","memberName",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const POSITION:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_Guild_MemInfo.position","position",3 << 3 | WireType.VARINT);
      
      public static const CONTRIB:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_MemInfo.contrib","contrib",4 << 3 | WireType.VARINT);
      
      public static const OFFLINETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_MemInfo.offlineTime","offlineTime",5 << 3 | WireType.VARINT);
      
      public static const DAYCONTRIB:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_MemInfo.dayContrib","dayContrib",6 << 3 | WireType.VARINT);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_MemInfo.level","level",7 << 3 | WireType.VARINT);
      
      public static const FACEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_MemInfo.faceId","faceId",8 << 3 | WireType.VARINT);
      
      public static const FIGHTPOWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_MemInfo.fightPower","fightPower",9 << 3 | WireType.VARINT);
      
      public static const QQFACEURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Guild_MemInfo.qqFaceURL","qqFaceURL",10 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const COHESION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guild_MemInfo.cohesion","cohesion",11 << 3 | WireType.VARINT);
       
      
      private var memberId$field:Int64;
      
      private var memberName$field:String;
      
      private var position$field:int;
      
      private var hasField$0:uint = 0;
      
      private var contrib$field:uint;
      
      private var offlineTime$field:uint;
      
      private var dayContrib$field:uint;
      
      private var level$field:uint;
      
      private var faceId$field:uint;
      
      private var fightPower$field:uint;
      
      private var qqFaceURL$field:String;
      
      private var cohesion$field:uint;
      
      public function Dto_Guild_MemInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Guild_MemInfo.$MessageID;
      }
      
      public function clearMemberId() : void
      {
         this.memberId$field = null;
      }
      
      public function get hasMemberId() : Boolean
      {
         return this.memberId$field != null;
      }
      
      public function set memberId(param1:Int64) : void
      {
         this.memberId$field = param1;
      }
      
      public function get memberId() : Int64
      {
         return this.memberId$field;
      }
      
      public function clearMemberName() : void
      {
         this.memberName$field = null;
      }
      
      public function get hasMemberName() : Boolean
      {
         return this.memberName$field != null;
      }
      
      public function set memberName(param1:String) : void
      {
         this.memberName$field = param1;
      }
      
      public function get memberName() : String
      {
         return this.memberName$field;
      }
      
      public function clearPosition() : void
      {
         this.hasField$0 &= 4294967294;
         this.position$field = new int();
      }
      
      public function get hasPosition() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set position(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.position$field = param1;
      }
      
      public function get position() : int
      {
         return this.position$field;
      }
      
      public function clearContrib() : void
      {
         this.hasField$0 &= 4294967293;
         this.contrib$field = new uint();
      }
      
      public function get hasContrib() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set contrib(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.contrib$field = param1;
      }
      
      public function get contrib() : uint
      {
         return this.contrib$field;
      }
      
      public function clearOfflineTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.offlineTime$field = new uint();
      }
      
      public function get hasOfflineTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set offlineTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.offlineTime$field = param1;
      }
      
      public function get offlineTime() : uint
      {
         return this.offlineTime$field;
      }
      
      public function clearDayContrib() : void
      {
         this.hasField$0 &= 4294967287;
         this.dayContrib$field = new uint();
      }
      
      public function get hasDayContrib() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set dayContrib(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.dayContrib$field = param1;
      }
      
      public function get dayContrib() : uint
      {
         return this.dayContrib$field;
      }
      
      public function clearLevel() : void
      {
         this.hasField$0 &= 4294967279;
         this.level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.level$field = param1;
      }
      
      public function get level() : uint
      {
         return this.level$field;
      }
      
      public function clearFaceId() : void
      {
         this.hasField$0 &= 4294967263;
         this.faceId$field = new uint();
      }
      
      public function get hasFaceId() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set faceId(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.faceId$field = param1;
      }
      
      public function get faceId() : uint
      {
         return this.faceId$field;
      }
      
      public function clearFightPower() : void
      {
         this.hasField$0 &= 4294967231;
         this.fightPower$field = new uint();
      }
      
      public function get hasFightPower() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set fightPower(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.fightPower$field = param1;
      }
      
      public function get fightPower() : uint
      {
         return this.fightPower$field;
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
      
      public function clearCohesion() : void
      {
         this.hasField$0 &= 4294967167;
         this.cohesion$field = new uint();
      }
      
      public function get hasCohesion() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set cohesion(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.cohesion$field = param1;
      }
      
      public function get cohesion() : uint
      {
         return this.cohesion$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasMemberId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.memberId$field);
         }
         if(this.hasMemberName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.memberName$field);
         }
         if(this.hasPosition)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_INT32(param1,this.position$field);
         }
         if(this.hasContrib)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.contrib$field);
         }
         if(this.hasOfflineTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.offlineTime$field);
         }
         if(this.hasDayContrib)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.dayContrib$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasFaceId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.faceId$field);
         }
         if(this.hasFightPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.fightPower$field);
         }
         if(this.hasQqFaceURL)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,10);
            WriteUtils.write$TYPE_STRING(param1,this.qqFaceURL$field);
         }
         if(this.hasCohesion)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.cohesion$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc14_:uint = 0;
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
         while(param1.bytesAvailable > param2)
         {
            _loc14_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc14_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_MemInfo.memberId cannot be set twice.");
                  }
                  _loc3_++;
                  this.memberId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_MemInfo.memberName cannot be set twice.");
                  }
                  _loc4_++;
                  this.memberName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_MemInfo.position cannot be set twice.");
                  }
                  _loc5_++;
                  this.position = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_MemInfo.contrib cannot be set twice.");
                  }
                  _loc6_++;
                  this.contrib = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_MemInfo.offlineTime cannot be set twice.");
                  }
                  _loc7_++;
                  this.offlineTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_MemInfo.dayContrib cannot be set twice.");
                  }
                  _loc8_++;
                  this.dayContrib = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_MemInfo.level cannot be set twice.");
                  }
                  _loc9_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_MemInfo.faceId cannot be set twice.");
                  }
                  _loc10_++;
                  this.faceId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_MemInfo.fightPower cannot be set twice.");
                  }
                  _loc11_++;
                  this.fightPower = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_MemInfo.qqFaceURL cannot be set twice.");
                  }
                  _loc12_++;
                  this.qqFaceURL = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guild_MemInfo.cohesion cannot be set twice.");
                  }
                  _loc13_++;
                  this.cohesion = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc14_);
                  break;
            }
         }
      }
   }
}
