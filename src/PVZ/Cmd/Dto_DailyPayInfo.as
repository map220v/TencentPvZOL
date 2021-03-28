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
   
   public final class Dto_DailyPayInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_DailyPayInfo";
      
      public static const GOODSID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_DailyPayInfo.goodsId","goodsId",1 << 3 | WireType.VARINT);
      
      public static const PAYSTATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_DailyPayInfo.payStatus","payStatus",2 << 3 | WireType.VARINT);
       
      
      private var goodsId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var payStatus$field:uint;
      
      public function Dto_DailyPayInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_DailyPayInfo.$MessageID;
      }
      
      public function clearGoodsId() : void
      {
         this.hasField$0 &= 4294967294;
         this.goodsId$field = new uint();
      }
      
      public function get hasGoodsId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set goodsId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.goodsId$field = param1;
      }
      
      public function get goodsId() : uint
      {
         return this.goodsId$field;
      }
      
      public function clearPayStatus() : void
      {
         this.hasField$0 &= 4294967293;
         this.payStatus$field = new uint();
      }
      
      public function get hasPayStatus() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set payStatus(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.payStatus$field = param1;
      }
      
      public function get payStatus() : uint
      {
         return this.payStatus$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasGoodsId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.goodsId$field);
         }
         if(this.hasPayStatus)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.payStatus$field);
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
                     throw new IOError("Bad data format: Dto_DailyPayInfo.goodsId cannot be set twice.");
                  }
                  _loc3_++;
                  this.goodsId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_DailyPayInfo.payStatus cannot be set twice.");
                  }
                  _loc4_++;
                  this.payStatus = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
