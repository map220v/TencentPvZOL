package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_ZombieIsland_TakeReward_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ZombieIsland_TakeReward_SC";
      
      public static const LEVELID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ZombieIsland_TakeReward_SC.levelId","levelId",1 << 3 | WireType.VARINT);
      
      public static const BOXID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ZombieIsland_TakeReward_SC.boxId","boxId",2 << 3 | WireType.VARINT);
      
      public static const REWARDSTATUS:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Cmd_ZombieIsland_TakeReward_SC.rewardStatus","rewardStatus",3 << 3 | WireType.VARINT,RewardStatus);
      
      public static const REWARDLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ZombieIsland_TakeReward_SC.rewardList","rewardList",4 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      private var levelId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var boxId$field:uint;
      
      private var rewardStatus$field:int;
      
      public var rewardList:Array;
      
      public function Cmd_ZombieIsland_TakeReward_SC()
      {
         this.rewardList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ZombieIsland_TakeReward_SC.$MessageID;
      }
      
      public function clearLevelId() : void
      {
         this.hasField$0 &= 4294967294;
         this.levelId$field = new uint();
      }
      
      public function get hasLevelId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set levelId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.levelId$field = param1;
      }
      
      public function get levelId() : uint
      {
         return this.levelId$field;
      }
      
      public function clearBoxId() : void
      {
         this.hasField$0 &= 4294967293;
         this.boxId$field = new uint();
      }
      
      public function get hasBoxId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set boxId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.boxId$field = param1;
      }
      
      public function get boxId() : uint
      {
         return this.boxId$field;
      }
      
      public function clearRewardStatus() : void
      {
         this.hasField$0 &= 4294967291;
         this.rewardStatus$field = new int();
      }
      
      public function get hasRewardStatus() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set rewardStatus(param1:int) : void
      {
         this.hasField$0 |= 4;
         this.rewardStatus$field = param1;
      }
      
      public function get rewardStatus() : int
      {
         return this.rewardStatus$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasLevelId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.levelId$field);
         }
         if(this.hasBoxId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.boxId$field);
         }
         if(this.hasRewardStatus)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_ENUM(param1,this.rewardStatus$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.rewardList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewardList[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Cmd_ZombieIsland_TakeReward_SC.levelId cannot be set twice.");
                  }
                  _loc3_++;
                  this.levelId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ZombieIsland_TakeReward_SC.boxId cannot be set twice.");
                  }
                  _loc4_++;
                  this.boxId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ZombieIsland_TakeReward_SC.rewardStatus cannot be set twice.");
                  }
                  _loc5_++;
                  this.rewardStatus = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 4:
                  this.rewardList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
