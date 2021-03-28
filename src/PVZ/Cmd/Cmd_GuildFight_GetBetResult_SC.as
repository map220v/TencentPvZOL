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
   
   public final class Cmd_GuildFight_GetBetResult_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_GuildFight_GetBetResult_SC";
      
      public static const BETWINNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFight_GetBetResult_SC.betWinNum","betWinNum",1 << 3 | WireType.VARINT);
      
      public static const CANGETNUMREWARD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFight_GetBetResult_SC.canGetNumReward","canGetNumReward",2 << 3 | WireType.VARINT);
      
      public static const RESULT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GuildFight_GetBetResult_SC.result","result",3 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFight_BetResult);
       
      
      private var betWinNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var canGetNumReward$field:uint;
      
      public var result:Array;
      
      public function Cmd_GuildFight_GetBetResult_SC()
      {
         this.result = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_GuildFight_GetBetResult_SC.$MessageID;
      }
      
      public function clearBetWinNum() : void
      {
         this.hasField$0 &= 4294967294;
         this.betWinNum$field = new uint();
      }
      
      public function get hasBetWinNum() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set betWinNum(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.betWinNum$field = param1;
      }
      
      public function get betWinNum() : uint
      {
         return this.betWinNum$field;
      }
      
      public function clearCanGetNumReward() : void
      {
         this.hasField$0 &= 4294967293;
         this.canGetNumReward$field = new uint();
      }
      
      public function get hasCanGetNumReward() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set canGetNumReward(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.canGetNumReward$field = param1;
      }
      
      public function get canGetNumReward() : uint
      {
         return this.canGetNumReward$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasBetWinNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.betWinNum$field);
         }
         if(this.hasCanGetNumReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.canGetNumReward$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.result.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.result[_loc2_]);
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
                     throw new IOError("Bad data format: Cmd_GuildFight_GetBetResult_SC.betWinNum cannot be set twice.");
                  }
                  _loc3_++;
                  this.betWinNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_GetBetResult_SC.canGetNumReward cannot be set twice.");
                  }
                  _loc4_++;
                  this.canGetNumReward = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  this.result.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_GuildFight_BetResult()));
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
