package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WritingBuffer;
   import flash.utils.IDataInput;
   
   public final class Cmd_Guard_Info_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Guard_Info_CS";
       
      
      public function Cmd_Guard_Info_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Guard_Info_CS.$MessageID;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc3_ = ReadUtils.read$TYPE_UINT32(param1);
            var _loc4_:* = _loc3_ >> 3;
            switch(0)
            {
            }
            super.readUnknown(param1,_loc3_);
         }
      }
   }
}
