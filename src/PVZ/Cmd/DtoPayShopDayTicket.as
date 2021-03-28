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
   
   public final class DtoPayShopDayTicket extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.DtoPayShopDayTicket";
      
      public static const GOODSID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.DtoPayShopDayTicket.goodsId","goodsId",1 << 3 | WireType.VARINT);
      
      public static const ENDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.DtoPayShopDayTicket.endTime","endTime",2 << 3 | WireType.VARINT);
      
      public static const LASTGETTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.DtoPayShopDayTicket.lastGetTime","lastGetTime",3 << 3 | WireType.VARINT);
      
      public static const TICKETNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.DtoPayShopDayTicket.ticketNum","ticketNum",4 << 3 | WireType.VARINT);
       
      
      private var goodsId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var endTime$field:uint;
      
      private var lastGetTime$field:uint;
      
      private var ticketNum$field:uint;
      
      public function DtoPayShopDayTicket()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return DtoPayShopDayTicket.$MessageID;
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
      
      public function clearEndTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.endTime$field = new uint();
      }
      
      public function get hasEndTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set endTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.endTime$field = param1;
      }
      
      public function get endTime() : uint
      {
         return this.endTime$field;
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
         if(this.hasEndTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.endTime$field);
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
                     throw new IOError("Bad data format: DtoPayShopDayTicket.goodsId cannot be set twice.");
                  }
                  _loc3_++;
                  this.goodsId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: DtoPayShopDayTicket.endTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.endTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: DtoPayShopDayTicket.lastGetTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.lastGetTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: DtoPayShopDayTicket.ticketNum cannot be set twice.");
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
