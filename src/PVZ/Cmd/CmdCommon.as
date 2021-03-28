package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BYTES;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public final class CmdCommon extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.CmdCommon";
      
      public static const CMDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.CmdCommon.cmdName","cmdName",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const CMDDATA:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("PVZ.Cmd.CmdCommon.cmdData","cmdData",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ERRORCODE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.CmdCommon.errorCode","errorCode",3 << 3 | WireType.VARINT);
      
      public static const SEQID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.CmdCommon.seqId","seqId",4 << 3 | WireType.VARINT);
      
      public static const CMDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.CmdCommon.cmdId","cmdId",5 << 3 | WireType.VARINT);
       
      
      public var cmdName:String;
      
      public var cmdData:ByteArray;
      
      private var errorCode$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var seqId$field:uint;
      
      private var cmdId$field:uint;
      
      public function CmdCommon()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return CmdCommon.$MessageID;
      }
      
      public function clearErrorCode() : void
      {
         this.hasField$0 &= 4294967294;
         this.errorCode$field = new uint();
      }
      
      public function get hasErrorCode() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set errorCode(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.errorCode$field = param1;
      }
      
      public function get errorCode() : uint
      {
         return this.errorCode$field;
      }
      
      public function clearSeqId() : void
      {
         this.hasField$0 &= 4294967293;
         this.seqId$field = new uint();
      }
      
      public function get hasSeqId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set seqId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.seqId$field = param1;
      }
      
      public function get seqId() : uint
      {
         return this.seqId$field;
      }
      
      public function clearCmdId() : void
      {
         this.hasField$0 &= 4294967291;
         this.cmdId$field = new uint();
      }
      
      public function get hasCmdId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set cmdId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.cmdId$field = param1;
      }
      
      public function get cmdId() : uint
      {
         return this.cmdId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
         WriteUtils.write$TYPE_STRING(param1,this.cmdName);
         WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
         WriteUtils.write$TYPE_BYTES(param1,this.cmdData);
         if(this.hasErrorCode)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.errorCode$field);
         }
         if(this.hasSeqId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.seqId$field);
         }
         if(this.hasCmdId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.cmdId$field);
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
                     throw new IOError("Bad data format: CmdCommon.cmdName cannot be set twice.");
                  }
                  _loc3_++;
                  this.cmdName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: CmdCommon.cmdData cannot be set twice.");
                  }
                  _loc4_++;
                  this.cmdData = ReadUtils.read$TYPE_BYTES(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: CmdCommon.errorCode cannot be set twice.");
                  }
                  _loc5_++;
                  this.errorCode = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: CmdCommon.seqId cannot be set twice.");
                  }
                  _loc6_++;
                  this.seqId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: CmdCommon.cmdId cannot be set twice.");
                  }
                  _loc7_++;
                  this.cmdId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
