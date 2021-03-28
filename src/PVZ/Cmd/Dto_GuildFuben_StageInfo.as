package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.UInt64;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_GuildFuben_StageInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_GuildFuben_StageInfo";
      
      public static const CHAPTERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFuben_StageInfo.chapterId","chapterId",1 << 3 | WireType.VARINT);
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFuben_StageInfo.stageId","stageId",2 << 3 | WireType.VARINT);
      
      public static const MAXHP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("PVZ.Cmd.Dto_GuildFuben_StageInfo.maxHp","maxHp",6 << 3 | WireType.VARINT);
      
      public static const CURHP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("PVZ.Cmd.Dto_GuildFuben_StageInfo.curHp","curHp",7 << 3 | WireType.VARINT);
       
      
      private var chapterId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var stageId$field:uint;
      
      private var maxHp$field:UInt64;
      
      private var curHp$field:UInt64;
      
      public function Dto_GuildFuben_StageInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_GuildFuben_StageInfo.$MessageID;
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
      
      public function clearStageId() : void
      {
         this.hasField$0 &= 4294967293;
         this.stageId$field = new uint();
      }
      
      public function get hasStageId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set stageId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.stageId$field = param1;
      }
      
      public function get stageId() : uint
      {
         return this.stageId$field;
      }
      
      public function clearMaxHp() : void
      {
         this.maxHp$field = null;
      }
      
      public function get hasMaxHp() : Boolean
      {
         return this.maxHp$field != null;
      }
      
      public function set maxHp(param1:UInt64) : void
      {
         this.maxHp$field = param1;
      }
      
      public function get maxHp() : UInt64
      {
         return this.maxHp$field;
      }
      
      public function clearCurHp() : void
      {
         this.curHp$field = null;
      }
      
      public function get hasCurHp() : Boolean
      {
         return this.curHp$field != null;
      }
      
      public function set curHp(param1:UInt64) : void
      {
         this.curHp$field = param1;
      }
      
      public function get curHp() : UInt64
      {
         return this.curHp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasChapterId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.chapterId$field);
         }
         if(this.hasStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.stageId$field);
         }
         if(this.hasMaxHp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT64(param1,this.maxHp$field);
         }
         if(this.hasCurHp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT64(param1,this.curHp$field);
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
                     throw new IOError("Bad data format: Dto_GuildFuben_StageInfo.chapterId cannot be set twice.");
                  }
                  _loc3_++;
                  this.chapterId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFuben_StageInfo.stageId cannot be set twice.");
                  }
                  _loc4_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFuben_StageInfo.maxHp cannot be set twice.");
                  }
                  _loc5_++;
                  this.maxHp = ReadUtils.read$TYPE_UINT64(param1);
                  break;
               case 7:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFuben_StageInfo.curHp cannot be set twice.");
                  }
                  _loc6_++;
                  this.curHp = ReadUtils.read$TYPE_UINT64(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
