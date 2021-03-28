package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_TreasureHouse extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_TreasureHouse";
      
      public static const HOUSEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TreasureHouse.houseId","houseId",1 << 3 | WireType.VARINT);
      
      public static const GUILDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_TreasureHouse.guildId","guildId",2 << 3 | WireType.VARINT);
      
      public static const GUILDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_TreasureHouse.guildName","guildName",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const LEFT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_TreasureHouse.left","left",4 << 3 | WireType.LENGTH_DELIMITED,Dto_TreasureHouseSide);
      
      public static const RIGHT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_TreasureHouse.right","right",5 << 3 | WireType.LENGTH_DELIMITED,Dto_TreasureHouseSide);
      
      public static const BEGINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TreasureHouse.beginTime","beginTime",6 << 3 | WireType.VARINT);
       
      
      private var houseId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var guildId$field:Int64;
      
      private var guildName$field:String;
      
      private var left$field:Dto_TreasureHouseSide;
      
      private var right$field:Dto_TreasureHouseSide;
      
      private var beginTime$field:uint;
      
      public function Dto_TreasureHouse()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_TreasureHouse.$MessageID;
      }
      
      public function clearHouseId() : void
      {
         this.hasField$0 &= 4294967294;
         this.houseId$field = new uint();
      }
      
      public function get hasHouseId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set houseId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.houseId$field = param1;
      }
      
      public function get houseId() : uint
      {
         return this.houseId$field;
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
      
      public function clearGuildName() : void
      {
         this.guildName$field = null;
      }
      
      public function get hasGuildName() : Boolean
      {
         return this.guildName$field != null;
      }
      
      public function set guildName(param1:String) : void
      {
         this.guildName$field = param1;
      }
      
      public function get guildName() : String
      {
         return this.guildName$field;
      }
      
      public function clearLeft() : void
      {
         this.left$field = null;
      }
      
      public function get hasLeft() : Boolean
      {
         return this.left$field != null;
      }
      
      public function set left(param1:Dto_TreasureHouseSide) : void
      {
         this.left$field = param1;
      }
      
      public function get left() : Dto_TreasureHouseSide
      {
         return this.left$field;
      }
      
      public function clearRight() : void
      {
         this.right$field = null;
      }
      
      public function get hasRight() : Boolean
      {
         return this.right$field != null;
      }
      
      public function set right(param1:Dto_TreasureHouseSide) : void
      {
         this.right$field = param1;
      }
      
      public function get right() : Dto_TreasureHouseSide
      {
         return this.right$field;
      }
      
      public function clearBeginTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.beginTime$field = new uint();
      }
      
      public function get hasBeginTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set beginTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.beginTime$field = param1;
      }
      
      public function get beginTime() : uint
      {
         return this.beginTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasHouseId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.houseId$field);
         }
         if(this.hasGuildId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.guildId$field);
         }
         if(this.hasGuildName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.guildName$field);
         }
         if(this.hasLeft)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.left$field);
         }
         if(this.hasRight)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.right$field);
         }
         if(this.hasBeginTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.beginTime$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc9_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc9_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TreasureHouse.houseId cannot be set twice.");
                  }
                  _loc3_++;
                  this.houseId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TreasureHouse.guildId cannot be set twice.");
                  }
                  _loc4_++;
                  this.guildId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TreasureHouse.guildName cannot be set twice.");
                  }
                  _loc5_++;
                  this.guildName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TreasureHouse.left cannot be set twice.");
                  }
                  _loc6_++;
                  this.left = new Dto_TreasureHouseSide();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.left);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TreasureHouse.right cannot be set twice.");
                  }
                  _loc7_++;
                  this.right = new Dto_TreasureHouseSide();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.right);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TreasureHouse.beginTime cannot be set twice.");
                  }
                  _loc8_++;
                  this.beginTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
