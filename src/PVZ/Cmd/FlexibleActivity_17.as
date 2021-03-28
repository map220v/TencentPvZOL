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
   
   public final class FlexibleActivity_17 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_17";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_17.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const FIRSTREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_17.firstReward","firstReward",2 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const SECONDREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_17.secondReward","secondReward",3 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const THIRDREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_17.thirdReward","thirdReward",4 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const CIRCUSREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_17.circusReward","circusReward",5 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const PLAYGROUNDREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_17.playGroundReward","playGroundReward",6 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const TAKEMERGESERVERWARTOTALREWARDDATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_17.takeMergeServerWarTotalRewardDate","takeMergeServerWarTotalRewardDate",100 << 3 | WireType.VARINT);
      
      public static const TAKEWARDAILYCIRCUSREWARDDATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_17.takeWarDailyCircusRewardDate","takeWarDailyCircusRewardDate",101 << 3 | WireType.VARINT);
      
      public static const TAKEWARDAILYPLAYGROUNDREWARDDATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_17.takeWarDailyPlayGroundRewardDate","takeWarDailyPlayGroundRewardDate",102 << 3 | WireType.VARINT);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var firstReward:Array;
      
      public var secondReward:Array;
      
      public var thirdReward:Array;
      
      public var circusReward:Array;
      
      public var playGroundReward:Array;
      
      private var takeMergeServerWarTotalRewardDate$field:uint;
      
      private var takeWarDailyCircusRewardDate$field:uint;
      
      private var takeWarDailyPlayGroundRewardDate$field:uint;
      
      public function FlexibleActivity_17()
      {
         this.firstReward = [];
         this.secondReward = [];
         this.thirdReward = [];
         this.circusReward = [];
         this.playGroundReward = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_17.$MessageID;
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
      
      public function clearTakeMergeServerWarTotalRewardDate() : void
      {
         this.hasField$0 &= 4294967293;
         this.takeMergeServerWarTotalRewardDate$field = new uint();
      }
      
      public function get hasTakeMergeServerWarTotalRewardDate() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set takeMergeServerWarTotalRewardDate(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.takeMergeServerWarTotalRewardDate$field = param1;
      }
      
      public function get takeMergeServerWarTotalRewardDate() : uint
      {
         return this.takeMergeServerWarTotalRewardDate$field;
      }
      
      public function clearTakeWarDailyCircusRewardDate() : void
      {
         this.hasField$0 &= 4294967291;
         this.takeWarDailyCircusRewardDate$field = new uint();
      }
      
      public function get hasTakeWarDailyCircusRewardDate() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set takeWarDailyCircusRewardDate(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.takeWarDailyCircusRewardDate$field = param1;
      }
      
      public function get takeWarDailyCircusRewardDate() : uint
      {
         return this.takeWarDailyCircusRewardDate$field;
      }
      
      public function clearTakeWarDailyPlayGroundRewardDate() : void
      {
         this.hasField$0 &= 4294967287;
         this.takeWarDailyPlayGroundRewardDate$field = new uint();
      }
      
      public function get hasTakeWarDailyPlayGroundRewardDate() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set takeWarDailyPlayGroundRewardDate(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.takeWarDailyPlayGroundRewardDate$field = param1;
      }
      
      public function get takeWarDailyPlayGroundRewardDate() : uint
      {
         return this.takeWarDailyPlayGroundRewardDate$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc7_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.firstReward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.firstReward[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.secondReward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.secondReward[_loc3_]);
            _loc3_++;
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.thirdReward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.thirdReward[_loc4_]);
            _loc4_++;
         }
         var _loc5_:uint = 0;
         while(_loc5_ < this.circusReward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.circusReward[_loc5_]);
            _loc5_++;
         }
         var _loc6_:uint = 0;
         while(_loc6_ < this.playGroundReward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.playGroundReward[_loc6_]);
            _loc6_++;
         }
         if(this.hasTakeMergeServerWarTotalRewardDate)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,100);
            WriteUtils.write$TYPE_UINT32(param1,this.takeMergeServerWarTotalRewardDate$field);
         }
         if(this.hasTakeWarDailyCircusRewardDate)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,101);
            WriteUtils.write$TYPE_UINT32(param1,this.takeWarDailyCircusRewardDate$field);
         }
         if(this.hasTakeWarDailyPlayGroundRewardDate)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,102);
            WriteUtils.write$TYPE_UINT32(param1,this.takeWarDailyPlayGroundRewardDate$field);
         }
         for(_loc7_ in this)
         {
            super.writeUnknown(param1,_loc7_);
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
                     throw new IOError("Bad data format: FlexibleActivity_17.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.firstReward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 3:
                  this.secondReward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 4:
                  this.thirdReward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 5:
                  this.circusReward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 6:
                  this.playGroundReward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 100:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_17.takeMergeServerWarTotalRewardDate cannot be set twice.");
                  }
                  _loc4_++;
                  this.takeMergeServerWarTotalRewardDate = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 101:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_17.takeWarDailyCircusRewardDate cannot be set twice.");
                  }
                  _loc5_++;
                  this.takeWarDailyCircusRewardDate = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 102:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_17.takeWarDailyPlayGroundRewardDate cannot be set twice.");
                  }
                  _loc6_++;
                  this.takeWarDailyPlayGroundRewardDate = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
