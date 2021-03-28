package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_PayRewardItem extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_PayRewardItem";
      
      public static const REWARDITEM:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_PayRewardItem.rewardItem","rewardItem",1 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNumOdd);
      
      public static const REWARDINDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_PayRewardItem.rewardIndex","rewardIndex",101 << 3 | WireType.VARINT);
      
      public static const RANDOMTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_PayRewardItem.randomTimes","randomTimes",102 << 3 | WireType.VARINT);
       
      
      public var rewardItem:Array;
      
      private var rewardIndex$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var randomTimes$field:uint;
      
      public function Dto_PayRewardItem()
      {
         this.rewardItem = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_PayRewardItem.$MessageID;
      }
      
      public function clearRewardIndex() : void
      {
         this.hasField$0 &= 4294967294;
         this.rewardIndex$field = new uint();
      }
      
      public function get hasRewardIndex() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set rewardIndex(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.rewardIndex$field = param1;
      }
      
      public function get rewardIndex() : uint
      {
         return this.rewardIndex$field;
      }
      
      public function clearRandomTimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.randomTimes$field = new uint();
      }
      
      public function get hasRandomTimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set randomTimes(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.randomTimes$field = param1;
      }
      
      public function get randomTimes() : uint
      {
         return this.randomTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.rewardItem.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewardItem[_loc2_]);
            _loc2_++;
         }
         if(this.hasRewardIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,101);
            WriteUtils.write$TYPE_UINT32(param1,this.rewardIndex$field);
         }
         if(this.hasRandomTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,102);
            WriteUtils.write$TYPE_UINT32(param1,this.randomTimes$field);
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
                  this.rewardItem.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNumOdd()));
                  break;
               case 101:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_PayRewardItem.rewardIndex cannot be set twice.");
                  }
                  _loc3_++;
                  this.rewardIndex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 102:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_PayRewardItem.randomTimes cannot be set twice.");
                  }
                  _loc4_++;
                  this.randomTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
