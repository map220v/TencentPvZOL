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
   
   public final class Dto_TanabataExchangeInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_TanabataExchangeInfo";
      
      public static const EXCHANGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TanabataExchangeInfo.exchangeId","exchangeId",1 << 3 | WireType.VARINT);
      
      public static const COSTSTONE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TanabataExchangeInfo.costStone","costStone",2 << 3 | WireType.VARINT);
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TanabataExchangeInfo.itemId","itemId",3 << 3 | WireType.VARINT);
      
      public static const ITEMNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TanabataExchangeInfo.itemNum","itemNum",4 << 3 | WireType.VARINT);
      
      public static const CANEXCHANGENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TanabataExchangeInfo.canExchangeNum","canExchangeNum",5 << 3 | WireType.VARINT);
      
      public static const HASEXCHANGENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TanabataExchangeInfo.hasExchangeNum","hasExchangeNum",6 << 3 | WireType.VARINT);
       
      
      private var exchangeId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var costStone$field:uint;
      
      private var itemId$field:uint;
      
      private var itemNum$field:uint;
      
      private var canExchangeNum$field:uint;
      
      private var hasExchangeNum$field:uint;
      
      public function Dto_TanabataExchangeInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_TanabataExchangeInfo.$MessageID;
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
      
      public function clearCostStone() : void
      {
         this.hasField$0 &= 4294967293;
         this.costStone$field = new uint();
      }
      
      public function get hasCostStone() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set costStone(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.costStone$field = param1;
      }
      
      public function get costStone() : uint
      {
         return this.costStone$field;
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
      
      public function clearCanExchangeNum() : void
      {
         this.hasField$0 &= 4294967279;
         this.canExchangeNum$field = new uint();
      }
      
      public function get hasCanExchangeNum() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set canExchangeNum(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.canExchangeNum$field = param1;
      }
      
      public function get canExchangeNum() : uint
      {
         return this.canExchangeNum$field;
      }
      
      public function clearHasExchangeNum() : void
      {
         this.hasField$0 &= 4294967263;
         this.hasExchangeNum$field = new uint();
      }
      
      public function get hasHasExchangeNum() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set hasExchangeNum(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.hasExchangeNum$field = param1;
      }
      
      public function get hasExchangeNum() : uint
      {
         return this.hasExchangeNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasExchangeId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.exchangeId$field);
         }
         if(this.hasCostStone)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.costStone$field);
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
         if(this.hasCanExchangeNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.canExchangeNum$field);
         }
         if(this.hasHasExchangeNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.hasExchangeNum$field);
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
                     throw new IOError("Bad data format: Dto_TanabataExchangeInfo.exchangeId cannot be set twice.");
                  }
                  _loc3_++;
                  this.exchangeId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TanabataExchangeInfo.costStone cannot be set twice.");
                  }
                  _loc4_++;
                  this.costStone = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TanabataExchangeInfo.itemId cannot be set twice.");
                  }
                  _loc5_++;
                  this.itemId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TanabataExchangeInfo.itemNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.itemNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TanabataExchangeInfo.canExchangeNum cannot be set twice.");
                  }
                  _loc7_++;
                  this.canExchangeNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TanabataExchangeInfo.hasExchangeNum cannot be set twice.");
                  }
                  _loc8_++;
                  this.hasExchangeNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
