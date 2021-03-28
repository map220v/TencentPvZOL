package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_NoEndTD_ReportResult_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_NoEndTD_ReportResult_SC";
      
      public static const PASSRESULT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndTD_ReportResult_SC.passResult","passResult",1 << 3 | WireType.VARINT);
      
      public static const CURMODE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_NoEndTD_ReportResult_SC.curMode","curMode",2 << 3 | WireType.LENGTH_DELIMITED,Dto_NoEndTD_Mode);
      
      public static const REWARDITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_NoEndTD_ReportResult_SC.rewardItems","rewardItems",3 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const RAIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndTD_ReportResult_SC.rain","rain",4 << 3 | WireType.VARINT);
      
      public static const STRENGTHPOINT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndTD_ReportResult_SC.strengthPoint","strengthPoint",5 << 3 | WireType.VARINT);
       
      
      private var passResult$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var curMode$field:Dto_NoEndTD_Mode;
      
      public var rewardItems:Array;
      
      private var rain$field:uint;
      
      private var strengthPoint$field:uint;
      
      public function Cmd_NoEndTD_ReportResult_SC()
      {
         this.rewardItems = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_NoEndTD_ReportResult_SC.$MessageID;
      }
      
      public function clearPassResult() : void
      {
         this.hasField$0 &= 4294967294;
         this.passResult$field = new uint();
      }
      
      public function get hasPassResult() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set passResult(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.passResult$field = param1;
      }
      
      public function get passResult() : uint
      {
         return this.passResult$field;
      }
      
      public function clearCurMode() : void
      {
         this.curMode$field = null;
      }
      
      public function get hasCurMode() : Boolean
      {
         return this.curMode$field != null;
      }
      
      public function set curMode(param1:Dto_NoEndTD_Mode) : void
      {
         this.curMode$field = param1;
      }
      
      public function get curMode() : Dto_NoEndTD_Mode
      {
         return this.curMode$field;
      }
      
      public function clearRain() : void
      {
         this.hasField$0 &= 4294967293;
         this.rain$field = new uint();
      }
      
      public function get hasRain() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set rain(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.rain$field = param1;
      }
      
      public function get rain() : uint
      {
         return this.rain$field;
      }
      
      public function clearStrengthPoint() : void
      {
         this.hasField$0 &= 4294967291;
         this.strengthPoint$field = new uint();
      }
      
      public function get hasStrengthPoint() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set strengthPoint(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.strengthPoint$field = param1;
      }
      
      public function get strengthPoint() : uint
      {
         return this.strengthPoint$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasPassResult)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.passResult$field);
         }
         if(this.hasCurMode)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.curMode$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.rewardItems.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewardItems[_loc2_]);
            _loc2_++;
         }
         if(this.hasRain)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.rain$field);
         }
         if(this.hasStrengthPoint)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.strengthPoint$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Cmd_NoEndTD_ReportResult_SC.passResult cannot be set twice.");
                  }
                  _loc3_++;
                  this.passResult = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndTD_ReportResult_SC.curMode cannot be set twice.");
                  }
                  _loc4_++;
                  this.curMode = new Dto_NoEndTD_Mode();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.curMode);
                  break;
               case 3:
                  this.rewardItems.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndTD_ReportResult_SC.rain cannot be set twice.");
                  }
                  _loc5_++;
                  this.rain = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndTD_ReportResult_SC.strengthPoint cannot be set twice.");
                  }
                  _loc6_++;
                  this.strengthPoint = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
