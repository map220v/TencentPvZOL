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
   
   public final class Cmd_ExpeditionFight_RefreshSumRankInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ExpeditionFight_RefreshSumRankInfo_SC";
      
      public static const RANKROLE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_RefreshSumRankInfo_SC.rankRole","rankRole",1 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightSumRankItemInfo);
      
      public static const SELFRANKID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_RefreshSumRankInfo_SC.selfRankId","selfRankId",2 << 3 | WireType.VARINT);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_RefreshSumRankInfo_SC.score","score",3 << 3 | WireType.VARINT);
       
      
      public var rankRole:Array;
      
      private var selfRankId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var score$field:uint;
      
      public function Cmd_ExpeditionFight_RefreshSumRankInfo_SC()
      {
         this.rankRole = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ExpeditionFight_RefreshSumRankInfo_SC.$MessageID;
      }
      
      public function clearSelfRankId() : void
      {
         this.hasField$0 &= 4294967294;
         this.selfRankId$field = new uint();
      }
      
      public function get hasSelfRankId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set selfRankId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.selfRankId$field = param1;
      }
      
      public function get selfRankId() : uint
      {
         return this.selfRankId$field;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.rankRole.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rankRole[_loc2_]);
            _loc2_++;
         }
         if(this.hasSelfRankId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.selfRankId$field);
         }
         if(this.hasScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.score$field);
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
                  this.rankRole.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ExpeditionFightSumRankItemInfo()));
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_RefreshSumRankInfo_SC.selfRankId cannot be set twice.");
                  }
                  _loc3_++;
                  this.selfRankId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_RefreshSumRankInfo_SC.score cannot be set twice.");
                  }
                  _loc4_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
