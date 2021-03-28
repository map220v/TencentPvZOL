package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Mail_NewMessage_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Mail_NewMessage_SC";
      
      public static const NEWSYSTEMMAILNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Mail_NewMessage_SC.newSystemMailNum","newSystemMailNum",1 << 3 | WireType.VARINT);
      
      public static const NEWUSERMAILNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Mail_NewMessage_SC.newUserMailNum","newUserMailNum",2 << 3 | WireType.VARINT);
       
      
      private var newSystemMailNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var newUserMailNum$field:uint;
      
      public function Cmd_Mail_NewMessage_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Mail_NewMessage_SC.$MessageID;
      }
      
      public function clearNewSystemMailNum() : void
      {
         this.hasField$0 &= 4294967294;
         this.newSystemMailNum$field = new uint();
      }
      
      public function get hasNewSystemMailNum() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set newSystemMailNum(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.newSystemMailNum$field = param1;
      }
      
      public function get newSystemMailNum() : uint
      {
         return this.newSystemMailNum$field;
      }
      
      public function clearNewUserMailNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.newUserMailNum$field = new uint();
      }
      
      public function get hasNewUserMailNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set newUserMailNum(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.newUserMailNum$field = param1;
      }
      
      public function get newUserMailNum() : uint
      {
         return this.newUserMailNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasNewSystemMailNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.newSystemMailNum$field);
         }
         if(this.hasNewUserMailNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.newUserMailNum$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Cmd_Mail_NewMessage_SC.newSystemMailNum cannot be set twice.");
                  }
                  _loc3_++;
                  this.newSystemMailNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Mail_NewMessage_SC.newUserMailNum cannot be set twice.");
                  }
                  _loc4_++;
                  this.newUserMailNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
