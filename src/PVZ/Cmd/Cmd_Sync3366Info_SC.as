package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Sync3366Info_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Sync3366Info_SC";
      
      public static const GROWLEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Cmd_Sync3366Info_SC.growLevel","growLevel",1 << 3 | WireType.VARINT);
       
      
      private var growLevel$field:int;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Sync3366Info_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Sync3366Info_SC.$MessageID;
      }
      
      public function clearGrowLevel() : void
      {
         this.hasField$0 &= 4294967294;
         this.growLevel$field = new int();
      }
      
      public function get hasGrowLevel() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set growLevel(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.growLevel$field = param1;
      }
      
      public function get growLevel() : int
      {
         return this.growLevel$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasGrowLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT32(param1,this.growLevel$field);
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
                     throw new IOError("Bad data format: Cmd_Sync3366Info_SC.growLevel cannot be set twice.");
                  }
                  _loc3_++;
                  this.growLevel = ReadUtils.read$TYPE_INT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
