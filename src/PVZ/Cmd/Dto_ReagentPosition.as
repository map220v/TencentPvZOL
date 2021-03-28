package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_ReagentPosition extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ReagentPosition";
      
      public static const REAGENTUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_ReagentPosition.reagentUID","reagentUID",1 << 3 | WireType.VARINT);
      
      public static const POSITION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ReagentPosition.position","position",2 << 3 | WireType.VARINT);
       
      
      private var reagentUID$field:Int64;
      
      private var position$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function Dto_ReagentPosition()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ReagentPosition.$MessageID;
      }
      
      public function clearReagentUID() : void
      {
         this.reagentUID$field = null;
      }
      
      public function get hasReagentUID() : Boolean
      {
         return this.reagentUID$field != null;
      }
      
      public function set reagentUID(param1:Int64) : void
      {
         this.reagentUID$field = param1;
      }
      
      public function get reagentUID() : Int64
      {
         return this.reagentUID$field;
      }
      
      public function clearPosition() : void
      {
         this.hasField$0 &= 4294967294;
         this.position$field = new uint();
      }
      
      public function get hasPosition() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set position(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.position$field = param1;
      }
      
      public function get position() : uint
      {
         return this.position$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasReagentUID)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.reagentUID$field);
         }
         if(this.hasPosition)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.position$field);
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
                     throw new IOError("Bad data format: Dto_ReagentPosition.reagentUID cannot be set twice.");
                  }
                  _loc3_++;
                  this.reagentUID = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ReagentPosition.position cannot be set twice.");
                  }
                  _loc4_++;
                  this.position = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
