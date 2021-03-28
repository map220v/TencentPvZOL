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
   
   public final class Dto_SecKill_Good extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_SecKill_Good";
      
      public static const SECKILLID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SecKill_Good.seckillId","seckillId",1 << 3 | WireType.VARINT);
      
      public static const SALEPRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SecKill_Good.salePrice","salePrice",2 << 3 | WireType.VARINT);
      
      public static const ORIPRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SecKill_Good.oriPrice","oriPrice",3 << 3 | WireType.VARINT);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_SecKill_Good.name","name",4 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const LMTPERPERSON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SecKill_Good.lmtPerPerson","lmtPerPerson",5 << 3 | WireType.VARINT);
      
      public static const BASEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SecKill_Good.baseId","baseId",6 << 3 | WireType.VARINT);
      
      public static const IDNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SecKill_Good.IdNum","idNum",7 << 3 | WireType.VARINT);
      
      public static const TOTALNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SecKill_Good.totalNum","totalNum",8 << 3 | WireType.VARINT);
      
      public static const USEGOLDTICKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SecKill_Good.useGoldTicket","useGoldTicket",9 << 3 | WireType.VARINT);
      
      public static const SALENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SecKill_Good.saleNum","saleNum",10 << 3 | WireType.VARINT);
       
      
      private var seckillId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var salePrice:uint;
      
      public var oriPrice:uint;
      
      private var name$field:String;
      
      public var lmtPerPerson:uint;
      
      public var baseId:uint;
      
      public var idNum:uint;
      
      public var totalNum:uint;
      
      private var useGoldTicket$field:uint;
      
      private var saleNum$field:uint;
      
      public function Dto_SecKill_Good()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_SecKill_Good.$MessageID;
      }
      
      public function clearSeckillId() : void
      {
         this.hasField$0 &= 4294967294;
         this.seckillId$field = new uint();
      }
      
      public function get hasSeckillId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set seckillId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.seckillId$field = param1;
      }
      
      public function get seckillId() : uint
      {
         return this.seckillId$field;
      }
      
      public function clearName() : void
      {
         this.name$field = null;
      }
      
      public function get hasName() : Boolean
      {
         return this.name$field != null;
      }
      
      public function set name(param1:String) : void
      {
         this.name$field = param1;
      }
      
      public function get name() : String
      {
         return this.name$field;
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
      
      public function clearSaleNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.saleNum$field = new uint();
      }
      
      public function get hasSaleNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set saleNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.saleNum$field = param1;
      }
      
      public function get saleNum() : uint
      {
         return this.saleNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasSeckillId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.seckillId$field);
         }
         WriteUtils.writeTag(param1,WireType.VARINT,2);
         WriteUtils.write$TYPE_UINT32(param1,this.salePrice);
         WriteUtils.writeTag(param1,WireType.VARINT,3);
         WriteUtils.write$TYPE_UINT32(param1,this.oriPrice);
         if(this.hasName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_STRING(param1,this.name$field);
         }
         WriteUtils.writeTag(param1,WireType.VARINT,5);
         WriteUtils.write$TYPE_UINT32(param1,this.lmtPerPerson);
         WriteUtils.writeTag(param1,WireType.VARINT,6);
         WriteUtils.write$TYPE_UINT32(param1,this.baseId);
         WriteUtils.writeTag(param1,WireType.VARINT,7);
         WriteUtils.write$TYPE_UINT32(param1,this.idNum);
         WriteUtils.writeTag(param1,WireType.VARINT,8);
         WriteUtils.write$TYPE_UINT32(param1,this.totalNum);
         if(this.hasUseGoldTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.useGoldTicket$field);
         }
         if(this.hasSaleNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.saleNum$field);
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
                     throw new IOError("Bad data format: Dto_SecKill_Good.seckillId cannot be set twice.");
                  }
                  _loc3_++;
                  this.seckillId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SecKill_Good.salePrice cannot be set twice.");
                  }
                  _loc4_++;
                  this.salePrice = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SecKill_Good.oriPrice cannot be set twice.");
                  }
                  _loc5_++;
                  this.oriPrice = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SecKill_Good.name cannot be set twice.");
                  }
                  _loc6_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SecKill_Good.lmtPerPerson cannot be set twice.");
                  }
                  _loc7_++;
                  this.lmtPerPerson = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SecKill_Good.baseId cannot be set twice.");
                  }
                  _loc8_++;
                  this.baseId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SecKill_Good.idNum cannot be set twice.");
                  }
                  _loc9_++;
                  this.idNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SecKill_Good.totalNum cannot be set twice.");
                  }
                  _loc10_++;
                  this.totalNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SecKill_Good.useGoldTicket cannot be set twice.");
                  }
                  _loc11_++;
                  this.useGoldTicket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SecKill_Good.saleNum cannot be set twice.");
                  }
                  _loc12_++;
                  this.saleNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc13_);
                  break;
            }
         }
      }
   }
}
