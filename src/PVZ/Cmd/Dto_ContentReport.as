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
   
   public final class Dto_ContentReport extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ContentReport";
      
      public static const WINSIDE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ContentReport.winSide","winSide",1 << 3 | WireType.VARINT);
      
      public static const LEFTSIDEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_ContentReport.leftSideInfo","leftSideInfo",2 << 3 | WireType.LENGTH_DELIMITED,Dto_ReportSide);
      
      public static const RIGHTSIDEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_ContentReport.rightSideInfo","rightSideInfo",3 << 3 | WireType.LENGTH_DELIMITED,Dto_ReportSide);
      
      public static const REPORTID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_ContentReport.reportId","reportId",4 << 3 | WireType.VARINT);
      
      public static const NOTE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_ContentReport.note","note",5 << 3 | WireType.LENGTH_DELIMITED,Dto_FightNote);
       
      
      private var winSide$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var leftSideInfo$field:Dto_ReportSide;
      
      private var rightSideInfo$field:Dto_ReportSide;
      
      private var reportId$field:Int64;
      
      private var note$field:Dto_FightNote;
      
      public function Dto_ContentReport()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ContentReport.$MessageID;
      }
      
      public function clearWinSide() : void
      {
         this.hasField$0 &= 4294967294;
         this.winSide$field = new uint();
      }
      
      public function get hasWinSide() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set winSide(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.winSide$field = param1;
      }
      
      public function get winSide() : uint
      {
         return this.winSide$field;
      }
      
      public function clearLeftSideInfo() : void
      {
         this.leftSideInfo$field = null;
      }
      
      public function get hasLeftSideInfo() : Boolean
      {
         return this.leftSideInfo$field != null;
      }
      
      public function set leftSideInfo(param1:Dto_ReportSide) : void
      {
         this.leftSideInfo$field = param1;
      }
      
      public function get leftSideInfo() : Dto_ReportSide
      {
         return this.leftSideInfo$field;
      }
      
      public function clearRightSideInfo() : void
      {
         this.rightSideInfo$field = null;
      }
      
      public function get hasRightSideInfo() : Boolean
      {
         return this.rightSideInfo$field != null;
      }
      
      public function set rightSideInfo(param1:Dto_ReportSide) : void
      {
         this.rightSideInfo$field = param1;
      }
      
      public function get rightSideInfo() : Dto_ReportSide
      {
         return this.rightSideInfo$field;
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
      
      public function clearNote() : void
      {
         this.note$field = null;
      }
      
      public function get hasNote() : Boolean
      {
         return this.note$field != null;
      }
      
      public function set note(param1:Dto_FightNote) : void
      {
         this.note$field = param1;
      }
      
      public function get note() : Dto_FightNote
      {
         return this.note$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasWinSide)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.winSide$field);
         }
         if(this.hasLeftSideInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.leftSideInfo$field);
         }
         if(this.hasRightSideInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rightSideInfo$field);
         }
         if(this.hasReportId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_INT64(param1,this.reportId$field);
         }
         if(this.hasNote)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.note$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Dto_ContentReport.winSide cannot be set twice.");
                  }
                  _loc3_++;
                  this.winSide = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ContentReport.leftSideInfo cannot be set twice.");
                  }
                  _loc4_++;
                  this.leftSideInfo = new Dto_ReportSide();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.leftSideInfo);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ContentReport.rightSideInfo cannot be set twice.");
                  }
                  _loc5_++;
                  this.rightSideInfo = new Dto_ReportSide();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.rightSideInfo);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ContentReport.reportId cannot be set twice.");
                  }
                  _loc6_++;
                  this.reportId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ContentReport.note cannot be set twice.");
                  }
                  _loc7_++;
                  this.note = new Dto_FightNote();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.note);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
