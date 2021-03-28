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
   
   public final class FlexibleActivity_23 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_23";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_23.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const TICKETITEM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_23.ticketItem","ticketItem",2 << 3 | WireType.LENGTH_DELIMITED,Dto_TryLuckItem);
      
      public static const GOLDTICKETITEM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_23.goldTicketItem","goldTicketItem",3 << 3 | WireType.LENGTH_DELIMITED,Dto_TryLuckItem);
      
      public static const LASTREFRESHDATATIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_23.lastRefreshDataTime","lastRefreshDataTime",50 << 3 | WireType.VARINT);
      
      public static const TICKETCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_23.ticketCount","ticketCount",51 << 3 | WireType.VARINT);
      
      public static const GOLDTICKETCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_23.goldTicketCount","goldTicketCount",52 << 3 | WireType.VARINT);
      
      public static const SUMREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_23.sumReward","sumReward",54 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var ticketItem:Array;
      
      public var goldTicketItem:Array;
      
      private var lastRefreshDataTime$field:uint;
      
      private var ticketCount$field:uint;
      
      private var goldTicketCount$field:uint;
      
      public var sumReward:Array;
      
      public function FlexibleActivity_23()
      {
         this.ticketItem = [];
         this.goldTicketItem = [];
         this.sumReward = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_23.$MessageID;
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
      
      public function clearLastRefreshDataTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.lastRefreshDataTime$field = new uint();
      }
      
      public function get hasLastRefreshDataTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set lastRefreshDataTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.lastRefreshDataTime$field = param1;
      }
      
      public function get lastRefreshDataTime() : uint
      {
         return this.lastRefreshDataTime$field;
      }
      
      public function clearTicketCount() : void
      {
         this.hasField$0 &= 4294967291;
         this.ticketCount$field = new uint();
      }
      
      public function get hasTicketCount() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set ticketCount(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.ticketCount$field = param1;
      }
      
      public function get ticketCount() : uint
      {
         return this.ticketCount$field;
      }
      
      public function clearGoldTicketCount() : void
      {
         this.hasField$0 &= 4294967287;
         this.goldTicketCount$field = new uint();
      }
      
      public function get hasGoldTicketCount() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set goldTicketCount(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.goldTicketCount$field = param1;
      }
      
      public function get goldTicketCount() : uint
      {
         return this.goldTicketCount$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.ticketItem.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.ticketItem[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.goldTicketItem.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.goldTicketItem[_loc3_]);
            _loc3_++;
         }
         if(this.hasLastRefreshDataTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,50);
            WriteUtils.write$TYPE_UINT32(param1,this.lastRefreshDataTime$field);
         }
         if(this.hasTicketCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,51);
            WriteUtils.write$TYPE_UINT32(param1,this.ticketCount$field);
         }
         if(this.hasGoldTicketCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,52);
            WriteUtils.write$TYPE_UINT32(param1,this.goldTicketCount$field);
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.sumReward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,54);
            WriteUtils.write$TYPE_MESSAGE(param1,this.sumReward[_loc4_]);
            _loc4_++;
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
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
                     throw new IOError("Bad data format: FlexibleActivity_23.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.ticketItem.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_TryLuckItem()));
                  break;
               case 3:
                  this.goldTicketItem.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_TryLuckItem()));
                  break;
               case 50:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_23.lastRefreshDataTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.lastRefreshDataTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 51:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_23.ticketCount cannot be set twice.");
                  }
                  _loc5_++;
                  this.ticketCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 52:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_23.goldTicketCount cannot be set twice.");
                  }
                  _loc6_++;
                  this.goldTicketCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 54:
                  this.sumReward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
