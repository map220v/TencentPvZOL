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
   
   public final class DtoPayShopGiftTicket extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.DtoPayShopGiftTicket";
      
      public static const GOODSID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.DtoPayShopGiftTicket.goodsId","goodsId",1 << 3 | WireType.VARINT);
      
      public static const REMAINTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.DtoPayShopGiftTicket.remainTimes","remainTimes",2 << 3 | WireType.VARINT);
      
      public static const LASTGETTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.DtoPayShopGiftTicket.lastGetTime","lastGetTime",3 << 3 | WireType.VARINT);
      
      public static const TICKETNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.DtoPayShopGiftTicket.ticketNum","ticketNum",4 << 3 | WireType.VARINT);
       
      
      private var goodsId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var remainTimes$field:uint;
      
      private var lastGetTime$field:uint;
      
      private var ticketNum$field:uint;
      
      public function DtoPayShopGiftTicket()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return DtoPayShopGiftTicket.$MessageID;
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
      
      public function clearRemainTimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.remainTimes$field = new uint();
      }
      
      public function get hasRemainTimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set remainTimes(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.remainTimes$field = param1;
      }
      
      public function get remainTimes() : uint
      {
         return this.remainTimes$field;
      }
      
      public function clearLastGetTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.lastGetTime$field = new uint();
      }
      
      public function get hasLastGetTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set lastGetTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.lastGetTime$field = param1;
      }
      
      public function get lastGetTime() : uint
      {
         return this.lastGetTime$field;
      }
      
      public function clearTicketNum() : void
      {
         this.hasField$0 &= 4294967287;
         this.ticketNum$field = new uint();
      }
      
      public function get hasTicketNum() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set ticketNum(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.ticketNum$field = param1;
      }
      
      public function get ticketNum() : uint
      {
         return this.ticketNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasGoodsId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.goodsId$field);
         }
         if(this.hasRemainTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.remainTimes$field);
         }
         if(this.hasLastGetTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.lastGetTime$field);
         }
         if(this.hasTicketNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.ticketNum$field);
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
                     throw new IOError("Bad data format: DtoPayShopGiftTicket.goodsId cannot be set twice.");
                  }
                  _loc3_++;
                  this.goodsId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: DtoPayShopGiftTicket.remainTimes cannot be set twice.");
                  }
                  _loc4_++;
                  this.remainTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: DtoPayShopGiftTicket.lastGetTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.lastGetTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: DtoPayShopGiftTicket.ticketNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.ticketNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
