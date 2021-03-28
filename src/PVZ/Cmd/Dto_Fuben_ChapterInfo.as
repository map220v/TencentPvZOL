package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Fuben_ChapterInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Fuben_ChapterInfo";
      
      public static const CHAPTERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fuben_ChapterInfo.chapterid","chapterid",1 << 3 | WireType.VARINT);
      
      public static const STAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fuben_ChapterInfo.star","star",2 << 3 | WireType.VARINT);
      
      public static const LASTEASYSTAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fuben_ChapterInfo.lastEasyStageId","lastEasyStageId",3 << 3 | WireType.VARINT);
      
      public static const LASTHARDSTAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Fuben_ChapterInfo.lastHardStageId","lastHardStageId",4 << 3 | WireType.VARINT);
       
      
      private var chapterid$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var star$field:uint;
      
      private var lastEasyStageId$field:uint;
      
      private var lastHardStageId$field:uint;
      
      public function Dto_Fuben_ChapterInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Fuben_ChapterInfo.$MessageID;
      }
      
      public function clearChapterid() : void
      {
         this.hasField$0 &= 4294967294;
         this.chapterid$field = new uint();
      }
      
      public function get hasChapterid() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set chapterid(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.chapterid$field = param1;
      }
      
      public function get chapterid() : uint
      {
         return this.chapterid$field;
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
      
      public function clearLastEasyStageId() : void
      {
         this.hasField$0 &= 4294967291;
         this.lastEasyStageId$field = new uint();
      }
      
      public function get hasLastEasyStageId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set lastEasyStageId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.lastEasyStageId$field = param1;
      }
      
      public function get lastEasyStageId() : uint
      {
         return this.lastEasyStageId$field;
      }
      
      public function clearLastHardStageId() : void
      {
         this.hasField$0 &= 4294967287;
         this.lastHardStageId$field = new uint();
      }
      
      public function get hasLastHardStageId() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set lastHardStageId(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.lastHardStageId$field = param1;
      }
      
      public function get lastHardStageId() : uint
      {
         return this.lastHardStageId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasChapterid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.chapterid$field);
         }
         if(this.hasStar)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.star$field);
         }
         if(this.hasLastEasyStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.lastEasyStageId$field);
         }
         if(this.hasLastHardStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.lastHardStageId$field);
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
                     throw new IOError("Bad data format: Dto_Fuben_ChapterInfo.chapterid cannot be set twice.");
                  }
                  _loc3_++;
                  this.chapterid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fuben_ChapterInfo.star cannot be set twice.");
                  }
                  _loc4_++;
                  this.star = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fuben_ChapterInfo.lastEasyStageId cannot be set twice.");
                  }
                  _loc5_++;
                  this.lastEasyStageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Fuben_ChapterInfo.lastHardStageId cannot be set twice.");
                  }
                  _loc6_++;
                  this.lastHardStageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
