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
   
   public final class Cmd_DailyPay_Exchange_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_DailyPay_Exchange_SC";
      
      public static const EXCHANGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_DailyPay_Exchange_SC.exchangeId","exchangeId",1 << 3 | WireType.VARINT);
      
      public static const ITEMLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_DailyPay_Exchange_SC.itemList","itemList",2 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const DAILYCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_DailyPay_Exchange_SC.dailyCount","dailyCount",3 << 3 | WireType.VARINT);
       
      
      private var exchangeId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var itemList:Array;
      
      private var dailyCount$field:uint;
      
      public function Cmd_DailyPay_Exchange_SC()
      {
         this.itemList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_DailyPay_Exchange_SC.$MessageID;
      }
      
      public function clearExchangeId() : void
      {
         this.hasField$0 &= 4294967294;
         this.exchangeId$field = new uint();
      }
      
      public function get hasExchangeId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set exchangeId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.exchangeId$field = param1;
      }
      
      public function get exchangeId() : uint
      {
         return this.exchangeId$field;
      }
      
      public function clearDailyCount() : void
      {
         this.hasField$0 &= 4294967293;
         this.dailyCount$field = new uint();
      }
      
      public function get hasDailyCount() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set dailyCount(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.dailyCount$field = param1;
      }
      
      public function get dailyCount() : uint
      {
         return this.dailyCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasExchangeId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.exchangeId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.itemList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.itemList[_loc2_]);
            _loc2_++;
         }
         if(this.hasDailyCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.dailyCount$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc5_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyPay_Exchange_SC.exchangeId cannot be set twice.");
                  }
                  _loc3_++;
                  this.exchangeId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.itemList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyPay_Exchange_SC.dailyCount cannot be set twice.");
                  }
                  _loc4_++;
                  this.dailyCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
