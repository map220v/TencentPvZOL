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
   
   public final class Dto_ShellingExchangeItem extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ShellingExchangeItem";
      
      public static const EXCHANGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ShellingExchangeItem.exchangeId","exchangeId",1 << 3 | WireType.VARINT);
      
      public static const COSTTICKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ShellingExchangeItem.costTicket","costTicket",2 << 3 | WireType.VARINT);
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ShellingExchangeItem.itemId","itemId",3 << 3 | WireType.VARINT);
      
      public static const ITEMNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ShellingExchangeItem.itemNum","itemNum",4 << 3 | WireType.VARINT);
      
      public static const EXCHANGENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ShellingExchangeItem.exchangeNum","exchangeNum",5 << 3 | WireType.VARINT);
      
      public static const EXCHANGEDNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ShellingExchangeItem.exchangedNum","exchangedNum",6 << 3 | WireType.VARINT);
       
      
      private var exchangeId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var costTicket$field:uint;
      
      private var itemId$field:uint;
      
      private var itemNum$field:uint;
      
      private var exchangeNum$field:uint;
      
      private var exchangedNum$field:uint;
      
      public function Dto_ShellingExchangeItem()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ShellingExchangeItem.$MessageID;
      }
      
      public function clearExchangeId() : void
      {
         this.hasField$0 &= 4294967294;
         this.exchangeId$field = new uint();
      }
      
      public function get hasExchangeId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set exchangeId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.exchangeId$field = param1;
      }
      
      public function get exchangeId() : uint
      {
         return this.exchangeId$field;
      }
      
      public function clearCostTicket() : void
      {
         this.hasField$0 &= 4294967293;
         this.costTicket$field = new uint();
      }
      
      public function get hasCostTicket() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set costTicket(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.costTicket$field = param1;
      }
      
      public function get costTicket() : uint
      {
         return this.costTicket$field;
      }
      
      public function clearItemId() : void
      {
         this.hasField$0 &= 4294967291;
         this.itemId$field = new uint();
      }
      
      public function get hasItemId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set itemId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.itemId$field = param1;
      }
      
      public function get itemId() : uint
      {
         return this.itemId$field;
      }
      
      public function clearItemNum() : void
      {
         this.hasField$0 &= 4294967287;
         this.itemNum$field = new uint();
      }
      
      public function get hasItemNum() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set itemNum(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.itemNum$field = param1;
      }
      
      public function get itemNum() : uint
      {
         return this.itemNum$field;
      }
      
      public function clearExchangeNum() : void
      {
         this.hasField$0 &= 4294967279;
         this.exchangeNum$field = new uint();
      }
      
      public function get hasExchangeNum() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set exchangeNum(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.exchangeNum$field = param1;
      }
      
      public function get exchangeNum() : uint
      {
         return this.exchangeNum$field;
      }
      
      public function clearExchangedNum() : void
      {
         this.hasField$0 &= 4294967263;
         this.exchangedNum$field = new uint();
      }
      
      public function get hasExchangedNum() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set exchangedNum(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.exchangedNum$field = param1;
      }
      
      public function get exchangedNum() : uint
      {
         return this.exchangedNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasExchangeId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.exchangeId$field);
         }
         if(this.hasCostTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.costTicket$field);
         }
         if(this.hasItemId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.itemId$field);
         }
         if(this.hasItemNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.itemNum$field);
         }
         if(this.hasExchangeNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.exchangeNum$field);
         }
         if(this.hasExchangedNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.exchangedNum$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc9_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc9_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ShellingExchangeItem.exchangeId cannot be set twice.");
                  }
                  _loc3_++;
                  this.exchangeId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ShellingExchangeItem.costTicket cannot be set twice.");
                  }
                  _loc4_++;
                  this.costTicket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ShellingExchangeItem.itemId cannot be set twice.");
                  }
                  _loc5_++;
                  this.itemId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ShellingExchangeItem.itemNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.itemNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ShellingExchangeItem.exchangeNum cannot be set twice.");
                  }
                  _loc7_++;
                  this.exchangeNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ShellingExchangeItem.exchangedNum cannot be set twice.");
                  }
                  _loc8_++;
                  this.exchangedNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
