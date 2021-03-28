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
   
   public final class Cmd_Card_SwapAttributeLost_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Card_SwapAttributeLost_CS";
      
      public static const SRCCARDUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Card_SwapAttributeLost_CS.srcCardUId","srcCardUId",1 << 3 | WireType.VARINT);
      
      public static const DSTCARDUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Card_SwapAttributeLost_CS.dstCardUId","dstCardUId",2 << 3 | WireType.VARINT);
      
      public static const BSWAPAWAKEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Card_SwapAttributeLost_CS.bSwapAwaken","bSwapAwaken",3 << 3 | WireType.VARINT);
      
      public static const BSWAPREFINE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Card_SwapAttributeLost_CS.bSwapRefine","bSwapRefine",4 << 3 | WireType.VARINT);
       
      
      private var srcCardUId$field:Int64;
      
      private var dstCardUId$field:Int64;
      
      private var bSwapAwaken$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var bSwapRefine$field:Boolean;
      
      public function Cmd_Card_SwapAttributeLost_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Card_SwapAttributeLost_CS.$MessageID;
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
      
      public function clearBSwapAwaken() : void
      {
         this.hasField$0 &= 4294967294;
         this.bSwapAwaken$field = new Boolean();
      }
      
      public function get hasBSwapAwaken() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set bSwapAwaken(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.bSwapAwaken$field = param1;
      }
      
      public function get bSwapAwaken() : Boolean
      {
         return this.bSwapAwaken$field;
      }
      
      public function clearBSwapRefine() : void
      {
         this.hasField$0 &= 4294967293;
         this.bSwapRefine$field = new Boolean();
      }
      
      public function get hasBSwapRefine() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set bSwapRefine(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.bSwapRefine$field = param1;
      }
      
      public function get bSwapRefine() : Boolean
      {
         return this.bSwapRefine$field;
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
         if(this.hasBSwapAwaken)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.bSwapAwaken$field);
         }
         if(this.hasBSwapRefine)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.bSwapRefine$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc7_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_SwapAttributeLost_CS.srcCardUId cannot be set twice.");
                  }
                  _loc3_++;
                  this.srcCardUId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_SwapAttributeLost_CS.dstCardUId cannot be set twice.");
                  }
                  _loc4_++;
                  this.dstCardUId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_SwapAttributeLost_CS.bSwapAwaken cannot be set twice.");
                  }
                  _loc5_++;
                  this.bSwapAwaken = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_SwapAttributeLost_CS.bSwapRefine cannot be set twice.");
                  }
                  _loc6_++;
                  this.bSwapRefine = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
