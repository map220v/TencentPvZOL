package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Melee_NoGetRewardInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Melee_NoGetRewardInfo";
      
      public static const HASNOGETREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_Melee_NoGetRewardInfo.hasNoGetReward","hasNoGetReward",1 << 3 | WireType.VARINT);
      
      public static const SCORE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_Melee_NoGetRewardInfo.score","score",2 << 3 | WireType.VARINT);
      
      public static const RANK:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_Melee_NoGetRewardInfo.rank","rank",3 << 3 | WireType.VARINT);
       
      
      private var hasNoGetReward$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var score$field:int;
      
      private var rank$field:int;
      
      public function Dto_Melee_NoGetRewardInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Melee_NoGetRewardInfo.$MessageID;
      }
      
      public function clearHasNoGetReward() : void
      {
         this.hasField$0 &= 4294967294;
         this.hasNoGetReward$field = new Boolean();
      }
      
      public function get hasHasNoGetReward() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set hasNoGetReward(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.hasNoGetReward$field = param1;
      }
      
      public function get hasNoGetReward() : Boolean
      {
         return this.hasNoGetReward$field;
      }
      
      public function clearScore() : void
      {
         this.hasField$0 &= 4294967293;
         this.score$field = new int();
      }
      
      public function get hasScore() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set score(param1:int) : void
      {
         this.hasField$0 |= 2;
         this.score$field = param1;
      }
      
      public function get score() : int
      {
         return this.score$field;
      }
      
      public function clearRank() : void
      {
         this.hasField$0 &= 4294967291;
         this.rank$field = new int();
      }
      
      public function get hasRank() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set rank(param1:int) : void
      {
         this.hasField$0 |= 4;
         this.rank$field = param1;
      }
      
      public function get rank() : int
      {
         return this.rank$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasHasNoGetReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_BOOL(param1,this.hasNoGetReward$field);
         }
         if(this.hasScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT32(param1,this.score$field);
         }
         if(this.hasRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_INT32(param1,this.rank$field);
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
                     throw new IOError("Bad data format: Dto_Melee_NoGetRewardInfo.hasNoGetReward cannot be set twice.");
                  }
                  _loc3_++;
                  this.hasNoGetReward = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Melee_NoGetRewardInfo.score cannot be set twice.");
                  }
                  _loc4_++;
                  this.score = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Melee_NoGetRewardInfo.rank cannot be set twice.");
                  }
                  _loc5_++;
                  this.rank = ReadUtils.read$TYPE_INT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
