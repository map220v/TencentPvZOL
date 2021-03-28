package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Temple_Detect_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Temple_Detect_CS";
      
      public static const GUILDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Temple_Detect_CS.guildId","guildId",1 << 3 | WireType.VARINT);
      
      public static const TEMPLEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Temple_Detect_CS.templeId","templeId",2 << 3 | WireType.VARINT);
       
      
      private var guildId$field:Int64;
      
      private var templeId$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Temple_Detect_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Temple_Detect_CS.$MessageID;
      }
      
      public function clearGuildId() : void
      {
         this.guildId$field = null;
      }
      
      public function get hasGuildId() : Boolean
      {
         return this.guildId$field != null;
      }
      
      public function set guildId(param1:Int64) : void
      {
         this.guildId$field = param1;
      }
      
      public function get guildId() : Int64
      {
         return this.guildId$field;
      }
      
      public function clearTempleId() : void
      {
         this.hasField$0 &= 4294967294;
         this.templeId$field = new uint();
      }
      
      public function get hasTempleId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set templeId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.templeId$field = param1;
      }
      
      public function get templeId() : uint
      {
         return this.templeId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasGuildId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.guildId$field);
         }
         if(this.hasTempleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.templeId$field);
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
                     throw new IOError("Bad data format: Cmd_Temple_Detect_CS.guildId cannot be set twice.");
                  }
                  _loc3_++;
                  this.guildId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Temple_Detect_CS.templeId cannot be set twice.");
                  }
                  _loc4_++;
                  this.templeId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
