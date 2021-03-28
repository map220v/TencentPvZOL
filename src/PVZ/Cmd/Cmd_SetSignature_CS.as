package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_SetSignature_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_SetSignature_CS";
      
      public static const SIGNATURE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_SetSignature_CS.signature","signature",1 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var signature$field:String;
      
      public function Cmd_SetSignature_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_SetSignature_CS.$MessageID;
      }
      
      public function clearSignature() : void
      {
         this.signature$field = null;
      }
      
      public function get hasSignature() : Boolean
      {
         return this.signature$field != null;
      }
      
      public function set signature(param1:String) : void
      {
         this.signature$field = param1;
      }
      
      public function get signature() : String
      {
         return this.signature$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasSignature)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_STRING(param1,this.signature$field);
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
                     throw new IOError("Bad data format: Cmd_SetSignature_CS.signature cannot be set twice.");
                  }
                  _loc3_++;
                  this.signature = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
