package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Mail_AllDelete_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Mail_AllDelete_CS";
      
      public static const SOURCETYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Cmd_Mail_AllDelete_CS.sourceType","sourceType",1 << 3 | WireType.VARINT,MailSourceType);
       
      
      private var sourceType$field:int;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Mail_AllDelete_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Mail_AllDelete_CS.$MessageID;
      }
      
      public function clearSourceType() : void
      {
         this.hasField$0 &= 4294967294;
         this.sourceType$field = new int();
      }
      
      public function get hasSourceType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set sourceType(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.sourceType$field = param1;
      }
      
      public function get sourceType() : int
      {
         return this.sourceType$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasSourceType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_ENUM(param1,this.sourceType$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Cmd_Mail_AllDelete_CS.sourceType cannot be set twice.");
                  }
                  _loc3_++;
                  this.sourceType = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
