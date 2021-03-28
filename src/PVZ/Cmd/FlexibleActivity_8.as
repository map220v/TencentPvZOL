package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class FlexibleActivity_8 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_8";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_8.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const SECKILLLIMIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_8.secKillLimit","secKillLimit",2 << 3 | WireType.VARINT);
      
      public static const SECKILLSTARTTIME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.FlexibleActivity_8.secKillStartTime","secKillStartTime",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const CONSUMETICKET:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_8.consumeTicket","consumeTicket",4 << 3 | WireType.VARINT);
      
      public static const USERLEVELLIMIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_8.userLevelLimit","userLevelLimit",5 << 3 | WireType.VARINT);
      
      public static const LOTTERYTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_8.lotteryTimes","lotteryTimes",6 << 3 | WireType.VARINT);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var secKillLimit$field:uint;
      
      private var secKillStartTime$field:String;
      
      public var consumeTicket:Array;
      
      private var userLevelLimit$field:uint;
      
      private var lotteryTimes$field:uint;
      
      public function FlexibleActivity_8()
      {
         this.consumeTicket = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_8.$MessageID;
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
      
      public function clearSecKillLimit() : void
      {
         this.hasField$0 &= 4294967293;
         this.secKillLimit$field = new uint();
      }
      
      public function get hasSecKillLimit() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set secKillLimit(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.secKillLimit$field = param1;
      }
      
      public function get secKillLimit() : uint
      {
         return this.secKillLimit$field;
      }
      
      public function clearSecKillStartTime() : void
      {
         this.secKillStartTime$field = null;
      }
      
      public function get hasSecKillStartTime() : Boolean
      {
         return this.secKillStartTime$field != null;
      }
      
      public function set secKillStartTime(param1:String) : void
      {
         this.secKillStartTime$field = param1;
      }
      
      public function get secKillStartTime() : String
      {
         return this.secKillStartTime$field;
      }
      
      public function clearUserLevelLimit() : void
      {
         this.hasField$0 &= 4294967291;
         this.userLevelLimit$field = new uint();
      }
      
      public function get hasUserLevelLimit() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set userLevelLimit(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.userLevelLimit$field = param1;
      }
      
      public function get userLevelLimit() : uint
      {
         return this.userLevelLimit$field;
      }
      
      public function clearLotteryTimes() : void
      {
         this.hasField$0 &= 4294967287;
         this.lotteryTimes$field = new uint();
      }
      
      public function get hasLotteryTimes() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set lotteryTimes(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.lotteryTimes$field = param1;
      }
      
      public function get lotteryTimes() : uint
      {
         return this.lotteryTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         if(this.hasSecKillLimit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.secKillLimit$field);
         }
         if(this.hasSecKillStartTime)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.secKillStartTime$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.consumeTicket.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.consumeTicket[_loc2_]);
            _loc2_++;
         }
         if(this.hasUserLevelLimit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.userLevelLimit$field);
         }
         if(this.hasLotteryTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.lotteryTimes$field);
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
                     throw new IOError("Bad data format: FlexibleActivity_8.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_8.secKillLimit cannot be set twice.");
                  }
                  _loc4_++;
                  this.secKillLimit = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_8.secKillStartTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.secKillStartTime = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if((_loc8_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.consumeTicket);
                  }
                  else
                  {
                     this.consumeTicket.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_8.userLevelLimit cannot be set twice.");
                  }
                  _loc6_++;
                  this.userLevelLimit = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_8.lotteryTimes cannot be set twice.");
                  }
                  _loc7_++;
                  this.lotteryTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
