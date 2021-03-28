package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_FLOAT;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_EquipEffect extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_EquipEffect";
      
      public static const ITYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_EquipEffect.iType","iType",1 << 3 | WireType.VARINT);
      
      public static const IVALUE:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("PVZ.Cmd.Dto_EquipEffect.iValue","iValue",2 << 3 | WireType.FIXED_32_BIT);
       
      
      private var iType$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var iValue$field:Number;
      
      public function Dto_EquipEffect()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_EquipEffect.$MessageID;
      }
      
      public function clearIType() : void
      {
         this.hasField$0 &= 4294967294;
         this.iType$field = new uint();
      }
      
      public function get hasIType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set iType(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.iType$field = param1;
      }
      
      public function get iType() : uint
      {
         return this.iType$field;
      }
      
      public function clearIValue() : void
      {
         this.hasField$0 &= 4294967293;
         this.iValue$field = new Number();
      }
      
      public function get hasIValue() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set iValue(param1:Number) : void
      {
         this.hasField$0 |= 2;
         this.iValue$field = param1;
      }
      
      public function get iValue() : Number
      {
         return this.iValue$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasIType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.iType$field);
         }
         if(this.hasIValue)
         {
            WriteUtils.writeTag(param1,WireType.FIXED_32_BIT,2);
            WriteUtils.write$TYPE_FLOAT(param1,this.iValue$field);
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
                     throw new IOError("Bad data format: Dto_EquipEffect.iType cannot be set twice.");
                  }
                  _loc3_++;
                  this.iType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_EquipEffect.iValue cannot be set twice.");
                  }
                  _loc4_++;
                  this.iValue = ReadUtils.read$TYPE_FLOAT(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
