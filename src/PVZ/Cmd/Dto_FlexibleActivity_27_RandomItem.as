package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_FlexibleActivity_27_RandomItem extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FlexibleActivity_27_RandomItem";
      
      public static const REWARD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivity_27_RandomItem.reward","reward",1 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const WEIGHT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivity_27_RandomItem.weight","weight",2 << 3 | WireType.VARINT);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivity_27_RandomItem.score","score",3 << 3 | WireType.VARINT);
      
      public static const SHOW:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_FlexibleActivity_27_RandomItem.show","show",4 << 3 | WireType.VARINT);
      
      public static const NUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivity_27_RandomItem.num","num",101 << 3 | WireType.VARINT);
       
      
      private var reward$field:Dto_IdNum;
      
      private var weight$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var score$field:uint;
      
      private var show$field:Boolean;
      
      private var num$field:uint;
      
      public function Dto_FlexibleActivity_27_RandomItem()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FlexibleActivity_27_RandomItem.$MessageID;
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
      
      public function clearWeight() : void
      {
         this.hasField$0 &= 4294967294;
         this.weight$field = new uint();
      }
      
      public function get hasWeight() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set weight(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.weight$field = param1;
      }
      
      public function get weight() : uint
      {
         return this.weight$field;
      }
      
      public function clearScore() : void
      {
         this.hasField$0 &= 4294967293;
         this.score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.score$field = param1;
      }
      
      public function get score() : uint
      {
         return this.score$field;
      }
      
      public function clearShow() : void
      {
         this.hasField$0 &= 4294967291;
         this.show$field = new Boolean();
      }
      
      public function get hasShow() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set show(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.show$field = param1;
      }
      
      public function get show() : Boolean
      {
         return this.show$field;
      }
      
      public function clearNum() : void
      {
         this.hasField$0 &= 4294967287;
         this.num$field = new uint();
      }
      
      public function get hasNum() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set num(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.num$field = param1;
      }
      
      public function get num() : uint
      {
         return this.num$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasReward)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward$field);
         }
         if(this.hasWeight)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.weight$field);
         }
         if(this.hasScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.score$field);
         }
         if(this.hasShow)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.show$field);
         }
         if(this.hasNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,101);
            WriteUtils.write$TYPE_UINT32(param1,this.num$field);
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
                     throw new IOError("Bad data format: Dto_FlexibleActivity_27_RandomItem.reward cannot be set twice.");
                  }
                  _loc3_++;
                  this.reward = new Dto_IdNum();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.reward);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivity_27_RandomItem.weight cannot be set twice.");
                  }
                  _loc4_++;
                  this.weight = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivity_27_RandomItem.score cannot be set twice.");
                  }
                  _loc5_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivity_27_RandomItem.show cannot be set twice.");
                  }
                  _loc6_++;
                  this.show = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 101:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivity_27_RandomItem.num cannot be set twice.");
                  }
                  _loc7_++;
                  this.num = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
