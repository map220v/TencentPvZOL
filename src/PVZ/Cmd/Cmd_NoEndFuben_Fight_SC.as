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
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_NoEndFuben_Fight_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_NoEndFuben_Fight_SC";
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndFuben_Fight_SC.stageId","stageId",1 << 3 | WireType.VARINT);
      
      public static const HISTORYMAXSTAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndFuben_Fight_SC.historyMaxStageId","historyMaxStageId",2 << 3 | WireType.VARINT);
      
      public static const HASPASSNEXTSTAGE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_NoEndFuben_Fight_SC.hasPassNextStage","hasPassNextStage",3 << 3 | WireType.VARINT);
      
      public static const LOSETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndFuben_Fight_SC.loseTimes","loseTimes",4 << 3 | WireType.VARINT);
      
      public static const REPORTID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_NoEndFuben_Fight_SC.reportId","reportId",5 << 3 | WireType.VARINT);
      
      public static const REPORT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_NoEndFuben_Fight_SC.report","report",6 << 3 | WireType.LENGTH_DELIMITED,Dto_FightReport);
      
      public static const REWARD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_NoEndFuben_Fight_SC.reward","reward",7 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      private var stageId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var historyMaxStageId$field:uint;
      
      private var hasPassNextStage$field:Boolean;
      
      private var loseTimes$field:uint;
      
      private var reportId$field:Int64;
      
      private var report$field:Dto_FightReport;
      
      private var reward$field:Dto_IdNum;
      
      public function Cmd_NoEndFuben_Fight_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_NoEndFuben_Fight_SC.$MessageID;
      }
      
      public function clearStageId() : void
      {
         this.hasField$0 &= 4294967294;
         this.stageId$field = new uint();
      }
      
      public function get hasStageId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set stageId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.stageId$field = param1;
      }
      
      public function get stageId() : uint
      {
         return this.stageId$field;
      }
      
      public function clearHistoryMaxStageId() : void
      {
         this.hasField$0 &= 4294967293;
         this.historyMaxStageId$field = new uint();
      }
      
      public function get hasHistoryMaxStageId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set historyMaxStageId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.historyMaxStageId$field = param1;
      }
      
      public function get historyMaxStageId() : uint
      {
         return this.historyMaxStageId$field;
      }
      
      public function clearHasPassNextStage() : void
      {
         this.hasField$0 &= 4294967291;
         this.hasPassNextStage$field = new Boolean();
      }
      
      public function get hasHasPassNextStage() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set hasPassNextStage(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.hasPassNextStage$field = param1;
      }
      
      public function get hasPassNextStage() : Boolean
      {
         return this.hasPassNextStage$field;
      }
      
      public function clearLoseTimes() : void
      {
         this.hasField$0 &= 4294967287;
         this.loseTimes$field = new uint();
      }
      
      public function get hasLoseTimes() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set loseTimes(param1:uint) : void
      {
         this.hasField$0 |= 8;
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
      
      public function clearReport() : void
      {
         this.report$field = null;
      }
      
      public function get hasReport() : Boolean
      {
         return this.report$field != null;
      }
      
      public function set report(param1:Dto_FightReport) : void
      {
         this.report$field = param1;
      }
      
      public function get report() : Dto_FightReport
      {
         return this.report$field;
      }
      
      public function clearReward() : void
      {
         this.reward$field = null;
      }
      
      public function get hasReward() : Boolean
      {
         return this.reward$field != null;
      }
      
      public function set reward(param1:Dto_IdNum) : void
      {
         this.reward$field = param1;
      }
      
      public function get reward() : Dto_IdNum
      {
         return this.reward$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.stageId$field);
         }
         if(this.hasHistoryMaxStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.historyMaxStageId$field);
         }
         if(this.hasHasPassNextStage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.hasPassNextStage$field);
         }
         if(this.hasLoseTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.loseTimes$field);
         }
         if(this.hasReportId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_INT64(param1,this.reportId$field);
         }
         if(this.hasReport)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.report$field);
         }
         if(this.hasReward)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Fight_SC.stageId cannot be set twice.");
                  }
                  _loc3_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Fight_SC.historyMaxStageId cannot be set twice.");
                  }
                  _loc4_++;
                  this.historyMaxStageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Fight_SC.hasPassNextStage cannot be set twice.");
                  }
                  _loc5_++;
                  this.hasPassNextStage = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Fight_SC.loseTimes cannot be set twice.");
                  }
                  _loc6_++;
                  this.loseTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Fight_SC.reportId cannot be set twice.");
                  }
                  _loc7_++;
                  this.reportId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Fight_SC.report cannot be set twice.");
                  }
                  _loc8_++;
                  this.report = new Dto_FightReport();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.report);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndFuben_Fight_SC.reward cannot be set twice.");
                  }
                  _loc9_++;
                  this.reward = new Dto_IdNum();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.reward);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
