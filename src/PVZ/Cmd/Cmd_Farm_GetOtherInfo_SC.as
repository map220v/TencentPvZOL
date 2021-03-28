package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Farm_GetOtherInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Farm_GetOtherInfo_SC";
      
      public static const FRIENDINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Farm_GetOtherInfo_SC.friendInfo","friendInfo",1 << 3 | WireType.LENGTH_DELIMITED,Dto_FriendInfo);
      
      public static const BLOCKS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Farm_GetOtherInfo_SC.blocks","blocks",2 << 3 | WireType.LENGTH_DELIMITED,Dto_Farm_BlockInfo);
       
      
      private var friendInfo$field:Dto_FriendInfo;
      
      public var blocks:Array;
      
      public function Cmd_Farm_GetOtherInfo_SC()
      {
         this.blocks = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Farm_GetOtherInfo_SC.$MessageID;
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
         var _loc3_:* = undefined;
         if(this.hasFriendInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.friendInfo$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.blocks.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.blocks[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc4_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Farm_GetOtherInfo_SC.friendInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.friendInfo = new Dto_FriendInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.friendInfo);
                  break;
               case 2:
                  this.blocks.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Farm_BlockInfo()));
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
