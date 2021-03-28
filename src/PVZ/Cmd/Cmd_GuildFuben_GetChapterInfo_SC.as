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
   
   public final class Cmd_GuildFuben_GetChapterInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_GuildFuben_GetChapterInfo_SC";
      
      public static const CHAPTERINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GuildFuben_GetChapterInfo_SC.chapterInfo","chapterInfo",1 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFuben_ChapterInfo);
      
      public static const GUILDCOHESION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFuben_GetChapterInfo_SC.guildCohesion","guildCohesion",2 << 3 | WireType.VARINT);
      
      public static const CURDAYCOHESION:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFuben_GetChapterInfo_SC.curDayCohesion","curDayCohesion",3 << 3 | WireType.VARINT);
       
      
      public var chapterInfo:Array;
      
      private var guildCohesion$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var curDayCohesion$field:uint;
      
      public function Cmd_GuildFuben_GetChapterInfo_SC()
      {
         this.chapterInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_GuildFuben_GetChapterInfo_SC.$MessageID;
      }
      
      public function clearGuildCohesion() : void
      {
         this.hasField$0 &= 4294967294;
         this.guildCohesion$field = new uint();
      }
      
      public function get hasGuildCohesion() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set guildCohesion(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.guildCohesion$field = param1;
      }
      
      public function get guildCohesion() : uint
      {
         return this.guildCohesion$field;
      }
      
      public function clearCurDayCohesion() : void
      {
         this.hasField$0 &= 4294967293;
         this.curDayCohesion$field = new uint();
      }
      
      public function get hasCurDayCohesion() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set curDayCohesion(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.curDayCohesion$field = param1;
      }
      
      public function get curDayCohesion() : uint
      {
         return this.curDayCohesion$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.chapterInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.chapterInfo[_loc2_]);
            _loc2_++;
         }
         if(this.hasGuildCohesion)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.guildCohesion$field);
         }
         if(this.hasCurDayCohesion)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.curDayCohesion$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc5_ >> 3)
            {
               case 1:
                  this.chapterInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_GuildFuben_ChapterInfo()));
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFuben_GetChapterInfo_SC.guildCohesion cannot be set twice.");
                  }
                  _loc3_++;
                  this.guildCohesion = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFuben_GetChapterInfo_SC.curDayCohesion cannot be set twice.");
                  }
                  _loc4_++;
                  this.curDayCohesion = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
