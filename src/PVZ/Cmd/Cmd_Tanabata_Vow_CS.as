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
   
   public final class Cmd_Tanabata_Vow_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Tanabata_Vow_CS";
      
      public static const VOWTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Tanabata_Vow_CS.vowType","vowType",1 << 3 | WireType.VARINT);
       
      
      private var vowType$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Tanabata_Vow_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Tanabata_Vow_CS.$MessageID;
      }
      
      public function clearVowType() : void
      {
         this.hasField$0 &= 4294967294;
         this.vowType$field = new uint();
      }
      
      public function get hasVowType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set vowType(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.vowType$field = param1;
      }
      
      public function get vowType() : uint
      {
         return this.vowType$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasVowType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.vowType$field);
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
                     throw new IOError("Bad data format: Cmd_Tanabata_Vow_CS.vowType cannot be set twice.");
                  }
                  _loc3_++;
                  this.vowType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
