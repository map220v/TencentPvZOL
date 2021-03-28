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
   
   public final class Cmd_Buff_Sync_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Buff_Sync_SC";
      
      public static const BUFFS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Buff_Sync_SC.buffs","buffs",1 << 3 | WireType.LENGTH_DELIMITED,Dto_Buff_Info);
       
      
      private var buffs$field:Dto_Buff_Info;
      
      public function Cmd_Buff_Sync_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Buff_Sync_SC.$MessageID;
      }
      
      public function clearBuffs() : void
      {
         this.buffs$field = null;
      }
      
      public function get hasBuffs() : Boolean
      {
         return this.buffs$field != null;
      }
      
      public function set buffs(param1:Dto_Buff_Info) : void
      {
         this.buffs$field = param1;
      }
      
      public function get buffs() : Dto_Buff_Info
      {
         return this.buffs$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasBuffs)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.buffs$field);
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
                     throw new IOError("Bad data format: Cmd_Buff_Sync_SC.buffs cannot be set twice.");
                  }
                  _loc3_++;
                  this.buffs = new Dto_Buff_Info();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.buffs);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
