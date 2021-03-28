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
   
   public final class Cmd_Item_Exchange_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Item_Exchange_SC";
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Item_Exchange_SC.itemId","itemId",1 << 3 | WireType.VARINT);
      
      public static const NUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Item_Exchange_SC.num","num",2 << 3 | WireType.VARINT);
      
      public static const EXCHANGEITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Item_Exchange_SC.exchangeItemId","exchangeItemId",3 << 3 | WireType.VARINT);
      
      public static const EXCHANGEITEMNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Item_Exchange_SC.exchangeItemNum","exchangeItemNum",4 << 3 | WireType.VARINT);
       
      
      private var itemId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var num$field:uint;
      
      private var exchangeItemId$field:uint;
      
      private var exchangeItemNum$field:uint;
      
      public function Cmd_Item_Exchange_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Item_Exchange_SC.$MessageID;
      }
      
      public function clearItemId() : void
      {
         this.hasField$0 &= 4294967294;
         this.itemId$field = new uint();
      }
      
      public function get hasItemId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set itemId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.itemId$field = param1;
      }
      
      public function get itemId() : uint
      {
         return this.itemId$field;
      }
      
      public function clearNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.num$field = new uint();
      }
      
      public function get hasNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set num(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.num$field = param1;
      }
      
      public function get num() : uint
      {
         return this.num$field;
      }
      
      public function clearExchangeItemId() : void
      {
         this.hasField$0 &= 4294967291;
         this.exchangeItemId$field = new uint();
      }
      
      public function get hasExchangeItemId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set exchangeItemId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.exchangeItemId$field = param1;
      }
      
      public function get exchangeItemId() : uint
      {
         return this.exchangeItemId$field;
      }
      
      public function clearExchangeItemNum() : void
      {
         this.hasField$0 &= 4294967287;
         this.exchangeItemNum$field = new uint();
      }
      
      public function get hasExchangeItemNum() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set exchangeItemNum(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.exchangeItemNum$field = param1;
      }
      
      public function get exchangeItemNum() : uint
      {
         return this.exchangeItemNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasItemId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.itemId$field);
         }
         if(this.hasNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.num$field);
         }
         if(this.hasExchangeItemId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.exchangeItemId$field);
         }
         if(this.hasExchangeItemNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.exchangeItemNum$field);
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
                     throw new IOError("Bad data format: Cmd_Item_Exchange_SC.itemId cannot be set twice.");
                  }
                  _loc3_++;
                  this.itemId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Item_Exchange_SC.num cannot be set twice.");
                  }
                  _loc4_++;
                  this.num = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Item_Exchange_SC.exchangeItemId cannot be set twice.");
                  }
                  _loc5_++;
                  this.exchangeItemId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Item_Exchange_SC.exchangeItemNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.exchangeItemNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
