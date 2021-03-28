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
   
   public final class Cmd_DoGm_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_DoGm_SC";
      
      public static const RESPONSECMD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_DoGm_SC.responseCmd","responseCmd",1 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var responseCmd$field:String;
      
      public function Cmd_DoGm_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_DoGm_SC.$MessageID;
      }
      
      public function clearResponseCmd() : void
      {
         this.responseCmd$field = null;
      }
      
      public function get hasResponseCmd() : Boolean
      {
         return this.responseCmd$field != null;
      }
      
      public function set responseCmd(param1:String) : void
      {
         this.responseCmd$field = param1;
      }
      
      public function get responseCmd() : String
      {
         return this.responseCmd$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasResponseCmd)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_STRING(param1,this.responseCmd$field);
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
                     throw new IOError("Bad data format: Cmd_DoGm_SC.responseCmd cannot be set twice.");
                  }
                  _loc3_++;
                  this.responseCmd = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
