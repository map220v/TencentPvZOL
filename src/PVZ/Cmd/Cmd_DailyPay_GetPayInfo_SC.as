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
   
   public final class Cmd_DailyPay_GetPayInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_DailyPay_GetPayInfo_SC";
      
      public static const PAYINFOLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_DailyPay_GetPayInfo_SC.payInfoList","payInfoList",1 << 3 | WireType.LENGTH_DELIMITED,Dto_DailyPayInfo);
      
      public static const EXCHANGEINFOLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_DailyPay_GetPayInfo_SC.exchangeInfoList","exchangeInfoList",2 << 3 | WireType.LENGTH_DELIMITED,Dto_DailyPayExchangeInfo);
      
      public static const DAIYPAYTICKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_DailyPay_GetPayInfo_SC.daiyPayTicket","daiyPayTicket",3 << 3 | WireType.VARINT);
       
      
      public var payInfoList:Array;
      
      public var exchangeInfoList:Array;
      
      private var daiyPayTicket$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_DailyPay_GetPayInfo_SC()
      {
         this.payInfoList = [];
         this.exchangeInfoList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_DailyPay_GetPayInfo_SC.$MessageID;
      }
      
      public function clearDaiyPayTicket() : void
      {
         this.hasField$0 &= 4294967294;
         this.daiyPayTicket$field = new uint();
      }
      
      public function get hasDaiyPayTicket() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set daiyPayTicket(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.daiyPayTicket$field = param1;
      }
      
      public function get daiyPayTicket() : uint
      {
         return this.daiyPayTicket$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.payInfoList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.payInfoList[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.exchangeInfoList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.exchangeInfoList[_loc3_]);
            _loc3_++;
         }
         if(this.hasDaiyPayTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.daiyPayTicket$field);
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc4_ >> 3)
            {
               case 1:
                  this.payInfoList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_DailyPayInfo()));
                  break;
               case 2:
                  this.exchangeInfoList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_DailyPayExchangeInfo()));
                  break;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyPay_GetPayInfo_SC.daiyPayTicket cannot be set twice.");
                  }
                  _loc3_++;
                  this.daiyPayTicket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
