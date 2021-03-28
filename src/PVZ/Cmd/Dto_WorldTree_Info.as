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
   
   public final class Dto_WorldTree_Info extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_WorldTree_Info";
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldTree_Info.level","level",1 << 3 | WireType.VARINT);
      
      public static const EXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldTree_Info.exp","exp",2 << 3 | WireType.VARINT);
      
      public static const FREETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldTree_Info.freeTimes","freeTimes",3 << 3 | WireType.VARINT);
      
      public static const ADVANCEDTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldTree_Info.advancedTimes","advancedTimes",4 << 3 | WireType.VARINT);
       
      
      private var level$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var exp$field:uint;
      
      private var freeTimes$field:uint;
      
      private var advancedTimes$field:uint;
      
      public function Dto_WorldTree_Info()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_WorldTree_Info.$MessageID;
      }
      
      public function clearLevel() : void
      {
         this.hasField$0 &= 4294967294;
         this.level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.level$field = param1;
      }
      
      public function get level() : uint
      {
         return this.level$field;
      }
      
      public function clearExp() : void
      {
         this.hasField$0 &= 4294967293;
         this.exp$field = new uint();
      }
      
      public function get hasExp() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set exp(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.exp$field = param1;
      }
      
      public function get exp() : uint
      {
         return this.exp$field;
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
      
      public function clearAdvancedTimes() : void
      {
         this.hasField$0 &= 4294967287;
         this.advancedTimes$field = new uint();
      }
      
      public function get hasAdvancedTimes() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set advancedTimes(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.advancedTimes$field = param1;
      }
      
      public function get advancedTimes() : uint
      {
         return this.advancedTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.exp$field);
         }
         if(this.hasFreeTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.freeTimes$field);
         }
         if(this.hasAdvancedTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.advancedTimes$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc7_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldTree_Info.level cannot be set twice.");
                  }
                  _loc3_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldTree_Info.exp cannot be set twice.");
                  }
                  _loc4_++;
                  this.exp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldTree_Info.freeTimes cannot be set twice.");
                  }
                  _loc5_++;
                  this.freeTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldTree_Info.advancedTimes cannot be set twice.");
                  }
                  _loc6_++;
                  this.advancedTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
