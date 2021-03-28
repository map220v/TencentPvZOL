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
   
   public final class Cmd_ExpeditionFight_DetailInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ExpeditionFight_DetailInfo_SC";
      
      public static const SIDEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_DetailInfo_SC.sideId","sideId",1 << 3 | WireType.VARINT);
      
      public static const CITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_DetailInfo_SC.cityId","cityId",2 << 3 | WireType.VARINT);
      
      public static const ATTACKSIDEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_DetailInfo_SC.attackSideId","attackSideId",3 << 3 | WireType.VARINT);
      
      public static const ATTACKCITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_DetailInfo_SC.attackCityId","attackCityId",4 << 3 | WireType.VARINT);
      
      public static const DEFENDCITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_DetailInfo_SC.defendCityId","defendCityId",5 << 3 | WireType.VARINT);
      
      public static const LEADER:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_DetailInfo_SC.leader","leader",6 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightLeaderRoleInfo);
      
      public static const SIDE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_DetailInfo_SC.side","side",7 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightSideRefreshInfo);
      
      public static const TOPREPORT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_DetailInfo_SC.topReport","topReport",8 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightReportInfo);
      
      public static const REPORT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_DetailInfo_SC.report","report",9 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightReportInfo);
      
      public static const BUYCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_DetailInfo_SC.buyCount","buyCount",10 << 3 | WireType.VARINT);
      
      public static const BANACTIONTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_DetailInfo_SC.banActionType","banActionType",11 << 3 | WireType.VARINT);
      
      public static const BANACTIONTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_DetailInfo_SC.banActionTime","banActionTime",12 << 3 | WireType.VARINT);
      
      public static const LASTBUYTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_DetailInfo_SC.lastBuyTime","lastBuyTime",13 << 3 | WireType.VARINT);
      
      public static const SIDEBUFF:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_DetailInfo_SC.sideBuff","sideBuff",14 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightSideBuffInfo);
      
      public static const NPC:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_DetailInfo_SC.npc","npc",15 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightNpcInfo);
      
      public static const TARGET:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_DetailInfo_SC.target","target",16 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightTarget);
       
      
      private var sideId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var cityId$field:uint;
      
      private var attackSideId$field:uint;
      
      private var attackCityId$field:uint;
      
      private var defendCityId$field:uint;
      
      public var leader:Array;
      
      public var side:Array;
      
      public var topReport:Array;
      
      public var report:Array;
      
      private var buyCount$field:uint;
      
      private var banActionType$field:uint;
      
      private var banActionTime$field:uint;
      
      private var lastBuyTime$field:uint;
      
      public var sideBuff:Array;
      
      private var npc$field:Dto_ExpeditionFightNpcInfo;
      
      private var target$field:Dto_ExpeditionFightTarget;
      
      public function Cmd_ExpeditionFight_DetailInfo_SC()
      {
         this.leader = [];
         this.side = [];
         this.topReport = [];
         this.report = [];
         this.sideBuff = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ExpeditionFight_DetailInfo_SC.$MessageID;
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
      
      public function clearAttackSideId() : void
      {
         this.hasField$0 &= 4294967291;
         this.attackSideId$field = new uint();
      }
      
      public function get hasAttackSideId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set attackSideId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.attackSideId$field = param1;
      }
      
      public function get attackSideId() : uint
      {
         return this.attackSideId$field;
      }
      
      public function clearAttackCityId() : void
      {
         this.hasField$0 &= 4294967287;
         this.attackCityId$field = new uint();
      }
      
      public function get hasAttackCityId() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set attackCityId(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.attackCityId$field = param1;
      }
      
      public function get attackCityId() : uint
      {
         return this.attackCityId$field;
      }
      
      public function clearDefendCityId() : void
      {
         this.hasField$0 &= 4294967279;
         this.defendCityId$field = new uint();
      }
      
      public function get hasDefendCityId() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set defendCityId(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.defendCityId$field = param1;
      }
      
      public function get defendCityId() : uint
      {
         return this.defendCityId$field;
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
      
      public function clearBanActionType() : void
      {
         this.hasField$0 &= 4294967231;
         this.banActionType$field = new uint();
      }
      
      public function get hasBanActionType() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set banActionType(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.banActionType$field = param1;
      }
      
      public function get banActionType() : uint
      {
         return this.banActionType$field;
      }
      
      public function clearBanActionTime() : void
      {
         this.hasField$0 &= 4294967167;
         this.banActionTime$field = new uint();
      }
      
      public function get hasBanActionTime() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set banActionTime(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.banActionTime$field = param1;
      }
      
      public function get banActionTime() : uint
      {
         return this.banActionTime$field;
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
      
      public function clearNpc() : void
      {
         this.npc$field = null;
      }
      
      public function get hasNpc() : Boolean
      {
         return this.npc$field != null;
      }
      
      public function set npc(param1:Dto_ExpeditionFightNpcInfo) : void
      {
         this.npc$field = param1;
      }
      
      public function get npc() : Dto_ExpeditionFightNpcInfo
      {
         return this.npc$field;
      }
      
      public function clearTarget() : void
      {
         this.target$field = null;
      }
      
      public function get hasTarget() : Boolean
      {
         return this.target$field != null;
      }
      
      public function set target(param1:Dto_ExpeditionFightTarget) : void
      {
         this.target$field = param1;
      }
      
      public function get target() : Dto_ExpeditionFightTarget
      {
         return this.target$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc7_:* = undefined;
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
         if(this.hasAttackSideId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.attackSideId$field);
         }
         if(this.hasAttackCityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.attackCityId$field);
         }
         if(this.hasDefendCityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.defendCityId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.leader.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.leader[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.side.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.side[_loc3_]);
            _loc3_++;
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.topReport.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.topReport[_loc4_]);
            _loc4_++;
         }
         var _loc5_:uint = 0;
         while(_loc5_ < this.report.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_MESSAGE(param1,this.report[_loc5_]);
            _loc5_++;
         }
         if(this.hasBuyCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.buyCount$field);
         }
         if(this.hasBanActionType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.banActionType$field);
         }
         if(this.hasBanActionTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_UINT32(param1,this.banActionTime$field);
         }
         if(this.hasLastBuyTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,13);
            WriteUtils.write$TYPE_UINT32(param1,this.lastBuyTime$field);
         }
         var _loc6_:uint = 0;
         while(_loc6_ < this.sideBuff.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,14);
            WriteUtils.write$TYPE_MESSAGE(param1,this.sideBuff[_loc6_]);
            _loc6_++;
         }
         if(this.hasNpc)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,15);
            WriteUtils.write$TYPE_MESSAGE(param1,this.npc$field);
         }
         if(this.hasTarget)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,16);
            WriteUtils.write$TYPE_MESSAGE(param1,this.target$field);
         }
         for(_loc7_ in this)
         {
            super.writeUnknown(param1,_loc7_);
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
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_DetailInfo_SC.sideId cannot be set twice.");
                  }
                  _loc3_++;
                  this.sideId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_DetailInfo_SC.cityId cannot be set twice.");
                  }
                  _loc4_++;
                  this.cityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_DetailInfo_SC.attackSideId cannot be set twice.");
                  }
                  _loc5_++;
                  this.attackSideId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_DetailInfo_SC.attackCityId cannot be set twice.");
                  }
                  _loc6_++;
                  this.attackCityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_DetailInfo_SC.defendCityId cannot be set twice.");
                  }
                  _loc7_++;
                  this.defendCityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  this.leader.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ExpeditionFightLeaderRoleInfo()));
                  break;
               case 7:
                  this.side.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ExpeditionFightSideRefreshInfo()));
                  break;
               case 8:
                  this.topReport.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ExpeditionFightReportInfo()));
                  break;
               case 9:
                  this.report.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ExpeditionFightReportInfo()));
                  break;
               case 10:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_DetailInfo_SC.buyCount cannot be set twice.");
                  }
                  _loc8_++;
                  this.buyCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_DetailInfo_SC.banActionType cannot be set twice.");
                  }
                  _loc9_++;
                  this.banActionType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_DetailInfo_SC.banActionTime cannot be set twice.");
                  }
                  _loc10_++;
                  this.banActionTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 13:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_DetailInfo_SC.lastBuyTime cannot be set twice.");
                  }
                  _loc11_++;
                  this.lastBuyTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 14:
                  this.sideBuff.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ExpeditionFightSideBuffInfo()));
                  break;
               case 15:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_DetailInfo_SC.npc cannot be set twice.");
                  }
                  _loc12_++;
                  this.npc = new Dto_ExpeditionFightNpcInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.npc);
                  break;
               case 16:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_DetailInfo_SC.target cannot be set twice.");
                  }
                  _loc13_++;
                  this.target = new Dto_ExpeditionFightTarget();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.target);
                  break;
               default:
                  super.readUnknown(param1,_loc14_);
                  break;
            }
         }
      }
   }
}
