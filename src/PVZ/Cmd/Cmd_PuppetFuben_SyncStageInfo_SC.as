package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_PuppetFuben_SyncStageInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_PuppetFuben_SyncStageInfo_SC";
      
      public static const CHAPTERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_PuppetFuben_SyncStageInfo_SC.chapterId","chapterId",1 << 3 | WireType.VARINT);
      
      public static const MODEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_PuppetFuben_SyncStageInfo_SC.modeId","modeId",2 << 3 | WireType.VARINT);
      
      public static const STAGEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_PuppetFuben_SyncStageInfo_SC.stageInfo","stageInfo",3 << 3 | WireType.LENGTH_DELIMITED,Dto_PuppetFuben_StageInfo);
      
      public static const FIGHTTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_PuppetFuben_SyncStageInfo_SC.fightTimes","fightTimes",4 << 3 | WireType.VARINT);
       
      
      private var chapterId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var modeId$field:uint;
      
      private var stageInfo$field:Dto_PuppetFuben_StageInfo;
      
      private var fightTimes$field:uint;
      
      public function Cmd_PuppetFuben_SyncStageInfo_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_PuppetFuben_SyncStageInfo_SC.$MessageID;
      }
      
      public function clearChapterId() : void
      {
         this.hasField$0 &= 4294967294;
         this.chapterId$field = new uint();
      }
      
      public function get hasChapterId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set chapterId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.chapterId$field = param1;
      }
      
      public function get chapterId() : uint
      {
         return this.chapterId$field;
      }
      
      public function clearModeId() : void
      {
         this.hasField$0 &= 4294967293;
         this.modeId$field = new uint();
      }
      
      public function get hasModeId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set modeId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.modeId$field = param1;
      }
      
      public function get modeId() : uint
      {
         return this.modeId$field;
      }
      
      public function clearStageInfo() : void
      {
         this.stageInfo$field = null;
      }
      
      public function get hasStageInfo() : Boolean
      {
         return this.stageInfo$field != null;
      }
      
      public function set stageInfo(param1:Dto_PuppetFuben_StageInfo) : void
      {
         this.stageInfo$field = param1;
      }
      
      public function get stageInfo() : Dto_PuppetFuben_StageInfo
      {
         return this.stageInfo$field;
      }
      
      public function clearFightTimes() : void
      {
         this.hasField$0 &= 4294967291;
         this.fightTimes$field = new uint();
      }
      
      public function get hasFightTimes() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set fightTimes(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.fightTimes$field = param1;
      }
      
      public function get fightTimes() : uint
      {
         return this.fightTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasChapterId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.chapterId$field);
         }
         if(this.hasModeId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.modeId$field);
         }
         if(this.hasStageInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.stageInfo$field);
         }
         if(this.hasFightTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.fightTimes$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc7_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PuppetFuben_SyncStageInfo_SC.chapterId cannot be set twice.");
                  }
                  _loc3_++;
                  this.chapterId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PuppetFuben_SyncStageInfo_SC.modeId cannot be set twice.");
                  }
                  _loc4_++;
                  this.modeId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PuppetFuben_SyncStageInfo_SC.stageInfo cannot be set twice.");
                  }
                  _loc5_++;
                  this.stageInfo = new Dto_PuppetFuben_StageInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.stageInfo);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PuppetFuben_SyncStageInfo_SC.fightTimes cannot be set twice.");
                  }
                  _loc6_++;
                  this.fightTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
