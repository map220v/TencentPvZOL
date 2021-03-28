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
   
   public final class Dto_ExchangeStore_Entry extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ExchangeStore_Entry";
      
      public static const ENTRYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExchangeStore_Entry.entryId","entryId",1 << 3 | WireType.VARINT);
      
      public static const POS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExchangeStore_Entry.pos","pos",2 << 3 | WireType.VARINT);
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExchangeStore_Entry.itemId","itemId",3 << 3 | WireType.VARINT);
      
      public static const ITEMNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExchangeStore_Entry.itemNum","itemNum",4 << 3 | WireType.VARINT);
      
      public static const CONSUMEITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExchangeStore_Entry.consumeItemId","consumeItemId",5 << 3 | WireType.VARINT);
      
      public static const CONSUMEITEMNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExchangeStore_Entry.consumeItemNum","consumeItemNum",6 << 3 | WireType.VARINT);
      
      public static const HASEXCHANGED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_ExchangeStore_Entry.hasExchanged","hasExchanged",7 << 3 | WireType.VARINT);
       
      
      private var entryId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var pos$field:uint;
      
      private var itemId$field:uint;
      
      private var itemNum$field:uint;
      
      private var consumeItemId$field:uint;
      
      private var consumeItemNum$field:uint;
      
      private var hasExchanged$field:Boolean;
      
      public function Dto_ExchangeStore_Entry()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ExchangeStore_Entry.$MessageID;
      }
      
      public function clearEntryId() : void
      {
         this.hasField$0 &= 4294967294;
         this.entryId$field = new uint();
      }
      
      public function get hasEntryId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set entryId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.entryId$field = param1;
      }
      
      public function get entryId() : uint
      {
         return this.entryId$field;
      }
      
      public function clearPos() : void
      {
         this.hasField$0 &= 4294967293;
         this.pos$field = new uint();
      }
      
      public function get hasPos() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set pos(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.pos$field = param1;
      }
      
      public function get pos() : uint
      {
         return this.pos$field;
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
      
      public function clearConsumeItemId() : void
      {
         this.hasField$0 &= 4294967279;
         this.consumeItemId$field = new uint();
      }
      
      public function get hasConsumeItemId() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set consumeItemId(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.consumeItemId$field = param1;
      }
      
      public function get consumeItemId() : uint
      {
         return this.consumeItemId$field;
      }
      
      public function clearConsumeItemNum() : void
      {
         this.hasField$0 &= 4294967263;
         this.consumeItemNum$field = new uint();
      }
      
      public function get hasConsumeItemNum() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set consumeItemNum(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.consumeItemNum$field = param1;
      }
      
      public function get consumeItemNum() : uint
      {
         return this.consumeItemNum$field;
      }
      
      public function clearHasExchanged() : void
      {
         this.hasField$0 &= 4294967231;
         this.hasExchanged$field = new Boolean();
      }
      
      public function get hasHasExchanged() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set hasExchanged(param1:Boolean) : void
      {
         this.hasField$0 |= 64;
         this.hasExchanged$field = param1;
      }
      
      public function get hasExchanged() : Boolean
      {
         return this.hasExchanged$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasEntryId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.entryId$field);
         }
         if(this.hasPos)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.pos$field);
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
         if(this.hasConsumeItemId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.consumeItemId$field);
         }
         if(this.hasConsumeItemNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.consumeItemNum$field);
         }
         if(this.hasHasExchanged)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_BOOL(param1,this.hasExchanged$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc10_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc10_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc10_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExchangeStore_Entry.entryId cannot be set twice.");
                  }
                  _loc3_++;
                  this.entryId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExchangeStore_Entry.pos cannot be set twice.");
                  }
                  _loc4_++;
                  this.pos = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExchangeStore_Entry.itemId cannot be set twice.");
                  }
                  _loc5_++;
                  this.itemId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExchangeStore_Entry.itemNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.itemNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExchangeStore_Entry.consumeItemId cannot be set twice.");
                  }
                  _loc7_++;
                  this.consumeItemId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExchangeStore_Entry.consumeItemNum cannot be set twice.");
                  }
                  _loc8_++;
                  this.consumeItemNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExchangeStore_Entry.hasExchanged cannot be set twice.");
                  }
                  _loc9_++;
                  this.hasExchanged = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
