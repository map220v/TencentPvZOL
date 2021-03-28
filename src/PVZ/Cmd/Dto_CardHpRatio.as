package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_DOUBLE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_CardHpRatio extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_CardHpRatio";
      
      public static const UID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_CardHpRatio.uid","uid",1 << 3 | WireType.VARINT);
      
      public static const HPRATIO:FieldDescriptor$TYPE_DOUBLE = new FieldDescriptor$TYPE_DOUBLE("PVZ.Cmd.Dto_CardHpRatio.hpRatio","hpRatio",2 << 3 | WireType.FIXED_64_BIT);
       
      
      private var uid$field:Int64;
      
      private var hpRatio$field:Number;
      
      private var hasField$0:uint = 0;
      
      public function Dto_CardHpRatio()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_CardHpRatio.$MessageID;
      }
      
      public function clearUid() : void
      {
         this.uid$field = null;
      }
      
      public function get hasUid() : Boolean
      {
         return this.uid$field != null;
      }
      
      public function set uid(param1:Int64) : void
      {
         this.uid$field = param1;
      }
      
      public function get uid() : Int64
      {
         return this.uid$field;
      }
      
      public function clearHpRatio() : void
      {
         this.hasField$0 &= 4294967294;
         this.hpRatio$field = new Number();
      }
      
      public function get hasHpRatio() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set hpRatio(param1:Number) : void
      {
         this.hasField$0 |= 1;
         this.hpRatio$field = param1;
      }
      
      public function get hpRatio() : Number
      {
         return this.hpRatio$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasUid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.uid$field);
         }
         if(this.hasHpRatio)
         {
            WriteUtils.writeTag(param1,WireType.FIXED_64_BIT,2);
            WriteUtils.write$TYPE_DOUBLE(param1,this.hpRatio$field);
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
                     throw new IOError("Bad data format: Dto_CardHpRatio.uid cannot be set twice.");
                  }
                  _loc3_++;
                  this.uid = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardHpRatio.hpRatio cannot be set twice.");
                  }
                  _loc4_++;
                  this.hpRatio = ReadUtils.read$TYPE_DOUBLE(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
