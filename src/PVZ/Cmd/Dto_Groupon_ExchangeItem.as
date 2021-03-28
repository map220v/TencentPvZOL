package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Groupon_ExchangeItem extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Groupon_ExchangeItem";
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Groupon_ExchangeItem.name","name",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const PRECOST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Groupon_ExchangeItem.preCost","preCost",2 << 3 | WireType.VARINT);
      
      public static const NOWCOST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Groupon_ExchangeItem.nowCost","nowCost",3 << 3 | WireType.VARINT);
      
      public static const EXCHANGETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Groupon_ExchangeItem.exchangeTimes","exchangeTimes",4 << 3 | WireType.VARINT);
      
      public static const ITEM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_Groupon_ExchangeItem.item","item",5 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const NOEXCHANGELIMIT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_Groupon_ExchangeItem.noexchangelimit","noexchangelimit",6 << 3 | WireType.VARINT);
       
      
      public var name:String;
      
      public var preCost:uint;
      
      public var nowCost:uint;
      
      public var exchangeTimes:uint;
      
      public var item:Dto_IdNum;
      
      private var noexchangelimit$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function Dto_Groupon_ExchangeItem()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Groupon_ExchangeItem.$MessageID;
      }
      
      public function clearNoexchangelimit() : void
      {
         this.hasField$0 &= 4294967294;
         this.noexchangelimit$field = new Boolean();
      }
      
      public function get hasNoexchangelimit() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set noexchangelimit(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.noexchangelimit$field = param1;
      }
      
      public function get noexchangelimit() : Boolean
      {
         return this.noexchangelimit$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
         WriteUtils.write$TYPE_STRING(param1,this.name);
         WriteUtils.writeTag(param1,WireType.VARINT,2);
         WriteUtils.write$TYPE_UINT32(param1,this.preCost);
         WriteUtils.writeTag(param1,WireType.VARINT,3);
         WriteUtils.write$TYPE_UINT32(param1,this.nowCost);
         WriteUtils.writeTag(param1,WireType.VARINT,4);
         WriteUtils.write$TYPE_UINT32(param1,this.exchangeTimes);
         WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
         WriteUtils.write$TYPE_MESSAGE(param1,this.item);
         if(this.hasNoexchangelimit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_BOOL(param1,this.noexchangelimit$field);
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
                     throw new IOError("Bad data format: Dto_Groupon_ExchangeItem.name cannot be set twice.");
                  }
                  _loc3_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Groupon_ExchangeItem.preCost cannot be set twice.");
                  }
                  _loc4_++;
                  this.preCost = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Groupon_ExchangeItem.nowCost cannot be set twice.");
                  }
                  _loc5_++;
                  this.nowCost = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Groupon_ExchangeItem.exchangeTimes cannot be set twice.");
                  }
                  _loc6_++;
                  this.exchangeTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Groupon_ExchangeItem.item cannot be set twice.");
                  }
                  _loc7_++;
                  this.item = new Dto_IdNum();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.item);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Groupon_ExchangeItem.noexchangelimit cannot be set twice.");
                  }
                  _loc8_++;
                  this.noexchangelimit = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
