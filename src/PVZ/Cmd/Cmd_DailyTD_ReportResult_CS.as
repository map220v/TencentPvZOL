package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BYTES;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public final class Cmd_DailyTD_ReportResult_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_DailyTD_ReportResult_CS";
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_DailyTD_ReportResult_CS.stageId","stageId",1 << 3 | WireType.VARINT);
      
      public static const PASSRESULT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_DailyTD_ReportResult_CS.passResult","passResult",2 << 3 | WireType.VARINT);
      
      public static const STDAILYTD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_DailyTD_ReportResult_CS.stDailyTD","stDailyTD",3 << 3 | WireType.LENGTH_DELIMITED,Dto_DailyTDInfo);
      
      public static const LOGS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_DailyTD_ReportResult_CS.logs","logs",4 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const BREPEAT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_DailyTD_ReportResult_CS.bRepeat","bRepeat",5 << 3 | WireType.VARINT);
      
      public static const BYTELOGS:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("PVZ.Cmd.Cmd_DailyTD_ReportResult_CS.bytelogs","bytelogs",6 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const SRCSIZE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_DailyTD_ReportResult_CS.srcsize","srcsize",7 << 3 | WireType.VARINT);
       
      
      private var stageId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var passResult$field:uint;
      
      private var stDailyTD$field:Dto_DailyTDInfo;
      
      private var logs$field:String;
      
      private var bRepeat$field:Boolean;
      
      private var bytelogs$field:ByteArray;
      
      private var srcsize$field:uint;
      
      public function Cmd_DailyTD_ReportResult_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_DailyTD_ReportResult_CS.$MessageID;
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
      
      public function clearPassResult() : void
      {
         this.hasField$0 &= 4294967293;
         this.passResult$field = new uint();
      }
      
      public function get hasPassResult() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set passResult(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.passResult$field = param1;
      }
      
      public function get passResult() : uint
      {
         return this.passResult$field;
      }
      
      public function clearStDailyTD() : void
      {
         this.stDailyTD$field = null;
      }
      
      public function get hasStDailyTD() : Boolean
      {
         return this.stDailyTD$field != null;
      }
      
      public function set stDailyTD(param1:Dto_DailyTDInfo) : void
      {
         this.stDailyTD$field = param1;
      }
      
      public function get stDailyTD() : Dto_DailyTDInfo
      {
         return this.stDailyTD$field;
      }
      
      public function clearLogs() : void
      {
         this.logs$field = null;
      }
      
      public function get hasLogs() : Boolean
      {
         return this.logs$field != null;
      }
      
      public function set logs(param1:String) : void
      {
         this.logs$field = param1;
      }
      
      public function get logs() : String
      {
         return this.logs$field;
      }
      
      public function clearBRepeat() : void
      {
         this.hasField$0 &= 4294967291;
         this.bRepeat$field = new Boolean();
      }
      
      public function get hasBRepeat() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set bRepeat(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.bRepeat$field = param1;
      }
      
      public function get bRepeat() : Boolean
      {
         return this.bRepeat$field;
      }
      
      public function clearBytelogs() : void
      {
         this.bytelogs$field = null;
      }
      
      public function get hasBytelogs() : Boolean
      {
         return this.bytelogs$field != null;
      }
      
      public function set bytelogs(param1:ByteArray) : void
      {
         this.bytelogs$field = param1;
      }
      
      public function get bytelogs() : ByteArray
      {
         return this.bytelogs$field;
      }
      
      public function clearSrcsize() : void
      {
         this.hasField$0 &= 4294967287;
         this.srcsize$field = new uint();
      }
      
      public function get hasSrcsize() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set srcsize(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.srcsize$field = param1;
      }
      
      public function get srcsize() : uint
      {
         return this.srcsize$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.stageId$field);
         }
         if(this.hasPassResult)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.passResult$field);
         }
         if(this.hasStDailyTD)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.stDailyTD$field);
         }
         if(this.hasLogs)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_STRING(param1,this.logs$field);
         }
         if(this.hasBRepeat)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_BOOL(param1,this.bRepeat$field);
         }
         if(this.hasBytelogs)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_BYTES(param1,this.bytelogs$field);
         }
         if(this.hasSrcsize)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.srcsize$field);
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
                     throw new IOError("Bad data format: Cmd_DailyTD_ReportResult_CS.stageId cannot be set twice.");
                  }
                  _loc3_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyTD_ReportResult_CS.passResult cannot be set twice.");
                  }
                  _loc4_++;
                  this.passResult = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyTD_ReportResult_CS.stDailyTD cannot be set twice.");
                  }
                  _loc5_++;
                  this.stDailyTD = new Dto_DailyTDInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.stDailyTD);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyTD_ReportResult_CS.logs cannot be set twice.");
                  }
                  _loc6_++;
                  this.logs = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyTD_ReportResult_CS.bRepeat cannot be set twice.");
                  }
                  _loc7_++;
                  this.bRepeat = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyTD_ReportResult_CS.bytelogs cannot be set twice.");
                  }
                  _loc8_++;
                  this.bytelogs = ReadUtils.read$TYPE_BYTES(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyTD_ReportResult_CS.srcsize cannot be set twice.");
                  }
                  _loc9_++;
                  this.srcsize = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
