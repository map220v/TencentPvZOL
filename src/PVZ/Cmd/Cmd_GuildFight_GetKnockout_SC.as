package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_GuildFight_GetKnockout_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_GuildFight_GetKnockout_SC";
      
      public static const GUILDINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GuildFight_GetKnockout_SC.guildInfo","guildInfo",1 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFight_GuildInfo);
      
      public static const HASREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_GuildFight_GetKnockout_SC.hasReward","hasReward",2 << 3 | WireType.VARINT);
      
      public static const BETRESULT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GuildFight_GetKnockout_SC.betResult","betResult",3 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFight_BetResult);
       
      
      public var guildInfo:Array;
      
      private var hasReward$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public var betResult:Array;
      
      public function Cmd_GuildFight_GetKnockout_SC()
      {
         this.guildInfo = [];
         this.betResult = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_GuildFight_GetKnockout_SC.$MessageID;
      }
      
      public function clearHasReward() : void
      {
         this.hasField$0 &= 4294967294;
         this.hasReward$field = new Boolean();
      }
      
      public function get hasHasReward() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set hasReward(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.hasReward$field = param1;
      }
      
      public function get hasReward() : Boolean
      {
         return this.hasReward$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.guildInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guildInfo[_loc2_]);
            _loc2_++;
         }
         if(this.hasHasReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.hasReward$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.betResult.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.betResult[_loc3_]);
            _loc3_++;
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc4_ >> 3)
            {
               case 1:
                  this.guildInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_GuildFight_GuildInfo()));
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_GetKnockout_SC.hasReward cannot be set twice.");
                  }
                  _loc3_++;
                  this.hasReward = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 3:
                  this.betResult.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_GuildFight_BetResult()));
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
