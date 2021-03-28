package PVZ.Cmd
{
   import PVZ.Protocol.Dto_IdNum;
   import PVZ.Protocol.Dto_KeyValue;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_CommonSysMail extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_CommonSysMail";
      
      public static const MSGID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_CommonSysMail.msgId","msgId",1 << 3 | WireType.VARINT);
      
      public static const PARAM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_CommonSysMail.param","param",2 << 3 | WireType.LENGTH_DELIMITED,Dto_KeyValue);
      
      public static const REWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_CommonSysMail.reward","reward",3 << 3 | WireType.LENGTH_DELIMITED,PVZ.Protocol.Dto_IdNum);
       
      
      private var msgId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var param:Array;
      
      public var reward:Array;
      
      public function Cmd_CommonSysMail()
      {
         this.param = [];
         this.reward = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_CommonSysMail.$MessageID;
      }
      
      public function clearMsgId() : void
      {
         this.hasField$0 &= 4294967294;
         this.msgId$field = new uint();
      }
      
      public function get hasMsgId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set msgId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.msgId$field = param1;
      }
      
      public function get msgId() : uint
      {
         return this.msgId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasMsgId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.msgId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.param.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.param[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.reward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward[_loc3_]);
            _loc3_++;
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc4_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_CommonSysMail.msgId cannot be set twice.");
                  }
                  _loc3_++;
                  this.msgId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.param.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_KeyValue()));
                  break;
               case 3:
                  this.reward.push(ReadUtils.read$TYPE_MESSAGE(param1,new PVZ.Protocol.Dto_IdNum()));
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
