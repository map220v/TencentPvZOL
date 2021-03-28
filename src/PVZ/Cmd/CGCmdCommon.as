package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BYTES;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public final class CGCmdCommon extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.CGCmdCommon";
      
      public static const CMDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.CGCmdCommon.cmdName","cmdName",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const CMDDATA:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("PVZ.Cmd.CGCmdCommon.cmdData","cmdData",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.CGCmdCommon.roleId","roleId",3 << 3 | WireType.VARINT);
      
      public static const ZONEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.CGCmdCommon.zoneId","zoneId",4 << 3 | WireType.VARINT);
      
      public static const ERRORCODE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.CGCmdCommon.errorCode","errorCode",5 << 3 | WireType.VARINT);
       
      
      private var cmdName$field:String;
      
      private var cmdData$field:ByteArray;
      
      private var roleId$field:Int64;
      
      private var zoneId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var errorCode$field:uint;
      
      public function CGCmdCommon()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return CGCmdCommon.$MessageID;
      }
      
      public function clearCmdName() : void
      {
         this.cmdName$field = null;
      }
      
      public function get hasCmdName() : Boolean
      {
         return this.cmdName$field != null;
      }
      
      public function set cmdName(param1:String) : void
      {
         this.cmdName$field = param1;
      }
      
      public function get cmdName() : String
      {
         return this.cmdName$field;
      }
      
      public function clearCmdData() : void
      {
         this.cmdData$field = null;
      }
      
      public function get hasCmdData() : Boolean
      {
         return this.cmdData$field != null;
      }
      
      public function set cmdData(param1:ByteArray) : void
      {
         this.cmdData$field = param1;
      }
      
      public function get cmdData() : ByteArray
      {
         return this.cmdData$field;
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
      
      public function clearErrorCode() : void
      {
         this.hasField$0 &= 4294967293;
         this.errorCode$field = new uint();
      }
      
      public function get hasErrorCode() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set errorCode(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.errorCode$field = param1;
      }
      
      public function get errorCode() : uint
      {
         return this.errorCode$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasCmdName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_STRING(param1,this.cmdName$field);
         }
         if(this.hasCmdData)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_BYTES(param1,this.cmdData$field);
         }
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasZoneId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.zoneId$field);
         }
         if(this.hasErrorCode)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.errorCode$field);
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
                     throw new IOError("Bad data format: CGCmdCommon.cmdName cannot be set twice.");
                  }
                  _loc3_++;
                  this.cmdName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CGCmdCommon.cmdData cannot be set twice.");
                  }
                  _loc4_++;
                  this.cmdData = ReadUtils.read$TYPE_BYTES(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CGCmdCommon.roleId cannot be set twice.");
                  }
                  _loc5_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CGCmdCommon.zoneId cannot be set twice.");
                  }
                  _loc6_++;
                  this.zoneId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: CGCmdCommon.errorCode cannot be set twice.");
                  }
                  _loc7_++;
                  this.errorCode = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
