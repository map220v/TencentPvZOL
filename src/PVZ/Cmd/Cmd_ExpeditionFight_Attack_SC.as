package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_ExpeditionFight_Attack_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ExpeditionFight_Attack_SC";
      
      public static const SIDEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_Attack_SC.sideId","sideId",1 << 3 | WireType.VARINT);
      
      public static const CITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_Attack_SC.cityId","cityId",2 << 3 | WireType.VARINT);
      
      public static const BANACTIONTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_Attack_SC.banActionType","banActionType",3 << 3 | WireType.VARINT);
      
      public static const BANACTIONTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_Attack_SC.banActionTime","banActionTime",4 << 3 | WireType.VARINT);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_Attack_SC.score","score",5 << 3 | WireType.VARINT);
      
      public static const BUYCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_Attack_SC.buyCount","buyCount",6 << 3 | WireType.VARINT);
      
      public static const REPORT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_Attack_SC.report","report",7 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightReportInfo);
      
      public static const DEFENDROLEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_Attack_SC.defendRoleInfo","defendRoleInfo",8 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightCityDefendRoleInfo);
      
      public static const WINCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_Attack_SC.winCount","winCount",9 << 3 | WireType.VARINT);
      
      public static const LEFTSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_Attack_SC.leftScore","leftScore",10 << 3 | WireType.VARINT);
      
      public static const LASTBUYTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_Attack_SC.lastBuyTime","lastBuyTime",11 << 3 | WireType.VARINT);
      
      public static const POWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_Attack_SC.power","power",12 << 3 | WireType.VARINT);
       
      
      private var sideId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var cityId$field:uint;
      
      private var banActionType$field:uint;
      
      private var banActionTime$field:uint;
      
      private var score$field:uint;
      
      private var buyCount$field:uint;
      
      public var report:Array;
      
      private var defendRoleInfo$field:Dto_ExpeditionFightCityDefendRoleInfo;
      
      private var winCount$field:uint;
      
      private var leftScore$field:uint;
      
      private var lastBuyTime$field:uint;
      
      private var power$field:uint;
      
      public function Cmd_ExpeditionFight_Attack_SC()
      {
         this.report = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ExpeditionFight_Attack_SC.$MessageID;
      }
      
      public function clearSideId() : void
      {
         this.hasField$0 &= 4294967294;
         this.sideId$field = new uint();
      }
      
      public function get hasSideId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set sideId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.sideId$field = param1;
      }
      
      public function get sideId() : uint
      {
         return this.sideId$field;
      }
      
      public function clearCityId() : void
      {
         this.hasField$0 &= 4294967293;
         this.cityId$field = new uint();
      }
      
      public function get hasCityId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set cityId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.cityId$field = param1;
      }
      
      public function get cityId() : uint
      {
         return this.cityId$field;
      }
      
      public function clearBanActionType() : void
      {
         this.hasField$0 &= 4294967291;
         this.banActionType$field = new uint();
      }
      
      public function get hasBanActionType() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set banActionType(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.banActionType$field = param1;
      }
      
      public function get banActionType() : uint
      {
         return this.banActionType$field;
      }
      
      public function clearBanActionTime() : void
      {
         this.hasField$0 &= 4294967287;
         this.banActionTime$field = new uint();
      }
      
      public function get hasBanActionTime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set banActionTime(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.banActionTime$field = param1;
      }
      
      public function get banActionTime() : uint
      {
         return this.banActionTime$field;
      }
      
      public function clearScore() : void
      {
         this.hasField$0 &= 4294967279;
         this.score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.score$field = param1;
      }
      
      public function get score() : uint
      {
         return this.score$field;
      }
      
      public function clearBuyCount() : void
      {
         this.hasField$0 &= 4294967263;
         this.buyCount$field = new uint();
      }
      
      public function get hasBuyCount() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set buyCount(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.buyCount$field = param1;
      }
      
      public function get buyCount() : uint
      {
         return this.buyCount$field;
      }
      
      public function clearDefendRoleInfo() : void
      {
         this.defendRoleInfo$field = null;
      }
      
      public function get hasDefendRoleInfo() : Boolean
      {
         return this.defendRoleInfo$field != null;
      }
      
      public function set defendRoleInfo(param1:Dto_ExpeditionFightCityDefendRoleInfo) : void
      {
         this.defendRoleInfo$field = param1;
      }
      
      public function get defendRoleInfo() : Dto_ExpeditionFightCityDefendRoleInfo
      {
         return this.defendRoleInfo$field;
      }
      
      public function clearWinCount() : void
      {
         this.hasField$0 &= 4294967231;
         this.winCount$field = new uint();
      }
      
      public function get hasWinCount() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set winCount(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.winCount$field = param1;
      }
      
      public function get winCount() : uint
      {
         return this.winCount$field;
      }
      
      public function clearLeftScore() : void
      {
         this.hasField$0 &= 4294967167;
         this.leftScore$field = new uint();
      }
      
      public function get hasLeftScore() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set leftScore(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.leftScore$field = param1;
      }
      
      public function get leftScore() : uint
      {
         return this.leftScore$field;
      }
      
      public function clearLastBuyTime() : void
      {
         this.hasField$0 &= 4294967039;
         this.lastBuyTime$field = new uint();
      }
      
      public function get hasLastBuyTime() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set lastBuyTime(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.lastBuyTime$field = param1;
      }
      
      public function get lastBuyTime() : uint
      {
         return this.lastBuyTime$field;
      }
      
      public function clearPower() : void
      {
         this.hasField$0 &= 4294966783;
         this.power$field = new uint();
      }
      
      public function get hasPower() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set power(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.power$field = param1;
      }
      
      public function get power() : uint
      {
         return this.power$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasSideId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.sideId$field);
         }
         if(this.hasCityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.cityId$field);
         }
         if(this.hasBanActionType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.banActionType$field);
         }
         if(this.hasBanActionTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.banActionTime$field);
         }
         if(this.hasScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.score$field);
         }
         if(this.hasBuyCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.buyCount$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.report.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.report[_loc2_]);
            _loc2_++;
         }
         if(this.hasDefendRoleInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.defendRoleInfo$field);
         }
         if(this.hasWinCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.winCount$field);
         }
         if(this.hasLeftScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.leftScore$field);
         }
         if(this.hasLastBuyTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.lastBuyTime$field);
         }
         if(this.hasPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_UINT32(param1,this.power$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc14_:uint = 0;
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
         var _loc13_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc14_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc14_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Attack_SC.sideId cannot be set twice.");
                  }
                  _loc3_++;
                  this.sideId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Attack_SC.cityId cannot be set twice.");
                  }
                  _loc4_++;
                  this.cityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Attack_SC.banActionType cannot be set twice.");
                  }
                  _loc5_++;
                  this.banActionType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Attack_SC.banActionTime cannot be set twice.");
                  }
                  _loc6_++;
                  this.banActionTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Attack_SC.score cannot be set twice.");
                  }
                  _loc7_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Attack_SC.buyCount cannot be set twice.");
                  }
                  _loc8_++;
                  this.buyCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  this.report.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ExpeditionFightReportInfo()));
                  break;
               case 8:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Attack_SC.defendRoleInfo cannot be set twice.");
                  }
                  _loc9_++;
                  this.defendRoleInfo = new Dto_ExpeditionFightCityDefendRoleInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.defendRoleInfo);
                  break;
               case 9:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Attack_SC.winCount cannot be set twice.");
                  }
                  _loc10_++;
                  this.winCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Attack_SC.leftScore cannot be set twice.");
                  }
                  _loc11_++;
                  this.leftScore = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Attack_SC.lastBuyTime cannot be set twice.");
                  }
                  _loc12_++;
                  this.lastBuyTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Attack_SC.power cannot be set twice.");
                  }
                  _loc13_++;
                  this.power = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc14_);
                  break;
            }
         }
      }
   }
}
