package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Mail_GuildSend_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Mail_GuildSend_CS";
      
      public static const CONTENT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Mail_GuildSend_CS.content","content",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const TITLE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Mail_GuildSend_CS.title","title",2 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var content$field:String;
      
      private var title$field:String;
      
      public function Cmd_Mail_GuildSend_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Mail_GuildSend_CS.$MessageID;
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
      
      public function clearTitle() : void
      {
         this.title$field = null;
      }
      
      public function get hasTitle() : Boolean
      {
         return this.title$field != null;
      }
      
      public function set title(param1:String) : void
      {
         this.title$field = param1;
      }
      
      public function get title() : String
      {
         return this.title$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasContent)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_STRING(param1,this.content$field);
         }
         if(this.hasTitle)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.title$field);
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
                     throw new IOError("Bad data format: Cmd_Mail_GuildSend_CS.content cannot be set twice.");
                  }
                  _loc3_++;
                  this.content = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Mail_GuildSend_CS.title cannot be set twice.");
                  }
                  _loc4_++;
                  this.title = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
