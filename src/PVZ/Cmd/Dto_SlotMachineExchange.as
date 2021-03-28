package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_SlotMachineExchange extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_SlotMachineExchange";
      
      public static const EXCHANGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SlotMachineExchange.exchangeid","exchangeid",1 << 3 | WireType.VARINT);
      
      public static const EXCHANGETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SlotMachineExchange.exchangetimes","exchangetimes",2 << 3 | WireType.VARINT);
      
      public static const NEEDCREDIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SlotMachineExchange.needcredit","needcredit",3 << 3 | WireType.VARINT);
      
      public static const ITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_SlotMachineExchange.items","items",4 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const EXCHANGECOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SlotMachineExchange.exchangecount","exchangecount",5 << 3 | WireType.VARINT);
       
      
      private var exchangeid$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var exchangetimes$field:uint;
      
      private var needcredit$field:uint;
      
      public var items:Array;
      
      private var exchangecount$field:uint;
      
      public function Dto_SlotMachineExchange()
      {
         this.items = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_SlotMachineExchange.$MessageID;
      }
      
      public function clearExchangeid() : void
      {
         this.hasField$0 &= 4294967294;
         this.exchangeid$field = new uint();
      }
      
      public function get hasExchangeid() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set exchangeid(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.exchangeid$field = param1;
      }
      
      public function get exchangeid() : uint
      {
         return this.exchangeid$field;
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
      
      public function clearNeedcredit() : void
      {
         this.hasField$0 &= 4294967291;
         this.needcredit$field = new uint();
      }
      
      public function get hasNeedcredit() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set needcredit(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.needcredit$field = param1;
      }
      
      public function get needcredit() : uint
      {
         return this.needcredit$field;
      }
      
      public function clearExchangecount() : void
      {
         this.hasField$0 &= 4294967287;
         this.exchangecount$field = new uint();
      }
      
      public function get hasExchangecount() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set exchangecount(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.exchangecount$field = param1;
      }
      
      public function get exchangecount() : uint
      {
         return this.exchangecount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasExchangeid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.exchangeid$field);
         }
         if(this.hasExchangetimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.exchangetimes$field);
         }
         if(this.hasNeedcredit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.needcredit$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.items.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.items[_loc2_]);
            _loc2_++;
         }
         if(this.hasExchangecount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.exchangecount$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Dto_SlotMachineExchange.exchangeid cannot be set twice.");
                  }
                  _loc3_++;
                  this.exchangeid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SlotMachineExchange.exchangetimes cannot be set twice.");
                  }
                  _loc4_++;
                  this.exchangetimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SlotMachineExchange.needcredit cannot be set twice.");
                  }
                  _loc5_++;
                  this.needcredit = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  this.items.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SlotMachineExchange.exchangecount cannot be set twice.");
                  }
                  _loc6_++;
                  this.exchangecount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
