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
   
   public final class Cmd_FlexibleActivity_DaveRedPacketStat_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_FlexibleActivity_DaveRedPacketStat_SC";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_DaveRedPacketStat_SC.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const REWARDTOTAL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_DaveRedPacketStat_SC.rewardTotal","rewardTotal",2 << 3 | WireType.VARINT);
      
      public static const QUESTLMT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_DaveRedPacketStat_SC.questLmt","questLmt",3 << 3 | WireType.VARINT);
      
      public static const LEFTREWARD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_DaveRedPacketStat_SC.leftReward","leftReward",4 << 3 | WireType.VARINT);
      
      public static const QUESTNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_DaveRedPacketStat_SC.questNum","questNum",5 << 3 | WireType.VARINT);
      
      public static const REWARDNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_FlexibleActivity_DaveRedPacketStat_SC.rewardNum","rewardNum",6 << 3 | WireType.VARINT);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var rewardTotal$field:uint;
      
      private var questLmt$field:uint;
      
      private var leftReward$field:uint;
      
      private var questNum$field:uint;
      
      private var rewardNum$field:uint;
      
      public function Cmd_FlexibleActivity_DaveRedPacketStat_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_FlexibleActivity_DaveRedPacketStat_SC.$MessageID;
      }
      
      public function clearActivityId() : void
      {
         this.hasField$0 &= 4294967294;
         this.activityId$field = new uint();
      }
      
      public function get hasActivityId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set activityId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.activityId$field = param1;
      }
      
      public function get activityId() : uint
      {
         return this.activityId$field;
      }
      
      public function clearRewardTotal() : void
      {
         this.hasField$0 &= 4294967293;
         this.rewardTotal$field = new uint();
      }
      
      public function get hasRewardTotal() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set rewardTotal(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.rewardTotal$field = param1;
      }
      
      public function get rewardTotal() : uint
      {
         return this.rewardTotal$field;
      }
      
      public function clearQuestLmt() : void
      {
         this.hasField$0 &= 4294967291;
         this.questLmt$field = new uint();
      }
      
      public function get hasQuestLmt() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set questLmt(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.questLmt$field = param1;
      }
      
      public function get questLmt() : uint
      {
         return this.questLmt$field;
      }
      
      public function clearLeftReward() : void
      {
         this.hasField$0 &= 4294967287;
         this.leftReward$field = new uint();
      }
      
      public function get hasLeftReward() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set leftReward(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.leftReward$field = param1;
      }
      
      public function get leftReward() : uint
      {
         return this.leftReward$field;
      }
      
      public function clearQuestNum() : void
      {
         this.hasField$0 &= 4294967279;
         this.questNum$field = new uint();
      }
      
      public function get hasQuestNum() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set questNum(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.questNum$field = param1;
      }
      
      public function get questNum() : uint
      {
         return this.questNum$field;
      }
      
      public function clearRewardNum() : void
      {
         this.hasField$0 &= 4294967263;
         this.rewardNum$field = new uint();
      }
      
      public function get hasRewardNum() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set rewardNum(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.rewardNum$field = param1;
      }
      
      public function get rewardNum() : uint
      {
         return this.rewardNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         if(this.hasRewardTotal)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.rewardTotal$field);
         }
         if(this.hasQuestLmt)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.questLmt$field);
         }
         if(this.hasLeftReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.leftReward$field);
         }
         if(this.hasQuestNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.questNum$field);
         }
         if(this.hasRewardNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.rewardNum$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc9_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc9_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_DaveRedPacketStat_SC.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_DaveRedPacketStat_SC.rewardTotal cannot be set twice.");
                  }
                  _loc4_++;
                  this.rewardTotal = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_DaveRedPacketStat_SC.questLmt cannot be set twice.");
                  }
                  _loc5_++;
                  this.questLmt = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_DaveRedPacketStat_SC.leftReward cannot be set twice.");
                  }
                  _loc6_++;
                  this.leftReward = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_DaveRedPacketStat_SC.questNum cannot be set twice.");
                  }
                  _loc7_++;
                  this.questNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_FlexibleActivity_DaveRedPacketStat_SC.rewardNum cannot be set twice.");
                  }
                  _loc8_++;
                  this.rewardNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
