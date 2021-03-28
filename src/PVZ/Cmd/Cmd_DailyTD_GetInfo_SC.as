package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_DailyTD_GetInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_DailyTD_GetInfo_SC";
      
      public static const STDAILYTD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_DailyTD_GetInfo_SC.stDailyTD","stDailyTD",1 << 3 | WireType.LENGTH_DELIMITED,Dto_DailyTDInfo);
      
      public static const STLOTTERY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_DailyTD_GetInfo_SC.stLottery","stLottery",2 << 3 | WireType.LENGTH_DELIMITED,Dto_LotteryInfo);
      
      public static const IREMAINCHALLENGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_DailyTD_GetInfo_SC.iRemainChallenge","iRemainChallenge",3 << 3 | WireType.VARINT);
      
      public static const TALENTIDLIST:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_DailyTD_GetInfo_SC.talentIdList","talentIdList",4 << 3 | WireType.VARINT);
      
      public static const HASPRIVILEGE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_DailyTD_GetInfo_SC.hasPrivilege","hasPrivilege",5 << 3 | WireType.VARINT);
      
      public static const PLANTID:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_DailyTD_GetInfo_SC.plantId","plantId",6 << 3 | WireType.VARINT);
      
      public static const REMAINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_DailyTD_GetInfo_SC.remainTime","remainTime",7 << 3 | WireType.VARINT);
       
      
      private var stDailyTD$field:Dto_DailyTDInfo;
      
      private var stLottery$field:Dto_LotteryInfo;
      
      private var iRemainChallenge$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var talentIdList:Array;
      
      private var hasPrivilege$field:Boolean;
      
      public var plantId:Array;
      
      private var remainTime$field:uint;
      
      public function Cmd_DailyTD_GetInfo_SC()
      {
         this.talentIdList = [];
         this.plantId = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_DailyTD_GetInfo_SC.$MessageID;
      }
      
      public function clearStDailyTD() : void
      {
         this.stDailyTD$field = null;
      }
      
      public function get hasStDailyTD() : Boolean
      {
         return this.stDailyTD$field != null;
      }
      
      public function set stDailyTD(param1:Dto_DailyTDInfo) : void
      {
         this.stDailyTD$field = param1;
      }
      
      public function get stDailyTD() : Dto_DailyTDInfo
      {
         return this.stDailyTD$field;
      }
      
      public function clearStLottery() : void
      {
         this.stLottery$field = null;
      }
      
      public function get hasStLottery() : Boolean
      {
         return this.stLottery$field != null;
      }
      
      public function set stLottery(param1:Dto_LotteryInfo) : void
      {
         this.stLottery$field = param1;
      }
      
      public function get stLottery() : Dto_LotteryInfo
      {
         return this.stLottery$field;
      }
      
      public function clearIRemainChallenge() : void
      {
         this.hasField$0 &= 4294967294;
         this.iRemainChallenge$field = new uint();
      }
      
      public function get hasIRemainChallenge() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set iRemainChallenge(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.iRemainChallenge$field = param1;
      }
      
      public function get iRemainChallenge() : uint
      {
         return this.iRemainChallenge$field;
      }
      
      public function clearHasPrivilege() : void
      {
         this.hasField$0 &= 4294967293;
         this.hasPrivilege$field = new Boolean();
      }
      
      public function get hasHasPrivilege() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set hasPrivilege(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.hasPrivilege$field = param1;
      }
      
      public function get hasPrivilege() : Boolean
      {
         return this.hasPrivilege$field;
      }
      
      public function clearRemainTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.remainTime$field = new uint();
      }
      
      public function get hasRemainTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set remainTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.remainTime$field = param1;
      }
      
      public function get remainTime() : uint
      {
         return this.remainTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasStDailyTD)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.stDailyTD$field);
         }
         if(this.hasStLottery)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.stLottery$field);
         }
         if(this.hasIRemainChallenge)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.iRemainChallenge$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.talentIdList.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.talentIdList[_loc2_]);
            _loc2_++;
         }
         if(this.hasHasPrivilege)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_BOOL(param1,this.hasPrivilege$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.plantId.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.plantId[_loc3_]);
            _loc3_++;
         }
         if(this.hasRemainTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.remainTime$field);
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyTD_GetInfo_SC.stDailyTD cannot be set twice.");
                  }
                  _loc3_++;
                  this.stDailyTD = new Dto_DailyTDInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.stDailyTD);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyTD_GetInfo_SC.stLottery cannot be set twice.");
                  }
                  _loc4_++;
                  this.stLottery = new Dto_LotteryInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.stLottery);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyTD_GetInfo_SC.iRemainChallenge cannot be set twice.");
                  }
                  _loc5_++;
                  this.iRemainChallenge = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if((_loc8_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.talentIdList);
                  }
                  else
                  {
                     this.talentIdList.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyTD_GetInfo_SC.hasPrivilege cannot be set twice.");
                  }
                  _loc6_++;
                  this.hasPrivilege = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 6:
                  if((_loc8_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.plantId);
                  }
                  else
                  {
                     this.plantId.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 7:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_DailyTD_GetInfo_SC.remainTime cannot be set twice.");
                  }
                  _loc7_++;
                  this.remainTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
