package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_GuildList_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_GuildList_CS";
      
      public static const BEGINDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildList_CS.begIndex","begIndex",1 << 3 | WireType.VARINT);
      
      public static const ENDINDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildList_CS.endIndex","endIndex",2 << 3 | WireType.VARINT);
       
      
      private var begIndex$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var endIndex$field:uint;
      
      public function Cmd_GuildList_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_GuildList_CS.$MessageID;
      }
      
      public function clearBegIndex() : void
      {
         this.hasField$0 &= 4294967294;
         this.begIndex$field = new uint();
      }
      
      public function get hasBegIndex() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set begIndex(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.begIndex$field = param1;
      }
      
      public function get begIndex() : uint
      {
         return this.begIndex$field;
      }
      
      public function clearEndIndex() : void
      {
         this.hasField$0 &= 4294967293;
         this.endIndex$field = new uint();
      }
      
      public function get hasEndIndex() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set endIndex(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.endIndex$field = param1;
      }
      
      public function get endIndex() : uint
      {
         return this.endIndex$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasBegIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.begIndex$field);
         }
         if(this.hasEndIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.endIndex$field);
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
                     throw new IOError("Bad data format: Cmd_GuildList_CS.begIndex cannot be set twice.");
                  }
                  _loc3_++;
                  this.begIndex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildList_CS.endIndex cannot be set twice.");
                  }
                  _loc4_++;
                  this.endIndex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
