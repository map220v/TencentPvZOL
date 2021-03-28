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
   
   public final class FlexibleActivity_15 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_15";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_15.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const MULTIPLEITEM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_15.multipleItem","multipleItem",2 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const TIMESLUCKVALUE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_15.timesLuckValue","timesLuckValue",3 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const MAXBUYTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_15.maxBuyTimes","maxBuyTimes",4 << 3 | WireType.VARINT);
      
      public static const FLOPALLCARD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_15.flopAllCard","flopAllCard",5 << 3 | WireType.VARINT);
      
      public static const FREETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_15.freeTimes","freeTimes",6 << 3 | WireType.VARINT);
      
      public static const CURLUCKVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_15.curLuckValue","curLuckValue",100 << 3 | WireType.VARINT);
      
      public static const USEDBUYTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_15.usedBuyTimes","usedBuyTimes",101 << 3 | WireType.VARINT);
      
      public static const CARDINFOLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_15.cardInfoList","cardInfoList",102 << 3 | WireType.LENGTH_DELIMITED,Dto_CardInfo);
      
      public static const SUPLUSTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_15.suplusTimes","suplusTimes",103 << 3 | WireType.VARINT);
      
      public static const CURBUYPRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_15.curBuyPrice","curBuyPrice",104 << 3 | WireType.VARINT);
      
      public static const LASTREFRESHTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_15.lastRefreshTime","lastRefreshTime",105 << 3 | WireType.VARINT);
       
      
      public var activityId:uint;
      
      private var multipleItem$field:Dto_IdNum;
      
      public var timesLuckValue:Array;
      
      private var maxBuyTimes$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var flopAllCard$field:uint;
      
      private var freeTimes$field:uint;
      
      private var curLuckValue$field:uint;
      
      private var usedBuyTimes$field:uint;
      
      public var cardInfoList:Array;
      
      private var suplusTimes$field:uint;
      
      private var curBuyPrice$field:uint;
      
      private var lastRefreshTime$field:uint;
      
      public function FlexibleActivity_15()
      {
         this.timesLuckValue = [];
         this.cardInfoList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_15.$MessageID;
      }
      
      public function clearMultipleItem() : void
      {
         this.multipleItem$field = null;
      }
      
      public function get hasMultipleItem() : Boolean
      {
         return this.multipleItem$field != null;
      }
      
      public function set multipleItem(param1:Dto_IdNum) : void
      {
         this.multipleItem$field = param1;
      }
      
      public function get multipleItem() : Dto_IdNum
      {
         return this.multipleItem$field;
      }
      
      public function clearMaxBuyTimes() : void
      {
         this.hasField$0 &= 4294967294;
         this.maxBuyTimes$field = new uint();
      }
      
      public function get hasMaxBuyTimes() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set maxBuyTimes(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.maxBuyTimes$field = param1;
      }
      
      public function get maxBuyTimes() : uint
      {
         return this.maxBuyTimes$field;
      }
      
      public function clearFlopAllCard() : void
      {
         this.hasField$0 &= 4294967293;
         this.flopAllCard$field = new uint();
      }
      
      public function get hasFlopAllCard() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set flopAllCard(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.flopAllCard$field = param1;
      }
      
      public function get flopAllCard() : uint
      {
         return this.flopAllCard$field;
      }
      
      public function clearFreeTimes() : void
      {
         this.hasField$0 &= 4294967291;
         this.freeTimes$field = new uint();
      }
      
      public function get hasFreeTimes() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set freeTimes(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.freeTimes$field = param1;
      }
      
      public function get freeTimes() : uint
      {
         return this.freeTimes$field;
      }
      
      public function clearCurLuckValue() : void
      {
         this.hasField$0 &= 4294967287;
         this.curLuckValue$field = new uint();
      }
      
      public function get hasCurLuckValue() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set curLuckValue(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.curLuckValue$field = param1;
      }
      
      public function get curLuckValue() : uint
      {
         return this.curLuckValue$field;
      }
      
      public function clearUsedBuyTimes() : void
      {
         this.hasField$0 &= 4294967279;
         this.usedBuyTimes$field = new uint();
      }
      
      public function get hasUsedBuyTimes() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set usedBuyTimes(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.usedBuyTimes$field = param1;
      }
      
      public function get usedBuyTimes() : uint
      {
         return this.usedBuyTimes$field;
      }
      
      public function clearSuplusTimes() : void
      {
         this.hasField$0 &= 4294967263;
         this.suplusTimes$field = new uint();
      }
      
      public function get hasSuplusTimes() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set suplusTimes(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.suplusTimes$field = param1;
      }
      
      public function get suplusTimes() : uint
      {
         return this.suplusTimes$field;
      }
      
      public function clearCurBuyPrice() : void
      {
         this.hasField$0 &= 4294967231;
         this.curBuyPrice$field = new uint();
      }
      
      public function get hasCurBuyPrice() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set curBuyPrice(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.curBuyPrice$field = param1;
      }
      
      public function get curBuyPrice() : uint
      {
         return this.curBuyPrice$field;
      }
      
      public function clearLastRefreshTime() : void
      {
         this.hasField$0 &= 4294967167;
         this.lastRefreshTime$field = new uint();
      }
      
      public function get hasLastRefreshTime() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set lastRefreshTime(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.lastRefreshTime$field = param1;
      }
      
      public function get lastRefreshTime() : uint
      {
         return this.lastRefreshTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         WriteUtils.writeTag(param1,WireType.VARINT,1);
         WriteUtils.write$TYPE_UINT32(param1,this.activityId);
         if(this.hasMultipleItem)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.multipleItem$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.timesLuckValue.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.timesLuckValue[_loc2_]);
            _loc2_++;
         }
         if(this.hasMaxBuyTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.maxBuyTimes$field);
         }
         if(this.hasFlopAllCard)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.flopAllCard$field);
         }
         if(this.hasFreeTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.freeTimes$field);
         }
         if(this.hasCurLuckValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,100);
            WriteUtils.write$TYPE_UINT32(param1,this.curLuckValue$field);
         }
         if(this.hasUsedBuyTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,101);
            WriteUtils.write$TYPE_UINT32(param1,this.usedBuyTimes$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.cardInfoList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,102);
            WriteUtils.write$TYPE_MESSAGE(param1,this.cardInfoList[_loc3_]);
            _loc3_++;
         }
         if(this.hasSuplusTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,103);
            WriteUtils.write$TYPE_UINT32(param1,this.suplusTimes$field);
         }
         if(this.hasCurBuyPrice)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,104);
            WriteUtils.write$TYPE_UINT32(param1,this.curBuyPrice$field);
         }
         if(this.hasLastRefreshTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,105);
            WriteUtils.write$TYPE_UINT32(param1,this.lastRefreshTime$field);
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
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
                     throw new IOError("Bad data format: FlexibleActivity_15.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_15.multipleItem cannot be set twice.");
                  }
                  _loc4_++;
                  this.multipleItem = new Dto_IdNum();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.multipleItem);
                  break;
               case 3:
                  this.timesLuckValue.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_15.maxBuyTimes cannot be set twice.");
                  }
                  _loc5_++;
                  this.maxBuyTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_15.flopAllCard cannot be set twice.");
                  }
                  _loc6_++;
                  this.flopAllCard = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_15.freeTimes cannot be set twice.");
                  }
                  _loc7_++;
                  this.freeTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 100:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_15.curLuckValue cannot be set twice.");
                  }
                  _loc8_++;
                  this.curLuckValue = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 101:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_15.usedBuyTimes cannot be set twice.");
                  }
                  _loc9_++;
                  this.usedBuyTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 102:
                  this.cardInfoList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_CardInfo()));
                  break;
               case 103:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_15.suplusTimes cannot be set twice.");
                  }
                  _loc10_++;
                  this.suplusTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 104:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_15.curBuyPrice cannot be set twice.");
                  }
                  _loc11_++;
                  this.curBuyPrice = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 105:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_15.lastRefreshTime cannot be set twice.");
                  }
                  _loc12_++;
                  this.lastRefreshTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc13_);
                  break;
            }
         }
      }
   }
}
