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
   
   public final class Dto_Equip_AddExpInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Equip_AddExpInfo";
      
      public static const ADDEXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Equip_AddExpInfo.addExp","addExp",1 << 3 | WireType.VARINT);
      
      public static const CRITICALTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Equip_AddExpInfo.criticalTimes","criticalTimes",2 << 3 | WireType.VARINT);
       
      
      private var addExp$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var criticalTimes$field:uint;
      
      public function Dto_Equip_AddExpInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Equip_AddExpInfo.$MessageID;
      }
      
      public function clearAddExp() : void
      {
         this.hasField$0 &= 4294967294;
         this.addExp$field = new uint();
      }
      
      public function get hasAddExp() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set addExp(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.addExp$field = param1;
      }
      
      public function get addExp() : uint
      {
         return this.addExp$field;
      }
      
      public function clearCriticalTimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.criticalTimes$field = new uint();
      }
      
      public function get hasCriticalTimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set criticalTimes(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.criticalTimes$field = param1;
      }
      
      public function get criticalTimes() : uint
      {
         return this.criticalTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasAddExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.addExp$field);
         }
         if(this.hasCriticalTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.criticalTimes$field);
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
                     throw new IOError("Bad data format: Dto_Equip_AddExpInfo.addExp cannot be set twice.");
                  }
                  _loc3_++;
                  this.addExp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Equip_AddExpInfo.criticalTimes cannot be set twice.");
                  }
                  _loc4_++;
                  this.criticalTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
