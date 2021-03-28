package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_FlexibleActivity_27_ExchangeItem extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FlexibleActivity_27_ExchangeItem";
      
      public static const REWARD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivity_27_ExchangeItem.reward","reward",1 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivity_27_ExchangeItem.score","score",2 << 3 | WireType.VARINT);
      
      public static const MAXCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivity_27_ExchangeItem.maxCount","maxCount",3 << 3 | WireType.VARINT);
      
      public static const COUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivity_27_ExchangeItem.count","count",101 << 3 | WireType.VARINT);
       
      
      private var reward$field:Dto_IdNum;
      
      private var score$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var maxCount$field:uint;
      
      private var count$field:uint;
      
      public function Dto_FlexibleActivity_27_ExchangeItem()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FlexibleActivity_27_ExchangeItem.$MessageID;
      }
      
      public function clearReward() : void
      {
         this.reward$field = null;
      }
      
      public function get hasReward() : Boolean
      {
         return this.reward$field != null;
      }
      
      public function set reward(param1:Dto_IdNum) : void
      {
         this.reward$field = param1;
      }
      
      public function get reward() : Dto_IdNum
      {
         return this.reward$field;
      }
      
      public function clearScore() : void
      {
         this.hasField$0 &= 4294967294;
         this.score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.score$field = param1;
      }
      
      public function get score() : uint
      {
         return this.score$field;
      }
      
      public function clearMaxCount() : void
      {
         this.hasField$0 &= 4294967293;
         this.maxCount$field = new uint();
      }
      
      public function get hasMaxCount() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set maxCount(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.maxCount$field = param1;
      }
      
      public function get maxCount() : uint
      {
         return this.maxCount$field;
      }
      
      public function clearCount() : void
      {
         this.hasField$0 &= 4294967291;
         this.count$field = new uint();
      }
      
      public function get hasCount() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set count(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.count$field = param1;
      }
      
      public function get count() : uint
      {
         return this.count$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasReward)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward$field);
         }
         if(this.hasScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.score$field);
         }
         if(this.hasMaxCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.maxCount$field);
         }
         if(this.hasCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,101);
            WriteUtils.write$TYPE_UINT32(param1,this.count$field);
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
                     throw new IOError("Bad data format: Dto_FlexibleActivity_27_ExchangeItem.reward cannot be set twice.");
                  }
                  _loc3_++;
                  this.reward = new Dto_IdNum();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.reward);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivity_27_ExchangeItem.score cannot be set twice.");
                  }
                  _loc4_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivity_27_ExchangeItem.maxCount cannot be set twice.");
                  }
                  _loc5_++;
                  this.maxCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 101:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivity_27_ExchangeItem.count cannot be set twice.");
                  }
                  _loc6_++;
                  this.count = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
