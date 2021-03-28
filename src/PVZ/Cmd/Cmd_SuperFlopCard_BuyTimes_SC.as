package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_SuperFlopCard_BuyTimes_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_SuperFlopCard_BuyTimes_SC";
      
      public static const SUPLUSTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SuperFlopCard_BuyTimes_SC.suplusTimes","suplusTimes",1 << 3 | WireType.VARINT);
      
      public static const BUYTIMESPRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SuperFlopCard_BuyTimes_SC.buyTimesPrice","buyTimesPrice",2 << 3 | WireType.VARINT);
      
      public static const SUPLUSBUYTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_SuperFlopCard_BuyTimes_SC.suplusBuyTimes","suplusBuyTimes",3 << 3 | WireType.VARINT);
       
      
      private var suplusTimes$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var buyTimesPrice$field:uint;
      
      private var suplusBuyTimes$field:uint;
      
      public function Cmd_SuperFlopCard_BuyTimes_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_SuperFlopCard_BuyTimes_SC.$MessageID;
      }
      
      public function clearSuplusTimes() : void
      {
         this.hasField$0 &= 4294967294;
         this.suplusTimes$field = new uint();
      }
      
      public function get hasSuplusTimes() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set suplusTimes(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.suplusTimes$field = param1;
      }
      
      public function get suplusTimes() : uint
      {
         return this.suplusTimes$field;
      }
      
      public function clearBuyTimesPrice() : void
      {
         this.hasField$0 &= 4294967293;
         this.buyTimesPrice$field = new uint();
      }
      
      public function get hasBuyTimesPrice() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set buyTimesPrice(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.buyTimesPrice$field = param1;
      }
      
      public function get buyTimesPrice() : uint
      {
         return this.buyTimesPrice$field;
      }
      
      public function clearSuplusBuyTimes() : void
      {
         this.hasField$0 &= 4294967291;
         this.suplusBuyTimes$field = new uint();
      }
      
      public function get hasSuplusBuyTimes() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set suplusBuyTimes(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.suplusBuyTimes$field = param1;
      }
      
      public function get suplusBuyTimes() : uint
      {
         return this.suplusBuyTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasSuplusTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.suplusTimes$field);
         }
         if(this.hasBuyTimesPrice)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.buyTimesPrice$field);
         }
         if(this.hasSuplusBuyTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.suplusBuyTimes$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SuperFlopCard_BuyTimes_SC.suplusTimes cannot be set twice.");
                  }
                  _loc3_++;
                  this.suplusTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SuperFlopCard_BuyTimes_SC.buyTimesPrice cannot be set twice.");
                  }
                  _loc4_++;
                  this.buyTimesPrice = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SuperFlopCard_BuyTimes_SC.suplusBuyTimes cannot be set twice.");
                  }
                  _loc5_++;
                  this.suplusBuyTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
