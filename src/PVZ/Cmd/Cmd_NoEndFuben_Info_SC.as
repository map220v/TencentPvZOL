package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_NoEndFuben_Info_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_NoEndFuben_Info_SC";
      
      public static const BEGINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndFuben_Info_SC.beginTime","beginTime",1 << 3 | WireType.VARINT);
      
      public static const ENDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndFuben_Info_SC.endTime","endTime",2 << 3 | WireType.VARINT);
      
      public static const OPENED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_NoEndFuben_Info_SC.opened","opened",3 << 3 | WireType.VARINT);
      
      public static const MODEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndFuben_Info_SC.modeId","modeId",4 << 3 | WireType.VARINT);
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndFuben_Info_SC.stageId","stageId",5 << 3 | WireType.VARINT);
      
      public static const HISTORYMAXSTAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndFuben_Info_SC.historyMaxStageId","historyMaxStageId",6 << 3 | WireType.VARINT);
      
      public static const LOSETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndFuben_Info_SC.loseTimes","loseTimes",7 << 3 | WireType.VARINT);
      
      public static const REPORTID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_NoEndFuben_Info_SC.reportId","reportId",8 << 3 | WireType.VARINT);
      
      public static const HASTAKEREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_NoEndFuben_Info_SC.hasTakeReward","hasTakeReward",9 << 3 | WireType.VARINT);
      
      public static const REWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_NoEndFuben_Info_SC.reward","reward",10 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const CARDHPRATIO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_NoEndFuben_Info_SC.cardHpRatio","cardHpRatio",11 << 3 | WireType.LENGTH_DELIMITED,Dto_CardHpRatio);
      
      public static const HASPASSNEXTSTAGE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_NoEndFuben_Info_SC.hasPassNextStage","hasPassNextStage",12 << 3 | WireType.VARINT);
      
      public static const RESETTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndFuben_Info_SC.resetTimes","resetTimes",13 << 3 | WireType.VARINT);
      
      public static const BESTSTAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndFuben_Info_SC.bestStageId","bestStageId",14 << 3 | WireType.VARINT);
      
      public static const REWARDSTAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndFuben_Info_SC.rewardStageId","rewardStageId",15 << 3 | WireType.VARINT);
       
      
      private var beginTime$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var endTime$field:uint;
      
      private var opened$field:Boolean;
      
      private var modeId$field:uint;
      
      private var stageId$field:uint;
      
      private var historyMaxStageId$field:uint;
      
      private var loseTimes$field:uint;
      
      private var reportId$field:Int64;
      
      private var hasTakeReward$field:Boolean;
      
      public var reward:Array;
      
      public var cardHpRatio:Array;
      
      private var hasPassNextStage$field:Boolean;
      
      private var resetTimes$field:uint;
      
      private var bestStageId$field:uint;
      
      private var rewardStageId$field:uint;
      
      public function Cmd_NoEndFuben_Info_SC()
      {
         this.reward = [];
         this.cardHpRatio = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_NoEndFuben_Info_SC.$MessageID;
      }
      
      public function clearBeginTime() : void
      {
         this.hasField$0 &= 4294967294;
         this.beginTime$field = new uint();
      }
      
      public function get hasBeginTime() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set beginTime(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.beginTime$field = param1;
      }
      
      public function get beginTime() : uint
      {
         return this.beginTime$field;
      }
      
      public function clearEndTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.endTime$field = new uint();
      }
      
      public function get hasEndTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set endTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.endTime$field = param1;
      }
      
      public function get endTime() : uint
      {
         return this.endTime$field;
      }
      
      public function clearOpened() : void
      {
         this.hasField$0 &= 4294967291;
         this.opened$field = new Boolean();
      }
      
      public function get hasOpened() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set opened(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.opened$field = param1;
      }
      
      public function get opened() : Boolean
      {
         return this.opened$field;
      }
      
      public function clearModeId() : void
      {
         this.hasField$0 &= 4294967287;
         this.modeId$field = new uint();
      }
      
      public function get hasModeId() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set modeId(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.modeId$field = param1;
      }
      
      public function get modeId() : uint
      {
         return this.modeId$field;
      }
      
      public function clearStageId() : void
      {
         this.hasField$0 &= 4294967279;
         this.stageId$field = new uint();
      }
      
      public function get hasStageId() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set stageId(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.stageId$field = param1;
      }
      
      public function get stageId() : uint
      {
         return this.stageId$field;
      }
      
      public function clearHistoryMaxStageId() : void
      {
         this.hasField$0 &= 4294967263;
         this.historyMaxStageId$field = new uint();
      }
      
      public function get hasHistoryMaxStageId() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set historyMaxStageId(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.historyMaxStageId$field = param1;
      }
      
      public function get historyMaxStageId() : uint
      {
         return this.historyMaxStageId$field;
      }
      
      public function clearLoseTimes() : void
      {
         this.hasField$0 &= 4294967231;
         this.loseTimes$field = new uint();
      }
      
      public function get hasLoseTimes() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set loseTimes(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.loseTimes$field = param1;
      }
      
      public function get loseTimes() : uint
      {
         return this.loseTimes$field;
      }
      
      public function clearReportId() : void
      {
         this.reportId$field = null;
      }
      
      public function get hasReportId() : Boolean
      {
         return this.reportId$field != null;
      }
      
      public function set reportId(param1:Int64) : void
      {
         this.reportId$field = param1;
      }
      
      public function get reportId() : Int64
      {
         return this.reportId$field;
      }
      
      public function clearHasTakeReward() : void
      {
         this.hasField$0 &= 4294967167;
         this.hasTakeReward$field = new Boolean();
      }
      
      public function get hasHasTakeReward() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set hasTakeReward(param1:Boolean) : void
      {
         this.hasField$0 |= 128;
         this.hasTakeReward$field = param1;
      }
      
      public function get hasTakeReward() : Boolean
      {
         return this.hasTakeReward$field;
      }
      
      public function clearHasPassNextStage() : void
      {
         this.hasField$0 &= 4294967039;
         this.hasPassNextStage$field = new Boolean();
      }
      
      public function get hasHasPassNextStage() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set hasPassNextStage(param1:Boolean) : void
      {
         this.hasField$0 |= 256;
         this.hasPassNextStage$field = param1;
      }
      
      public function get hasPassNextStage() : Boolean
      {
         return this.hasPassNextStage$field;
      }
      
      public function clearResetTimes() : void
      {
         this.hasField$0 &= 4294966783;
         this.resetTimes$field = new uint();
      }
      
      public function get hasResetTimes() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set resetTimes(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.resetTimes$field = param1;
      }
      
      public function get resetTimes() : uint
      {
         return this.resetTimes$field;
      }
      
      public function clearBestStageId() : void
      {
         this.hasField$0 &= 4294966271;
         this.bestStageId$field = new uint();
      }
      
      public function get hasBestStageId() : Boolean
      {
         return (this.hasField$0 & 1024) != 0;
      }
      
      public function set bestStageId(param1:uint) : void
      {
         this.hasField$0 |= 1024;
         this.bestStageId$field = param1;
      }
      
      public function get bestStageId() : uint
      {
         return this.bestStageId$field;
      }
      
      public function clearRewardStageId() : void
      {
         this.hasField$0 &= 4294965247;
         this.rewardStageId$field = new uint();
      }
      
      public function get hasRewardStageId() : Boolean
      {
         return (this.hasField$0 & 2048) != 0;
      }
      
      public function set rewardStageId(param1:uint) : void
      {
         this.hasField$0 |= 2048;
         this.rewardStageId$field = param1;
      }
      
      public function get rewardStageId() : uint
      {
         return this.rewardStageId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasBeginTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.beginTime$field);
         }
         if(this.hasEndTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.endTime$field);
         }
         if(this.hasOpened)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.opened$field);
         }
         if(this.hasModeId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.modeId$field);
         }
         if(this.hasStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.stageId$field);
         }
         if(this.hasHistoryMaxStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.historyMaxStageId$field);
         }
         if(this.hasLoseTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.loseTimes$field);
         }
         if(this.hasReportId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_INT64(param1,this.reportId$field);
         }
         if(this.hasHasTakeReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_BOOL(param1,this.hasTakeReward$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.reward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,10);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.cardHpRatio.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,11);
            WriteUtils.write$TYPE_MESSAGE(param1,this.cardHpRatio[_loc3_]);
            _loc3_++;
         }
         if(this.hasHasPassNextStage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_BOOL(param1,this.hasPassNextStage$field);
         }
         if(this.hasResetTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,13);
            WriteUtils.write$TYPE_UINT32(param1,this.resetTimes$field);
         }
         if(this.hasBestStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,14);
            WriteUtils.write$TYPE_UINT32(param1,this.bestStageId$field);
         }
         if(this.hasRewardStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,15);
            WriteUtils.write$TYPE_UINT32(param1,this.rewardStageId$field);
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc16_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         var _loc13_:uint = 0;
         var _loc14_:uint = 0;
         var _loc15_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc16_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc16_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Info_SC.beginTime cannot be set twice.");
                  }
                  _loc3_++;
                  this.beginTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Info_SC.endTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.endTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Info_SC.opened cannot be set twice.");
                  }
                  _loc5_++;
                  this.opened = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Info_SC.modeId cannot be set twice.");
                  }
                  _loc6_++;
                  this.modeId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Info_SC.stageId cannot be set twice.");
                  }
                  _loc7_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Info_SC.historyMaxStageId cannot be set twice.");
                  }
                  _loc8_++;
                  this.historyMaxStageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Info_SC.loseTimes cannot be set twice.");
                  }
                  _loc9_++;
                  this.loseTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Info_SC.reportId cannot be set twice.");
                  }
                  _loc10_++;
                  this.reportId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Info_SC.hasTakeReward cannot be set twice.");
                  }
                  _loc11_++;
                  this.hasTakeReward = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 10:
                  this.reward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 11:
                  this.cardHpRatio.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_CardHpRatio()));
                  break;
               case 12:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Info_SC.hasPassNextStage cannot be set twice.");
                  }
                  _loc12_++;
                  this.hasPassNextStage = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 13:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Info_SC.resetTimes cannot be set twice.");
                  }
                  _loc13_++;
                  this.resetTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 14:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Info_SC.bestStageId cannot be set twice.");
                  }
                  _loc14_++;
                  this.bestStageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 15:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Info_SC.rewardStageId cannot be set twice.");
                  }
                  _loc15_++;
                  this.rewardStageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc16_);
                  break;
            }
         }
      }
   }
}
