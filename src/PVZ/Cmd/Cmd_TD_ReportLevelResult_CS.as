package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BYTES;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public final class Cmd_TD_ReportLevelResult_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_TD_ReportLevelResult_CS";
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_ReportLevelResult_CS.stageId","stageId",1 << 3 | WireType.VARINT);
      
      public static const LEVELID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_ReportLevelResult_CS.levelId","levelId",2 << 3 | WireType.VARINT);
      
      public static const SUBLEVELID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_ReportLevelResult_CS.subLevelId","subLevelId",3 << 3 | WireType.VARINT);
      
      public static const PASSRESULT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_ReportLevelResult_CS.passResult","passResult",4 << 3 | WireType.VARINT);
      
      public static const ACHIEVEMENTLIST:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_ReportLevelResult_CS.achievementList","achievementList",5 << 3 | WireType.VARINT);
      
      public static const LOGS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_TD_ReportLevelResult_CS.logs","logs",6 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const BYTELOGS:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("PVZ.Cmd.Cmd_TD_ReportLevelResult_CS.bytelogs","bytelogs",7 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const SRCSIZE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_ReportLevelResult_CS.srcsize","srcsize",8 << 3 | WireType.VARINT);
      
      public static const BREPEAT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_TD_ReportLevelResult_CS.bRepeat","bRepeat",9 << 3 | WireType.VARINT);
      
      public static const CHALLENGELEVELID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_ReportLevelResult_CS.challengeLevelId","challengeLevelId",10 << 3 | WireType.VARINT);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TD_ReportLevelResult_CS.score","score",11 << 3 | WireType.VARINT);
       
      
      private var stageId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var levelId$field:uint;
      
      private var subLevelId$field:uint;
      
      private var passResult$field:uint;
      
      public var achievementList:Array;
      
      private var logs$field:String;
      
      private var bytelogs$field:ByteArray;
      
      private var srcsize$field:uint;
      
      private var bRepeat$field:Boolean;
      
      private var challengeLevelId$field:uint;
      
      private var score$field:uint;
      
      public function Cmd_TD_ReportLevelResult_CS()
      {
         this.achievementList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_TD_ReportLevelResult_CS.$MessageID;
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
      
      public function clearPassResult() : void
      {
         this.hasField$0 &= 4294967287;
         this.passResult$field = new uint();
      }
      
      public function get hasPassResult() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set passResult(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.passResult$field = param1;
      }
      
      public function get passResult() : uint
      {
         return this.passResult$field;
      }
      
      public function clearLogs() : void
      {
         this.logs$field = null;
      }
      
      public function get hasLogs() : Boolean
      {
         return this.logs$field != null;
      }
      
      public function set logs(param1:String) : void
      {
         this.logs$field = param1;
      }
      
      public function get logs() : String
      {
         return this.logs$field;
      }
      
      public function clearBytelogs() : void
      {
         this.bytelogs$field = null;
      }
      
      public function get hasBytelogs() : Boolean
      {
         return this.bytelogs$field != null;
      }
      
      public function set bytelogs(param1:ByteArray) : void
      {
         this.bytelogs$field = param1;
      }
      
      public function get bytelogs() : ByteArray
      {
         return this.bytelogs$field;
      }
      
      public function clearSrcsize() : void
      {
         this.hasField$0 &= 4294967279;
         this.srcsize$field = new uint();
      }
      
      public function get hasSrcsize() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set srcsize(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.srcsize$field = param1;
      }
      
      public function get srcsize() : uint
      {
         return this.srcsize$field;
      }
      
      public function clearBRepeat() : void
      {
         this.hasField$0 &= 4294967263;
         this.bRepeat$field = new Boolean();
      }
      
      public function get hasBRepeat() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set bRepeat(param1:Boolean) : void
      {
         this.hasField$0 |= 32;
         this.bRepeat$field = param1;
      }
      
      public function get bRepeat() : Boolean
      {
         return this.bRepeat$field;
      }
      
      public function clearChallengeLevelId() : void
      {
         this.hasField$0 &= 4294967231;
         this.challengeLevelId$field = new uint();
      }
      
      public function get hasChallengeLevelId() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set challengeLevelId(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.challengeLevelId$field = param1;
      }
      
      public function get challengeLevelId() : uint
      {
         return this.challengeLevelId$field;
      }
      
      public function clearScore() : void
      {
         this.hasField$0 &= 4294967167;
         this.score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.score$field = param1;
      }
      
      public function get score() : uint
      {
         return this.score$field;
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
         if(this.hasPassResult)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.passResult$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.achievementList.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.achievementList[_loc2_]);
            _loc2_++;
         }
         if(this.hasLogs)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_STRING(param1,this.logs$field);
         }
         if(this.hasBytelogs)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_BYTES(param1,this.bytelogs$field);
         }
         if(this.hasSrcsize)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.srcsize$field);
         }
         if(this.hasBRepeat)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_BOOL(param1,this.bRepeat$field);
         }
         if(this.hasChallengeLevelId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.challengeLevelId$field);
         }
         if(this.hasScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.score$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Cmd_TD_ReportLevelResult_CS.stageId cannot be set twice.");
                  }
                  _loc3_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_ReportLevelResult_CS.levelId cannot be set twice.");
                  }
                  _loc4_++;
                  this.levelId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_ReportLevelResult_CS.subLevelId cannot be set twice.");
                  }
                  _loc5_++;
                  this.subLevelId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_ReportLevelResult_CS.passResult cannot be set twice.");
                  }
                  _loc6_++;
                  this.passResult = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if((_loc13_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.achievementList);
                  }
                  else
                  {
                     this.achievementList.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_ReportLevelResult_CS.logs cannot be set twice.");
                  }
                  _loc7_++;
                  this.logs = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_ReportLevelResult_CS.bytelogs cannot be set twice.");
                  }
                  _loc8_++;
                  this.bytelogs = ReadUtils.read$TYPE_BYTES(param1);
                  break;
               case 8:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_ReportLevelResult_CS.srcsize cannot be set twice.");
                  }
                  _loc9_++;
                  this.srcsize = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_ReportLevelResult_CS.bRepeat cannot be set twice.");
                  }
                  _loc10_++;
                  this.bRepeat = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 10:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_ReportLevelResult_CS.challengeLevelId cannot be set twice.");
                  }
                  _loc11_++;
                  this.challengeLevelId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TD_ReportLevelResult_CS.score cannot be set twice.");
                  }
                  _loc12_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc13_);
                  break;
            }
         }
      }
   }
}
