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
   
   public final class Cmd_SuperFlopCard_GetInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_SuperFlopCard_GetInfo_SC";
      
      public static const LUCK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SuperFlopCard_GetInfo_SC.luck","luck",1 << 3 | WireType.VARINT);
      
      public static const SUPLUSTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SuperFlopCard_GetInfo_SC.suplusTimes","suplusTimes",2 << 3 | WireType.VARINT);
      
      public static const CARDINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_SuperFlopCard_GetInfo_SC.cardInfo","cardInfo",3 << 3 | WireType.LENGTH_DELIMITED,Dto_CardInfo);
      
      public static const BUYTIMESPRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SuperFlopCard_GetInfo_SC.buyTimesPrice","buyTimesPrice",4 << 3 | WireType.VARINT);
      
      public static const SUPLUSBUYTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SuperFlopCard_GetInfo_SC.suplusBuyTimes","suplusBuyTimes",5 << 3 | WireType.VARINT);
      
      public static const CURMULTIPLE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SuperFlopCard_GetInfo_SC.curMultiple","curMultiple",6 << 3 | WireType.VARINT);
       
      
      private var luck$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var suplusTimes$field:uint;
      
      public var cardInfo:Array;
      
      private var buyTimesPrice$field:uint;
      
      private var suplusBuyTimes$field:uint;
      
      private var curMultiple$field:uint;
      
      public function Cmd_SuperFlopCard_GetInfo_SC()
      {
         this.cardInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_SuperFlopCard_GetInfo_SC.$MessageID;
      }
      
      public function clearLuck() : void
      {
         this.hasField$0 &= 4294967294;
         this.luck$field = new uint();
      }
      
      public function get hasLuck() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set luck(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.luck$field = param1;
      }
      
      public function get luck() : uint
      {
         return this.luck$field;
      }
      
      public function clearSuplusTimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.suplusTimes$field = new uint();
      }
      
      public function get hasSuplusTimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set suplusTimes(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.suplusTimes$field = param1;
      }
      
      public function get suplusTimes() : uint
      {
         return this.suplusTimes$field;
      }
      
      public function clearBuyTimesPrice() : void
      {
         this.hasField$0 &= 4294967291;
         this.buyTimesPrice$field = new uint();
      }
      
      public function get hasBuyTimesPrice() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set buyTimesPrice(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.buyTimesPrice$field = param1;
      }
      
      public function get buyTimesPrice() : uint
      {
         return this.buyTimesPrice$field;
      }
      
      public function clearSuplusBuyTimes() : void
      {
         this.hasField$0 &= 4294967287;
         this.suplusBuyTimes$field = new uint();
      }
      
      public function get hasSuplusBuyTimes() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set suplusBuyTimes(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.suplusBuyTimes$field = param1;
      }
      
      public function get suplusBuyTimes() : uint
      {
         return this.suplusBuyTimes$field;
      }
      
      public function clearCurMultiple() : void
      {
         this.hasField$0 &= 4294967279;
         this.curMultiple$field = new uint();
      }
      
      public function get hasCurMultiple() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set curMultiple(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.curMultiple$field = param1;
      }
      
      public function get curMultiple() : uint
      {
         return this.curMultiple$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasLuck)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.luck$field);
         }
         if(this.hasSuplusTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.suplusTimes$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.cardInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.cardInfo[_loc2_]);
            _loc2_++;
         }
         if(this.hasBuyTimesPrice)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.buyTimesPrice$field);
         }
         if(this.hasSuplusBuyTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.suplusBuyTimes$field);
         }
         if(this.hasCurMultiple)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.curMultiple$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Cmd_SuperFlopCard_GetInfo_SC.luck cannot be set twice.");
                  }
                  _loc3_++;
                  this.luck = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SuperFlopCard_GetInfo_SC.suplusTimes cannot be set twice.");
                  }
                  _loc4_++;
                  this.suplusTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  this.cardInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_CardInfo()));
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SuperFlopCard_GetInfo_SC.buyTimesPrice cannot be set twice.");
                  }
                  _loc5_++;
                  this.buyTimesPrice = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SuperFlopCard_GetInfo_SC.suplusBuyTimes cannot be set twice.");
                  }
                  _loc6_++;
                  this.suplusBuyTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SuperFlopCard_GetInfo_SC.curMultiple cannot be set twice.");
                  }
                  _loc7_++;
                  this.curMultiple = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
