package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_ChatRoleInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ChatRoleInfo";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_ChatRoleInfo.roleId","roleId",3 << 3 | WireType.VARINT);
      
      public static const ROLENICK:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_ChatRoleInfo.roleNick","roleNick",4 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var roleId$field:Int64;
      
      private var roleNick$field:String;
      
      public function Dto_ChatRoleInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ChatRoleInfo.$MessageID;
      }
      
      public function clearRoleId() : void
      {
         this.roleId$field = null;
      }
      
      public function get hasRoleId() : Boolean
      {
         return this.roleId$field != null;
      }
      
      public function set roleId(param1:Int64) : void
      {
         this.roleId$field = param1;
      }
      
      public function get roleId() : Int64
      {
         return this.roleId$field;
      }
      
      public function clearRoleNick() : void
      {
         this.roleNick$field = null;
      }
      
      public function get hasRoleNick() : Boolean
      {
         return this.roleNick$field != null;
      }
      
      public function set roleNick(param1:String) : void
      {
         this.roleNick$field = param1;
      }
      
      public function get roleNick() : String
      {
         return this.roleNick$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasRoleNick)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_STRING(param1,this.roleNick$field);
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
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ChatRoleInfo.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ChatRoleInfo.roleNick cannot be set twice.");
                  }
                  _loc4_++;
                  this.roleNick = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
