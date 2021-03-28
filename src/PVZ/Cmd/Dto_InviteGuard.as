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
   
   public final class Dto_InviteGuard extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_InviteGuard";
      
      public static const GUARDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_InviteGuard.guardId","guardId",1 << 3 | WireType.VARINT);
      
      public static const GUARDTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_InviteGuard.guardType","guardType",2 << 3 | WireType.VARINT);
      
      public static const FINISHTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_InviteGuard.finishTime","finishTime",3 << 3 | WireType.VARINT);
      
      public static const INVITETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_InviteGuard.inviteTime","inviteTime",4 << 3 | WireType.VARINT);
      
      public static const POWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_InviteGuard.power","power",5 << 3 | WireType.VARINT);
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_InviteGuard.roleId","roleId",6 << 3 | WireType.VARINT);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_InviteGuard.name","name",7 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_InviteGuard.level","level",8 << 3 | WireType.VARINT);
      
      public static const FACEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_InviteGuard.faceId","faceId",9 << 3 | WireType.VARINT);
      
      public static const QQFACEURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_InviteGuard.qqFaceURL","qqFaceURL",10 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var guardId$field:Int64;
      
      private var guardType$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var finishTime$field:uint;
      
      private var inviteTime$field:uint;
      
      private var power$field:uint;
      
      private var roleId$field:Int64;
      
      private var name$field:String;
      
      private var level$field:uint;
      
      private var faceId$field:uint;
      
      private var qqFaceURL$field:String;
      
      public function Dto_InviteGuard()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_InviteGuard.$MessageID;
      }
      
      public function clearGuardId() : void
      {
         this.guardId$field = null;
      }
      
      public function get hasGuardId() : Boolean
      {
         return this.guardId$field != null;
      }
      
      public function set guardId(param1:Int64) : void
      {
         this.guardId$field = param1;
      }
      
      public function get guardId() : Int64
      {
         return this.guardId$field;
      }
      
      public function clearGuardType() : void
      {
         this.hasField$0 &= 4294967294;
         this.guardType$field = new uint();
      }
      
      public function get hasGuardType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set guardType(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.guardType$field = param1;
      }
      
      public function get guardType() : uint
      {
         return this.guardType$field;
      }
      
      public function clearFinishTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.finishTime$field = new uint();
      }
      
      public function get hasFinishTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set finishTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.finishTime$field = param1;
      }
      
      public function get finishTime() : uint
      {
         return this.finishTime$field;
      }
      
      public function clearInviteTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.inviteTime$field = new uint();
      }
      
      public function get hasInviteTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set inviteTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.inviteTime$field = param1;
      }
      
      public function get inviteTime() : uint
      {
         return this.inviteTime$field;
      }
      
      public function clearPower() : void
      {
         this.hasField$0 &= 4294967287;
         this.power$field = new uint();
      }
      
      public function get hasPower() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set power(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.power$field = param1;
      }
      
      public function get power() : uint
      {
         return this.power$field;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasGuardId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.guardId$field);
         }
         if(this.hasGuardType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.guardType$field);
         }
         if(this.hasFinishTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.finishTime$field);
         }
         if(this.hasInviteTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.inviteTime$field);
         }
         if(this.hasPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.power$field);
         }
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_STRING(param1,this.name$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasFaceId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.faceId$field);
         }
         if(this.hasQqFaceURL)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,10);
            WriteUtils.write$TYPE_STRING(param1,this.qqFaceURL$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Dto_InviteGuard.guardId cannot be set twice.");
                  }
                  _loc3_++;
                  this.guardId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_InviteGuard.guardType cannot be set twice.");
                  }
                  _loc4_++;
                  this.guardType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_InviteGuard.finishTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.finishTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_InviteGuard.inviteTime cannot be set twice.");
                  }
                  _loc6_++;
                  this.inviteTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_InviteGuard.power cannot be set twice.");
                  }
                  _loc7_++;
                  this.power = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_InviteGuard.roleId cannot be set twice.");
                  }
                  _loc8_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_InviteGuard.name cannot be set twice.");
                  }
                  _loc9_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_InviteGuard.level cannot be set twice.");
                  }
                  _loc10_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_InviteGuard.faceId cannot be set twice.");
                  }
                  _loc11_++;
                  this.faceId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_InviteGuard.qqFaceURL cannot be set twice.");
                  }
                  _loc12_++;
                  this.qqFaceURL = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc13_);
                  break;
            }
         }
      }
   }
}
