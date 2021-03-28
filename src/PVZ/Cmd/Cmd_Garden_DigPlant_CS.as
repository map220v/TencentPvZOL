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
   
   public final class Cmd_Garden_DigPlant_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Garden_DigPlant_CS";
      
      public static const FIELDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Garden_DigPlant_CS.fieldid","fieldid",1 << 3 | WireType.VARINT);
       
      
      private var fieldid$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Garden_DigPlant_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Garden_DigPlant_CS.$MessageID;
      }
      
      public function clearFieldid() : void
      {
         this.hasField$0 &= 4294967294;
         this.fieldid$field = new uint();
      }
      
      public function get hasFieldid() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set fieldid(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.fieldid$field = param1;
      }
      
      public function get fieldid() : uint
      {
         return this.fieldid$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasFieldid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.fieldid$field);
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
                     throw new IOError("Bad data format: Cmd_Garden_DigPlant_CS.fieldid cannot be set twice.");
                  }
                  _loc3_++;
                  this.fieldid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
