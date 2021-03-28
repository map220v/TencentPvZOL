package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_GuildCreate_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_GuildCreate_CS";
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_GuildCreate_CS.name","name",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const FLAGINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GuildCreate_CS.flagInfo","flagInfo",2 << 3 | WireType.LENGTH_DELIMITED,Dto_Guild_FlagInfo);
       
      
      private var name$field:String;
      
      private var flagInfo$field:Dto_Guild_FlagInfo;
      
      public function Cmd_GuildCreate_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_GuildCreate_CS.$MessageID;
      }
      
      public function clearName() : void
      {
         this.name$field = null;
      }
      
      public function get hasName() : Boolean
      {
         return this.name$field != null;
      }
      
      public function set name(param1:String) : void
      {
         this.name$field = param1;
      }
      
      public function get name() : String
      {
         return this.name$field;
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
         if(this.hasName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_STRING(param1,this.name$field);
         }
         if(this.hasFlagInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.flagInfo$field);
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
                     throw new IOError("Bad data format: Cmd_GuildCreate_CS.name cannot be set twice.");
                  }
                  _loc3_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildCreate_CS.flagInfo cannot be set twice.");
                  }
                  _loc4_++;
                  this.flagInfo = new Dto_Guild_FlagInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.flagInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
