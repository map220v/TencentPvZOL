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
   
   public final class Cmd_SyncFosterTicket_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_SyncFosterTicket_SC";
      
      public static const FOSTERTICKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SyncFosterTicket_SC.fosterTicket","fosterTicket",1 << 3 | WireType.VARINT);
       
      
      private var fosterTicket$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_SyncFosterTicket_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_SyncFosterTicket_SC.$MessageID;
      }
      
      public function clearFosterTicket() : void
      {
         this.hasField$0 &= 4294967294;
         this.fosterTicket$field = new uint();
      }
      
      public function get hasFosterTicket() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set fosterTicket(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.fosterTicket$field = param1;
      }
      
      public function get fosterTicket() : uint
      {
         return this.fosterTicket$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasFosterTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.fosterTicket$field);
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
                     throw new IOError("Bad data format: Cmd_SyncFosterTicket_SC.fosterTicket cannot be set twice.");
                  }
                  _loc3_++;
                  this.fosterTicket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
