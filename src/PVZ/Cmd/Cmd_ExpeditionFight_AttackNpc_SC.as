package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_DOUBLE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_ExpeditionFight_AttackNpc_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ExpeditionFight_AttackNpc_SC";
      
      public static const BANACTIONTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_AttackNpc_SC.banActionType","banActionType",1 << 3 | WireType.VARINT);
      
      public static const BANACTIONTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_AttackNpc_SC.banActionTime","banActionTime",2 << 3 | WireType.VARINT);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_AttackNpc_SC.score","score",3 << 3 | WireType.VARINT);
      
      public static const BUYCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_AttackNpc_SC.buyCount","buyCount",4 << 3 | WireType.VARINT);
      
      public static const LASTBUYTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_AttackNpc_SC.lastBuyTime","lastBuyTime",5 << 3 | WireType.VARINT);
      
      public static const REPORT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_AttackNpc_SC.report","report",6 << 3 | WireType.LENGTH_DELIMITED,Dto_FightReport);
      
      public static const REWARD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_AttackNpc_SC.reward","reward",7 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const NPCID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_AttackNpc_SC.npcId","npcId",8 << 3 | WireType.VARINT);
      
      public static const HPRATIO:FieldDescriptor$TYPE_DOUBLE = new FieldDescriptor$TYPE_DOUBLE("PVZ.Cmd.Cmd_ExpeditionFight_AttackNpc_SC.hpRatio","hpRatio",9 << 3 | WireType.FIXED_64_BIT);
      
      public static const POWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_AttackNpc_SC.power","power",10 << 3 | WireType.VARINT);
       
      
      private var banActionType$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var banActionTime$field:uint;
      
      private var score$field:uint;
      
      private var buyCount$field:uint;
      
      private var lastBuyTime$field:uint;
      
      private var report$field:Dto_FightReport;
      
      private var reward$field:Dto_IdNum;
      
      private var npcId$field:uint;
      
      private var hpRatio$field:Number;
      
      private var power$field:uint;
      
      public function Cmd_ExpeditionFight_AttackNpc_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ExpeditionFight_AttackNpc_SC.$MessageID;
      }
      
      public function clearBanActionType() : void
      {
         this.hasField$0 &= 4294967294;
         this.banActionType$field = new uint();
      }
      
      public function get hasBanActionType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set banActionType(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.banActionType$field = param1;
      }
      
      public function get banActionType() : uint
      {
         return this.banActionType$field;
      }
      
      public function clearBanActionTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.banActionTime$field = new uint();
      }
      
      public function get hasBanActionTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set banActionTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.banActionTime$field = param1;
      }
      
      public function get banActionTime() : uint
      {
         return this.banActionTime$field;
      }
      
      public function clearScore() : void
      {
         this.hasField$0 &= 4294967291;
         this.score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.score$field = param1;
      }
      
      public function get score() : uint
      {
         return this.score$field;
      }
      
      public function clearBuyCount() : void
      {
         this.hasField$0 &= 4294967287;
         this.buyCount$field = new uint();
      }
      
      public function get hasBuyCount() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set buyCount(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.buyCount$field = param1;
      }
      
      public function get buyCount() : uint
      {
         return this.buyCount$field;
      }
      
      public function clearLastBuyTime() : void
      {
         this.hasField$0 &= 4294967279;
         this.lastBuyTime$field = new uint();
      }
      
      public function get hasLastBuyTime() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set lastBuyTime(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.lastBuyTime$field = param1;
      }
      
      public function get lastBuyTime() : uint
      {
         return this.lastBuyTime$field;
      }
      
      public function clearReport() : void
      {
         this.report$field = null;
      }
      
      public function get hasReport() : Boolean
      {
         return this.report$field != null;
      }
      
      public function set report(param1:Dto_FightReport) : void
      {
         this.report$field = param1;
      }
      
      public function get report() : Dto_FightReport
      {
         return this.report$field;
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
      
      public function clearNpcId() : void
      {
         this.hasField$0 &= 4294967263;
         this.npcId$field = new uint();
      }
      
      public function get hasNpcId() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set npcId(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.npcId$field = param1;
      }
      
      public function get npcId() : uint
      {
         return this.npcId$field;
      }
      
      public function clearHpRatio() : void
      {
         this.hasField$0 &= 4294967231;
         this.hpRatio$field = new Number();
      }
      
      public function get hasHpRatio() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set hpRatio(param1:Number) : void
      {
         this.hasField$0 |= 64;
         this.hpRatio$field = param1;
      }
      
      public function get hpRatio() : Number
      {
         return this.hpRatio$field;
      }
      
      public function clearPower() : void
      {
         this.hasField$0 &= 4294967167;
         this.power$field = new uint();
      }
      
      public function get hasPower() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set power(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.power$field = param1;
      }
      
      public function get power() : uint
      {
         return this.power$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasBanActionType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.banActionType$field);
         }
         if(this.hasBanActionTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.banActionTime$field);
         }
         if(this.hasScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.score$field);
         }
         if(this.hasBuyCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.buyCount$field);
         }
         if(this.hasLastBuyTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.lastBuyTime$field);
         }
         if(this.hasReport)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.report$field);
         }
         if(this.hasReward)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.reward$field);
         }
         if(this.hasNpcId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.npcId$field);
         }
         if(this.hasHpRatio)
         {
            WriteUtils.writeTag(param1,WireType.FIXED_64_BIT,9);
            WriteUtils.write$TYPE_DOUBLE(param1,this.hpRatio$field);
         }
         if(this.hasPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.power$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc13_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc13_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc13_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_AttackNpc_SC.banActionType cannot be set twice.");
                  }
                  _loc3_++;
                  this.banActionType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_AttackNpc_SC.banActionTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.banActionTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_AttackNpc_SC.score cannot be set twice.");
                  }
                  _loc5_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_AttackNpc_SC.buyCount cannot be set twice.");
                  }
                  _loc6_++;
                  this.buyCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_AttackNpc_SC.lastBuyTime cannot be set twice.");
                  }
                  _loc7_++;
                  this.lastBuyTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_AttackNpc_SC.report cannot be set twice.");
                  }
                  _loc8_++;
                  this.report = new Dto_FightReport();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.report);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_AttackNpc_SC.reward cannot be set twice.");
                  }
                  _loc9_++;
                  this.reward = new Dto_IdNum();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.reward);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_AttackNpc_SC.npcId cannot be set twice.");
                  }
                  _loc10_++;
                  this.npcId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_AttackNpc_SC.hpRatio cannot be set twice.");
                  }
                  _loc11_++;
                  this.hpRatio = ReadUtils.read$TYPE_DOUBLE(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_AttackNpc_SC.power cannot be set twice.");
                  }
                  _loc12_++;
                  this.power = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc13_);
                  break;
            }
         }
      }
   }
}
