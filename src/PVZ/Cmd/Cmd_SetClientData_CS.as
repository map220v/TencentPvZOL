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
   
   public final class Cmd_SetClientData_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_SetClientData_CS";
      
      public static const KEY:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_SetClientData_CS.key","key",1 << 3 | WireType.VARINT);
      
      public static const VALUE:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_SetClientData_CS.value","value",2 << 3 | WireType.VARINT);
       
      
      private var key$field:Int64;
      
      private var value$field:Int64;
      
      public function Cmd_SetClientData_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_SetClientData_CS.$MessageID;
      }
      
      public function clearKey() : void
      {
         this.key$field = null;
      }
      
      public function get hasKey() : Boolean
      {
         return this.key$field != null;
      }
      
      public function set key(param1:Int64) : void
      {
         this.key$field = param1;
      }
      
      public function get key() : Int64
      {
         return this.key$field;
      }
      
      public function clearValue() : void
      {
         this.value$field = null;
      }
      
      public function get hasValue() : Boolean
      {
         return this.value$field != null;
      }
      
      public function set value(param1:Int64) : void
      {
         this.value$field = param1;
      }
      
      public function get value() : Int64
      {
         return this.value$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasKey)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.key$field);
         }
         if(this.hasValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.value$field);
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
                     throw new IOError("Bad data format: Cmd_SetClientData_CS.key cannot be set twice.");
                  }
                  _loc3_++;
                  this.key = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SetClientData_CS.value cannot be set twice.");
                  }
                  _loc4_++;
                  this.value = ReadUtils.read$TYPE_INT64(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
