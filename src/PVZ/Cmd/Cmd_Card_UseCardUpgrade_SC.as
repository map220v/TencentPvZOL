package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Card_UseCardUpgrade_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Card_UseCardUpgrade_SC";
      
      public static const OLDUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Card_UseCardUpgrade_SC.oldUId","oldUId",1 << 3 | WireType.VARINT);
      
      public static const NEWUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Card_UseCardUpgrade_SC.newUId","newUId",2 << 3 | WireType.VARINT);
       
      
      private var oldUId$field:Int64;
      
      private var newUId$field:Int64;
      
      public function Cmd_Card_UseCardUpgrade_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Card_UseCardUpgrade_SC.$MessageID;
      }
      
      public function clearOldUId() : void
      {
         this.oldUId$field = null;
      }
      
      public function get hasOldUId() : Boolean
      {
         return this.oldUId$field != null;
      }
      
      public function set oldUId(param1:Int64) : void
      {
         this.oldUId$field = param1;
      }
      
      public function get oldUId() : Int64
      {
         return this.oldUId$field;
      }
      
      public function clearNewUId() : void
      {
         this.newUId$field = null;
      }
      
      public function get hasNewUId() : Boolean
      {
         return this.newUId$field != null;
      }
      
      public function set newUId(param1:Int64) : void
      {
         this.newUId$field = param1;
      }
      
      public function get newUId() : Int64
      {
         return this.newUId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasOldUId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.oldUId$field);
         }
         if(this.hasNewUId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.newUId$field);
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
                     throw new IOError("Bad data format: Cmd_Card_UseCardUpgrade_SC.oldUId cannot be set twice.");
                  }
                  _loc3_++;
                  this.oldUId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_UseCardUpgrade_SC.newUId cannot be set twice.");
                  }
                  _loc4_++;
                  this.newUId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
