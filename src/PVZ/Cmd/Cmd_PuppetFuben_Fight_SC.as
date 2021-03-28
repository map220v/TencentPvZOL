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
   
   public final class Cmd_PuppetFuben_Fight_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_PuppetFuben_Fight_SC";
      
      public static const CHAPTERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_PuppetFuben_Fight_SC.chapterId","chapterId",1 << 3 | WireType.VARINT);
      
      public static const MODEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_PuppetFuben_Fight_SC.modeId","modeId",2 << 3 | WireType.VARINT);
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_PuppetFuben_Fight_SC.stageId","stageId",3 << 3 | WireType.VARINT);
      
      public static const SUBSTAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_PuppetFuben_Fight_SC.subStageId","subStageId",4 << 3 | WireType.VARINT);
      
      public static const REPORT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_PuppetFuben_Fight_SC.report","report",5 << 3 | WireType.LENGTH_DELIMITED,Dto_FightReport);
       
      
      private var chapterId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var modeId$field:uint;
      
      private var stageId$field:uint;
      
      private var subStageId$field:uint;
      
      private var report$field:Dto_FightReport;
      
      public function Cmd_PuppetFuben_Fight_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_PuppetFuben_Fight_SC.$MessageID;
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
      
      public function clearStageId() : void
      {
         this.hasField$0 &= 4294967291;
         this.stageId$field = new uint();
      }
      
      public function get hasStageId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set stageId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.stageId$field = param1;
      }
      
      public function get stageId() : uint
      {
         return this.stageId$field;
      }
      
      public function clearSubStageId() : void
      {
         this.hasField$0 &= 4294967287;
         this.subStageId$field = new uint();
      }
      
      public function get hasSubStageId() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set subStageId(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.subStageId$field = param1;
      }
      
      public function get subStageId() : uint
      {
         return this.subStageId$field;
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
         if(this.hasStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.stageId$field);
         }
         if(this.hasSubStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.subStageId$field);
         }
         if(this.hasReport)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.report$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Cmd_PuppetFuben_Fight_SC.chapterId cannot be set twice.");
                  }
                  _loc3_++;
                  this.chapterId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PuppetFuben_Fight_SC.modeId cannot be set twice.");
                  }
                  _loc4_++;
                  this.modeId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PuppetFuben_Fight_SC.stageId cannot be set twice.");
                  }
                  _loc5_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PuppetFuben_Fight_SC.subStageId cannot be set twice.");
                  }
                  _loc6_++;
                  this.subStageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PuppetFuben_Fight_SC.report cannot be set twice.");
                  }
                  _loc7_++;
                  this.report = new Dto_FightReport();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.report);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
