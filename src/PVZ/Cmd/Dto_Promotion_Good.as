package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Promotion_Good extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Promotion_Good";
      
      public static const PROMOTIONID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Promotion_Good.promotionId","promotionId",1 << 3 | WireType.VARINT);
      
      public static const PROMOTIONCOST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Promotion_Good.promotionCost","promotionCost",2 << 3 | WireType.VARINT);
      
      public static const ORIGINALCOST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Promotion_Good.originalCost","originalCost",3 << 3 | WireType.VARINT);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Promotion_Good.name","name",4 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const BUYLIMIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Promotion_Good.buyLimit","buyLimit",5 << 3 | WireType.VARINT);
      
      public static const ITEMBASEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Promotion_Good.itemBaseId","itemBaseId",6 << 3 | WireType.VARINT);
      
      public static const NUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Promotion_Good.num","num",7 << 3 | WireType.VARINT);
      
      public static const HASBUYNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Promotion_Good.hasBuyNum","hasBuyNum",8 << 3 | WireType.VARINT);
      
      public static const USEGOLDTICKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Promotion_Good.useGoldTicket","useGoldTicket",9 << 3 | WireType.VARINT);
      
      public static const CYCLE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Promotion_Good.cycle","cycle",10 << 3 | WireType.VARINT);
       
      
      public var promotionId:uint;
      
      public var promotionCost:uint;
      
      public var originalCost:uint;
      
      public var name:String;
      
      public var buyLimit:uint;
      
      public var itemBaseId:uint;
      
      public var num:uint;
      
      private var hasBuyNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var useGoldTicket$field:uint;
      
      private var cycle$field:uint;
      
      public function Dto_Promotion_Good()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Promotion_Good.$MessageID;
      }
      
      public function clearHasBuyNum() : void
      {
         this.hasField$0 &= 4294967294;
         this.hasBuyNum$field = new uint();
      }
      
      public function get hasHasBuyNum() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set hasBuyNum(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.hasBuyNum$field = param1;
      }
      
      public function get hasBuyNum() : uint
      {
         return this.hasBuyNum$field;
      }
      
      public function clearUseGoldTicket() : void
      {
         this.hasField$0 &= 4294967293;
         this.useGoldTicket$field = new uint();
      }
      
      public function get hasUseGoldTicket() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set useGoldTicket(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.useGoldTicket$field = param1;
      }
      
      public function get useGoldTicket() : uint
      {
         return this.useGoldTicket$field;
      }
      
      public function clearCycle() : void
      {
         this.hasField$0 &= 4294967291;
         this.cycle$field = new uint();
      }
      
      public function get hasCycle() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set cycle(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.cycle$field = param1;
      }
      
      public function get cycle() : uint
      {
         return this.cycle$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         WriteUtils.writeTag(param1,WireType.VARINT,1);
         WriteUtils.write$TYPE_UINT32(param1,this.promotionId);
         WriteUtils.writeTag(param1,WireType.VARINT,2);
         WriteUtils.write$TYPE_UINT32(param1,this.promotionCost);
         WriteUtils.writeTag(param1,WireType.VARINT,3);
         WriteUtils.write$TYPE_UINT32(param1,this.originalCost);
         WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
         WriteUtils.write$TYPE_STRING(param1,this.name);
         WriteUtils.writeTag(param1,WireType.VARINT,5);
         WriteUtils.write$TYPE_UINT32(param1,this.buyLimit);
         WriteUtils.writeTag(param1,WireType.VARINT,6);
         WriteUtils.write$TYPE_UINT32(param1,this.itemBaseId);
         WriteUtils.writeTag(param1,WireType.VARINT,7);
         WriteUtils.write$TYPE_UINT32(param1,this.num);
         if(this.hasHasBuyNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.hasBuyNum$field);
         }
         if(this.hasUseGoldTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.useGoldTicket$field);
         }
         if(this.hasCycle)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.cycle$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc13_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc13_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc13_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Promotion_Good.promotionId cannot be set twice.");
                  }
                  _loc3_++;
                  this.promotionId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Promotion_Good.promotionCost cannot be set twice.");
                  }
                  _loc4_++;
                  this.promotionCost = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Promotion_Good.originalCost cannot be set twice.");
                  }
                  _loc5_++;
                  this.originalCost = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Promotion_Good.name cannot be set twice.");
                  }
                  _loc6_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Promotion_Good.buyLimit cannot be set twice.");
                  }
                  _loc7_++;
                  this.buyLimit = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Promotion_Good.itemBaseId cannot be set twice.");
                  }
                  _loc8_++;
                  this.itemBaseId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Promotion_Good.num cannot be set twice.");
                  }
                  _loc9_++;
                  this.num = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Promotion_Good.hasBuyNum cannot be set twice.");
                  }
                  _loc10_++;
                  this.hasBuyNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Promotion_Good.useGoldTicket cannot be set twice.");
                  }
                  _loc11_++;
                  this.useGoldTicket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Promotion_Good.cycle cannot be set twice.");
                  }
                  _loc12_++;
                  this.cycle = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc13_);
                  break;
            }
         }
      }
   }
}
