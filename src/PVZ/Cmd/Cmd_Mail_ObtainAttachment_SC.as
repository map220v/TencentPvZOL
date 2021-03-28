package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Mail_ObtainAttachment_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Mail_ObtainAttachment_SC";
      
      public static const MAILUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Mail_ObtainAttachment_SC.mailUId","mailUId",1 << 3 | WireType.VARINT);
       
      
      private var mailUId$field:Int64;
      
      public function Cmd_Mail_ObtainAttachment_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Mail_ObtainAttachment_SC.$MessageID;
      }
      
      public function clearMailUId() : void
      {
         this.mailUId$field = null;
      }
      
      public function get hasMailUId() : Boolean
      {
         return this.mailUId$field != null;
      }
      
      public function set mailUId(param1:Int64) : void
      {
         this.mailUId$field = param1;
      }
      
      public function get mailUId() : Int64
      {
         return this.mailUId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasMailUId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.mailUId$field);
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
                     throw new IOError("Bad data format: Cmd_Mail_ObtainAttachment_SC.mailUId cannot be set twice.");
                  }
                  _loc3_++;
                  this.mailUId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
