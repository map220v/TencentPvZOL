package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_War_History extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_War_History";
      
      public static const TYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_War_History.type","type",1 << 3 | WireType.VARINT);
      
      public static const ACTIVEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_War_History.activeInfo","activeInfo",2 << 3 | WireType.LENGTH_DELIMITED,Dto_War_Target);
      
      public static const TARGETINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_War_History.targetInfo","targetInfo",3 << 3 | WireType.LENGTH_DELIMITED,Dto_War_Target);
      
      public static const TEAMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_War_History.teamId","teamId",4 << 3 | WireType.VARINT);
      
      public static const ACTIONID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_War_History.actionId","actionId",5 << 3 | WireType.VARINT);
      
      public static const BEGINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_War_History.beginTime","beginTime",6 << 3 | WireType.VARINT);
      
      public static const ENDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_War_History.endTime","endTime",7 << 3 | WireType.VARINT);
      
      public static const TEAMSTATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_War_History.teamState","teamState",8 << 3 | WireType.VARINT);
      
      public static const WARRESULT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_War_History.warResult","warResult",9 << 3 | WireType.VARINT);
      
      public static const REPORTID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_War_History.reportId","reportId",10 << 3 | WireType.VARINT);
      
      public static const TASKTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_War_History.taskTime","taskTime",11 << 3 | WireType.VARINT);
      
      public static const AREAID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_War_History.areaId","areaId",12 << 3 | WireType.VARINT);
      
      public static const WARHISTORYTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_War_History.warHistoryType","warHistoryType",13 << 3 | WireType.VARINT);
      
      public static const TIMESTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_War_History.timeStamp","timeStamp",14 << 3 | WireType.VARINT);
       
      
      private var type$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var activeInfo$field:Dto_War_Target;
      
      private var targetInfo$field:Dto_War_Target;
      
      private var teamId$field:uint;
      
      private var actionId$field:uint;
      
      private var beginTime$field:uint;
      
      private var endTime$field:uint;
      
      private var teamState$field:uint;
      
      private var warResult$field:uint;
      
      private var reportId$field:Int64;
      
      private var taskTime$field:uint;
      
      private var areaId$field:uint;
      
      private var warHistoryType$field:uint;
      
      private var timeStamp$field:uint;
      
      public function Dto_War_History()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_War_History.$MessageID;
      }
      
      public function clearType() : void
      {
         this.hasField$0 &= 4294967294;
         this.type$field = new uint();
      }
      
      public function get hasType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set type(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.type$field = param1;
      }
      
      public function get type() : uint
      {
         return this.type$field;
      }
      
      public function clearActiveInfo() : void
      {
         this.activeInfo$field = null;
      }
      
      public function get hasActiveInfo() : Boolean
      {
         return this.activeInfo$field != null;
      }
      
      public function set activeInfo(param1:Dto_War_Target) : void
      {
         this.activeInfo$field = param1;
      }
      
      public function get activeInfo() : Dto_War_Target
      {
         return this.activeInfo$field;
      }
      
      public function clearTargetInfo() : void
      {
         this.targetInfo$field = null;
      }
      
      public function get hasTargetInfo() : Boolean
      {
         return this.targetInfo$field != null;
      }
      
      public function set targetInfo(param1:Dto_War_Target) : void
      {
         this.targetInfo$field = param1;
      }
      
      public function get targetInfo() : Dto_War_Target
      {
         return this.targetInfo$field;
      }
      
      public function clearTeamId() : void
      {
         this.hasField$0 &= 4294967293;
         this.teamId$field = new uint();
      }
      
      public function get hasTeamId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set teamId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.teamId$field = param1;
      }
      
      public function get teamId() : uint
      {
         return this.teamId$field;
      }
      
      public function clearActionId() : void
      {
         this.hasField$0 &= 4294967291;
         this.actionId$field = new uint();
      }
      
      public function get hasActionId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set actionId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.actionId$field = param1;
      }
      
      public function get actionId() : uint
      {
         return this.actionId$field;
      }
      
      public function clearBeginTime() : void
      {
         this.hasField$0 &= 4294967287;
         this.beginTime$field = new uint();
      }
      
      public function get hasBeginTime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set beginTime(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.beginTime$field = param1;
      }
      
      public function get beginTime() : uint
      {
         return this.beginTime$field;
      }
      
      public function clearEndTime() : void
      {
         this.hasField$0 &= 4294967279;
         this.endTime$field = new uint();
      }
      
      public function get hasEndTime() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set endTime(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.endTime$field = param1;
      }
      
      public function get endTime() : uint
      {
         return this.endTime$field;
      }
      
      public function clearTeamState() : void
      {
         this.hasField$0 &= 4294967263;
         this.teamState$field = new uint();
      }
      
      public function get hasTeamState() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set teamState(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.teamState$field = param1;
      }
      
      public function get teamState() : uint
      {
         return this.teamState$field;
      }
      
      public function clearWarResult() : void
      {
         this.hasField$0 &= 4294967231;
         this.warResult$field = new uint();
      }
      
      public function get hasWarResult() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set warResult(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.warResult$field = param1;
      }
      
      public function get warResult() : uint
      {
         return this.warResult$field;
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
      
      public function clearTaskTime() : void
      {
         this.hasField$0 &= 4294967167;
         this.taskTime$field = new uint();
      }
      
      public function get hasTaskTime() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set taskTime(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.taskTime$field = param1;
      }
      
      public function get taskTime() : uint
      {
         return this.taskTime$field;
      }
      
      public function clearAreaId() : void
      {
         this.hasField$0 &= 4294967039;
         this.areaId$field = new uint();
      }
      
      public function get hasAreaId() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set areaId(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.areaId$field = param1;
      }
      
      public function get areaId() : uint
      {
         return this.areaId$field;
      }
      
      public function clearWarHistoryType() : void
      {
         this.hasField$0 &= 4294966783;
         this.warHistoryType$field = new uint();
      }
      
      public function get hasWarHistoryType() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set warHistoryType(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.warHistoryType$field = param1;
      }
      
      public function get warHistoryType() : uint
      {
         return this.warHistoryType$field;
      }
      
      public function clearTimeStamp() : void
      {
         this.hasField$0 &= 4294966271;
         this.timeStamp$field = new uint();
      }
      
      public function get hasTimeStamp() : Boolean
      {
         return (this.hasField$0 & 1024) != 0;
      }
      
      public function set timeStamp(param1:uint) : void
      {
         this.hasField$0 |= 1024;
         this.timeStamp$field = param1;
      }
      
      public function get timeStamp() : uint
      {
         return this.timeStamp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.type$field);
         }
         if(this.hasActiveInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.activeInfo$field);
         }
         if(this.hasTargetInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.targetInfo$field);
         }
         if(this.hasTeamId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.teamId$field);
         }
         if(this.hasActionId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.actionId$field);
         }
         if(this.hasBeginTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.beginTime$field);
         }
         if(this.hasEndTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.endTime$field);
         }
         if(this.hasTeamState)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.teamState$field);
         }
         if(this.hasWarResult)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.warResult$field);
         }
         if(this.hasReportId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_INT64(param1,this.reportId$field);
         }
         if(this.hasTaskTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.taskTime$field);
         }
         if(this.hasAreaId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_UINT32(param1,this.areaId$field);
         }
         if(this.hasWarHistoryType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,13);
            WriteUtils.write$TYPE_UINT32(param1,this.warHistoryType$field);
         }
         if(this.hasTimeStamp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,14);
            WriteUtils.write$TYPE_UINT32(param1,this.timeStamp$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc17_:uint = 0;
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
         var _loc16_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc17_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc17_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_War_History.type cannot be set twice.");
                  }
                  _loc3_++;
                  this.type = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_War_History.activeInfo cannot be set twice.");
                  }
                  _loc4_++;
                  this.activeInfo = new Dto_War_Target();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.activeInfo);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_War_History.targetInfo cannot be set twice.");
                  }
                  _loc5_++;
                  this.targetInfo = new Dto_War_Target();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.targetInfo);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_War_History.teamId cannot be set twice.");
                  }
                  _loc6_++;
                  this.teamId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_War_History.actionId cannot be set twice.");
                  }
                  _loc7_++;
                  this.actionId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_War_History.beginTime cannot be set twice.");
                  }
                  _loc8_++;
                  this.beginTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_War_History.endTime cannot be set twice.");
                  }
                  _loc9_++;
                  this.endTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_War_History.teamState cannot be set twice.");
                  }
                  _loc10_++;
                  this.teamState = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_War_History.warResult cannot be set twice.");
                  }
                  _loc11_++;
                  this.warResult = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_War_History.reportId cannot be set twice.");
                  }
                  _loc12_++;
                  this.reportId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_War_History.taskTime cannot be set twice.");
                  }
                  _loc13_++;
                  this.taskTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_War_History.areaId cannot be set twice.");
                  }
                  _loc14_++;
                  this.areaId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 13:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_War_History.warHistoryType cannot be set twice.");
                  }
                  _loc15_++;
                  this.warHistoryType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 14:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_War_History.timeStamp cannot be set twice.");
                  }
                  _loc16_++;
                  this.timeStamp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc17_);
                  break;
            }
         }
      }
   }
}
