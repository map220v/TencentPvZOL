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
   
   public final class Dto_Plant_AvatarInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Plant_AvatarInfo";
      
      public static const AVATARID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Plant_AvatarInfo.avatarId","avatarId",1 << 3 | WireType.VARINT);
      
      public static const AVATARSTATUS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Plant_AvatarInfo.avatarStatus","avatarStatus",2 << 3 | WireType.VARINT);
       
      
      private var avatarId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var avatarStatus$field:uint;
      
      public function Dto_Plant_AvatarInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Plant_AvatarInfo.$MessageID;
      }
      
      public function clearAvatarId() : void
      {
         this.hasField$0 &= 4294967294;
         this.avatarId$field = new uint();
      }
      
      public function get hasAvatarId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set avatarId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.avatarId$field = param1;
      }
      
      public function get avatarId() : uint
      {
         return this.avatarId$field;
      }
      
      public function clearAvatarStatus() : void
      {
         this.hasField$0 &= 4294967293;
         this.avatarStatus$field = new uint();
      }
      
      public function get hasAvatarStatus() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set avatarStatus(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.avatarStatus$field = param1;
      }
      
      public function get avatarStatus() : uint
      {
         return this.avatarStatus$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasAvatarId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.avatarId$field);
         }
         if(this.hasAvatarStatus)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.avatarStatus$field);
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
                     throw new IOError("Bad data format: Dto_Plant_AvatarInfo.avatarId cannot be set twice.");
                  }
                  _loc3_++;
                  this.avatarId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Plant_AvatarInfo.avatarStatus cannot be set twice.");
                  }
                  _loc4_++;
                  this.avatarStatus = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
