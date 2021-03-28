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
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_WorldMap_GetCityInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_WorldMap_GetCityInfo_SC";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_WorldMap_GetCityInfo_SC.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_WorldMap_GetCityInfo_SC.roleName","roleName",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ROLELEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_WorldMap_GetCityInfo_SC.roleLevel","roleLevel",3 << 3 | WireType.VARINT);
      
      public static const FACEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_WorldMap_GetCityInfo_SC.faceId","faceId",4 << 3 | WireType.VARINT);
      
      public static const GUILDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_WorldMap_GetCityInfo_SC.guildId","guildId",5 << 3 | WireType.VARINT);
      
      public static const GUILDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_WorldMap_GetCityInfo_SC.guildName","guildName",6 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const WARHISTORY:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_WorldMap_GetCityInfo_SC.warHistory","warHistory",7 << 3 | WireType.LENGTH_DELIMITED,Dto_War_History);
      
      public static const QQFACEURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_WorldMap_GetCityInfo_SC.qqFaceURL","qqFaceURL",8 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const DIAMOND:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_WorldMap_GetCityInfo_SC.diamond","diamond",9 << 3 | WireType.LENGTH_DELIMITED,Dto_DiamondInfo);
      
      public static const FIRENDSTATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_WorldMap_GetCityInfo_SC.firendStatus","firendStatus",10 << 3 | WireType.VARINT);
      
      public static const SIGNATURE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_WorldMap_GetCityInfo_SC.signature","signature",11 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var roleId$field:Int64;
      
      private var roleName$field:String;
      
      private var roleLevel$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var faceId$field:uint;
      
      private var guildId$field:Int64;
      
      private var guildName$field:String;
      
      public var warHistory:Array;
      
      private var qqFaceURL$field:String;
      
      private var diamond$field:Dto_DiamondInfo;
      
      private var firendStatus$field:uint;
      
      private var signature$field:String;
      
      public function Cmd_WorldMap_GetCityInfo_SC()
      {
         this.warHistory = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_WorldMap_GetCityInfo_SC.$MessageID;
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
      
      public function clearRoleLevel() : void
      {
         this.hasField$0 &= 4294967294;
         this.roleLevel$field = new uint();
      }
      
      public function get hasRoleLevel() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set roleLevel(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.roleLevel$field = param1;
      }
      
      public function get roleLevel() : uint
      {
         return this.roleLevel$field;
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
      
      public function clearFirendStatus() : void
      {
         this.hasField$0 &= 4294967291;
         this.firendStatus$field = new uint();
      }
      
      public function get hasFirendStatus() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set firendStatus(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.firendStatus$field = param1;
      }
      
      public function get firendStatus() : uint
      {
         return this.firendStatus$field;
      }
      
      public function clearSignature() : void
      {
         this.signature$field = null;
      }
      
      public function get hasSignature() : Boolean
      {
         return this.signature$field != null;
      }
      
      public function set signature(param1:String) : void
      {
         this.signature$field = param1;
      }
      
      public function get signature() : String
      {
         return this.signature$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
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
         if(this.hasRoleLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.roleLevel$field);
         }
         if(this.hasFaceId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.faceId$field);
         }
         if(this.hasGuildId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_INT64(param1,this.guildId$field);
         }
         if(this.hasGuildName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_STRING(param1,this.guildName$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.warHistory.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.warHistory[_loc2_]);
            _loc2_++;
         }
         if(this.hasQqFaceURL)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_STRING(param1,this.qqFaceURL$field);
         }
         if(this.hasDiamond)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_MESSAGE(param1,this.diamond$field);
         }
         if(this.hasFirendStatus)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.firendStatus$field);
         }
         if(this.hasSignature)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,11);
            WriteUtils.write$TYPE_STRING(param1,this.signature$field);
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
                     throw new IOError("Bad data format: Cmd_WorldMap_GetCityInfo_SC.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldMap_GetCityInfo_SC.roleName cannot be set twice.");
                  }
                  _loc4_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldMap_GetCityInfo_SC.roleLevel cannot be set twice.");
                  }
                  _loc5_++;
                  this.roleLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldMap_GetCityInfo_SC.faceId cannot be set twice.");
                  }
                  _loc6_++;
                  this.faceId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldMap_GetCityInfo_SC.guildId cannot be set twice.");
                  }
                  _loc7_++;
                  this.guildId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldMap_GetCityInfo_SC.guildName cannot be set twice.");
                  }
                  _loc8_++;
                  this.guildName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 7:
                  this.warHistory.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_War_History()));
                  break;
               case 8:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldMap_GetCityInfo_SC.qqFaceURL cannot be set twice.");
                  }
                  _loc9_++;
                  this.qqFaceURL = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 9:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldMap_GetCityInfo_SC.diamond cannot be set twice.");
                  }
                  _loc10_++;
                  this.diamond = new Dto_DiamondInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.diamond);
                  break;
               case 10:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldMap_GetCityInfo_SC.firendStatus cannot be set twice.");
                  }
                  _loc11_++;
                  this.firendStatus = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_WorldMap_GetCityInfo_SC.signature cannot be set twice.");
                  }
                  _loc12_++;
                  this.signature = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc13_);
                  break;
            }
         }
      }
   }
}
