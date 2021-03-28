package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_GuildFight_BetResult extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_GuildFight_BetResult";
      
      public static const STAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_BetResult.stage","stage",1 << 3 | WireType.VARINT);
      
      public static const GUILDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_GuildFight_BetResult.guildId","guildId",2 << 3 | WireType.VARINT);
      
      public static const GUILDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_GuildFight_BetResult.guildName","guildName",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const FIGHTSTATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_BetResult.fightState","fightState",4 << 3 | WireType.VARINT);
      
      public static const BETCOIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_BetResult.betCoin","betCoin",5 << 3 | WireType.VARINT);
      
      public static const CANGETRETURNREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_GuildFight_BetResult.canGetReturnReward","canGetReturnReward",6 << 3 | WireType.VARINT);
       
      
      private var stage$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var guildId$field:Int64;
      
      private var guildName$field:String;
      
      private var fightState$field:uint;
      
      private var betCoin$field:uint;
      
      private var canGetReturnReward$field:Boolean;
      
      public function Dto_GuildFight_BetResult()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_GuildFight_BetResult.$MessageID;
      }
      
      public function clearStage() : void
      {
         this.hasField$0 &= 4294967294;
         this.stage$field = new uint();
      }
      
      public function get hasStage() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set stage(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.stage$field = param1;
      }
      
      public function get stage() : uint
      {
         return this.stage$field;
      }
      
      public function clearGuildId() : void
      {
         this.guildId$field = null;
      }
      
      public function get hasGuildId() : Boolean
      {
         return this.guildId$field != null;
      }
      
      public function set guildId(param1:Int64) : void
      {
         this.guildId$field = param1;
      }
      
      public function get guildId() : Int64
      {
         return this.guildId$field;
      }
      
      public function clearGuildName() : void
      {
         this.guildName$field = null;
      }
      
      public function get hasGuildName() : Boolean
      {
         return this.guildName$field != null;
      }
      
      public function set guildName(param1:String) : void
      {
         this.guildName$field = param1;
      }
      
      public function get guildName() : String
      {
         return this.guildName$field;
      }
      
      public function clearFightState() : void
      {
         this.hasField$0 &= 4294967293;
         this.fightState$field = new uint();
      }
      
      public function get hasFightState() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set fightState(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.fightState$field = param1;
      }
      
      public function get fightState() : uint
      {
         return this.fightState$field;
      }
      
      public function clearBetCoin() : void
      {
         this.hasField$0 &= 4294967291;
         this.betCoin$field = new uint();
      }
      
      public function get hasBetCoin() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set betCoin(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.betCoin$field = param1;
      }
      
      public function get betCoin() : uint
      {
         return this.betCoin$field;
      }
      
      public function clearCanGetReturnReward() : void
      {
         this.hasField$0 &= 4294967287;
         this.canGetReturnReward$field = new Boolean();
      }
      
      public function get hasCanGetReturnReward() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set canGetReturnReward(param1:Boolean) : void
      {
         this.hasField$0 |= 8;
         this.canGetReturnReward$field = param1;
      }
      
      public function get canGetReturnReward() : Boolean
      {
         return this.canGetReturnReward$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasStage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.stage$field);
         }
         if(this.hasGuildId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.guildId$field);
         }
         if(this.hasGuildName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.guildName$field);
         }
         if(this.hasFightState)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.fightState$field);
         }
         if(this.hasBetCoin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.betCoin$field);
         }
         if(this.hasCanGetReturnReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_BOOL(param1,this.canGetReturnReward$field);
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
                     throw new IOError("Bad data format: Dto_GuildFight_BetResult.stage cannot be set twice.");
                  }
                  _loc3_++;
                  this.stage = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_BetResult.guildId cannot be set twice.");
                  }
                  _loc4_++;
                  this.guildId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_BetResult.guildName cannot be set twice.");
                  }
                  _loc5_++;
                  this.guildName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_BetResult.fightState cannot be set twice.");
                  }
                  _loc6_++;
                  this.fightState = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_BetResult.betCoin cannot be set twice.");
                  }
                  _loc7_++;
                  this.betCoin = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_BetResult.canGetReturnReward cannot be set twice.");
                  }
                  _loc8_++;
                  this.canGetReturnReward = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
