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
   
   public final class Cmd_SecondPwd_SetPwd_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_SecondPwd_SetPwd_CS";
      
      public static const PASSWORD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_SecondPwd_SetPwd_CS.password","password",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const INPUT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_SecondPwd_SetPwd_CS.input","input",2 << 3 | WireType.VARINT);
       
      
      private var password$field:String;
      
      private var input$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_SecondPwd_SetPwd_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_SecondPwd_SetPwd_CS.$MessageID;
      }
      
      public function clearPassword() : void
      {
         this.password$field = null;
      }
      
      public function get hasPassword() : Boolean
      {
         return this.password$field != null;
      }
      
      public function set password(param1:String) : void
      {
         this.password$field = param1;
      }
      
      public function get password() : String
      {
         return this.password$field;
      }
      
      public function clearInput() : void
      {
         this.hasField$0 &= 4294967294;
         this.input$field = new Boolean();
      }
      
      public function get hasInput() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set input(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.input$field = param1;
      }
      
      public function get input() : Boolean
      {
         return this.input$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasPassword)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_STRING(param1,this.password$field);
         }
         if(this.hasInput)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.input$field);
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
                     throw new IOError("Bad data format: Cmd_SecondPwd_SetPwd_CS.password cannot be set twice.");
                  }
                  _loc3_++;
                  this.password = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SecondPwd_SetPwd_CS.input cannot be set twice.");
                  }
                  _loc4_++;
                  this.input = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
