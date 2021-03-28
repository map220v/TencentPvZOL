package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Card_Forge_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Card_Forge_SC";
      
      public static const ISSUCCESS:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Card_Forge_SC.isSuccess","isSuccess",1 << 3 | WireType.VARINT);
      
      public static const CARDUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Card_Forge_SC.cardUId","cardUId",2 << 3 | WireType.VARINT);
       
      
      private var isSuccess$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var cardUId$field:Int64;
      
      public function Cmd_Card_Forge_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Card_Forge_SC.$MessageID;
      }
      
      public function clearIsSuccess() : void
      {
         this.hasField$0 &= 4294967294;
         this.isSuccess$field = new Boolean();
      }
      
      public function get hasIsSuccess() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set isSuccess(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.isSuccess$field = param1;
      }
      
      public function get isSuccess() : Boolean
      {
         return this.isSuccess$field;
      }
      
      public function clearCardUId() : void
      {
         this.cardUId$field = null;
      }
      
      public function get hasCardUId() : Boolean
      {
         return this.cardUId$field != null;
      }
      
      public function set cardUId(param1:Int64) : void
      {
         this.cardUId$field = param1;
      }
      
      public function get cardUId() : Int64
      {
         return this.cardUId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasIsSuccess)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_BOOL(param1,this.isSuccess$field);
         }
         if(this.hasCardUId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.cardUId$field);
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
                     throw new IOError("Bad data format: Cmd_Card_Forge_SC.isSuccess cannot be set twice.");
                  }
                  _loc3_++;
                  this.isSuccess = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_Forge_SC.cardUId cannot be set twice.");
                  }
                  _loc4_++;
                  this.cardUId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
