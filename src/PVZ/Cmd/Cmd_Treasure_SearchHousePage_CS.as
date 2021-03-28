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
   
   public final class Cmd_Treasure_SearchHousePage_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Treasure_SearchHousePage_CS";
      
      public static const STARTID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Treasure_SearchHousePage_CS.startId","startId",1 << 3 | WireType.VARINT);
      
      public static const PAGESIZE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Treasure_SearchHousePage_CS.pageSize","pageSize",2 << 3 | WireType.VARINT);
      
      public static const GUILDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Treasure_SearchHousePage_CS.guildId","guildId",3 << 3 | WireType.VARINT);
       
      
      private var startId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var pageSize$field:uint;
      
      private var guildId$field:Int64;
      
      public function Cmd_Treasure_SearchHousePage_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Treasure_SearchHousePage_CS.$MessageID;
      }
      
      public function clearStartId() : void
      {
         this.hasField$0 &= 4294967294;
         this.startId$field = new uint();
      }
      
      public function get hasStartId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set startId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.startId$field = param1;
      }
      
      public function get startId() : uint
      {
         return this.startId$field;
      }
      
      public function clearPageSize() : void
      {
         this.hasField$0 &= 4294967293;
         this.pageSize$field = new uint();
      }
      
      public function get hasPageSize() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set pageSize(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.pageSize$field = param1;
      }
      
      public function get pageSize() : uint
      {
         return this.pageSize$field;
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
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasStartId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.startId$field);
         }
         if(this.hasPageSize)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.pageSize$field);
         }
         if(this.hasGuildId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_INT64(param1,this.guildId$field);
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
                     throw new IOError("Bad data format: Cmd_Treasure_SearchHousePage_CS.startId cannot be set twice.");
                  }
                  _loc3_++;
                  this.startId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Treasure_SearchHousePage_CS.pageSize cannot be set twice.");
                  }
                  _loc4_++;
                  this.pageSize = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Treasure_SearchHousePage_CS.guildId cannot be set twice.");
                  }
                  _loc5_++;
                  this.guildId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
