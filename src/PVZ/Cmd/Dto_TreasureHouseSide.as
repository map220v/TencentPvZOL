package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_TreasureHouseSide extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_TreasureHouseSide";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_TreasureHouseSide.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_TreasureHouseSide.name","name",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const LEADERCARDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TreasureHouseSide.leaderCardId","leaderCardId",3 << 3 | WireType.VARINT);
      
      public static const BEGINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TreasureHouseSide.beginTime","beginTime",6 << 3 | WireType.VARINT);
      
      public static const TREASUREMAPID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TreasureHouseSide.treasureMapId","treasureMapId",7 << 3 | WireType.VARINT);
       
      
      private var roleId$field:Int64;
      
      private var name$field:String;
      
      private var leaderCardId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var beginTime$field:uint;
      
      private var treasureMapId$field:uint;
      
      public function Dto_TreasureHouseSide()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_TreasureHouseSide.$MessageID;
      }
      
      public function clearRoleId() : void
      {
         this.roleId$field = null;
      }
      
      public function get hasRoleId() : Boolean
      {
         return this.roleId$field != null;
      }
      
      public function set roleId(param1:Int64) : void
      {
         this.roleId$field = param1;
      }
      
      public function get roleId() : Int64
      {
         return this.roleId$field;
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
      
      public function clearLeaderCardId() : void
      {
         this.hasField$0 &= 4294967294;
         this.leaderCardId$field = new uint();
      }
      
      public function get hasLeaderCardId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set leaderCardId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.leaderCardId$field = param1;
      }
      
      public function get leaderCardId() : uint
      {
         return this.leaderCardId$field;
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
      
      public function clearTreasureMapId() : void
      {
         this.hasField$0 &= 4294967291;
         this.treasureMapId$field = new uint();
      }
      
      public function get hasTreasureMapId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set treasureMapId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.treasureMapId$field = param1;
      }
      
      public function get treasureMapId() : uint
      {
         return this.treasureMapId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.name$field);
         }
         if(this.hasLeaderCardId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.leaderCardId$field);
         }
         if(this.hasBeginTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.beginTime$field);
         }
         if(this.hasTreasureMapId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.treasureMapId$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TreasureHouseSide.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TreasureHouseSide.name cannot be set twice.");
                  }
                  _loc4_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TreasureHouseSide.leaderCardId cannot be set twice.");
                  }
                  _loc5_++;
                  this.leaderCardId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TreasureHouseSide.beginTime cannot be set twice.");
                  }
                  _loc6_++;
                  this.beginTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TreasureHouseSide.treasureMapId cannot be set twice.");
                  }
                  _loc7_++;
                  this.treasureMapId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
