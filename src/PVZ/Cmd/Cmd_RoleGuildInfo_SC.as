package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_RoleGuildInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_RoleGuildInfo_SC";
      
      public static const ROLEGUILDINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_RoleGuildInfo_SC.roleGuildInfo","roleGuildInfo",1 << 3 | WireType.LENGTH_DELIMITED,Dto_Role_GuildInfo);
       
      
      private var roleGuildInfo$field:Dto_Role_GuildInfo;
      
      public function Cmd_RoleGuildInfo_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_RoleGuildInfo_SC.$MessageID;
      }
      
      public function clearRoleGuildInfo() : void
      {
         this.roleGuildInfo$field = null;
      }
      
      public function get hasRoleGuildInfo() : Boolean
      {
         return this.roleGuildInfo$field != null;
      }
      
      public function set roleGuildInfo(param1:Dto_Role_GuildInfo) : void
      {
         this.roleGuildInfo$field = param1;
      }
      
      public function get roleGuildInfo() : Dto_Role_GuildInfo
      {
         return this.roleGuildInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRoleGuildInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.roleGuildInfo$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Cmd_RoleGuildInfo_SC.roleGuildInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleGuildInfo = new Dto_Role_GuildInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.roleGuildInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
