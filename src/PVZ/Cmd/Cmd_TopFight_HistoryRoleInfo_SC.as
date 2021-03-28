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
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_TopFight_HistoryRoleInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_TopFight_HistoryRoleInfo_SC";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_TopFight_HistoryRoleInfo_SC.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const ZONEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TopFight_HistoryRoleInfo_SC.zoneId","zoneId",2 << 3 | WireType.VARINT);
      
      public static const UIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TopFight_HistoryRoleInfo_SC.uin","uin",3 << 3 | WireType.VARINT);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TopFight_HistoryRoleInfo_SC.level","level",4 << 3 | WireType.VARINT);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_TopFight_HistoryRoleInfo_SC.roleName","roleName",5 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const QQFACEURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_TopFight_HistoryRoleInfo_SC.qqFaceURL","qqFaceURL",6 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const CARDBASEID:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TopFight_HistoryRoleInfo_SC.cardBaseId","cardBaseId",7 << 3 | WireType.VARINT);
       
      
      private var roleId$field:Int64;
      
      private var zoneId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var uin$field:uint;
      
      private var level$field:uint;
      
      private var roleName$field:String;
      
      private var qqFaceURL$field:String;
      
      public var cardBaseId:Array;
      
      public function Cmd_TopFight_HistoryRoleInfo_SC()
      {
         this.cardBaseId = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_TopFight_HistoryRoleInfo_SC.$MessageID;
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
         this.hasField$0 &= 4294967294;
         this.zoneId$field = new uint();
      }
      
      public function get hasZoneId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set zoneId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.zoneId$field = param1;
      }
      
      public function get zoneId() : uint
      {
         return this.zoneId$field;
      }
      
      public function clearUin() : void
      {
         this.hasField$0 &= 4294967293;
         this.uin$field = new uint();
      }
      
      public function get hasUin() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set uin(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.uin$field = param1;
      }
      
      public function get uin() : uint
      {
         return this.uin$field;
      }
      
      public function clearLevel() : void
      {
         this.hasField$0 &= 4294967291;
         this.level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.level$field = param1;
      }
      
      public function get level() : uint
      {
         return this.level$field;
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
         var _loc3_:* = undefined;
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasZoneId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.zoneId$field);
         }
         if(this.hasUin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.uin$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_STRING(param1,this.roleName$field);
         }
         if(this.hasQqFaceURL)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_STRING(param1,this.qqFaceURL$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.cardBaseId.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.cardBaseId[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc9_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc9_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_HistoryRoleInfo_SC.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_HistoryRoleInfo_SC.zoneId cannot be set twice.");
                  }
                  _loc4_++;
                  this.zoneId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_HistoryRoleInfo_SC.uin cannot be set twice.");
                  }
                  _loc5_++;
                  this.uin = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_HistoryRoleInfo_SC.level cannot be set twice.");
                  }
                  _loc6_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_HistoryRoleInfo_SC.roleName cannot be set twice.");
                  }
                  _loc7_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_HistoryRoleInfo_SC.qqFaceURL cannot be set twice.");
                  }
                  _loc8_++;
                  this.qqFaceURL = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 7:
                  if((_loc9_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.cardBaseId);
                  }
                  else
                  {
                     this.cardBaseId.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
