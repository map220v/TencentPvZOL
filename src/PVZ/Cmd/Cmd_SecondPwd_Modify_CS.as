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
   
   public final class Cmd_SecondPwd_Modify_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_SecondPwd_Modify_CS";
      
      public static const OLDPWD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_SecondPwd_Modify_CS.oldPwd","oldPwd",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const NEWPWD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_SecondPwd_Modify_CS.newPwd","newPwd",2 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var oldPwd$field:String;
      
      private var newPwd$field:String;
      
      public function Cmd_SecondPwd_Modify_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_SecondPwd_Modify_CS.$MessageID;
      }
      
      public function clearOldPwd() : void
      {
         this.oldPwd$field = null;
      }
      
      public function get hasOldPwd() : Boolean
      {
         return this.oldPwd$field != null;
      }
      
      public function set oldPwd(param1:String) : void
      {
         this.oldPwd$field = param1;
      }
      
      public function get oldPwd() : String
      {
         return this.oldPwd$field;
      }
      
      public function clearNewPwd() : void
      {
         this.newPwd$field = null;
      }
      
      public function get hasNewPwd() : Boolean
      {
         return this.newPwd$field != null;
      }
      
      public function set newPwd(param1:String) : void
      {
         this.newPwd$field = param1;
      }
      
      public function get newPwd() : String
      {
         return this.newPwd$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasOldPwd)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_STRING(param1,this.oldPwd$field);
         }
         if(this.hasNewPwd)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.newPwd$field);
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
                     throw new IOError("Bad data format: Cmd_SecondPwd_Modify_CS.oldPwd cannot be set twice.");
                  }
                  _loc3_++;
                  this.oldPwd = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_SecondPwd_Modify_CS.newPwd cannot be set twice.");
                  }
                  _loc4_++;
                  this.newPwd = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
