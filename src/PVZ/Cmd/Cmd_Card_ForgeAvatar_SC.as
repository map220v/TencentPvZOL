package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Card_ForgeAvatar_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Card_ForgeAvatar_SC";
      
      public static const CARDUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Card_ForgeAvatar_SC.cardUId","cardUId",1 << 3 | WireType.VARINT);
      
      public static const AVATARINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Card_ForgeAvatar_SC.avatarInfo","avatarInfo",2 << 3 | WireType.LENGTH_DELIMITED,Dto_AvatarInfo);
      
      public static const AVATARALLATTR:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Card_ForgeAvatar_SC.avatarAllAttr","avatarAllAttr",3 << 3 | WireType.LENGTH_DELIMITED,Dto_AvatarAllAttr);
       
      
      private var cardUId$field:Int64;
      
      private var avatarInfo$field:Dto_AvatarInfo;
      
      private var avatarAllAttr$field:Dto_AvatarAllAttr;
      
      public function Cmd_Card_ForgeAvatar_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Card_ForgeAvatar_SC.$MessageID;
      }
      
      public function clearCardUId() : void
      {
         this.cardUId$field = null;
      }
      
      public function get hasCardUId() : Boolean
      {
         return this.cardUId$field != null;
      }
      
      public function set cardUId(param1:Int64) : void
      {
         this.cardUId$field = param1;
      }
      
      public function get cardUId() : Int64
      {
         return this.cardUId$field;
      }
      
      public function clearAvatarInfo() : void
      {
         this.avatarInfo$field = null;
      }
      
      public function get hasAvatarInfo() : Boolean
      {
         return this.avatarInfo$field != null;
      }
      
      public function set avatarInfo(param1:Dto_AvatarInfo) : void
      {
         this.avatarInfo$field = param1;
      }
      
      public function get avatarInfo() : Dto_AvatarInfo
      {
         return this.avatarInfo$field;
      }
      
      public function clearAvatarAllAttr() : void
      {
         this.avatarAllAttr$field = null;
      }
      
      public function get hasAvatarAllAttr() : Boolean
      {
         return this.avatarAllAttr$field != null;
      }
      
      public function set avatarAllAttr(param1:Dto_AvatarAllAttr) : void
      {
         this.avatarAllAttr$field = param1;
      }
      
      public function get avatarAllAttr() : Dto_AvatarAllAttr
      {
         return this.avatarAllAttr$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasCardUId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.cardUId$field);
         }
         if(this.hasAvatarInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.avatarInfo$field);
         }
         if(this.hasAvatarAllAttr)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.avatarAllAttr$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_ForgeAvatar_SC.cardUId cannot be set twice.");
                  }
                  _loc3_++;
                  this.cardUId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_ForgeAvatar_SC.avatarInfo cannot be set twice.");
                  }
                  _loc4_++;
                  this.avatarInfo = new Dto_AvatarInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.avatarInfo);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_ForgeAvatar_SC.avatarAllAttr cannot be set twice.");
                  }
                  _loc5_++;
                  this.avatarAllAttr = new Dto_AvatarAllAttr();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.avatarAllAttr);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
