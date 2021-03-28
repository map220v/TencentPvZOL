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
   
   public final class Dto_SpinResult extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_SpinResult";
      
      public static const RESULT1:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SpinResult.result1","result1",1 << 3 | WireType.VARINT);
      
      public static const RESULT2:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SpinResult.result2","result2",2 << 3 | WireType.VARINT);
      
      public static const RESULT3:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SpinResult.result3","result3",3 << 3 | WireType.VARINT);
       
      
      private var result1$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var result2$field:uint;
      
      private var result3$field:uint;
      
      public function Dto_SpinResult()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_SpinResult.$MessageID;
      }
      
      public function clearResult1() : void
      {
         this.hasField$0 &= 4294967294;
         this.result1$field = new uint();
      }
      
      public function get hasResult1() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set result1(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.result1$field = param1;
      }
      
      public function get result1() : uint
      {
         return this.result1$field;
      }
      
      public function clearResult2() : void
      {
         this.hasField$0 &= 4294967293;
         this.result2$field = new uint();
      }
      
      public function get hasResult2() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set result2(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.result2$field = param1;
      }
      
      public function get result2() : uint
      {
         return this.result2$field;
      }
      
      public function clearResult3() : void
      {
         this.hasField$0 &= 4294967291;
         this.result3$field = new uint();
      }
      
      public function get hasResult3() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set result3(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.result3$field = param1;
      }
      
      public function get result3() : uint
      {
         return this.result3$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasResult1)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.result1$field);
         }
         if(this.hasResult2)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.result2$field);
         }
         if(this.hasResult3)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.result3$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SpinResult.result1 cannot be set twice.");
                  }
                  _loc3_++;
                  this.result1 = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SpinResult.result2 cannot be set twice.");
                  }
                  _loc4_++;
                  this.result2 = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SpinResult.result3 cannot be set twice.");
                  }
                  _loc5_++;
                  this.result3 = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
