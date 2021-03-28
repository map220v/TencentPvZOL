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
   
   public final class Dto_ThanksGiving_MyInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ThanksGiving_MyInfo";
      
      public static const SPENDTICKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ThanksGiving_MyInfo.spendTicket","spendTicket",1 << 3 | WireType.VARINT);
      
      public static const TOTALLOTTERYTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ThanksGiving_MyInfo.totalLotteryTimes","totalLotteryTimes",2 << 3 | WireType.VARINT);
      
      public static const REMAINLOTTERYTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ThanksGiving_MyInfo.remainLotteryTimes","remainLotteryTimes",3 << 3 | WireType.VARINT);
      
      public static const ITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_ThanksGiving_MyInfo.items","items",4 << 3 | WireType.LENGTH_DELIMITED,Dto_ThanksGiving_RewardItem);
      
      public static const NEXTLOTTERYGAP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ThanksGiving_MyInfo.nextLotteryGap","nextLotteryGap",5 << 3 | WireType.VARINT);
       
      
      private var spendTicket$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var totalLotteryTimes$field:uint;
      
      private var remainLotteryTimes$field:uint;
      
      public var items:Array;
      
      private var nextLotteryGap$field:uint;
      
      public function Dto_ThanksGiving_MyInfo()
      {
         this.items = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ThanksGiving_MyInfo.$MessageID;
      }
      
      public function clearSpendTicket() : void
      {
         this.hasField$0 &= 4294967294;
         this.spendTicket$field = new uint();
      }
      
      public function get hasSpendTicket() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set spendTicket(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.spendTicket$field = param1;
      }
      
      public function get spendTicket() : uint
      {
         return this.spendTicket$field;
      }
      
      public function clearTotalLotteryTimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.totalLotteryTimes$field = new uint();
      }
      
      public function get hasTotalLotteryTimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set totalLotteryTimes(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.totalLotteryTimes$field = param1;
      }
      
      public function get totalLotteryTimes() : uint
      {
         return this.totalLotteryTimes$field;
      }
      
      public function clearRemainLotteryTimes() : void
      {
         this.hasField$0 &= 4294967291;
         this.remainLotteryTimes$field = new uint();
      }
      
      public function get hasRemainLotteryTimes() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set remainLotteryTimes(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.remainLotteryTimes$field = param1;
      }
      
      public function get remainLotteryTimes() : uint
      {
         return this.remainLotteryTimes$field;
      }
      
      public function clearNextLotteryGap() : void
      {
         this.hasField$0 &= 4294967287;
         this.nextLotteryGap$field = new uint();
      }
      
      public function get hasNextLotteryGap() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set nextLotteryGap(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.nextLotteryGap$field = param1;
      }
      
      public function get nextLotteryGap() : uint
      {
         return this.nextLotteryGap$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasSpendTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.spendTicket$field);
         }
         if(this.hasTotalLotteryTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.totalLotteryTimes$field);
         }
         if(this.hasRemainLotteryTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.remainLotteryTimes$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.items.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.items[_loc2_]);
            _loc2_++;
         }
         if(this.hasNextLotteryGap)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.nextLotteryGap$field);
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
                     throw new IOError("Bad data format: Dto_ThanksGiving_MyInfo.spendTicket cannot be set twice.");
                  }
                  _loc3_++;
                  this.spendTicket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ThanksGiving_MyInfo.totalLotteryTimes cannot be set twice.");
                  }
                  _loc4_++;
                  this.totalLotteryTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ThanksGiving_MyInfo.remainLotteryTimes cannot be set twice.");
                  }
                  _loc5_++;
                  this.remainLotteryTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  this.items.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ThanksGiving_RewardItem()));
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ThanksGiving_MyInfo.nextLotteryGap cannot be set twice.");
                  }
                  _loc6_++;
                  this.nextLotteryGap = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
