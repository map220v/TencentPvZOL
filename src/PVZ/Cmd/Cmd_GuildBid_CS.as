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
   
   public final class Cmd_GuildBid_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_GuildBid_CS";
      
      public static const MANIFESTO:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_GuildBid_CS.manifesto","manifesto",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const GUILDEXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildBid_CS.guildExp","guildExp",2 << 3 | WireType.VARINT);
       
      
      private var manifesto$field:String;
      
      private var guildExp$field:uint;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_GuildBid_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_GuildBid_CS.$MessageID;
      }
      
      public function clearManifesto() : void
      {
         this.manifesto$field = null;
      }
      
      public function get hasManifesto() : Boolean
      {
         return this.manifesto$field != null;
      }
      
      public function set manifesto(param1:String) : void
      {
         this.manifesto$field = param1;
      }
      
      public function get manifesto() : String
      {
         return this.manifesto$field;
      }
      
      public function clearGuildExp() : void
      {
         this.hasField$0 &= 4294967294;
         this.guildExp$field = new uint();
      }
      
      public function get hasGuildExp() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set guildExp(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.guildExp$field = param1;
      }
      
      public function get guildExp() : uint
      {
         return this.guildExp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasManifesto)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_STRING(param1,this.manifesto$field);
         }
         if(this.hasGuildExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.guildExp$field);
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
                     throw new IOError("Bad data format: Cmd_GuildBid_CS.manifesto cannot be set twice.");
                  }
                  _loc3_++;
                  this.manifesto = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildBid_CS.guildExp cannot be set twice.");
                  }
                  _loc4_++;
                  this.guildExp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
