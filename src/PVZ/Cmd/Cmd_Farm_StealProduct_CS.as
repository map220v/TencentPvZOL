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
   
   public final class Cmd_Farm_StealProduct_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Farm_StealProduct_CS";
      
      public static const BLOCKID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Farm_StealProduct_CS.blockId","blockId",1 << 3 | WireType.VARINT);
      
      public static const FRIENDINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Farm_StealProduct_CS.friendInfo","friendInfo",2 << 3 | WireType.LENGTH_DELIMITED,Dto_FriendInfo);
       
      
      private var blockId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var friendInfo$field:Dto_FriendInfo;
      
      public function Cmd_Farm_StealProduct_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Farm_StealProduct_CS.$MessageID;
      }
      
      public function clearBlockId() : void
      {
         this.hasField$0 &= 4294967294;
         this.blockId$field = new uint();
      }
      
      public function get hasBlockId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set blockId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.blockId$field = param1;
      }
      
      public function get blockId() : uint
      {
         return this.blockId$field;
      }
      
      public function clearFriendInfo() : void
      {
         this.friendInfo$field = null;
      }
      
      public function get hasFriendInfo() : Boolean
      {
         return this.friendInfo$field != null;
      }
      
      public function set friendInfo(param1:Dto_FriendInfo) : void
      {
         this.friendInfo$field = param1;
      }
      
      public function get friendInfo() : Dto_FriendInfo
      {
         return this.friendInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasBlockId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.blockId$field);
         }
         if(this.hasFriendInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.friendInfo$field);
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
                     throw new IOError("Bad data format: Cmd_Farm_StealProduct_CS.blockId cannot be set twice.");
                  }
                  _loc3_++;
                  this.blockId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Farm_StealProduct_CS.friendInfo cannot be set twice.");
                  }
                  _loc4_++;
                  this.friendInfo = new Dto_FriendInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.friendInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
