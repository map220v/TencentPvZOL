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
   
   public final class Cmd_Setout_GetSetoutTimes_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Setout_GetSetoutTimes_SC";
      
      public static const TYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Setout_GetSetoutTimes_SC.type","type",1 << 3 | WireType.VARINT);
      
      public static const TOTALTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Setout_GetSetoutTimes_SC.totalTimes","totalTimes",2 << 3 | WireType.VARINT);
      
      public static const TIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Setout_GetSetoutTimes_SC.times","times",3 << 3 | WireType.VARINT);
      
      public static const TOTALPAYTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Setout_GetSetoutTimes_SC.totalPayTimes","totalPayTimes",4 << 3 | WireType.VARINT);
      
      public static const PAYTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Setout_GetSetoutTimes_SC.payTimes","payTimes",5 << 3 | WireType.VARINT);
       
      
      private var type$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var totalTimes$field:uint;
      
      private var times$field:uint;
      
      private var totalPayTimes$field:uint;
      
      private var payTimes$field:uint;
      
      public function Cmd_Setout_GetSetoutTimes_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Setout_GetSetoutTimes_SC.$MessageID;
      }
      
      public function clearType() : void
      {
         this.hasField$0 &= 4294967294;
         this.type$field = new uint();
      }
      
      public function get hasType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set type(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.type$field = param1;
      }
      
      public function get type() : uint
      {
         return this.type$field;
      }
      
      public function clearTotalTimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.totalTimes$field = new uint();
      }
      
      public function get hasTotalTimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set totalTimes(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.totalTimes$field = param1;
      }
      
      public function get totalTimes() : uint
      {
         return this.totalTimes$field;
      }
      
      public function clearTimes() : void
      {
         this.hasField$0 &= 4294967291;
         this.times$field = new uint();
      }
      
      public function get hasTimes() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set times(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.times$field = param1;
      }
      
      public function get times() : uint
      {
         return this.times$field;
      }
      
      public function clearTotalPayTimes() : void
      {
         this.hasField$0 &= 4294967287;
         this.totalPayTimes$field = new uint();
      }
      
      public function get hasTotalPayTimes() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set totalPayTimes(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.totalPayTimes$field = param1;
      }
      
      public function get totalPayTimes() : uint
      {
         return this.totalPayTimes$field;
      }
      
      public function clearPayTimes() : void
      {
         this.hasField$0 &= 4294967279;
         this.payTimes$field = new uint();
      }
      
      public function get hasPayTimes() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set payTimes(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.payTimes$field = param1;
      }
      
      public function get payTimes() : uint
      {
         return this.payTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.type$field);
         }
         if(this.hasTotalTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.totalTimes$field);
         }
         if(this.hasTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.times$field);
         }
         if(this.hasTotalPayTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.totalPayTimes$field);
         }
         if(this.hasPayTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.payTimes$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Setout_GetSetoutTimes_SC.type cannot be set twice.");
                  }
                  _loc3_++;
                  this.type = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Setout_GetSetoutTimes_SC.totalTimes cannot be set twice.");
                  }
                  _loc4_++;
                  this.totalTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Setout_GetSetoutTimes_SC.times cannot be set twice.");
                  }
                  _loc5_++;
                  this.times = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Setout_GetSetoutTimes_SC.totalPayTimes cannot be set twice.");
                  }
                  _loc6_++;
                  this.totalPayTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Setout_GetSetoutTimes_SC.payTimes cannot be set twice.");
                  }
                  _loc7_++;
                  this.payTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
