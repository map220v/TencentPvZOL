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
   
   public final class Cmd_FlexibleActivity_ConsumeFundBuy_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_FlexibleActivity_ConsumeFundBuy_CS";
      
      public static const IACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_ConsumeFundBuy_CS.iActivityId","iActivityId",1 << 3 | WireType.VARINT);
      
      public static const IFUNDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_ConsumeFundBuy_CS.iFundId","iFundId",2 << 3 | WireType.VARINT);
       
      
      private var iActivityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var iFundId$field:uint;
      
      public function Cmd_FlexibleActivity_ConsumeFundBuy_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_FlexibleActivity_ConsumeFundBuy_CS.$MessageID;
      }
      
      public function clearIActivityId() : void
      {
         this.hasField$0 &= 4294967294;
         this.iActivityId$field = new uint();
      }
      
      public function get hasIActivityId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set iActivityId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.iActivityId$field = param1;
      }
      
      public function get iActivityId() : uint
      {
         return this.iActivityId$field;
      }
      
      public function clearIFundId() : void
      {
         this.hasField$0 &= 4294967293;
         this.iFundId$field = new uint();
      }
      
      public function get hasIFundId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set iFundId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.iFundId$field = param1;
      }
      
      public function get iFundId() : uint
      {
         return this.iFundId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasIActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.iActivityId$field);
         }
         if(this.hasIFundId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.iFundId$field);
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
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_ConsumeFundBuy_CS.iActivityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.iActivityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_ConsumeFundBuy_CS.iFundId cannot be set twice.");
                  }
                  _loc4_++;
                  this.iFundId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
