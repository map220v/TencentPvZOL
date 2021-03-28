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
   
   public final class Dto_FriendFightInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FriendFightInfo";
      
      public static const ID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_FriendFightInfo.id","id",1 << 3 | WireType.VARINT);
      
      public static const TYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FriendFightInfo.type","type",2 << 3 | WireType.VARINT);
      
      public static const ZONEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FriendFightInfo.zoneid","zoneid",3 << 3 | WireType.VARINT);
      
      public static const ROLEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FriendFightInfo.roleid","roleid",4 << 3 | WireType.VARINT);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FriendFightInfo.name","name",5 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const TIMESTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FriendFightInfo.timestamp","timestamp",6 << 3 | WireType.VARINT);
      
      public static const REPORTID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_FriendFightInfo.reportId","reportId",7 << 3 | WireType.VARINT);
       
      
      private var id$field:Int64;
      
      private var type$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var zoneid$field:uint;
      
      private var roleid$field:uint;
      
      private var name$field:String;
      
      private var timestamp$field:uint;
      
      private var reportId$field:Int64;
      
      public function Dto_FriendFightInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FriendFightInfo.$MessageID;
      }
      
      public function clearId() : void
      {
         this.id$field = null;
      }
      
      public function get hasId() : Boolean
      {
         return this.id$field != null;
      }
      
      public function set id(param1:Int64) : void
      {
         this.id$field = param1;
      }
      
      public function get id() : Int64
      {
         return this.id$field;
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
      
      public function clearZoneid() : void
      {
         this.hasField$0 &= 4294967293;
         this.zoneid$field = new uint();
      }
      
      public function get hasZoneid() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set zoneid(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.zoneid$field = param1;
      }
      
      public function get zoneid() : uint
      {
         return this.zoneid$field;
      }
      
      public function clearRoleid() : void
      {
         this.hasField$0 &= 4294967291;
         this.roleid$field = new uint();
      }
      
      public function get hasRoleid() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set roleid(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.roleid$field = param1;
      }
      
      public function get roleid() : uint
      {
         return this.roleid$field;
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
      
      public function clearTimestamp() : void
      {
         this.hasField$0 &= 4294967287;
         this.timestamp$field = new uint();
      }
      
      public function get hasTimestamp() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set timestamp(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.timestamp$field = param1;
      }
      
      public function get timestamp() : uint
      {
         return this.timestamp$field;
      }
      
      public function clearReportId() : void
      {
         this.reportId$field = null;
      }
      
      public function get hasReportId() : Boolean
      {
         return this.reportId$field != null;
      }
      
      public function set reportId(param1:Int64) : void
      {
         this.reportId$field = param1;
      }
      
      public function get reportId() : Int64
      {
         return this.reportId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.id$field);
         }
         if(this.hasType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.type$field);
         }
         if(this.hasZoneid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.zoneid$field);
         }
         if(this.hasRoleid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.roleid$field);
         }
         if(this.hasName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_STRING(param1,this.name$field);
         }
         if(this.hasTimestamp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.timestamp$field);
         }
         if(this.hasReportId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_INT64(param1,this.reportId$field);
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
                     throw new IOError("Bad data format: Dto_FriendFightInfo.id cannot be set twice.");
                  }
                  _loc3_++;
                  this.id = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendFightInfo.type cannot be set twice.");
                  }
                  _loc4_++;
                  this.type = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendFightInfo.zoneid cannot be set twice.");
                  }
                  _loc5_++;
                  this.zoneid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendFightInfo.roleid cannot be set twice.");
                  }
                  _loc6_++;
                  this.roleid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendFightInfo.name cannot be set twice.");
                  }
                  _loc7_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendFightInfo.timestamp cannot be set twice.");
                  }
                  _loc8_++;
                  this.timestamp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FriendFightInfo.reportId cannot be set twice.");
                  }
                  _loc9_++;
                  this.reportId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
