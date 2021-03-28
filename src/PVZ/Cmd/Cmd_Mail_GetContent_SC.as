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
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Mail_GetContent_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Mail_GetContent_SC";
      
      public static const MAILUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Mail_GetContent_SC.mailUId","mailUId",1 << 3 | WireType.VARINT);
      
      public static const CONTENT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Mail_GetContent_SC.content","content",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ADDCONTENT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Mail_GetContent_SC.addContent","addContent",3 << 3 | WireType.LENGTH_DELIMITED,Dto_AddContent);
       
      
      private var mailUId$field:Int64;
      
      private var content$field:String;
      
      private var addContent$field:Dto_AddContent;
      
      public function Cmd_Mail_GetContent_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Mail_GetContent_SC.$MessageID;
      }
      
      public function clearMailUId() : void
      {
         this.mailUId$field = null;
      }
      
      public function get hasMailUId() : Boolean
      {
         return this.mailUId$field != null;
      }
      
      public function set mailUId(param1:Int64) : void
      {
         this.mailUId$field = param1;
      }
      
      public function get mailUId() : Int64
      {
         return this.mailUId$field;
      }
      
      public function clearContent() : void
      {
         this.content$field = null;
      }
      
      public function get hasContent() : Boolean
      {
         return this.content$field != null;
      }
      
      public function set content(param1:String) : void
      {
         this.content$field = param1;
      }
      
      public function get content() : String
      {
         return this.content$field;
      }
      
      public function clearAddContent() : void
      {
         this.addContent$field = null;
      }
      
      public function get hasAddContent() : Boolean
      {
         return this.addContent$field != null;
      }
      
      public function set addContent(param1:Dto_AddContent) : void
      {
         this.addContent$field = param1;
      }
      
      public function get addContent() : Dto_AddContent
      {
         return this.addContent$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasMailUId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.mailUId$field);
         }
         if(this.hasContent)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.content$field);
         }
         if(this.hasAddContent)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.addContent$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Mail_GetContent_SC.mailUId cannot be set twice.");
                  }
                  _loc3_++;
                  this.mailUId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Mail_GetContent_SC.content cannot be set twice.");
                  }
                  _loc4_++;
                  this.content = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Mail_GetContent_SC.addContent cannot be set twice.");
                  }
                  _loc5_++;
                  this.addContent = new Dto_AddContent();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.addContent);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
