package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_TopFight_WinnerLogin_GC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_TopFight_WinnerLogin_GC";
      
      public static const MSGID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_TopFight_WinnerLogin_GC.msgId","msgId",1 << 3 | WireType.VARINT);
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_TopFight_WinnerLogin_GC.roleName","roleName",2 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var msgId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var roleName$field:String;
      
      public function Cmd_TopFight_WinnerLogin_GC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_TopFight_WinnerLogin_GC.$MessageID;
      }
      
      public function clearMsgId() : void
      {
         this.hasField$0 &= 4294967294;
         this.msgId$field = new uint();
      }
      
      public function get hasMsgId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set msgId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.msgId$field = param1;
      }
      
      public function get msgId() : uint
      {
         return this.msgId$field;
      }
      
      public function clearRoleName() : void
      {
         this.roleName$field = null;
      }
      
      public function get hasRoleName() : Boolean
      {
         return this.roleName$field != null;
      }
      
      public function set roleName(param1:String) : void
      {
         this.roleName$field = param1;
      }
      
      public function get roleName() : String
      {
         return this.roleName$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasMsgId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.msgId$field);
         }
         if(this.hasRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.roleName$field);
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
                     throw new IOError("Bad data format: Cmd_TopFight_WinnerLogin_GC.msgId cannot be set twice.");
                  }
                  _loc3_++;
                  this.msgId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_WinnerLogin_GC.roleName cannot be set twice.");
                  }
                  _loc4_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
