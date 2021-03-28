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
   
   public final class Dto_GuildFight_RoleInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_GuildFight_RoleInfo";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_GuildFight_RoleInfo.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_GuildFight_RoleInfo.roleName","roleName",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const CYCLES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_RoleInfo.cycles","cycles",3 << 3 | WireType.VARINT);
      
      public static const MAXPOWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_RoleInfo.maxPower","maxPower",4 << 3 | WireType.VARINT);
      
      public static const TOTALPOWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_RoleInfo.totalPower","totalPower",5 << 3 | WireType.VARINT);
       
      
      private var roleId$field:Int64;
      
      private var roleName$field:String;
      
      private var cycles$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var maxPower$field:uint;
      
      private var totalPower$field:uint;
      
      public function Dto_GuildFight_RoleInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_GuildFight_RoleInfo.$MessageID;
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
      
      public function clearCycles() : void
      {
         this.hasField$0 &= 4294967294;
         this.cycles$field = new uint();
      }
      
      public function get hasCycles() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set cycles(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.cycles$field = param1;
      }
      
      public function get cycles() : uint
      {
         return this.cycles$field;
      }
      
      public function clearMaxPower() : void
      {
         this.hasField$0 &= 4294967293;
         this.maxPower$field = new uint();
      }
      
      public function get hasMaxPower() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set maxPower(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.maxPower$field = param1;
      }
      
      public function get maxPower() : uint
      {
         return this.maxPower$field;
      }
      
      public function clearTotalPower() : void
      {
         this.hasField$0 &= 4294967291;
         this.totalPower$field = new uint();
      }
      
      public function get hasTotalPower() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set totalPower(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.totalPower$field = param1;
      }
      
      public function get totalPower() : uint
      {
         return this.totalPower$field;
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
         if(this.hasCycles)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.cycles$field);
         }
         if(this.hasMaxPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.maxPower$field);
         }
         if(this.hasTotalPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.totalPower$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_RoleInfo.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_RoleInfo.roleName cannot be set twice.");
                  }
                  _loc4_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_RoleInfo.cycles cannot be set twice.");
                  }
                  _loc5_++;
                  this.cycles = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_RoleInfo.maxPower cannot be set twice.");
                  }
                  _loc6_++;
                  this.maxPower = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_RoleInfo.totalPower cannot be set twice.");
                  }
                  _loc7_++;
                  this.totalPower = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
