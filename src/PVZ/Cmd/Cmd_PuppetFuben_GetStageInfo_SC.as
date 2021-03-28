package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_PuppetFuben_GetStageInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_PuppetFuben_GetStageInfo_SC";
      
      public static const CHAPTERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_PuppetFuben_GetStageInfo_SC.chapterId","chapterId",1 << 3 | WireType.VARINT);
      
      public static const MODEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_PuppetFuben_GetStageInfo_SC.modeId","modeId",2 << 3 | WireType.VARINT);
      
      public static const STAGEINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_PuppetFuben_GetStageInfo_SC.stageInfo","stageInfo",3 << 3 | WireType.LENGTH_DELIMITED,Dto_PuppetFuben_StageInfo);
      
      public static const FIGHTTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_PuppetFuben_GetStageInfo_SC.fightTimes","fightTimes",4 << 3 | WireType.VARINT);
       
      
      private var chapterId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var modeId$field:uint;
      
      public var stageInfo:Array;
      
      private var fightTimes$field:uint;
      
      public function Cmd_PuppetFuben_GetStageInfo_SC()
      {
         this.stageInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_PuppetFuben_GetStageInfo_SC.$MessageID;
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
         var _loc3_:* = undefined;
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
         var _loc2_:uint = 0;
         while(_loc2_ < this.stageInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.stageInfo[_loc2_]);
            _loc2_++;
         }
         if(this.hasFightTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.fightTimes$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Cmd_PuppetFuben_GetStageInfo_SC.chapterId cannot be set twice.");
                  }
                  _loc3_++;
                  this.chapterId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PuppetFuben_GetStageInfo_SC.modeId cannot be set twice.");
                  }
                  _loc4_++;
                  this.modeId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  this.stageInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_PuppetFuben_StageInfo()));
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PuppetFuben_GetStageInfo_SC.fightTimes cannot be set twice.");
                  }
                  _loc5_++;
                  this.fightTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
