package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BYTES;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public final class Dto_NoEndTD_Record extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_NoEndTD_Record";
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_NoEndTD_Record.level","level",1 << 3 | WireType.VARINT);
      
      public static const RAIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_NoEndTD_Record.rain","rain",2 << 3 | WireType.VARINT);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_NoEndTD_Record.score","score",3 << 3 | WireType.VARINT);
      
      public static const INFO:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("PVZ.Cmd.Dto_NoEndTD_Record.info","info",4 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var level$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var rain$field:uint;
      
      private var score$field:uint;
      
      private var info$field:ByteArray;
      
      public function Dto_NoEndTD_Record()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_NoEndTD_Record.$MessageID;
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
      
      public function clearRain() : void
      {
         this.hasField$0 &= 4294967293;
         this.rain$field = new uint();
      }
      
      public function get hasRain() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set rain(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.rain$field = param1;
      }
      
      public function get rain() : uint
      {
         return this.rain$field;
      }
      
      public function clearScore() : void
      {
         this.hasField$0 &= 4294967291;
         this.score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.score$field = param1;
      }
      
      public function get score() : uint
      {
         return this.score$field;
      }
      
      public function clearInfo() : void
      {
         this.info$field = null;
      }
      
      public function get hasInfo() : Boolean
      {
         return this.info$field != null;
      }
      
      public function set info(param1:ByteArray) : void
      {
         this.info$field = param1;
      }
      
      public function get info() : ByteArray
      {
         return this.info$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasRain)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.rain$field);
         }
         if(this.hasScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.score$field);
         }
         if(this.hasInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_BYTES(param1,this.info$field);
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
                     throw new IOError("Bad data format: Dto_NoEndTD_Record.level cannot be set twice.");
                  }
                  _loc3_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NoEndTD_Record.rain cannot be set twice.");
                  }
                  _loc4_++;
                  this.rain = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NoEndTD_Record.score cannot be set twice.");
                  }
                  _loc5_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_NoEndTD_Record.info cannot be set twice.");
                  }
                  _loc6_++;
                  this.info = ReadUtils.read$TYPE_BYTES(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
