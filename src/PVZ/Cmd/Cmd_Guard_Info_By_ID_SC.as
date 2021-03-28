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
   
   public final class Cmd_Guard_Info_By_ID_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Guard_Info_By_ID_SC";
      
      public static const GUARD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Guard_Info_By_ID_SC.guard","guard",1 << 3 | WireType.LENGTH_DELIMITED,Dto_Guard);
       
      
      private var guard$field:Dto_Guard;
      
      public function Cmd_Guard_Info_By_ID_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Guard_Info_By_ID_SC.$MessageID;
      }
      
      public function clearGuard() : void
      {
         this.guard$field = null;
      }
      
      public function get hasGuard() : Boolean
      {
         return this.guard$field != null;
      }
      
      public function set guard(param1:Dto_Guard) : void
      {
         this.guard$field = param1;
      }
      
      public function get guard() : Dto_Guard
      {
         return this.guard$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasGuard)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guard$field);
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
                     throw new IOError("Bad data format: Cmd_Guard_Info_By_ID_SC.guard cannot be set twice.");
                  }
                  _loc3_++;
                  this.guard = new Dto_Guard();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.guard);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
