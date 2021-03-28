package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Card_BatchRefine_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Card_BatchRefine_CS";
      
      public static const CARDUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Card_BatchRefine_CS.cardUId","cardUId",1 << 3 | WireType.VARINT);
      
      public static const MODE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Card_BatchRefine_CS.mode","mode",2 << 3 | WireType.VARINT);
      
      public static const BATCHCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Card_BatchRefine_CS.batchCount","batchCount",3 << 3 | WireType.VARINT);
      
      public static const CONDITION:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Card_BatchRefine_CS.condition","condition",4 << 3 | WireType.VARINT);
       
      
      private var cardUId$field:Int64;
      
      private var mode$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var batchCount$field:uint;
      
      public var condition:Array;
      
      public function Cmd_Card_BatchRefine_CS()
      {
         this.condition = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Card_BatchRefine_CS.$MessageID;
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
      
      public function clearMode() : void
      {
         this.hasField$0 &= 4294967294;
         this.mode$field = new uint();
      }
      
      public function get hasMode() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set mode(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.mode$field = param1;
      }
      
      public function get mode() : uint
      {
         return this.mode$field;
      }
      
      public function clearBatchCount() : void
      {
         this.hasField$0 &= 4294967293;
         this.batchCount$field = new uint();
      }
      
      public function get hasBatchCount() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set batchCount(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.batchCount$field = param1;
      }
      
      public function get batchCount() : uint
      {
         return this.batchCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasCardUId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.cardUId$field);
         }
         if(this.hasMode)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.mode$field);
         }
         if(this.hasBatchCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.batchCount$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.condition.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.condition[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_BatchRefine_CS.cardUId cannot be set twice.");
                  }
                  _loc3_++;
                  this.cardUId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_BatchRefine_CS.mode cannot be set twice.");
                  }
                  _loc4_++;
                  this.mode = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_BatchRefine_CS.batchCount cannot be set twice.");
                  }
                  _loc5_++;
                  this.batchCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if((_loc6_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.condition);
                  }
                  else
                  {
                     this.condition.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
