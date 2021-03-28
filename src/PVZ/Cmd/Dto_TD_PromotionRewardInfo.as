package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_TD_PromotionRewardInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_TD_PromotionRewardInfo";
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TD_PromotionRewardInfo.stageId","stageId",1 << 3 | WireType.VARINT);
      
      public static const LEVELID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TD_PromotionRewardInfo.levelId","levelId",2 << 3 | WireType.VARINT);
      
      public static const SUBLEVELID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TD_PromotionRewardInfo.subLevelId","subLevelId",3 << 3 | WireType.VARINT);
      
      public static const CHALLENGELEVELID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TD_PromotionRewardInfo.challengeLevelId","challengeLevelId",4 << 3 | WireType.VARINT);
      
      public static const FROMRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TD_PromotionRewardInfo.fromRank","fromRank",5 << 3 | WireType.VARINT);
      
      public static const TORANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TD_PromotionRewardInfo.toRank","toRank",6 << 3 | WireType.VARINT);
      
      public static const TIMESTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TD_PromotionRewardInfo.timestamp","timestamp",7 << 3 | WireType.VARINT);
      
      public static const REWARDSTATE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_TD_PromotionRewardInfo.rewardState","rewardState",8 << 3 | WireType.VARINT,E_RewardState);
       
      
      private var stageId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var levelId$field:uint;
      
      private var subLevelId$field:uint;
      
      private var challengeLevelId$field:uint;
      
      private var fromRank$field:uint;
      
      private var toRank$field:uint;
      
      private var timestamp$field:uint;
      
      private var rewardState$field:int;
      
      public function Dto_TD_PromotionRewardInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_TD_PromotionRewardInfo.$MessageID;
      }
      
      public function clearStageId() : void
      {
         this.hasField$0 &= 4294967294;
         this.stageId$field = new uint();
      }
      
      public function get hasStageId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set stageId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.stageId$field = param1;
      }
      
      public function get stageId() : uint
      {
         return this.stageId$field;
      }
      
      public function clearLevelId() : void
      {
         this.hasField$0 &= 4294967293;
         this.levelId$field = new uint();
      }
      
      public function get hasLevelId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set levelId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.levelId$field = param1;
      }
      
      public function get levelId() : uint
      {
         return this.levelId$field;
      }
      
      public function clearSubLevelId() : void
      {
         this.hasField$0 &= 4294967291;
         this.subLevelId$field = new uint();
      }
      
      public function get hasSubLevelId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set subLevelId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.subLevelId$field = param1;
      }
      
      public function get subLevelId() : uint
      {
         return this.subLevelId$field;
      }
      
      public function clearChallengeLevelId() : void
      {
         this.hasField$0 &= 4294967287;
         this.challengeLevelId$field = new uint();
      }
      
      public function get hasChallengeLevelId() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set challengeLevelId(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.challengeLevelId$field = param1;
      }
      
      public function get challengeLevelId() : uint
      {
         return this.challengeLevelId$field;
      }
      
      public function clearFromRank() : void
      {
         this.hasField$0 &= 4294967279;
         this.fromRank$field = new uint();
      }
      
      public function get hasFromRank() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set fromRank(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.fromRank$field = param1;
      }
      
      public function get fromRank() : uint
      {
         return this.fromRank$field;
      }
      
      public function clearToRank() : void
      {
         this.hasField$0 &= 4294967263;
         this.toRank$field = new uint();
      }
      
      public function get hasToRank() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set toRank(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.toRank$field = param1;
      }
      
      public function get toRank() : uint
      {
         return this.toRank$field;
      }
      
      public function clearTimestamp() : void
      {
         this.hasField$0 &= 4294967231;
         this.timestamp$field = new uint();
      }
      
      public function get hasTimestamp() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set timestamp(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.timestamp$field = param1;
      }
      
      public function get timestamp() : uint
      {
         return this.timestamp$field;
      }
      
      public function clearRewardState() : void
      {
         this.hasField$0 &= 4294967167;
         this.rewardState$field = new int();
      }
      
      public function get hasRewardState() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set rewardState(param1:int) : void
      {
         this.hasField$0 |= 128;
         this.rewardState$field = param1;
      }
      
      public function get rewardState() : int
      {
         return this.rewardState$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.stageId$field);
         }
         if(this.hasLevelId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.levelId$field);
         }
         if(this.hasSubLevelId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.subLevelId$field);
         }
         if(this.hasChallengeLevelId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.challengeLevelId$field);
         }
         if(this.hasFromRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.fromRank$field);
         }
         if(this.hasToRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.toRank$field);
         }
         if(this.hasTimestamp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.timestamp$field);
         }
         if(this.hasRewardState)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_ENUM(param1,this.rewardState$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc11_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc11_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc11_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TD_PromotionRewardInfo.stageId cannot be set twice.");
                  }
                  _loc3_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TD_PromotionRewardInfo.levelId cannot be set twice.");
                  }
                  _loc4_++;
                  this.levelId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TD_PromotionRewardInfo.subLevelId cannot be set twice.");
                  }
                  _loc5_++;
                  this.subLevelId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TD_PromotionRewardInfo.challengeLevelId cannot be set twice.");
                  }
                  _loc6_++;
                  this.challengeLevelId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TD_PromotionRewardInfo.fromRank cannot be set twice.");
                  }
                  _loc7_++;
                  this.fromRank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TD_PromotionRewardInfo.toRank cannot be set twice.");
                  }
                  _loc8_++;
                  this.toRank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TD_PromotionRewardInfo.timestamp cannot be set twice.");
                  }
                  _loc9_++;
                  this.timestamp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TD_PromotionRewardInfo.rewardState cannot be set twice.");
                  }
                  _loc10_++;
                  this.rewardState = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc11_);
                  break;
            }
         }
      }
   }
}
