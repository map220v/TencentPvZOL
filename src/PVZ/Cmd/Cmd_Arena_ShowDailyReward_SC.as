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
   
   public final class Cmd_Arena_ShowDailyReward_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Arena_ShowDailyReward_SC";
      
      public static const YESTERDAYRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Arena_ShowDailyReward_SC.yesterdayRank","yesterdayRank",1 << 3 | WireType.VARINT);
      
      public static const YESTERDAYRESULT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Arena_ShowDailyReward_SC.yesterdayResult","yesterdayResult",2 << 3 | WireType.VARINT);
      
      public static const CURGRADE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Arena_ShowDailyReward_SC.curGrade","curGrade",3 << 3 | WireType.VARINT);
      
      public static const CURFEATUREID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Arena_ShowDailyReward_SC.curFeatureId","curFeatureId",4 << 3 | WireType.VARINT);
      
      public static const NEXTGRADE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Arena_ShowDailyReward_SC.nextGrade","nextGrade",5 << 3 | WireType.VARINT);
      
      public static const NEXTFEATUREID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Arena_ShowDailyReward_SC.nextFeatureId","nextFeatureId",6 << 3 | WireType.VARINT);
      
      public static const HASTAKEREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Arena_ShowDailyReward_SC.hasTakeReward","hasTakeReward",7 << 3 | WireType.VARINT);
      
      public static const REWARDLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Arena_ShowDailyReward_SC.rewardList","rewardList",8 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      private var yesterdayRank$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var yesterdayResult$field:uint;
      
      private var curGrade$field:uint;
      
      private var curFeatureId$field:uint;
      
      private var nextGrade$field:uint;
      
      private var nextFeatureId$field:uint;
      
      private var hasTakeReward$field:Boolean;
      
      public var rewardList:Array;
      
      public function Cmd_Arena_ShowDailyReward_SC()
      {
         this.rewardList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Arena_ShowDailyReward_SC.$MessageID;
      }
      
      public function clearYesterdayRank() : void
      {
         this.hasField$0 &= 4294967294;
         this.yesterdayRank$field = new uint();
      }
      
      public function get hasYesterdayRank() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set yesterdayRank(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.yesterdayRank$field = param1;
      }
      
      public function get yesterdayRank() : uint
      {
         return this.yesterdayRank$field;
      }
      
      public function clearYesterdayResult() : void
      {
         this.hasField$0 &= 4294967293;
         this.yesterdayResult$field = new uint();
      }
      
      public function get hasYesterdayResult() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set yesterdayResult(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.yesterdayResult$field = param1;
      }
      
      public function get yesterdayResult() : uint
      {
         return this.yesterdayResult$field;
      }
      
      public function clearCurGrade() : void
      {
         this.hasField$0 &= 4294967291;
         this.curGrade$field = new uint();
      }
      
      public function get hasCurGrade() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set curGrade(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.curGrade$field = param1;
      }
      
      public function get curGrade() : uint
      {
         return this.curGrade$field;
      }
      
      public function clearCurFeatureId() : void
      {
         this.hasField$0 &= 4294967287;
         this.curFeatureId$field = new uint();
      }
      
      public function get hasCurFeatureId() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set curFeatureId(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.curFeatureId$field = param1;
      }
      
      public function get curFeatureId() : uint
      {
         return this.curFeatureId$field;
      }
      
      public function clearNextGrade() : void
      {
         this.hasField$0 &= 4294967279;
         this.nextGrade$field = new uint();
      }
      
      public function get hasNextGrade() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set nextGrade(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.nextGrade$field = param1;
      }
      
      public function get nextGrade() : uint
      {
         return this.nextGrade$field;
      }
      
      public function clearNextFeatureId() : void
      {
         this.hasField$0 &= 4294967263;
         this.nextFeatureId$field = new uint();
      }
      
      public function get hasNextFeatureId() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set nextFeatureId(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.nextFeatureId$field = param1;
      }
      
      public function get nextFeatureId() : uint
      {
         return this.nextFeatureId$field;
      }
      
      public function clearHasTakeReward() : void
      {
         this.hasField$0 &= 4294967231;
         this.hasTakeReward$field = new Boolean();
      }
      
      public function get hasHasTakeReward() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set hasTakeReward(param1:Boolean) : void
      {
         this.hasField$0 |= 64;
         this.hasTakeReward$field = param1;
      }
      
      public function get hasTakeReward() : Boolean
      {
         return this.hasTakeReward$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasYesterdayRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.yesterdayRank$field);
         }
         if(this.hasYesterdayResult)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.yesterdayResult$field);
         }
         if(this.hasCurGrade)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.curGrade$field);
         }
         if(this.hasCurFeatureId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.curFeatureId$field);
         }
         if(this.hasNextGrade)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.nextGrade$field);
         }
         if(this.hasNextFeatureId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.nextFeatureId$field);
         }
         if(this.hasHasTakeReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_BOOL(param1,this.hasTakeReward$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.rewardList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewardList[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc10_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc10_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc10_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Arena_ShowDailyReward_SC.yesterdayRank cannot be set twice.");
                  }
                  _loc3_++;
                  this.yesterdayRank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Arena_ShowDailyReward_SC.yesterdayResult cannot be set twice.");
                  }
                  _loc4_++;
                  this.yesterdayResult = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Arena_ShowDailyReward_SC.curGrade cannot be set twice.");
                  }
                  _loc5_++;
                  this.curGrade = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Arena_ShowDailyReward_SC.curFeatureId cannot be set twice.");
                  }
                  _loc6_++;
                  this.curFeatureId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Arena_ShowDailyReward_SC.nextGrade cannot be set twice.");
                  }
                  _loc7_++;
                  this.nextGrade = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Arena_ShowDailyReward_SC.nextFeatureId cannot be set twice.");
                  }
                  _loc8_++;
                  this.nextFeatureId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Arena_ShowDailyReward_SC.hasTakeReward cannot be set twice.");
                  }
                  _loc9_++;
                  this.hasTakeReward = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 8:
                  this.rewardList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
