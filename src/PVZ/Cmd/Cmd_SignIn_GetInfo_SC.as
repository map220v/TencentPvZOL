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
   
   public final class Cmd_SignIn_GetInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_SignIn_GetInfo_SC";
      
      public static const SIGNININFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_SignIn_GetInfo_SC.signInInfo","signInInfo",1 << 3 | WireType.LENGTH_DELIMITED,Dto_SignIn_Info);
       
      
      private var signInInfo$field:Dto_SignIn_Info;
      
      public function Cmd_SignIn_GetInfo_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_SignIn_GetInfo_SC.$MessageID;
      }
      
      public function clearSignInInfo() : void
      {
         this.signInInfo$field = null;
      }
      
      public function get hasSignInInfo() : Boolean
      {
         return this.signInInfo$field != null;
      }
      
      public function set signInInfo(param1:Dto_SignIn_Info) : void
      {
         this.signInInfo$field = param1;
      }
      
      public function get signInInfo() : Dto_SignIn_Info
      {
         return this.signInInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasSignInInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.signInInfo$field);
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
                     throw new IOError("Bad data format: Cmd_SignIn_GetInfo_SC.signInInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.signInInfo = new Dto_SignIn_Info();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.signInInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
