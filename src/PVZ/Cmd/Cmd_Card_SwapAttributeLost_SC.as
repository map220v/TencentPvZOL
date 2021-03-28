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
   
   public final class Cmd_Card_SwapAttributeLost_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Card_SwapAttributeLost_SC";
      
      public static const REFINE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Card_SwapAttributeLost_SC.refine","refine",1 << 3 | WireType.VARINT);
       
      
      private var refine$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Card_SwapAttributeLost_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Card_SwapAttributeLost_SC.$MessageID;
      }
      
      public function clearRefine() : void
      {
         this.hasField$0 &= 4294967294;
         this.refine$field = new Boolean();
      }
      
      public function get hasRefine() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set refine(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.refine$field = param1;
      }
      
      public function get refine() : Boolean
      {
         return this.refine$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRefine)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_BOOL(param1,this.refine$field);
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
                     throw new IOError("Bad data format: Cmd_Card_SwapAttributeLost_SC.refine cannot be set twice.");
                  }
                  _loc3_++;
                  this.refine = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
