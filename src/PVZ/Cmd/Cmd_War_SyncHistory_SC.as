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
   
   public final class Cmd_War_SyncHistory_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_War_SyncHistory_SC";
      
      public static const HISTORY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_War_SyncHistory_SC.history","history",1 << 3 | WireType.LENGTH_DELIMITED,Dto_War_History);
       
      
      private var history$field:Dto_War_History;
      
      public function Cmd_War_SyncHistory_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_War_SyncHistory_SC.$MessageID;
      }
      
      public function clearHistory() : void
      {
         this.history$field = null;
      }
      
      public function get hasHistory() : Boolean
      {
         return this.history$field != null;
      }
      
      public function set history(param1:Dto_War_History) : void
      {
         this.history$field = param1;
      }
      
      public function get history() : Dto_War_History
      {
         return this.history$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasHistory)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.history$field);
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
                     throw new IOError("Bad data format: Cmd_War_SyncHistory_SC.history cannot be set twice.");
                  }
                  _loc3_++;
                  this.history = new Dto_War_History();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.history);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
