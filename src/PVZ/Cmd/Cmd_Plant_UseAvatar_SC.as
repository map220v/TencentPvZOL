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
   
   public final class Cmd_Plant_UseAvatar_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Plant_UseAvatar_SC";
      
      public static const PLANTID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Plant_UseAvatar_SC.plantId","plantId",1 << 3 | WireType.VARINT);
      
      public static const AVATARID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Plant_UseAvatar_SC.avatarId","avatarId",2 << 3 | WireType.VARINT);
       
      
      private var plantId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var avatarId$field:uint;
      
      public function Cmd_Plant_UseAvatar_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Plant_UseAvatar_SC.$MessageID;
      }
      
      public function clearPlantId() : void
      {
         this.hasField$0 &= 4294967294;
         this.plantId$field = new uint();
      }
      
      public function get hasPlantId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set plantId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.plantId$field = param1;
      }
      
      public function get plantId() : uint
      {
         return this.plantId$field;
      }
      
      public function clearAvatarId() : void
      {
         this.hasField$0 &= 4294967293;
         this.avatarId$field = new uint();
      }
      
      public function get hasAvatarId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set avatarId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.avatarId$field = param1;
      }
      
      public function get avatarId() : uint
      {
         return this.avatarId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasPlantId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.plantId$field);
         }
         if(this.hasAvatarId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.avatarId$field);
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
                     throw new IOError("Bad data format: Cmd_Plant_UseAvatar_SC.plantId cannot be set twice.");
                  }
                  _loc3_++;
                  this.plantId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Plant_UseAvatar_SC.avatarId cannot be set twice.");
                  }
                  _loc4_++;
                  this.avatarId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
