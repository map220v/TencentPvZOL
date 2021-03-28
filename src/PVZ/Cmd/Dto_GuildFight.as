package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_INT64;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_GuildFight extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_GuildFight";
      
      public static const LEFTCYCLES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight.leftCycles","leftCycles",1 << 3 | WireType.VARINT);
      
      public static const RIGHTCYCLES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight.rightCycles","rightCycles",2 << 3 | WireType.VARINT);
      
      public static const SUBHPVALUE:RepeatedFieldDescriptor$TYPE_INT64 = new RepeatedFieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_GuildFight.subHpValue","subHpValue",3 << 3 | WireType.VARINT);
       
      
      private var leftCycles$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var rightCycles$field:uint;
      
      public var subHpValue:Array;
      
      public function Dto_GuildFight()
      {
         this.subHpValue = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_GuildFight.$MessageID;
      }
      
      public function clearLeftCycles() : void
      {
         this.hasField$0 &= 4294967294;
         this.leftCycles$field = new uint();
      }
      
      public function get hasLeftCycles() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set leftCycles(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.leftCycles$field = param1;
      }
      
      public function get leftCycles() : uint
      {
         return this.leftCycles$field;
      }
      
      public function clearRightCycles() : void
      {
         this.hasField$0 &= 4294967293;
         this.rightCycles$field = new uint();
      }
      
      public function get hasRightCycles() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set rightCycles(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.rightCycles$field = param1;
      }
      
      public function get rightCycles() : uint
      {
         return this.rightCycles$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasLeftCycles)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.leftCycles$field);
         }
         if(this.hasRightCycles)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.rightCycles$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.subHpValue.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_INT64(param1,this.subHpValue[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Dto_GuildFight.leftCycles cannot be set twice.");
                  }
                  _loc3_++;
                  this.leftCycles = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight.rightCycles cannot be set twice.");
                  }
                  _loc4_++;
                  this.rightCycles = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if((_loc5_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_INT64,this.subHpValue);
                  }
                  else
                  {
                     this.subHpValue.push(ReadUtils.read$TYPE_INT64(param1));
                  }
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
