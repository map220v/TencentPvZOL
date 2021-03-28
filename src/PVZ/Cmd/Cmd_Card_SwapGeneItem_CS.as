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
   
   public final class Cmd_Card_SwapGeneItem_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Card_SwapGeneItem_CS";
      
      public static const SRCCARDUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Card_SwapGeneItem_CS.srcCardUId","srcCardUId",1 << 3 | WireType.VARINT);
      
      public static const DSTCARDUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Card_SwapGeneItem_CS.dstCardUId","dstCardUId",2 << 3 | WireType.VARINT);
       
      
      private var srcCardUId$field:Int64;
      
      private var dstCardUId$field:Int64;
      
      public function Cmd_Card_SwapGeneItem_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Card_SwapGeneItem_CS.$MessageID;
      }
      
      public function clearSrcCardUId() : void
      {
         this.srcCardUId$field = null;
      }
      
      public function get hasSrcCardUId() : Boolean
      {
         return this.srcCardUId$field != null;
      }
      
      public function set srcCardUId(param1:Int64) : void
      {
         this.srcCardUId$field = param1;
      }
      
      public function get srcCardUId() : Int64
      {
         return this.srcCardUId$field;
      }
      
      public function clearDstCardUId() : void
      {
         this.dstCardUId$field = null;
      }
      
      public function get hasDstCardUId() : Boolean
      {
         return this.dstCardUId$field != null;
      }
      
      public function set dstCardUId(param1:Int64) : void
      {
         this.dstCardUId$field = param1;
      }
      
      public function get dstCardUId() : Int64
      {
         return this.dstCardUId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasSrcCardUId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.srcCardUId$field);
         }
         if(this.hasDstCardUId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.dstCardUId$field);
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
                     throw new IOError("Bad data format: Cmd_Card_SwapGeneItem_CS.srcCardUId cannot be set twice.");
                  }
                  _loc3_++;
                  this.srcCardUId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_SwapGeneItem_CS.dstCardUId cannot be set twice.");
                  }
                  _loc4_++;
                  this.dstCardUId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
