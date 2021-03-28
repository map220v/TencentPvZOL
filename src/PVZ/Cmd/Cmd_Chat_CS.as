package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Chat_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Chat_CS";
      
      public static const CHATDATA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Chat_CS.chatData","chatData",1 << 3 | WireType.LENGTH_DELIMITED,Dto_Chat);
      
      public static const OBJTYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Cmd_Chat_CS.objType","objType",2 << 3 | WireType.VARINT,ObjInfoType);
      
      public static const OBJUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Chat_CS.objUid","objUid",3 << 3 | WireType.VARINT);
       
      
      private var chatData$field:Dto_Chat;
      
      private var objType$field:int;
      
      private var hasField$0:uint = 0;
      
      private var objUid$field:Int64;
      
      public function Cmd_Chat_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Chat_CS.$MessageID;
      }
      
      public function clearChatData() : void
      {
         this.chatData$field = null;
      }
      
      public function get hasChatData() : Boolean
      {
         return this.chatData$field != null;
      }
      
      public function set chatData(param1:Dto_Chat) : void
      {
         this.chatData$field = param1;
      }
      
      public function get chatData() : Dto_Chat
      {
         return this.chatData$field;
      }
      
      public function clearObjType() : void
      {
         this.hasField$0 &= 4294967294;
         this.objType$field = new int();
      }
      
      public function get hasObjType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set objType(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.objType$field = param1;
      }
      
      public function get objType() : int
      {
         return this.objType$field;
      }
      
      public function clearObjUid() : void
      {
         this.objUid$field = null;
      }
      
      public function get hasObjUid() : Boolean
      {
         return this.objUid$field != null;
      }
      
      public function set objUid(param1:Int64) : void
      {
         this.objUid$field = param1;
      }
      
      public function get objUid() : Int64
      {
         return this.objUid$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasChatData)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.chatData$field);
         }
         if(this.hasObjType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_ENUM(param1,this.objType$field);
         }
         if(this.hasObjUid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_INT64(param1,this.objUid$field);
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
                     throw new IOError("Bad data format: Cmd_Chat_CS.chatData cannot be set twice.");
                  }
                  _loc3_++;
                  this.chatData = new Dto_Chat();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.chatData);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Chat_CS.objType cannot be set twice.");
                  }
                  _loc4_++;
                  this.objType = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Chat_CS.objUid cannot be set twice.");
                  }
                  _loc5_++;
                  this.objUid = ReadUtils.read$TYPE_INT64(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
