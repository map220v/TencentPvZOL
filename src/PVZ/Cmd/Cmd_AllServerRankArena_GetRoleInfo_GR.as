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
   
   public final class Cmd_AllServerRankArena_GetRoleInfo_GR extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_AllServerRankArena_GetRoleInfo_GR";
      
      public static const ROLEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_AllServerRankArena_GetRoleInfo_GR.roleInfo","roleInfo",1 << 3 | WireType.LENGTH_DELIMITED,Dto_AllServerRankArenaRoleInfo);
       
      
      private var roleInfo$field:Dto_AllServerRankArenaRoleInfo;
      
      public function Cmd_AllServerRankArena_GetRoleInfo_GR()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_AllServerRankArena_GetRoleInfo_GR.$MessageID;
      }
      
      public function clearRoleInfo() : void
      {
         this.roleInfo$field = null;
      }
      
      public function get hasRoleInfo() : Boolean
      {
         return this.roleInfo$field != null;
      }
      
      public function set roleInfo(param1:Dto_AllServerRankArenaRoleInfo) : void
      {
         this.roleInfo$field = param1;
      }
      
      public function get roleInfo() : Dto_AllServerRankArenaRoleInfo
      {
         return this.roleInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRoleInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.roleInfo$field);
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
                     throw new IOError("Bad data format: Cmd_AllServerRankArena_GetRoleInfo_GR.roleInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleInfo = new Dto_AllServerRankArenaRoleInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.roleInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
