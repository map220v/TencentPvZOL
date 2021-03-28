package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_ShareInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ShareInfo";
      
      public static const SHAREID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ShareInfo.shareId","shareId",1 << 3 | WireType.VARINT);
      
      public static const LEFTTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ShareInfo.leftTimes","leftTimes",2 << 3 | WireType.VARINT);
       
      
      private var shareId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var leftTimes$field:uint;
      
      public function Dto_ShareInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ShareInfo.$MessageID;
      }
      
      public function clearShareId() : void
      {
         this.hasField$0 &= 4294967294;
         this.shareId$field = new uint();
      }
      
      public function get hasShareId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set shareId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.shareId$field = param1;
      }
      
      public function get shareId() : uint
      {
         return this.shareId$field;
      }
      
      public function clearLeftTimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.leftTimes$field = new uint();
      }
      
      public function get hasLeftTimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set leftTimes(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.leftTimes$field = param1;
      }
      
      public function get leftTimes() : uint
      {
         return this.leftTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasShareId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.shareId$field);
         }
         if(this.hasLeftTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.leftTimes$field);
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
                     throw new IOError("Bad data format: Dto_ShareInfo.shareId cannot be set twice.");
                  }
                  _loc3_++;
                  this.shareId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ShareInfo.leftTimes cannot be set twice.");
                  }
                  _loc4_++;
                  this.leftTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
