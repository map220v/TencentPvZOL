package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_TopFightReportInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_TopFightReportInfo";
      
      public static const WIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_TopFightReportInfo.win","win",1 << 3 | WireType.VARINT);
      
      public static const REPORTID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_TopFightReportInfo.reportId","reportId",2 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var win$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var reportId$field:String;
      
      public function Dto_TopFightReportInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_TopFightReportInfo.$MessageID;
      }
      
      public function clearWin() : void
      {
         this.hasField$0 &= 4294967294;
         this.win$field = new Boolean();
      }
      
      public function get hasWin() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set win(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.win$field = param1;
      }
      
      public function get win() : Boolean
      {
         return this.win$field;
      }
      
      public function clearReportId() : void
      {
         this.reportId$field = null;
      }
      
      public function get hasReportId() : Boolean
      {
         return this.reportId$field != null;
      }
      
      public function set reportId(param1:String) : void
      {
         this.reportId$field = param1;
      }
      
      public function get reportId() : String
      {
         return this.reportId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasWin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_BOOL(param1,this.win$field);
         }
         if(this.hasReportId)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.reportId$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc5_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TopFightReportInfo.win cannot be set twice.");
                  }
                  _loc3_++;
                  this.win = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TopFightReportInfo.reportId cannot be set twice.");
                  }
                  _loc4_++;
                  this.reportId = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
