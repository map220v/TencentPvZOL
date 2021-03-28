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
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_GuildFuben_ChapterInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_GuildFuben_ChapterInfo";
      
      public static const CHAPTERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFuben_ChapterInfo.chapterId","chapterId",1 << 3 | WireType.VARINT);
      
      public static const TIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFuben_ChapterInfo.times","times",2 << 3 | WireType.VARINT);
      
      public static const OPENTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFuben_ChapterInfo.openTime","openTime",3 << 3 | WireType.VARINT);
      
      public static const CHAPTERSTATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFuben_ChapterInfo.chapterStatus","chapterStatus",4 << 3 | WireType.VARINT);
      
      public static const CURSTAGE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_GuildFuben_ChapterInfo.curStage","curStage",5 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFuben_StageInfo);
      
      public static const PASSCHAPTER:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_GuildFuben_ChapterInfo.passChapter","passChapter",6 << 3 | WireType.VARINT);
       
      
      private var chapterId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var times$field:uint;
      
      private var openTime$field:uint;
      
      private var chapterStatus$field:uint;
      
      private var curStage$field:Dto_GuildFuben_StageInfo;
      
      private var passChapter$field:Boolean;
      
      public function Dto_GuildFuben_ChapterInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_GuildFuben_ChapterInfo.$MessageID;
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
      
      public function clearTimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.times$field = new uint();
      }
      
      public function get hasTimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set times(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.times$field = param1;
      }
      
      public function get times() : uint
      {
         return this.times$field;
      }
      
      public function clearOpenTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.openTime$field = new uint();
      }
      
      public function get hasOpenTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set openTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.openTime$field = param1;
      }
      
      public function get openTime() : uint
      {
         return this.openTime$field;
      }
      
      public function clearChapterStatus() : void
      {
         this.hasField$0 &= 4294967287;
         this.chapterStatus$field = new uint();
      }
      
      public function get hasChapterStatus() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set chapterStatus(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.chapterStatus$field = param1;
      }
      
      public function get chapterStatus() : uint
      {
         return this.chapterStatus$field;
      }
      
      public function clearCurStage() : void
      {
         this.curStage$field = null;
      }
      
      public function get hasCurStage() : Boolean
      {
         return this.curStage$field != null;
      }
      
      public function set curStage(param1:Dto_GuildFuben_StageInfo) : void
      {
         this.curStage$field = param1;
      }
      
      public function get curStage() : Dto_GuildFuben_StageInfo
      {
         return this.curStage$field;
      }
      
      public function clearPassChapter() : void
      {
         this.hasField$0 &= 4294967279;
         this.passChapter$field = new Boolean();
      }
      
      public function get hasPassChapter() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set passChapter(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.passChapter$field = param1;
      }
      
      public function get passChapter() : Boolean
      {
         return this.passChapter$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasChapterId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.chapterId$field);
         }
         if(this.hasTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.times$field);
         }
         if(this.hasOpenTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.openTime$field);
         }
         if(this.hasChapterStatus)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.chapterStatus$field);
         }
         if(this.hasCurStage)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.curStage$field);
         }
         if(this.hasPassChapter)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_BOOL(param1,this.passChapter$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Dto_GuildFuben_ChapterInfo.chapterId cannot be set twice.");
                  }
                  _loc3_++;
                  this.chapterId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFuben_ChapterInfo.times cannot be set twice.");
                  }
                  _loc4_++;
                  this.times = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFuben_ChapterInfo.openTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.openTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFuben_ChapterInfo.chapterStatus cannot be set twice.");
                  }
                  _loc6_++;
                  this.chapterStatus = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFuben_ChapterInfo.curStage cannot be set twice.");
                  }
                  _loc7_++;
                  this.curStage = new Dto_GuildFuben_StageInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.curStage);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFuben_ChapterInfo.passChapter cannot be set twice.");
                  }
                  _loc8_++;
                  this.passChapter = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
