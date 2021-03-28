package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BYTES;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_INT64;
   import flash.errors.IOError;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public final class ProxyProtocolCommon extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.ProxyProtocolCommon";
      
      public static const SRCID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.ProxyProtocolCommon.srcId","srcId",1 << 3 | WireType.VARINT);
      
      public static const DSTID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.ProxyProtocolCommon.dstId","dstId",2 << 3 | WireType.VARINT);
      
      public static const CMDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.ProxyProtocolCommon.cmdName","cmdName",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const CMDDATA:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("PVZ.Cmd.ProxyProtocolCommon.cmdData","cmdData",4 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ZONEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.ProxyProtocolCommon.zoneId","zoneId",5 << 3 | WireType.VARINT);
      
      public static const ROLEID:RepeatedFieldDescriptor$TYPE_INT64 = new RepeatedFieldDescriptor$TYPE_INT64("PVZ.Cmd.ProxyProtocolCommon.roleId","roleId",6 << 3 | WireType.VARINT);
      
      public static const ERRORCODE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.ProxyProtocolCommon.errorCode","errorCode",7 << 3 | WireType.VARINT);
      
      public static const ASYNCDATA:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("PVZ.Cmd.ProxyProtocolCommon.asyncData","asyncData",8 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var srcId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var dstId$field:uint;
      
      private var cmdName$field:String;
      
      private var cmdData$field:ByteArray;
      
      private var zoneId$field:uint;
      
      public var roleId:Array;
      
      private var errorCode$field:int;
      
      private var asyncData$field:ByteArray;
      
      public function ProxyProtocolCommon()
      {
         this.roleId = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return ProxyProtocolCommon.$MessageID;
      }
      
      public function clearSrcId() : void
      {
         this.hasField$0 &= 4294967294;
         this.srcId$field = new uint();
      }
      
      public function get hasSrcId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set srcId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.srcId$field = param1;
      }
      
      public function get srcId() : uint
      {
         return this.srcId$field;
      }
      
      public function clearDstId() : void
      {
         this.hasField$0 &= 4294967293;
         this.dstId$field = new uint();
      }
      
      public function get hasDstId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set dstId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.dstId$field = param1;
      }
      
      public function get dstId() : uint
      {
         return this.dstId$field;
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
      
      public function clearZoneId() : void
      {
         this.hasField$0 &= 4294967291;
         this.zoneId$field = new uint();
      }
      
      public function get hasZoneId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set zoneId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.zoneId$field = param1;
      }
      
      public function get zoneId() : uint
      {
         return this.zoneId$field;
      }
      
      public function clearErrorCode() : void
      {
         this.hasField$0 &= 4294967287;
         this.errorCode$field = new int();
      }
      
      public function get hasErrorCode() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set errorCode(param1:int) : void
      {
         this.hasField$0 |= 8;
         this.errorCode$field = param1;
      }
      
      public function get errorCode() : int
      {
         return this.errorCode$field;
      }
      
      public function clearAsyncData() : void
      {
         this.asyncData$field = null;
      }
      
      public function get hasAsyncData() : Boolean
      {
         return this.asyncData$field != null;
      }
      
      public function set asyncData(param1:ByteArray) : void
      {
         this.asyncData$field = param1;
      }
      
      public function get asyncData() : ByteArray
      {
         return this.asyncData$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasSrcId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.srcId$field);
         }
         if(this.hasDstId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.dstId$field);
         }
         if(this.hasCmdName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.cmdName$field);
         }
         if(this.hasCmdData)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_BYTES(param1,this.cmdData$field);
         }
         if(this.hasZoneId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.zoneId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.roleId.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_INT64(param1,this.roleId[_loc2_]);
            _loc2_++;
         }
         if(this.hasErrorCode)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_INT32(param1,this.errorCode$field);
         }
         if(this.hasAsyncData)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_BYTES(param1,this.asyncData$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: ProxyProtocolCommon.srcId cannot be set twice.");
                  }
                  _loc3_++;
                  this.srcId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: ProxyProtocolCommon.dstId cannot be set twice.");
                  }
                  _loc4_++;
                  this.dstId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: ProxyProtocolCommon.cmdName cannot be set twice.");
                  }
                  _loc5_++;
                  this.cmdName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: ProxyProtocolCommon.cmdData cannot be set twice.");
                  }
                  _loc6_++;
                  this.cmdData = ReadUtils.read$TYPE_BYTES(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: ProxyProtocolCommon.zoneId cannot be set twice.");
                  }
                  _loc7_++;
                  this.zoneId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if((_loc10_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_INT64,this.roleId);
                  }
                  else
                  {
                     this.roleId.push(ReadUtils.read$TYPE_INT64(param1));
                  }
                  break;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: ProxyProtocolCommon.errorCode cannot be set twice.");
                  }
                  _loc8_++;
                  this.errorCode = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 8:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: ProxyProtocolCommon.asyncData cannot be set twice.");
                  }
                  _loc9_++;
                  this.asyncData = ReadUtils.read$TYPE_BYTES(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
