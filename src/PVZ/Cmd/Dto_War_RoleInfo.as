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
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_War_RoleInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_War_RoleInfo";
      
      public static const GUILDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_War_RoleInfo.guildId","guildId",1 << 3 | WireType.VARINT);
      
      public static const GUILDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_War_RoleInfo.guildName","guildName",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_War_RoleInfo.roleId","roleId",3 << 3 | WireType.VARINT);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_War_RoleInfo.roleName","roleName",4 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const POS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_War_RoleInfo.pos","pos",5 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
       
      
      private var guildId$field:Int64;
      
      private var guildName$field:String;
      
      private var roleId$field:Int64;
      
      private var roleName$field:String;
      
      private var pos$field:Dto_WorldMap_Pos;
      
      public function Dto_War_RoleInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_War_RoleInfo.$MessageID;
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
      
      public function clearPos() : void
      {
         this.pos$field = null;
      }
      
      public function get hasPos() : Boolean
      {
         return this.pos$field != null;
      }
      
      public function set pos(param1:Dto_WorldMap_Pos) : void
      {
         this.pos$field = param1;
      }
      
      public function get pos() : Dto_WorldMap_Pos
      {
         return this.pos$field;
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
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_STRING(param1,this.roleName$field);
         }
         if(this.hasPos)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.pos$field);
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
                     throw new IOError("Bad data format: Dto_War_RoleInfo.guildId cannot be set twice.");
                  }
                  _loc3_++;
                  this.guildId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_War_RoleInfo.guildName cannot be set twice.");
                  }
                  _loc4_++;
                  this.guildName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_War_RoleInfo.roleId cannot be set twice.");
                  }
                  _loc5_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_War_RoleInfo.roleName cannot be set twice.");
                  }
                  _loc6_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_War_RoleInfo.pos cannot be set twice.");
                  }
                  _loc7_++;
                  this.pos = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.pos);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
