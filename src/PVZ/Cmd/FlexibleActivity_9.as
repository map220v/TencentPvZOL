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
   
   public final class FlexibleActivity_9 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_9";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_9.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const REWARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_9.rewards","rewards",2 << 3 | WireType.LENGTH_DELIMITED,Dto_HoodleReward);
      
      public static const NUTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_9.nuts","nuts",3 << 3 | WireType.LENGTH_DELIMITED,Dto_NutInfo);
      
      public static const TOTALTICKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_9.totalTicket","totalTicket",4 << 3 | WireType.VARINT);
      
      public static const FIRECOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_9.fireCount","fireCount",5 << 3 | WireType.VARINT);
      
      public static const PRESENTCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_9.presentCount","presentCount",6 << 3 | WireType.VARINT);
      
      public static const FREECOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_9.freeCount","freeCount",7 << 3 | WireType.VARINT);
      
      public static const USEDCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_9.usedCount","usedCount",8 << 3 | WireType.VARINT);
      
      public static const REFRESHTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_9.refreshTime","refreshTime",9 << 3 | WireType.VARINT);
      
      public static const TOP5REWARDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_9.top5Rewards","top5Rewards",10 << 3 | WireType.LENGTH_DELIMITED,Dto_HoodleTop5Reward);
      
      public static const TOP5TAKETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_9.top5TakeTime","top5TakeTime",11 << 3 | WireType.VARINT);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var rewards:Array;
      
      public var nuts:Array;
      
      private var totalTicket$field:uint;
      
      private var fireCount$field:uint;
      
      private var presentCount$field:uint;
      
      private var freeCount$field:uint;
      
      private var usedCount$field:uint;
      
      private var refreshTime$field:uint;
      
      public var top5Rewards:Array;
      
      private var top5TakeTime$field:uint;
      
      public function FlexibleActivity_9()
      {
         this.rewards = [];
         this.nuts = [];
         this.top5Rewards = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_9.$MessageID;
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
      
      public function clearFireCount() : void
      {
         this.hasField$0 &= 4294967291;
         this.fireCount$field = new uint();
      }
      
      public function get hasFireCount() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set fireCount(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.fireCount$field = param1;
      }
      
      public function get fireCount() : uint
      {
         return this.fireCount$field;
      }
      
      public function clearPresentCount() : void
      {
         this.hasField$0 &= 4294967287;
         this.presentCount$field = new uint();
      }
      
      public function get hasPresentCount() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set presentCount(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.presentCount$field = param1;
      }
      
      public function get presentCount() : uint
      {
         return this.presentCount$field;
      }
      
      public function clearFreeCount() : void
      {
         this.hasField$0 &= 4294967279;
         this.freeCount$field = new uint();
      }
      
      public function get hasFreeCount() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set freeCount(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.freeCount$field = param1;
      }
      
      public function get freeCount() : uint
      {
         return this.freeCount$field;
      }
      
      public function clearUsedCount() : void
      {
         this.hasField$0 &= 4294967263;
         this.usedCount$field = new uint();
      }
      
      public function get hasUsedCount() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set usedCount(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.usedCount$field = param1;
      }
      
      public function get usedCount() : uint
      {
         return this.usedCount$field;
      }
      
      public function clearRefreshTime() : void
      {
         this.hasField$0 &= 4294967231;
         this.refreshTime$field = new uint();
      }
      
      public function get hasRefreshTime() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set refreshTime(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.refreshTime$field = param1;
      }
      
      public function get refreshTime() : uint
      {
         return this.refreshTime$field;
      }
      
      public function clearTop5TakeTime() : void
      {
         this.hasField$0 &= 4294967167;
         this.top5TakeTime$field = new uint();
      }
      
      public function get hasTop5TakeTime() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set top5TakeTime(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.top5TakeTime$field = param1;
      }
      
      public function get top5TakeTime() : uint
      {
         return this.top5TakeTime$field;
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
         while(_loc2_ < this.rewards.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewards[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.nuts.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.nuts[_loc3_]);
            _loc3_++;
         }
         if(this.hasTotalTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.totalTicket$field);
         }
         if(this.hasFireCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.fireCount$field);
         }
         if(this.hasPresentCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.presentCount$field);
         }
         if(this.hasFreeCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.freeCount$field);
         }
         if(this.hasUsedCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.usedCount$field);
         }
         if(this.hasRefreshTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.refreshTime$field);
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.top5Rewards.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,10);
            WriteUtils.write$TYPE_MESSAGE(param1,this.top5Rewards[_loc4_]);
            _loc4_++;
         }
         if(this.hasTop5TakeTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.top5TakeTime$field);
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc11_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc11_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc11_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_9.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.rewards.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_HoodleReward()));
                  break;
               case 3:
                  this.nuts.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_NutInfo()));
                  break;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_9.totalTicket cannot be set twice.");
                  }
                  _loc4_++;
                  this.totalTicket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_9.fireCount cannot be set twice.");
                  }
                  _loc5_++;
                  this.fireCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_9.presentCount cannot be set twice.");
                  }
                  _loc6_++;
                  this.presentCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_9.freeCount cannot be set twice.");
                  }
                  _loc7_++;
                  this.freeCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_9.usedCount cannot be set twice.");
                  }
                  _loc8_++;
                  this.usedCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_9.refreshTime cannot be set twice.");
                  }
                  _loc9_++;
                  this.refreshTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  this.top5Rewards.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_HoodleTop5Reward()));
                  break;
               case 11:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_9.top5TakeTime cannot be set twice.");
                  }
                  _loc10_++;
                  this.top5TakeTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc11_);
                  break;
            }
         }
      }
   }
}
