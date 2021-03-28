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
   
   public final class Cmd_ExpeditionFight_GrantReward_FG extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ExpeditionFight_GrantReward_FG";
      
      public static const BEGINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_GrantReward_FG.beginTime","beginTime",1 << 3 | WireType.VARINT);
      
      public static const ROUND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_GrantReward_FG.round","round",2 << 3 | WireType.VARINT);
      
      public static const SIDERANKID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_GrantReward_FG.sideRankId","sideRankId",3 << 3 | WireType.VARINT);
      
      public static const REWARDINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_GrantReward_FG.rewardInfo","rewardInfo",4 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightRewardInfo);
       
      
      private var beginTime$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var round$field:uint;
      
      private var sideRankId$field:uint;
      
      public var rewardInfo:Array;
      
      public function Cmd_ExpeditionFight_GrantReward_FG()
      {
         this.rewardInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ExpeditionFight_GrantReward_FG.$MessageID;
      }
      
      public function clearBeginTime() : void
      {
         this.hasField$0 &= 4294967294;
         this.beginTime$field = new uint();
      }
      
      public function get hasBeginTime() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set beginTime(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.beginTime$field = param1;
      }
      
      public function get beginTime() : uint
      {
         return this.beginTime$field;
      }
      
      public function clearRound() : void
      {
         this.hasField$0 &= 4294967293;
         this.round$field = new uint();
      }
      
      public function get hasRound() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set round(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.round$field = param1;
      }
      
      public function get round() : uint
      {
         return this.round$field;
      }
      
      public function clearSideRankId() : void
      {
         this.hasField$0 &= 4294967291;
         this.sideRankId$field = new uint();
      }
      
      public function get hasSideRankId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set sideRankId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.sideRankId$field = param1;
      }
      
      public function get sideRankId() : uint
      {
         return this.sideRankId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasBeginTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.beginTime$field);
         }
         if(this.hasRound)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.round$field);
         }
         if(this.hasSideRankId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.sideRankId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.rewardInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewardInfo[_loc2_]);
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
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_GrantReward_FG.beginTime cannot be set twice.");
                  }
                  _loc3_++;
                  this.beginTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_GrantReward_FG.round cannot be set twice.");
                  }
                  _loc4_++;
                  this.round = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_GrantReward_FG.sideRankId cannot be set twice.");
                  }
                  _loc5_++;
                  this.sideRankId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  this.rewardInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ExpeditionFightRewardInfo()));
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
