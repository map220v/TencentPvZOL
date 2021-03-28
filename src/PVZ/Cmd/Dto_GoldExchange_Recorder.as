package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_GoldExchange_Recorder extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_GoldExchange_Recorder";
      
      public static const PRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GoldExchange_Recorder.price","price",1 << 3 | WireType.VARINT);
      
      public static const GOLD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GoldExchange_Recorder.gold","gold",2 << 3 | WireType.VARINT);
      
      public static const CRITICALTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GoldExchange_Recorder.criticalTimes","criticalTimes",3 << 3 | WireType.VARINT);
      
      public static const PRIORITY:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_GoldExchange_Recorder.priority","priority",4 << 3 | WireType.VARINT,E_Priority);
      
      public static const PRICETYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GoldExchange_Recorder.priceType","priceType",5 << 3 | WireType.VARINT);
      
      public static const EXTRAGOLD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GoldExchange_Recorder.extraGold","extraGold",6 << 3 | WireType.VARINT);
       
      
      private var price$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var gold$field:uint;
      
      private var criticalTimes$field:uint;
      
      private var priority$field:int;
      
      private var priceType$field:uint;
      
      private var extraGold$field:uint;
      
      public function Dto_GoldExchange_Recorder()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_GoldExchange_Recorder.$MessageID;
      }
      
      public function clearPrice() : void
      {
         this.hasField$0 &= 4294967294;
         this.price$field = new uint();
      }
      
      public function get hasPrice() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set price(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.price$field = param1;
      }
      
      public function get price() : uint
      {
         return this.price$field;
      }
      
      public function clearGold() : void
      {
         this.hasField$0 &= 4294967293;
         this.gold$field = new uint();
      }
      
      public function get hasGold() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set gold(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.gold$field = param1;
      }
      
      public function get gold() : uint
      {
         return this.gold$field;
      }
      
      public function clearCriticalTimes() : void
      {
         this.hasField$0 &= 4294967291;
         this.criticalTimes$field = new uint();
      }
      
      public function get hasCriticalTimes() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set criticalTimes(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.criticalTimes$field = param1;
      }
      
      public function get criticalTimes() : uint
      {
         return this.criticalTimes$field;
      }
      
      public function clearPriority() : void
      {
         this.hasField$0 &= 4294967287;
         this.priority$field = new int();
      }
      
      public function get hasPriority() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set priority(param1:int) : void
      {
         this.hasField$0 |= 8;
         this.priority$field = param1;
      }
      
      public function get priority() : int
      {
         return this.priority$field;
      }
      
      public function clearPriceType() : void
      {
         this.hasField$0 &= 4294967279;
         this.priceType$field = new uint();
      }
      
      public function get hasPriceType() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set priceType(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.priceType$field = param1;
      }
      
      public function get priceType() : uint
      {
         return this.priceType$field;
      }
      
      public function clearExtraGold() : void
      {
         this.hasField$0 &= 4294967263;
         this.extraGold$field = new uint();
      }
      
      public function get hasExtraGold() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set extraGold(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.extraGold$field = param1;
      }
      
      public function get extraGold() : uint
      {
         return this.extraGold$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasPrice)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.price$field);
         }
         if(this.hasGold)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.gold$field);
         }
         if(this.hasCriticalTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.criticalTimes$field);
         }
         if(this.hasPriority)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_ENUM(param1,this.priority$field);
         }
         if(this.hasPriceType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.priceType$field);
         }
         if(this.hasExtraGold)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.extraGold$field);
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
                     throw new IOError("Bad data format: Dto_GoldExchange_Recorder.price cannot be set twice.");
                  }
                  _loc3_++;
                  this.price = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GoldExchange_Recorder.gold cannot be set twice.");
                  }
                  _loc4_++;
                  this.gold = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GoldExchange_Recorder.criticalTimes cannot be set twice.");
                  }
                  _loc5_++;
                  this.criticalTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GoldExchange_Recorder.priority cannot be set twice.");
                  }
                  _loc6_++;
                  this.priority = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GoldExchange_Recorder.priceType cannot be set twice.");
                  }
                  _loc7_++;
                  this.priceType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GoldExchange_Recorder.extraGold cannot be set twice.");
                  }
                  _loc8_++;
                  this.extraGold = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
