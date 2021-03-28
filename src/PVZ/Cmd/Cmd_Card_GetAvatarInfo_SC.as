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
   
   public final class Cmd_Card_GetAvatarInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Card_GetAvatarInfo_SC";
      
      public static const AVATARLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Card_GetAvatarInfo_SC.avatarList","avatarList",1 << 3 | WireType.LENGTH_DELIMITED,Dto_AvatarInfo);
      
      public static const AVATARALLATTR:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Card_GetAvatarInfo_SC.avatarAllAttr","avatarAllAttr",2 << 3 | WireType.LENGTH_DELIMITED,Dto_AvatarAllAttr);
       
      
      public var avatarList:Array;
      
      private var avatarAllAttr$field:Dto_AvatarAllAttr;
      
      public function Cmd_Card_GetAvatarInfo_SC()
      {
         this.avatarList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Card_GetAvatarInfo_SC.$MessageID;
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
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.avatarList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.avatarList[_loc2_]);
            _loc2_++;
         }
         if(this.hasAvatarAllAttr)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.avatarAllAttr$field);
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
                  this.avatarList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_AvatarInfo()));
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Card_GetAvatarInfo_SC.avatarAllAttr cannot be set twice.");
                  }
                  _loc3_++;
                  this.avatarAllAttr = new Dto_AvatarAllAttr();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.avatarAllAttr);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
