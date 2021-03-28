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
   
   public final class FlexibleActivity_7 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_7";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_7.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const EXCHANGEITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_7.exchangeItems","exchangeItems",2 << 3 | WireType.LENGTH_DELIMITED,Dto_ShellingExchangeItem);
      
      public static const TICKETNUMCALC:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_7.ticketNumCalc","ticketNumCalc",3 << 3 | WireType.LENGTH_DELIMITED,Dto_TicketNumCalc);
      
      public static const TOTALTICKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_7.totalTicket","totalTicket",4 << 3 | WireType.VARINT);
      
      public static const TICKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_7.ticket","ticket",5 << 3 | WireType.VARINT);
      
      public static const LASTGIVESMALLGUNTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_7.lastGiveSmallGunTime","lastGiveSmallGunTime",6 << 3 | WireType.VARINT);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var exchangeItems:Array;
      
      public var ticketNumCalc:Array;
      
      private var totalTicket$field:uint;
      
      private var ticket$field:uint;
      
      private var lastGiveSmallGunTime$field:uint;
      
      public function FlexibleActivity_7()
      {
         this.exchangeItems = [];
         this.ticketNumCalc = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_7.$MessageID;
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
      
      public function clearTotalTicket() : void
      {
         this.hasField$0 &= 4294967293;
         this.totalTicket$field = new uint();
      }
      
      public function get hasTotalTicket() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set totalTicket(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.totalTicket$field = param1;
      }
      
      public function get totalTicket() : uint
      {
         return this.totalTicket$field;
      }
      
      public function clearTicket() : void
      {
         this.hasField$0 &= 4294967291;
         this.ticket$field = new uint();
      }
      
      public function get hasTicket() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set ticket(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.ticket$field = param1;
      }
      
      public function get ticket() : uint
      {
         return this.ticket$field;
      }
      
      public function clearLastGiveSmallGunTime() : void
      {
         this.hasField$0 &= 4294967287;
         this.lastGiveSmallGunTime$field = new uint();
      }
      
      public function get hasLastGiveSmallGunTime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set lastGiveSmallGunTime(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.lastGiveSmallGunTime$field = param1;
      }
      
      public function get lastGiveSmallGunTime() : uint
      {
         return this.lastGiveSmallGunTime$field;
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
         while(_loc2_ < this.exchangeItems.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.exchangeItems[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.ticketNumCalc.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.ticketNumCalc[_loc3_]);
            _loc3_++;
         }
         if(this.hasTotalTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.totalTicket$field);
         }
         if(this.hasTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.ticket$field);
         }
         if(this.hasLastGiveSmallGunTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.lastGiveSmallGunTime$field);
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
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_7.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.exchangeItems.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ShellingExchangeItem()));
                  break;
               case 3:
                  this.ticketNumCalc.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_TicketNumCalc()));
                  break;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_7.totalTicket cannot be set twice.");
                  }
                  _loc4_++;
                  this.totalTicket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_7.ticket cannot be set twice.");
                  }
                  _loc5_++;
                  this.ticket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_7.lastGiveSmallGunTime cannot be set twice.");
                  }
                  _loc6_++;
                  this.lastGiveSmallGunTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
