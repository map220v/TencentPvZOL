package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_LogicError_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_LogicError_SC";
      
      public static const POS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_LogicError_SC.pos","pos",1 << 3 | WireType.VARINT);
      
      public static const PARAM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_LogicError_SC.param","param",2 << 3 | WireType.LENGTH_DELIMITED,Dto_StringReplace);
      
      public static const SEQID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_LogicError_SC.seqid","seqid",3 << 3 | WireType.VARINT);
       
      
      private var pos$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var param:Array;
      
      private var seqid$field:uint;
      
      public function Cmd_LogicError_SC()
      {
         this.param = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_LogicError_SC.$MessageID;
      }
      
      public function clearPos() : void
      {
         this.hasField$0 &= 4294967294;
         this.pos$field = new uint();
      }
      
      public function get hasPos() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set pos(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.pos$field = param1;
      }
      
      public function get pos() : uint
      {
         return this.pos$field;
      }
      
      public function clearSeqid() : void
      {
         this.hasField$0 &= 4294967293;
         this.seqid$field = new uint();
      }
      
      public function get hasSeqid() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set seqid(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.seqid$field = param1;
      }
      
      public function get seqid() : uint
      {
         return this.seqid$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasPos)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.pos$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.param.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.param[_loc2_]);
            _loc2_++;
         }
         if(this.hasSeqid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.seqid$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc5_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_LogicError_SC.pos cannot be set twice.");
                  }
                  _loc3_++;
                  this.pos = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.param.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_StringReplace()));
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_LogicError_SC.seqid cannot be set twice.");
                  }
                  _loc4_++;
                  this.seqid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
