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
   
   public final class Cmd_NoEndTD_GetWeekRankBoard_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_NoEndTD_GetWeekRankBoard_SC";
      
      public static const MODE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndTD_GetWeekRankBoard_SC.mode","mode",1 << 3 | WireType.VARINT);
      
      public static const PAGENO:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndTD_GetWeekRankBoard_SC.pageNo","pageNo",2 << 3 | WireType.VARINT);
      
      public static const TOTALPAGENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndTD_GetWeekRankBoard_SC.totalPageNum","totalPageNum",3 << 3 | WireType.VARINT);
      
      public static const RECORDER:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_NoEndTD_GetWeekRankBoard_SC.recorder","recorder",4 << 3 | WireType.LENGTH_DELIMITED,Dto_NoEndTD_RankRecorder);
      
      public static const MYRECORDER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_NoEndTD_GetWeekRankBoard_SC.myRecorder","myRecorder",5 << 3 | WireType.LENGTH_DELIMITED,Dto_NoEndTD_RankRecorder);
      
      public static const MYRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndTD_GetWeekRankBoard_SC.myRank","myRank",6 << 3 | WireType.VARINT);
       
      
      private var mode$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var pageNo$field:uint;
      
      private var totalPageNum$field:uint;
      
      public var recorder:Array;
      
      private var myRecorder$field:Dto_NoEndTD_RankRecorder;
      
      private var myRank$field:uint;
      
      public function Cmd_NoEndTD_GetWeekRankBoard_SC()
      {
         this.recorder = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_NoEndTD_GetWeekRankBoard_SC.$MessageID;
      }
      
      public function clearMode() : void
      {
         this.hasField$0 &= 4294967294;
         this.mode$field = new uint();
      }
      
      public function get hasMode() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set mode(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.mode$field = param1;
      }
      
      public function get mode() : uint
      {
         return this.mode$field;
      }
      
      public function clearPageNo() : void
      {
         this.hasField$0 &= 4294967293;
         this.pageNo$field = new uint();
      }
      
      public function get hasPageNo() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set pageNo(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.pageNo$field = param1;
      }
      
      public function get pageNo() : uint
      {
         return this.pageNo$field;
      }
      
      public function clearTotalPageNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.totalPageNum$field = new uint();
      }
      
      public function get hasTotalPageNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set totalPageNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.totalPageNum$field = param1;
      }
      
      public function get totalPageNum() : uint
      {
         return this.totalPageNum$field;
      }
      
      public function clearMyRecorder() : void
      {
         this.myRecorder$field = null;
      }
      
      public function get hasMyRecorder() : Boolean
      {
         return this.myRecorder$field != null;
      }
      
      public function set myRecorder(param1:Dto_NoEndTD_RankRecorder) : void
      {
         this.myRecorder$field = param1;
      }
      
      public function get myRecorder() : Dto_NoEndTD_RankRecorder
      {
         return this.myRecorder$field;
      }
      
      public function clearMyRank() : void
      {
         this.hasField$0 &= 4294967287;
         this.myRank$field = new uint();
      }
      
      public function get hasMyRank() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set myRank(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.myRank$field = param1;
      }
      
      public function get myRank() : uint
      {
         return this.myRank$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasMode)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.mode$field);
         }
         if(this.hasPageNo)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.pageNo$field);
         }
         if(this.hasTotalPageNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.totalPageNum$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.recorder.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.recorder[_loc2_]);
            _loc2_++;
         }
         if(this.hasMyRecorder)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.myRecorder$field);
         }
         if(this.hasMyRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.myRank$field);
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
                     throw new IOError("Bad data format: Cmd_NoEndTD_GetWeekRankBoard_SC.mode cannot be set twice.");
                  }
                  _loc3_++;
                  this.mode = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndTD_GetWeekRankBoard_SC.pageNo cannot be set twice.");
                  }
                  _loc4_++;
                  this.pageNo = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndTD_GetWeekRankBoard_SC.totalPageNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.totalPageNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  this.recorder.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_NoEndTD_RankRecorder()));
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndTD_GetWeekRankBoard_SC.myRecorder cannot be set twice.");
                  }
                  _loc6_++;
                  this.myRecorder = new Dto_NoEndTD_RankRecorder();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.myRecorder);
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndTD_GetWeekRankBoard_SC.myRank cannot be set twice.");
                  }
                  _loc7_++;
                  this.myRank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
