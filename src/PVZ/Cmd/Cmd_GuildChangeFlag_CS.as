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
   
   public final class Cmd_GuildChangeFlag_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_GuildChangeFlag_CS";
      
      public static const FLAGINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GuildChangeFlag_CS.flagInfo","flagInfo",1 << 3 | WireType.LENGTH_DELIMITED,Dto_Guild_FlagInfo);
       
      
      private var flagInfo$field:Dto_Guild_FlagInfo;
      
      public function Cmd_GuildChangeFlag_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_GuildChangeFlag_CS.$MessageID;
      }
      
      public function clearFlagInfo() : void
      {
         this.flagInfo$field = null;
      }
      
      public function get hasFlagInfo() : Boolean
      {
         return this.flagInfo$field != null;
      }
      
      public function set flagInfo(param1:Dto_Guild_FlagInfo) : void
      {
         this.flagInfo$field = param1;
      }
      
      public function get flagInfo() : Dto_Guild_FlagInfo
      {
         return this.flagInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasFlagInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.flagInfo$field);
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
                     throw new IOError("Bad data format: Cmd_GuildChangeFlag_CS.flagInfo cannot be set twice.");
                  }
                  _loc3_++;
                  this.flagInfo = new Dto_Guild_FlagInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.flagInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
