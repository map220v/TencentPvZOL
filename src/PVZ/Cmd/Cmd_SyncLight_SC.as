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
   
   public final class Cmd_SyncLight_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_SyncLight_SC";
      
      public static const LIGHT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SyncLight_SC.light","light",1 << 3 | WireType.VARINT);
       
      
      private var light$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_SyncLight_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_SyncLight_SC.$MessageID;
      }
      
      public function clearLight() : void
      {
         this.hasField$0 &= 4294967294;
         this.light$field = new uint();
      }
      
      public function get hasLight() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set light(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.light$field = param1;
      }
      
      public function get light() : uint
      {
         return this.light$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasLight)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.light$field);
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
                     throw new IOError("Bad data format: Cmd_SyncLight_SC.light cannot be set twice.");
                  }
                  _loc3_++;
                  this.light = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
