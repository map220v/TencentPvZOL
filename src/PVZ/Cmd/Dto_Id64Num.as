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
   
   public final class Dto_Id64Num extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Id64Num";
      
      public static const ID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_Id64Num.id","id",1 << 3 | WireType.VARINT);
      
      public static const NUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Id64Num.num","num",2 << 3 | WireType.VARINT);
       
      
      private var id$field:Int64;
      
      private var num$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function Dto_Id64Num()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Id64Num.$MessageID;
      }
      
      public function clearId() : void
      {
         this.id$field = null;
      }
      
      public function get hasId() : Boolean
      {
         return this.id$field != null;
      }
      
      public function set id(param1:Int64) : void
      {
         this.id$field = param1;
      }
      
      public function get id() : Int64
      {
         return this.id$field;
      }
      
      public function clearNum() : void
      {
         this.hasField$0 &= 4294967294;
         this.num$field = new uint();
      }
      
      public function get hasNum() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set num(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.num$field = param1;
      }
      
      public function get num() : uint
      {
         return this.num$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.id$field);
         }
         if(this.hasNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.num$field);
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
                     throw new IOError("Bad data format: Dto_Id64Num.id cannot be set twice.");
                  }
                  _loc3_++;
                  this.id = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Id64Num.num cannot be set twice.");
                  }
                  _loc4_++;
                  this.num = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
