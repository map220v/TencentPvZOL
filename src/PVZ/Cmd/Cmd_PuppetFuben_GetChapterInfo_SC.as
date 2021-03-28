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
   
   public final class Cmd_PuppetFuben_GetChapterInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_PuppetFuben_GetChapterInfo_SC";
      
      public static const LASTPASSEASYCHAPTERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_PuppetFuben_GetChapterInfo_SC.lastPassEasyChapterId","lastPassEasyChapterId",1 << 3 | WireType.VARINT);
      
      public static const LASTPASSHARDCHAPTERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_PuppetFuben_GetChapterInfo_SC.lastPassHardChapterId","lastPassHardChapterId",2 << 3 | WireType.VARINT);
       
      
      private var lastPassEasyChapterId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var lastPassHardChapterId$field:uint;
      
      public function Cmd_PuppetFuben_GetChapterInfo_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_PuppetFuben_GetChapterInfo_SC.$MessageID;
      }
      
      public function clearLastPassEasyChapterId() : void
      {
         this.hasField$0 &= 4294967294;
         this.lastPassEasyChapterId$field = new uint();
      }
      
      public function get hasLastPassEasyChapterId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set lastPassEasyChapterId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.lastPassEasyChapterId$field = param1;
      }
      
      public function get lastPassEasyChapterId() : uint
      {
         return this.lastPassEasyChapterId$field;
      }
      
      public function clearLastPassHardChapterId() : void
      {
         this.hasField$0 &= 4294967293;
         this.lastPassHardChapterId$field = new uint();
      }
      
      public function get hasLastPassHardChapterId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set lastPassHardChapterId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.lastPassHardChapterId$field = param1;
      }
      
      public function get lastPassHardChapterId() : uint
      {
         return this.lastPassHardChapterId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasLastPassEasyChapterId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.lastPassEasyChapterId$field);
         }
         if(this.hasLastPassHardChapterId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.lastPassHardChapterId$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PuppetFuben_GetChapterInfo_SC.lastPassEasyChapterId cannot be set twice.");
                  }
                  _loc3_++;
                  this.lastPassEasyChapterId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PuppetFuben_GetChapterInfo_SC.lastPassHardChapterId cannot be set twice.");
                  }
                  _loc4_++;
                  this.lastPassHardChapterId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
