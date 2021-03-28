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
   
   public final class Cmd_NoEndTD_ReadRecord_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_NoEndTD_ReadRecord_SC";
      
      public static const CURMODE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_NoEndTD_ReadRecord_SC.curMode","curMode",1 << 3 | WireType.LENGTH_DELIMITED,Dto_NoEndTD_Mode);
       
      
      private var curMode$field:Dto_NoEndTD_Mode;
      
      public function Cmd_NoEndTD_ReadRecord_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_NoEndTD_ReadRecord_SC.$MessageID;
      }
      
      public function clearCurMode() : void
      {
         this.curMode$field = null;
      }
      
      public function get hasCurMode() : Boolean
      {
         return this.curMode$field != null;
      }
      
      public function set curMode(param1:Dto_NoEndTD_Mode) : void
      {
         this.curMode$field = param1;
      }
      
      public function get curMode() : Dto_NoEndTD_Mode
      {
         return this.curMode$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasCurMode)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.curMode$field);
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
                     throw new IOError("Bad data format: Cmd_NoEndTD_ReadRecord_SC.curMode cannot be set twice.");
                  }
                  _loc3_++;
                  this.curMode = new Dto_NoEndTD_Mode();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.curMode);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
