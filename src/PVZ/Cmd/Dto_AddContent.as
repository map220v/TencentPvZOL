package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_AddContent extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_AddContent";
      
      public static const REPORTCONTENT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_AddContent.reportContent","reportContent",1 << 3 | WireType.LENGTH_DELIMITED,Dto_ContentReport);
       
      
      private var reportContent$field:Dto_ContentReport;
      
      public function Dto_AddContent()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_AddContent.$MessageID;
      }
      
      public function clearReportContent() : void
      {
         this.reportContent$field = null;
      }
      
      public function get hasReportContent() : Boolean
      {
         return this.reportContent$field != null;
      }
      
      public function set reportContent(param1:Dto_ContentReport) : void
      {
         this.reportContent$field = param1;
      }
      
      public function get reportContent() : Dto_ContentReport
      {
         return this.reportContent$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasReportContent)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reportContent$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc4_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AddContent.reportContent cannot be set twice.");
                  }
                  _loc3_++;
                  this.reportContent = new Dto_ContentReport();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.reportContent);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
