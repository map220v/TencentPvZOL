package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Mail_Send_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Mail_Send_CS";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Mail_Send_CS.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const CONTENT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Mail_Send_CS.content","content",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const TITLE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Mail_Send_CS.title","title",3 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var roleId$field:Int64;
      
      private var content$field:String;
      
      private var title$field:String;
      
      public function Cmd_Mail_Send_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Mail_Send_CS.$MessageID;
      }
      
      public function clearRoleId() : void
      {
         this.roleId$field = null;
      }
      
      public function get hasRoleId() : Boolean
      {
         return this.roleId$field != null;
      }
      
      public function set roleId(param1:Int64) : void
      {
         this.roleId$field = param1;
      }
      
      public function get roleId() : Int64
      {
         return this.roleId$field;
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
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasContent)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.content$field);
         }
         if(this.hasTitle)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.title$field);
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
                     throw new IOError("Bad data format: Cmd_Mail_Send_CS.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Mail_Send_CS.content cannot be set twice.");
                  }
                  _loc4_++;
                  this.content = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Mail_Send_CS.title cannot be set twice.");
                  }
                  _loc5_++;
                  this.title = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
