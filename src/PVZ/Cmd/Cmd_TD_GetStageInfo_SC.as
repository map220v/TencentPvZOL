package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_TD_GetStageInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_TD_GetStageInfo_SC";
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_GetStageInfo_SC.stageId","stageId",1 << 3 | WireType.VARINT);
      
      public static const LEVELINFOLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_TD_GetStageInfo_SC.levelInfoList","levelInfoList",2 << 3 | WireType.LENGTH_DELIMITED,Dto_TD_LevelInfo);
      
      public static const GATELIST:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_GetStageInfo_SC.gateList","gateList",3 << 3 | WireType.VARINT);
      
      public static const STAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_GetStageInfo_SC.star","star",4 << 3 | WireType.VARINT);
      
      public static const HASSWAPTD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_TD_GetStageInfo_SC.hasSwapTD","hasSwapTD",5 << 3 | WireType.VARINT);
      
      public static const CHALLENGETIMES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_TD_GetStageInfo_SC.challengeTimes","challengeTimes",6 << 3 | WireType.LENGTH_DELIMITED,Dto_TD_ChallengeTimes);
      
      public static const CHAMPIONINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_TD_GetStageInfo_SC.championInfo","championInfo",7 << 3 | WireType.LENGTH_DELIMITED,Dto_TD_ChampionInfo);
       
      
      private var stageId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var levelInfoList:Array;
      
      public var gateList:Array;
      
      private var star$field:uint;
      
      private var hasSwapTD$field:Boolean;
      
      public var challengeTimes:Array;
      
      public var championInfo:Array;
      
      public function Cmd_TD_GetStageInfo_SC()
      {
         this.levelInfoList = [];
         this.gateList = [];
         this.challengeTimes = [];
         this.championInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_TD_GetStageInfo_SC.$MessageID;
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
      
      public function clearStar() : void
      {
         this.hasField$0 &= 4294967293;
         this.star$field = new uint();
      }
      
      public function get hasStar() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set star(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.star$field = param1;
      }
      
      public function get star() : uint
      {
         return this.star$field;
      }
      
      public function clearHasSwapTD() : void
      {
         this.hasField$0 &= 4294967291;
         this.hasSwapTD$field = new Boolean();
      }
      
      public function get hasHasSwapTD() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set hasSwapTD(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.hasSwapTD$field = param1;
      }
      
      public function get hasSwapTD() : Boolean
      {
         return this.hasSwapTD$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc6_:* = undefined;
         if(this.hasStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.stageId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.levelInfoList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.levelInfoList[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.gateList.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.gateList[_loc3_]);
            _loc3_++;
         }
         if(this.hasStar)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.star$field);
         }
         if(this.hasHasSwapTD)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_BOOL(param1,this.hasSwapTD$field);
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.challengeTimes.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.challengeTimes[_loc4_]);
            _loc4_++;
         }
         var _loc5_:uint = 0;
         while(_loc5_ < this.championInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.championInfo[_loc5_]);
            _loc5_++;
         }
         for(_loc6_ in this)
         {
            super.writeUnknown(param1,_loc6_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_GetStageInfo_SC.stageId cannot be set twice.");
                  }
                  _loc3_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  this.levelInfoList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_TD_LevelInfo()));
                  break;
               case 3:
                  if((_loc6_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.gateList);
                  }
                  else
                  {
                     this.gateList.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_GetStageInfo_SC.star cannot be set twice.");
                  }
                  _loc4_++;
                  this.star = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_GetStageInfo_SC.hasSwapTD cannot be set twice.");
                  }
                  _loc5_++;
                  this.hasSwapTD = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 6:
                  this.challengeTimes.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_TD_ChallengeTimes()));
                  break;
               case 7:
                  this.championInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_TD_ChampionInfo()));
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
