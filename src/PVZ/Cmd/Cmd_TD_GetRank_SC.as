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
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_TD_GetRank_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_TD_GetRank_SC";
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_GetRank_SC.stageId","stageId",1 << 3 | WireType.VARINT);
      
      public static const LEVELID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_GetRank_SC.levelId","levelId",2 << 3 | WireType.VARINT);
      
      public static const SUBLEVELID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_GetRank_SC.subLevelId","subLevelId",3 << 3 | WireType.VARINT);
      
      public static const CHALLENGELEVELID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_GetRank_SC.challengeLevelId","challengeLevelId",4 << 3 | WireType.VARINT);
      
      public static const PAGENO:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_GetRank_SC.pageNo","pageNo",5 << 3 | WireType.VARINT);
      
      public static const TOTALPAGENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_GetRank_SC.totalPageNum","totalPageNum",6 << 3 | WireType.VARINT);
      
      public static const INFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_TD_GetRank_SC.info","info",7 << 3 | WireType.LENGTH_DELIMITED,Dto_TD_RankInfo);
      
      public static const SELFINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_TD_GetRank_SC.selfInfo","selfInfo",8 << 3 | WireType.LENGTH_DELIMITED,Dto_TD_RankInfo);
      
      public static const SELFRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_GetRank_SC.selfRank","selfRank",9 << 3 | WireType.VARINT);
      
      public static const CANTAKEREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_TD_GetRank_SC.canTakeReward","canTakeReward",10 << 3 | WireType.VARINT);
       
      
      private var stageId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var levelId$field:uint;
      
      private var subLevelId$field:uint;
      
      private var challengeLevelId$field:uint;
      
      private var pageNo$field:uint;
      
      private var totalPageNum$field:uint;
      
      public var info:Array;
      
      private var selfInfo$field:Dto_TD_RankInfo;
      
      private var selfRank$field:uint;
      
      private var canTakeReward$field:Boolean;
      
      public function Cmd_TD_GetRank_SC()
      {
         this.info = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_TD_GetRank_SC.$MessageID;
      }
      
      public function clearStageId() : void
      {
         this.hasField$0 &= 4294967294;
         this.stageId$field = new uint();
      }
      
      public function get hasStageId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set stageId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.stageId$field = param1;
      }
      
      public function get stageId() : uint
      {
         return this.stageId$field;
      }
      
      public function clearLevelId() : void
      {
         this.hasField$0 &= 4294967293;
         this.levelId$field = new uint();
      }
      
      public function get hasLevelId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set levelId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.levelId$field = param1;
      }
      
      public function get levelId() : uint
      {
         return this.levelId$field;
      }
      
      public function clearSubLevelId() : void
      {
         this.hasField$0 &= 4294967291;
         this.subLevelId$field = new uint();
      }
      
      public function get hasSubLevelId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set subLevelId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.subLevelId$field = param1;
      }
      
      public function get subLevelId() : uint
      {
         return this.subLevelId$field;
      }
      
      public function clearChallengeLevelId() : void
      {
         this.hasField$0 &= 4294967287;
         this.challengeLevelId$field = new uint();
      }
      
      public function get hasChallengeLevelId() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set challengeLevelId(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.challengeLevelId$field = param1;
      }
      
      public function get challengeLevelId() : uint
      {
         return this.challengeLevelId$field;
      }
      
      public function clearPageNo() : void
      {
         this.hasField$0 &= 4294967279;
         this.pageNo$field = new uint();
      }
      
      public function get hasPageNo() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set pageNo(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.pageNo$field = param1;
      }
      
      public function get pageNo() : uint
      {
         return this.pageNo$field;
      }
      
      public function clearTotalPageNum() : void
      {
         this.hasField$0 &= 4294967263;
         this.totalPageNum$field = new uint();
      }
      
      public function get hasTotalPageNum() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set totalPageNum(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.totalPageNum$field = param1;
      }
      
      public function get totalPageNum() : uint
      {
         return this.totalPageNum$field;
      }
      
      public function clearSelfInfo() : void
      {
         this.selfInfo$field = null;
      }
      
      public function get hasSelfInfo() : Boolean
      {
         return this.selfInfo$field != null;
      }
      
      public function set selfInfo(param1:Dto_TD_RankInfo) : void
      {
         this.selfInfo$field = param1;
      }
      
      public function get selfInfo() : Dto_TD_RankInfo
      {
         return this.selfInfo$field;
      }
      
      public function clearSelfRank() : void
      {
         this.hasField$0 &= 4294967231;
         this.selfRank$field = new uint();
      }
      
      public function get hasSelfRank() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set selfRank(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.selfRank$field = param1;
      }
      
      public function get selfRank() : uint
      {
         return this.selfRank$field;
      }
      
      public function clearCanTakeReward() : void
      {
         this.hasField$0 &= 4294967167;
         this.canTakeReward$field = new Boolean();
      }
      
      public function get hasCanTakeReward() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set canTakeReward(param1:Boolean) : void
      {
         this.hasField$0 |= 128;
         this.canTakeReward$field = param1;
      }
      
      public function get canTakeReward() : Boolean
      {
         return this.canTakeReward$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.stageId$field);
         }
         if(this.hasLevelId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.levelId$field);
         }
         if(this.hasSubLevelId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.subLevelId$field);
         }
         if(this.hasChallengeLevelId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.challengeLevelId$field);
         }
         if(this.hasPageNo)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.pageNo$field);
         }
         if(this.hasTotalPageNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.totalPageNum$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.info.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.info[_loc2_]);
            _loc2_++;
         }
         if(this.hasSelfInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.selfInfo$field);
         }
         if(this.hasSelfRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.selfRank$field);
         }
         if(this.hasCanTakeReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_BOOL(param1,this.canTakeReward$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc12_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc12_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc12_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_GetRank_SC.stageId cannot be set twice.");
                  }
                  _loc3_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_GetRank_SC.levelId cannot be set twice.");
                  }
                  _loc4_++;
                  this.levelId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_GetRank_SC.subLevelId cannot be set twice.");
                  }
                  _loc5_++;
                  this.subLevelId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_GetRank_SC.challengeLevelId cannot be set twice.");
                  }
                  _loc6_++;
                  this.challengeLevelId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_GetRank_SC.pageNo cannot be set twice.");
                  }
                  _loc7_++;
                  this.pageNo = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_GetRank_SC.totalPageNum cannot be set twice.");
                  }
                  _loc8_++;
                  this.totalPageNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  this.info.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_TD_RankInfo()));
                  break;
               case 8:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_GetRank_SC.selfInfo cannot be set twice.");
                  }
                  _loc9_++;
                  this.selfInfo = new Dto_TD_RankInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.selfInfo);
                  break;
               case 9:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_GetRank_SC.selfRank cannot be set twice.");
                  }
                  _loc10_++;
                  this.selfRank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_GetRank_SC.canTakeReward cannot be set twice.");
                  }
                  _loc11_++;
                  this.canTakeReward = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc12_);
                  break;
            }
         }
      }
   }
}
