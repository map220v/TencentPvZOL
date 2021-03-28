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
   
   public final class Dto_DailyVow_Info extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_DailyVow_Info";
      
      public static const TYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_DailyVow_Info.type","type",1 << 3 | WireType.VARINT);
      
      public static const TIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_DailyVow_Info.times","times",2 << 3 | WireType.VARINT);
      
      public static const FREETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_DailyVow_Info.freeTimes","freeTimes",3 << 3 | WireType.VARINT);
       
      
      private var type$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var times$field:uint;
      
      private var freeTimes$field:uint;
      
      public function Dto_DailyVow_Info()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_DailyVow_Info.$MessageID;
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
      
      public function clearTimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.times$field = new uint();
      }
      
      public function get hasTimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set times(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.times$field = param1;
      }
      
      public function get times() : uint
      {
         return this.times$field;
      }
      
      public function clearFreeTimes() : void
      {
         this.hasField$0 &= 4294967291;
         this.freeTimes$field = new uint();
      }
      
      public function get hasFreeTimes() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set freeTimes(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.freeTimes$field = param1;
      }
      
      public function get freeTimes() : uint
      {
         return this.freeTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.type$field);
         }
         if(this.hasTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.times$field);
         }
         if(this.hasFreeTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.freeTimes$field);
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
                     throw new IOError("Bad data format: Dto_DailyVow_Info.type cannot be set twice.");
                  }
                  _loc3_++;
                  this.type = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_DailyVow_Info.times cannot be set twice.");
                  }
                  _loc4_++;
                  this.times = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_DailyVow_Info.freeTimes cannot be set twice.");
                  }
                  _loc5_++;
                  this.freeTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
