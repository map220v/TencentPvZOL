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
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_NoEndTD_GetInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_NoEndTD_GetInfo_SC";
      
      public static const CURMODE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_NoEndTD_GetInfo_SC.curMode","curMode",1 << 3 | WireType.LENGTH_DELIMITED,Dto_NoEndTD_Mode);
      
      public static const TALENTIDLIST:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndTD_GetInfo_SC.talentIdList","talentIdList",2 << 3 | WireType.VARINT);
      
      public static const PLANTLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_NoEndTD_GetInfo_SC.plantList","plantList",3 << 3 | WireType.LENGTH_DELIMITED,Dto_PlantInfo);
      
      public static const STRENGTHPOINT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndTD_GetInfo_SC.strengthPoint","strengthPoint",4 << 3 | WireType.VARINT);
      
      public static const REWARDITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_NoEndTD_GetInfo_SC.rewardItems","rewardItems",5 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const HASTAKEREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_NoEndTD_GetInfo_SC.hasTakeReward","hasTakeReward",6 << 3 | WireType.VARINT);
      
      public static const HASPRIVILEGE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_NoEndTD_GetInfo_SC.hasPrivilege","hasPrivilege",7 << 3 | WireType.VARINT);
      
      public static const PLANTID:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndTD_GetInfo_SC.plantId","plantId",8 << 3 | WireType.VARINT);
      
      public static const REMAINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NoEndTD_GetInfo_SC.remainTime","remainTime",9 << 3 | WireType.VARINT);
      
      public static const RECORD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_NoEndTD_GetInfo_SC.record","record",10 << 3 | WireType.LENGTH_DELIMITED,Dto_NoEndTD_Record);
       
      
      private var curMode$field:Dto_NoEndTD_Mode;
      
      public var talentIdList:Array;
      
      public var plantList:Array;
      
      private var strengthPoint$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var rewardItems:Array;
      
      private var hasTakeReward$field:Boolean;
      
      private var hasPrivilege$field:Boolean;
      
      public var plantId:Array;
      
      private var remainTime$field:uint;
      
      private var record$field:Dto_NoEndTD_Record;
      
      public function Cmd_NoEndTD_GetInfo_SC()
      {
         this.talentIdList = [];
         this.plantList = [];
         this.rewardItems = [];
         this.plantId = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_NoEndTD_GetInfo_SC.$MessageID;
      }
      
      public function clearCurMode() : void
      {
         this.curMode$field = null;
      }
      
      public function get hasCurMode() : Boolean
      {
         return this.curMode$field != null;
      }
      
      public function set curMode(param1:Dto_NoEndTD_Mode) : void
      {
         this.curMode$field = param1;
      }
      
      public function get curMode() : Dto_NoEndTD_Mode
      {
         return this.curMode$field;
      }
      
      public function clearStrengthPoint() : void
      {
         this.hasField$0 &= 4294967294;
         this.strengthPoint$field = new uint();
      }
      
      public function get hasStrengthPoint() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set strengthPoint(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.strengthPoint$field = param1;
      }
      
      public function get strengthPoint() : uint
      {
         return this.strengthPoint$field;
      }
      
      public function clearHasTakeReward() : void
      {
         this.hasField$0 &= 4294967293;
         this.hasTakeReward$field = new Boolean();
      }
      
      public function get hasHasTakeReward() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set hasTakeReward(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.hasTakeReward$field = param1;
      }
      
      public function get hasTakeReward() : Boolean
      {
         return this.hasTakeReward$field;
      }
      
      public function clearHasPrivilege() : void
      {
         this.hasField$0 &= 4294967291;
         this.hasPrivilege$field = new Boolean();
      }
      
      public function get hasHasPrivilege() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set hasPrivilege(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.hasPrivilege$field = param1;
      }
      
      public function get hasPrivilege() : Boolean
      {
         return this.hasPrivilege$field;
      }
      
      public function clearRemainTime() : void
      {
         this.hasField$0 &= 4294967287;
         this.remainTime$field = new uint();
      }
      
      public function get hasRemainTime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set remainTime(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.remainTime$field = param1;
      }
      
      public function get remainTime() : uint
      {
         return this.remainTime$field;
      }
      
      public function clearRecord() : void
      {
         this.record$field = null;
      }
      
      public function get hasRecord() : Boolean
      {
         return this.record$field != null;
      }
      
      public function set record(param1:Dto_NoEndTD_Record) : void
      {
         this.record$field = param1;
      }
      
      public function get record() : Dto_NoEndTD_Record
      {
         return this.record$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc6_:* = undefined;
         if(this.hasCurMode)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.curMode$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.talentIdList.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.talentIdList[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.plantList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.plantList[_loc3_]);
            _loc3_++;
         }
         if(this.hasStrengthPoint)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.strengthPoint$field);
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.rewardItems.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewardItems[_loc4_]);
            _loc4_++;
         }
         if(this.hasHasTakeReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_BOOL(param1,this.hasTakeReward$field);
         }
         if(this.hasHasPrivilege)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_BOOL(param1,this.hasPrivilege$field);
         }
         var _loc5_:uint = 0;
         while(_loc5_ < this.plantId.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.plantId[_loc5_]);
            _loc5_++;
         }
         if(this.hasRemainTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.remainTime$field);
         }
         if(this.hasRecord)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,10);
            WriteUtils.write$TYPE_MESSAGE(param1,this.record$field);
         }
         for(_loc6_ in this)
         {
            super.writeUnknown(param1,_loc6_);
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
                     throw new IOError("Bad data format: Cmd_NoEndTD_GetInfo_SC.curMode cannot be set twice.");
                  }
                  _loc3_++;
                  this.curMode = new Dto_NoEndTD_Mode();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.curMode);
                  break;
               case 2:
                  if((_loc9_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.talentIdList);
                  }
                  else
                  {
                     this.talentIdList.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 3:
                  this.plantList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_PlantInfo()));
                  break;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndTD_GetInfo_SC.strengthPoint cannot be set twice.");
                  }
                  _loc4_++;
                  this.strengthPoint = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  this.rewardItems.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 6:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndTD_GetInfo_SC.hasTakeReward cannot be set twice.");
                  }
                  _loc5_++;
                  this.hasTakeReward = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 7:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndTD_GetInfo_SC.hasPrivilege cannot be set twice.");
                  }
                  _loc6_++;
                  this.hasPrivilege = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 8:
                  if((_loc9_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.plantId);
                  }
                  else
                  {
                     this.plantId.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 9:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndTD_GetInfo_SC.remainTime cannot be set twice.");
                  }
                  _loc7_++;
                  this.remainTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NoEndTD_GetInfo_SC.record cannot be set twice.");
                  }
                  _loc8_++;
                  this.record = new Dto_NoEndTD_Record();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.record);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
