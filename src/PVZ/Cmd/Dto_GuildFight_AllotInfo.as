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
   
   public final class Dto_GuildFight_AllotInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_GuildFight_AllotInfo";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_GuildFight_AllotInfo.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_GuildFight_AllotInfo.roleName","roleName",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ROLESEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_AllotInfo.roleSex","roleSex",3 << 3 | WireType.VARINT);
      
      public static const TOTALPOWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_AllotInfo.totalPower","totalPower",4 << 3 | WireType.VARINT);
      
      public static const MAXPOWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_AllotInfo.maxPower","maxPower",5 << 3 | WireType.VARINT);
      
      public static const COHESION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_AllotInfo.cohesion","cohesion",6 << 3 | WireType.VARINT);
      
      public static const ALLOTSTATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_AllotInfo.allotState","allotState",7 << 3 | WireType.VARINT);
       
      
      private var roleId$field:Int64;
      
      private var roleName$field:String;
      
      private var roleSex$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var totalPower$field:uint;
      
      private var maxPower$field:uint;
      
      private var cohesion$field:uint;
      
      private var allotState$field:uint;
      
      public function Dto_GuildFight_AllotInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_GuildFight_AllotInfo.$MessageID;
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
      
      public function clearRoleName() : void
      {
         this.roleName$field = null;
      }
      
      public function get hasRoleName() : Boolean
      {
         return this.roleName$field != null;
      }
      
      public function set roleName(param1:String) : void
      {
         this.roleName$field = param1;
      }
      
      public function get roleName() : String
      {
         return this.roleName$field;
      }
      
      public function clearRoleSex() : void
      {
         this.hasField$0 &= 4294967294;
         this.roleSex$field = new uint();
      }
      
      public function get hasRoleSex() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set roleSex(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.roleSex$field = param1;
      }
      
      public function get roleSex() : uint
      {
         return this.roleSex$field;
      }
      
      public function clearTotalPower() : void
      {
         this.hasField$0 &= 4294967293;
         this.totalPower$field = new uint();
      }
      
      public function get hasTotalPower() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set totalPower(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.totalPower$field = param1;
      }
      
      public function get totalPower() : uint
      {
         return this.totalPower$field;
      }
      
      public function clearMaxPower() : void
      {
         this.hasField$0 &= 4294967291;
         this.maxPower$field = new uint();
      }
      
      public function get hasMaxPower() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set maxPower(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.maxPower$field = param1;
      }
      
      public function get maxPower() : uint
      {
         return this.maxPower$field;
      }
      
      public function clearCohesion() : void
      {
         this.hasField$0 &= 4294967287;
         this.cohesion$field = new uint();
      }
      
      public function get hasCohesion() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set cohesion(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.cohesion$field = param1;
      }
      
      public function get cohesion() : uint
      {
         return this.cohesion$field;
      }
      
      public function clearAllotState() : void
      {
         this.hasField$0 &= 4294967279;
         this.allotState$field = new uint();
      }
      
      public function get hasAllotState() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set allotState(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.allotState$field = param1;
      }
      
      public function get allotState() : uint
      {
         return this.allotState$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.roleName$field);
         }
         if(this.hasRoleSex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.roleSex$field);
         }
         if(this.hasTotalPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.totalPower$field);
         }
         if(this.hasMaxPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.maxPower$field);
         }
         if(this.hasCohesion)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.cohesion$field);
         }
         if(this.hasAllotState)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.allotState$field);
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
                     throw new IOError("Bad data format: Dto_GuildFight_AllotInfo.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_AllotInfo.roleName cannot be set twice.");
                  }
                  _loc4_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_AllotInfo.roleSex cannot be set twice.");
                  }
                  _loc5_++;
                  this.roleSex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_AllotInfo.totalPower cannot be set twice.");
                  }
                  _loc6_++;
                  this.totalPower = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_AllotInfo.maxPower cannot be set twice.");
                  }
                  _loc7_++;
                  this.maxPower = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_AllotInfo.cohesion cannot be set twice.");
                  }
                  _loc8_++;
                  this.cohesion = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_AllotInfo.allotState cannot be set twice.");
                  }
                  _loc9_++;
                  this.allotState = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
