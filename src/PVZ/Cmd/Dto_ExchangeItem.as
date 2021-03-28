package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_ExchangeItem extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ExchangeItem";
      
      public static const COSTITEM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_ExchangeItem.costItem","costItem",1 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const REWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_ExchangeItem.reward","reward",2 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const CYCLE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_ExchangeItem.cycle","cycle",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const MAXTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExchangeItem.maxTimes","maxTimes",4 << 3 | WireType.VARINT);
      
      public static const TIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExchangeItem.times","times",101 << 3 | WireType.VARINT);
      
      public static const TIMESTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExchangeItem.timestamp","timestamp",102 << 3 | WireType.VARINT);
       
      
      public var costItem:Array;
      
      public var reward:Array;
      
      private var cycle$field:String;
      
      private var maxTimes$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var times$field:uint;
      
      private var timestamp$field:uint;
      
      public function Dto_ExchangeItem()
      {
         this.costItem = [];
         this.reward = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ExchangeItem.$MessageID;
      }
      
      public function clearCycle() : void
      {
         this.cycle$field = null;
      }
      
      public function get hasCycle() : Boolean
      {
         return this.cycle$field != null;
      }
      
      public function set cycle(param1:String) : void
      {
         this.cycle$field = param1;
      }
      
      public function get cycle() : String
      {
         return this.cycle$field;
      }
      
      public function clearMaxTimes() : void
      {
         this.hasField$0 &= 4294967294;
         this.maxTimes$field = new uint();
      }
      
      public function get hasMaxTimes() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set maxTimes(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.maxTimes$field = param1;
      }
      
      public function get maxTimes() : uint
      {
         return this.maxTimes$field;
      }
      
      public function clearTimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.times$field = new uint();
      }
      
      public function get hasTimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set times(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.times$field = param1;
      }
      
      public function get times() : uint
      {
         return this.times$field;
      }
      
      public function clearTimestamp() : void
      {
         this.hasField$0 &= 4294967291;
         this.timestamp$field = new uint();
      }
      
      public function get hasTimestamp() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set timestamp(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.timestamp$field = param1;
      }
      
      public function get timestamp() : uint
      {
         return this.timestamp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.costItem.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.costItem[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.reward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward[_loc3_]);
            _loc3_++;
         }
         if(this.hasCycle)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.cycle$field);
         }
         if(this.hasMaxTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.maxTimes$field);
         }
         if(this.hasTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,101);
            WriteUtils.write$TYPE_UINT32(param1,this.times$field);
         }
         if(this.hasTimestamp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,102);
            WriteUtils.write$TYPE_UINT32(param1,this.timestamp$field);
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
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
                  this.costItem.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 2:
                  this.reward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExchangeItem.cycle cannot be set twice.");
                  }
                  _loc3_++;
                  this.cycle = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExchangeItem.maxTimes cannot be set twice.");
                  }
                  _loc4_++;
                  this.maxTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 101:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExchangeItem.times cannot be set twice.");
                  }
                  _loc5_++;
                  this.times = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 102:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExchangeItem.timestamp cannot be set twice.");
                  }
                  _loc6_++;
                  this.timestamp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
