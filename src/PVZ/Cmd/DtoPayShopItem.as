package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class DtoPayShopItem extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.DtoPayShopItem";
      
      public static const GOODSID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.DtoPayShopItem.goodsId","goodsId",1 << 3 | WireType.VARINT);
      
      public static const PRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.DtoPayShopItem.price","price",2 << 3 | WireType.VARINT);
      
      public static const CANBUY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.DtoPayShopItem.canBuy","canBuy",3 << 3 | WireType.VARINT);
       
      
      private var goodsId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var price$field:uint;
      
      private var canBuy$field:Boolean;
      
      public function DtoPayShopItem()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return DtoPayShopItem.$MessageID;
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
      
      public function clearPrice() : void
      {
         this.hasField$0 &= 4294967293;
         this.price$field = new uint();
      }
      
      public function get hasPrice() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set price(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.price$field = param1;
      }
      
      public function get price() : uint
      {
         return this.price$field;
      }
      
      public function clearCanBuy() : void
      {
         this.hasField$0 &= 4294967291;
         this.canBuy$field = new Boolean();
      }
      
      public function get hasCanBuy() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set canBuy(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.canBuy$field = param1;
      }
      
      public function get canBuy() : Boolean
      {
         return this.canBuy$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasGoodsId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.goodsId$field);
         }
         if(this.hasPrice)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.price$field);
         }
         if(this.hasCanBuy)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.canBuy$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: DtoPayShopItem.goodsId cannot be set twice.");
                  }
                  _loc3_++;
                  this.goodsId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: DtoPayShopItem.price cannot be set twice.");
                  }
                  _loc4_++;
                  this.price = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: DtoPayShopItem.canBuy cannot be set twice.");
                  }
                  _loc5_++;
                  this.canBuy = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
