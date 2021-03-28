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
   
   public final class Cmd_GuildSkill_Upgrade_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_GuildSkill_Upgrade_SC";
      
      public static const INFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GuildSkill_Upgrade_SC.info","info",1 << 3 | WireType.LENGTH_DELIMITED,Dto_SkillInfo);
       
      
      private var info$field:Dto_SkillInfo;
      
      public function Cmd_GuildSkill_Upgrade_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_GuildSkill_Upgrade_SC.$MessageID;
      }
      
      public function clearInfo() : void
      {
         this.info$field = null;
      }
      
      public function get hasInfo() : Boolean
      {
         return this.info$field != null;
      }
      
      public function set info(param1:Dto_SkillInfo) : void
      {
         this.info$field = param1;
      }
      
      public function get info() : Dto_SkillInfo
      {
         return this.info$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.info$field);
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
                     throw new IOError("Bad data format: Cmd_GuildSkill_Upgrade_SC.info cannot be set twice.");
                  }
                  _loc3_++;
                  this.info = new Dto_SkillInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.info);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
