package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Equip_AttachLevelUp_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Equip_AttachLevelUp_CS";
      
      public static const USETICKET:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Equip_AttachLevelUp_CS.useTicket","useTicket",1 << 3 | WireType.VARINT);
       
      
      private var useTicket$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Equip_AttachLevelUp_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Equip_AttachLevelUp_CS.$MessageID;
      }
      
      public function clearUseTicket() : void
      {
         this.hasField$0 &= 4294967294;
         this.useTicket$field = new Boolean();
      }
      
      public function get hasUseTicket() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set useTicket(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.useTicket$field = param1;
      }
      
      public function get useTicket() : Boolean
      {
         return this.useTicket$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasUseTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_BOOL(param1,this.useTicket$field);
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
                     throw new IOError("Bad data format: Cmd_Equip_AttachLevelUp_CS.useTicket cannot be set twice.");
                  }
                  _loc3_++;
                  this.useTicket = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
