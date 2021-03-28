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
   
   public final class Cmd_Card_ConfirmRefine_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Card_ConfirmRefine_CS";
      
      public static const CARDUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Card_ConfirmRefine_CS.cardUId","cardUId",1 << 3 | WireType.VARINT);
      
      public static const ABANDON:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Card_ConfirmRefine_CS.abandon","abandon",2 << 3 | WireType.VARINT);
       
      
      private var cardUId$field:Int64;
      
      private var abandon$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Card_ConfirmRefine_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Card_ConfirmRefine_CS.$MessageID;
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
      
      public function clearAbandon() : void
      {
         this.hasField$0 &= 4294967294;
         this.abandon$field = new Boolean();
      }
      
      public function get hasAbandon() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set abandon(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.abandon$field = param1;
      }
      
      public function get abandon() : Boolean
      {
         return this.abandon$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasCardUId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.cardUId$field);
         }
         if(this.hasAbandon)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.abandon$field);
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
                     throw new IOError("Bad data format: Cmd_Card_ConfirmRefine_CS.cardUId cannot be set twice.");
                  }
                  _loc3_++;
                  this.cardUId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_ConfirmRefine_CS.abandon cannot be set twice.");
                  }
                  _loc4_++;
                  this.abandon = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
