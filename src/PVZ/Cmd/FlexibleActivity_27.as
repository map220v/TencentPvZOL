package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class FlexibleActivity_27 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_27";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_27.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const RANDOMITEM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_27.randomItem","randomItem",2 << 3 | WireType.LENGTH_DELIMITED,Dto_FlexibleActivity_27_RandomItem);
      
      public static const RANDOMCOST:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_27.randomCost","randomCost",3 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const EXCHANGEITEM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_27.exchangeItem","exchangeItem",4 << 3 | WireType.LENGTH_DELIMITED,Dto_FlexibleActivity_27_ExchangeItem);
      
      public static const LUCKYREWARD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_27.luckyReward","luckyReward",5 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const LUCKYFACTOR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_27.luckyFactor","luckyFactor",6 << 3 | WireType.VARINT);
      
      public static const LUCKYBASEODDS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_27.luckyBaseOdds","luckyBaseOdds",7 << 3 | WireType.VARINT);
      
      public static const LUCKYMAXODDS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_27.luckyMaxOdds","luckyMaxOdds",8 << 3 | WireType.VARINT);
      
      public static const FREERANDOMCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_27.freeRandomCount","freeRandomCount",9 << 3 | WireType.VARINT);
      
      public static const TIMESTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_27.timestamp","timestamp",101 << 3 | WireType.VARINT);
      
      public static const LUCKY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_27.lucky","lucky",102 << 3 | WireType.VARINT);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_27.score","score",103 << 3 | WireType.VARINT);
      
      public static const RANDOMCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_27.randomCount","randomCount",104 << 3 | WireType.VARINT);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var randomItem:Array;
      
      private var randomCost$field:Dto_IdNum;
      
      public var exchangeItem:Array;
      
      private var luckyReward$field:Dto_IdNum;
      
      private var luckyFactor$field:uint;
      
      private var luckyBaseOdds$field:uint;
      
      private var luckyMaxOdds$field:uint;
      
      private var freeRandomCount$field:uint;
      
      private var timestamp$field:uint;
      
      private var lucky$field:uint;
      
      private var score$field:uint;
      
      private var randomCount$field:uint;
      
      public function FlexibleActivity_27()
      {
         this.randomItem = [];
         this.exchangeItem = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_27.$MessageID;
      }
      
      public function clearActivityId() : void
      {
         this.hasField$0 &= 4294967294;
         this.activityId$field = new uint();
      }
      
      public function get hasActivityId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set activityId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.activityId$field = param1;
      }
      
      public function get activityId() : uint
      {
         return this.activityId$field;
      }
      
      public function clearRandomCost() : void
      {
         this.randomCost$field = null;
      }
      
      public function get hasRandomCost() : Boolean
      {
         return this.randomCost$field != null;
      }
      
      public function set randomCost(param1:Dto_IdNum) : void
      {
         this.randomCost$field = param1;
      }
      
      public function get randomCost() : Dto_IdNum
      {
         return this.randomCost$field;
      }
      
      public function clearLuckyReward() : void
      {
         this.luckyReward$field = null;
      }
      
      public function get hasLuckyReward() : Boolean
      {
         return this.luckyReward$field != null;
      }
      
      public function set luckyReward(param1:Dto_IdNum) : void
      {
         this.luckyReward$field = param1;
      }
      
      public function get luckyReward() : Dto_IdNum
      {
         return this.luckyReward$field;
      }
      
      public function clearLuckyFactor() : void
      {
         this.hasField$0 &= 4294967293;
         this.luckyFactor$field = new uint();
      }
      
      public function get hasLuckyFactor() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set luckyFactor(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.luckyFactor$field = param1;
      }
      
      public function get luckyFactor() : uint
      {
         return this.luckyFactor$field;
      }
      
      public function clearLuckyBaseOdds() : void
      {
         this.hasField$0 &= 4294967291;
         this.luckyBaseOdds$field = new uint();
      }
      
      public function get hasLuckyBaseOdds() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set luckyBaseOdds(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.luckyBaseOdds$field = param1;
      }
      
      public function get luckyBaseOdds() : uint
      {
         return this.luckyBaseOdds$field;
      }
      
      public function clearLuckyMaxOdds() : void
      {
         this.hasField$0 &= 4294967287;
         this.luckyMaxOdds$field = new uint();
      }
      
      public function get hasLuckyMaxOdds() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set luckyMaxOdds(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.luckyMaxOdds$field = param1;
      }
      
      public function get luckyMaxOdds() : uint
      {
         return this.luckyMaxOdds$field;
      }
      
      public function clearFreeRandomCount() : void
      {
         this.hasField$0 &= 4294967279;
         this.freeRandomCount$field = new uint();
      }
      
      public function get hasFreeRandomCount() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set freeRandomCount(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.freeRandomCount$field = param1;
      }
      
      public function get freeRandomCount() : uint
      {
         return this.freeRandomCount$field;
      }
      
      public function clearTimestamp() : void
      {
         this.hasField$0 &= 4294967263;
         this.timestamp$field = new uint();
      }
      
      public function get hasTimestamp() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set timestamp(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.timestamp$field = param1;
      }
      
      public function get timestamp() : uint
      {
         return this.timestamp$field;
      }
      
      public function clearLucky() : void
      {
         this.hasField$0 &= 4294967231;
         this.lucky$field = new uint();
      }
      
      public function get hasLucky() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set lucky(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.lucky$field = param1;
      }
      
      public function get lucky() : uint
      {
         return this.lucky$field;
      }
      
      public function clearScore() : void
      {
         this.hasField$0 &= 4294967167;
         this.score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.score$field = param1;
      }
      
      public function get score() : uint
      {
         return this.score$field;
      }
      
      public function clearRandomCount() : void
      {
         this.hasField$0 &= 4294967039;
         this.randomCount$field = new uint();
      }
      
      public function get hasRandomCount() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set randomCount(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.randomCount$field = param1;
      }
      
      public function get randomCount() : uint
      {
         return this.randomCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.randomItem.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.randomItem[_loc2_]);
            _loc2_++;
         }
         if(this.hasRandomCost)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.randomCost$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.exchangeItem.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.exchangeItem[_loc3_]);
            _loc3_++;
         }
         if(this.hasLuckyReward)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.luckyReward$field);
         }
         if(this.hasLuckyFactor)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.luckyFactor$field);
         }
         if(this.hasLuckyBaseOdds)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.luckyBaseOdds$field);
         }
         if(this.hasLuckyMaxOdds)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.luckyMaxOdds$field);
         }
         if(this.hasFreeRandomCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.freeRandomCount$field);
         }
         if(this.hasTimestamp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,101);
            WriteUtils.write$TYPE_UINT32(param1,this.timestamp$field);
         }
         if(this.hasLucky)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,102);
            WriteUtils.write$TYPE_UINT32(param1,this.lucky$field);
         }
         if(this.hasScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,103);
            WriteUtils.write$TYPE_UINT32(param1,this.score$field);
         }
         if(this.hasRandomCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,104);
            WriteUtils.write$TYPE_UINT32(param1,this.randomCount$field);
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc14_:uint = 0;
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
         var _loc13_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc14_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc14_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_27.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.randomItem.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FlexibleActivity_27_RandomItem()));
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_27.randomCost cannot be set twice.");
                  }
                  _loc4_++;
                  this.randomCost = new Dto_IdNum();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.randomCost);
                  break;
               case 4:
                  this.exchangeItem.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FlexibleActivity_27_ExchangeItem()));
                  break;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_27.luckyReward cannot be set twice.");
                  }
                  _loc5_++;
                  this.luckyReward = new Dto_IdNum();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.luckyReward);
                  break;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_27.luckyFactor cannot be set twice.");
                  }
                  _loc6_++;
                  this.luckyFactor = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_27.luckyBaseOdds cannot be set twice.");
                  }
                  _loc7_++;
                  this.luckyBaseOdds = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_27.luckyMaxOdds cannot be set twice.");
                  }
                  _loc8_++;
                  this.luckyMaxOdds = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_27.freeRandomCount cannot be set twice.");
                  }
                  _loc9_++;
                  this.freeRandomCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 101:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_27.timestamp cannot be set twice.");
                  }
                  _loc10_++;
                  this.timestamp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 102:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_27.lucky cannot be set twice.");
                  }
                  _loc11_++;
                  this.lucky = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 103:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_27.score cannot be set twice.");
                  }
                  _loc12_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 104:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_27.randomCount cannot be set twice.");
                  }
                  _loc13_++;
                  this.randomCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc14_);
                  break;
            }
         }
      }
   }
}
