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
   
   public final class Dto_GuildFight_HistoryRecord extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_GuildFight_HistoryRecord";
      
      public static const SEASON:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_HistoryRecord.season","season",1 << 3 | WireType.VARINT);
      
      public static const GUILDFIGHTRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_HistoryRecord.guildFightRank","guildFightRank",2 << 3 | WireType.VARINT);
      
      public static const FINALISTRANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_GuildFight_HistoryRecord.finalistRank","finalistRank",3 << 3 | WireType.VARINT);
       
      
      private var season$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var guildFightRank$field:uint;
      
      private var finalistRank$field:uint;
      
      public function Dto_GuildFight_HistoryRecord()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_GuildFight_HistoryRecord.$MessageID;
      }
      
      public function clearSeason() : void
      {
         this.hasField$0 &= 4294967294;
         this.season$field = new uint();
      }
      
      public function get hasSeason() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set season(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.season$field = param1;
      }
      
      public function get season() : uint
      {
         return this.season$field;
      }
      
      public function clearGuildFightRank() : void
      {
         this.hasField$0 &= 4294967293;
         this.guildFightRank$field = new uint();
      }
      
      public function get hasGuildFightRank() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set guildFightRank(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.guildFightRank$field = param1;
      }
      
      public function get guildFightRank() : uint
      {
         return this.guildFightRank$field;
      }
      
      public function clearFinalistRank() : void
      {
         this.hasField$0 &= 4294967291;
         this.finalistRank$field = new uint();
      }
      
      public function get hasFinalistRank() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set finalistRank(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.finalistRank$field = param1;
      }
      
      public function get finalistRank() : uint
      {
         return this.finalistRank$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasSeason)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.season$field);
         }
         if(this.hasGuildFightRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.guildFightRank$field);
         }
         if(this.hasFinalistRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.finalistRank$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_HistoryRecord.season cannot be set twice.");
                  }
                  _loc3_++;
                  this.season = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_HistoryRecord.guildFightRank cannot be set twice.");
                  }
                  _loc4_++;
                  this.guildFightRank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_GuildFight_HistoryRecord.finalistRank cannot be set twice.");
                  }
                  _loc5_++;
                  this.finalistRank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
