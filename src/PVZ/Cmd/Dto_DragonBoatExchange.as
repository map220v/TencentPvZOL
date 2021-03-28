package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_DragonBoatExchange extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_DragonBoatExchange";
      
      public static const EXCHANGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_DragonBoatExchange.exchangeid","exchangeid",1 << 3 | WireType.VARINT);
      
      public static const EXCHANGETIMESLIMIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_DragonBoatExchange.exchangetimeslimit","exchangetimeslimit",2 << 3 | WireType.VARINT);
      
      public static const NEEDCREDIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_DragonBoatExchange.needcredit","needcredit",3 << 3 | WireType.VARINT);
      
      public static const ITEM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_DragonBoatExchange.item","item",4 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const EXCHANGETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_DragonBoatExchange.exchangetimes","exchangetimes",5 << 3 | WireType.VARINT);
       
      
      public var exchangeid:uint;
      
      private var exchangetimeslimit$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var needcredit:uint;
      
      public var item:Dto_IdNum;
      
      private var exchangetimes$field:uint;
      
      public function Dto_DragonBoatExchange()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_DragonBoatExchange.$MessageID;
      }
      
      public function clearExchangetimeslimit() : void
      {
         this.hasField$0 &= 4294967294;
         this.exchangetimeslimit$field = new uint();
      }
      
      public function get hasExchangetimeslimit() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set exchangetimeslimit(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.exchangetimeslimit$field = param1;
      }
      
      public function get exchangetimeslimit() : uint
      {
         return this.exchangetimeslimit$field;
      }
      
      public function clearExchangetimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.exchangetimes$field = new uint();
      }
      
      public function get hasExchangetimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set exchangetimes(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.exchangetimes$field = param1;
      }
      
      public function get exchangetimes() : uint
      {
         return this.exchangetimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         WriteUtils.writeTag(param1,WireType.VARINT,1);
         WriteUtils.write$TYPE_UINT32(param1,this.exchangeid);
         if(this.hasExchangetimeslimit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.exchangetimeslimit$field);
         }
         WriteUtils.writeTag(param1,WireType.VARINT,3);
         WriteUtils.write$TYPE_UINT32(param1,this.needcredit);
         WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
         WriteUtils.write$TYPE_MESSAGE(param1,this.item);
         if(this.hasExchangetimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.exchangetimes$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_DragonBoatExchange.exchangeid cannot be set twice.");
                  }
                  _loc3_++;
                  this.exchangeid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_DragonBoatExchange.exchangetimeslimit cannot be set twice.");
                  }
                  _loc4_++;
                  this.exchangetimeslimit = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_DragonBoatExchange.needcredit cannot be set twice.");
                  }
                  _loc5_++;
                  this.needcredit = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_DragonBoatExchange.item cannot be set twice.");
                  }
                  _loc6_++;
                  this.item = new Dto_IdNum();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.item);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_DragonBoatExchange.exchangetimes cannot be set twice.");
                  }
                  _loc7_++;
                  this.exchangetimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
