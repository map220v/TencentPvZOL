package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_GetRankList_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_GetRankList_CS";
      
      public static const RANKTYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Cmd_GetRankList_CS.ranktype","ranktype",1 << 3 | WireType.VARINT,E_RankType);
      
      public static const PAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GetRankList_CS.page","page",2 << 3 | WireType.VARINT);
      
      public static const RANKID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GetRankList_CS.rankid","rankid",3 << 3 | WireType.VARINT);
       
      
      private var ranktype$field:int;
      
      private var hasField$0:uint = 0;
      
      private var page$field:uint;
      
      private var rankid$field:uint;
      
      public function Cmd_GetRankList_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_GetRankList_CS.$MessageID;
      }
      
      public function clearRanktype() : void
      {
         this.hasField$0 &= 4294967294;
         this.ranktype$field = new int();
      }
      
      public function get hasRanktype() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set ranktype(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.ranktype$field = param1;
      }
      
      public function get ranktype() : int
      {
         return this.ranktype$field;
      }
      
      public function clearPage() : void
      {
         this.hasField$0 &= 4294967293;
         this.page$field = new uint();
      }
      
      public function get hasPage() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set page(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.page$field = param1;
      }
      
      public function get page() : uint
      {
         return this.page$field;
      }
      
      public function clearRankid() : void
      {
         this.hasField$0 &= 4294967291;
         this.rankid$field = new uint();
      }
      
      public function get hasRankid() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set rankid(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.rankid$field = param1;
      }
      
      public function get rankid() : uint
      {
         return this.rankid$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRanktype)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_ENUM(param1,this.ranktype$field);
         }
         if(this.hasPage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.page$field);
         }
         if(this.hasRankid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.rankid$field);
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
                     throw new IOError("Bad data format: Cmd_GetRankList_CS.ranktype cannot be set twice.");
                  }
                  _loc3_++;
                  this.ranktype = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetRankList_CS.page cannot be set twice.");
                  }
                  _loc4_++;
                  this.page = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetRankList_CS.rankid cannot be set twice.");
                  }
                  _loc5_++;
                  this.rankid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
