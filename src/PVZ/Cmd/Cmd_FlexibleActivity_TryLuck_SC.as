package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_FlexibleActivity_TryLuck_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_FlexibleActivity_TryLuck_SC";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_TryLuck_SC.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const GOLDTICKET:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_FlexibleActivity_TryLuck_SC.goldTicket","goldTicket",2 << 3 | WireType.VARINT);
      
      public static const TICKETCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_TryLuck_SC.ticketCount","ticketCount",4 << 3 | WireType.VARINT);
      
      public static const GOLDTICKETCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_TryLuck_SC.goldTicketCount","goldTicketCount",5 << 3 | WireType.VARINT);
      
      public static const REWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_FlexibleActivity_TryLuck_SC.reward","reward",7 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const SUMREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_FlexibleActivity_TryLuck_SC.sumReward","sumReward",8 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var goldTicket$field:Boolean;
      
      private var ticketCount$field:uint;
      
      private var goldTicketCount$field:uint;
      
      public var reward:Array;
      
      public var sumReward:Array;
      
      public function Cmd_FlexibleActivity_TryLuck_SC()
      {
         this.reward = [];
         this.sumReward = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_FlexibleActivity_TryLuck_SC.$MessageID;
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
      
      public function clearGoldTicket() : void
      {
         this.hasField$0 &= 4294967293;
         this.goldTicket$field = new Boolean();
      }
      
      public function get hasGoldTicket() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set goldTicket(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.goldTicket$field = param1;
      }
      
      public function get goldTicket() : Boolean
      {
         return this.goldTicket$field;
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
         var _loc4_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         if(this.hasGoldTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.goldTicket$field);
         }
         if(this.hasTicketCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.ticketCount$field);
         }
         if(this.hasGoldTicketCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.goldTicketCount$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.reward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.sumReward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.sumReward[_loc3_]);
            _loc3_++;
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
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_TryLuck_SC.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_TryLuck_SC.goldTicket cannot be set twice.");
                  }
                  _loc4_++;
                  this.goldTicket = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_TryLuck_SC.ticketCount cannot be set twice.");
                  }
                  _loc5_++;
                  this.ticketCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_TryLuck_SC.goldTicketCount cannot be set twice.");
                  }
                  _loc6_++;
                  this.goldTicketCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  this.reward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 8:
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
