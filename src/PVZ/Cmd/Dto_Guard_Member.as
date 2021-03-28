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
   
   public final class Dto_Guard_Member extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Guard_Member";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_Guard_Member.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Guard_Member.name","name",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guard_Member.level","level",3 << 3 | WireType.VARINT);
      
      public static const FACEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guard_Member.faceId","faceId",4 << 3 | WireType.VARINT);
      
      public static const QQFACEURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Guard_Member.qqFaceURL","qqFaceURL",5 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const JOINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guard_Member.joinTime","joinTime",6 << 3 | WireType.VARINT);
      
      public static const INVITETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guard_Member.inviteTime","inviteTime",7 << 3 | WireType.VARINT);
      
      public static const POWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guard_Member.power","power",8 << 3 | WireType.VARINT);
      
      public static const SPEED:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Guard_Member.speed","speed",9 << 3 | WireType.VARINT);
      
      public static const CARDINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Guard_Member.cardInfo","cardInfo",10 << 3 | WireType.LENGTH_DELIMITED,Dto_EnemyCardInfo);
       
      
      private var roleId$field:Int64;
      
      private var name$field:String;
      
      private var level$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var faceId$field:uint;
      
      private var qqFaceURL$field:String;
      
      private var joinTime$field:uint;
      
      private var inviteTime$field:uint;
      
      private var power$field:uint;
      
      private var speed$field:uint;
      
      public var cardInfo:Array;
      
      public function Dto_Guard_Member()
      {
         this.cardInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Guard_Member.$MessageID;
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
      
      public function clearFaceId() : void
      {
         this.hasField$0 &= 4294967293;
         this.faceId$field = new uint();
      }
      
      public function get hasFaceId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set faceId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.faceId$field = param1;
      }
      
      public function get faceId() : uint
      {
         return this.faceId$field;
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
      
      public function clearJoinTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.joinTime$field = new uint();
      }
      
      public function get hasJoinTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set joinTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.joinTime$field = param1;
      }
      
      public function get joinTime() : uint
      {
         return this.joinTime$field;
      }
      
      public function clearInviteTime() : void
      {
         this.hasField$0 &= 4294967287;
         this.inviteTime$field = new uint();
      }
      
      public function get hasInviteTime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set inviteTime(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.inviteTime$field = param1;
      }
      
      public function get inviteTime() : uint
      {
         return this.inviteTime$field;
      }
      
      public function clearPower() : void
      {
         this.hasField$0 &= 4294967279;
         this.power$field = new uint();
      }
      
      public function get hasPower() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set power(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.power$field = param1;
      }
      
      public function get power() : uint
      {
         return this.power$field;
      }
      
      public function clearSpeed() : void
      {
         this.hasField$0 &= 4294967263;
         this.speed$field = new uint();
      }
      
      public function get hasSpeed() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set speed(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.speed$field = param1;
      }
      
      public function get speed() : uint
      {
         return this.speed$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.name$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasFaceId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.faceId$field);
         }
         if(this.hasQqFaceURL)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_STRING(param1,this.qqFaceURL$field);
         }
         if(this.hasJoinTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.joinTime$field);
         }
         if(this.hasInviteTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.inviteTime$field);
         }
         if(this.hasPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.power$field);
         }
         if(this.hasSpeed)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.speed$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.cardInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,10);
            WriteUtils.write$TYPE_MESSAGE(param1,this.cardInfo[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Dto_Guard_Member.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guard_Member.name cannot be set twice.");
                  }
                  _loc4_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guard_Member.level cannot be set twice.");
                  }
                  _loc5_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guard_Member.faceId cannot be set twice.");
                  }
                  _loc6_++;
                  this.faceId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guard_Member.qqFaceURL cannot be set twice.");
                  }
                  _loc7_++;
                  this.qqFaceURL = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guard_Member.joinTime cannot be set twice.");
                  }
                  _loc8_++;
                  this.joinTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guard_Member.inviteTime cannot be set twice.");
                  }
                  _loc9_++;
                  this.inviteTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guard_Member.power cannot be set twice.");
                  }
                  _loc10_++;
                  this.power = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Guard_Member.speed cannot be set twice.");
                  }
                  _loc11_++;
                  this.speed = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  this.cardInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_EnemyCardInfo()));
                  break;
               default:
                  super.readUnknown(param1,_loc12_);
                  break;
            }
         }
      }
   }
}
