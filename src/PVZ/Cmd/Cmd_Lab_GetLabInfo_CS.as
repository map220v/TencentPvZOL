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
   
   public final class Cmd_Lab_GetLabInfo_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Lab_GetLabInfo_CS";
      
      public static const FROM:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Cmd_Lab_GetLabInfo_CS.from","from",1 << 3 | WireType.VARINT,E_LabActionFrom);
       
      
      private var from$field:int;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Lab_GetLabInfo_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Lab_GetLabInfo_CS.$MessageID;
      }
      
      public function clearFrom() : void
      {
         this.hasField$0 &= 4294967294;
         this.from$field = new int();
      }
      
      public function get hasFrom() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set from(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.from$field = param1;
      }
      
      public function get from() : int
      {
         return this.from$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasFrom)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_ENUM(param1,this.from$field);
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
                     throw new IOError("Bad data format: Cmd_Lab_GetLabInfo_CS.from cannot be set twice.");
                  }
                  _loc3_++;
                  this.from = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
