package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Treasure_EnterHouse_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Treasure_EnterHouse_CS";
      
      public static const HOUSEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Treasure_EnterHouse_CS.houseId","houseId",1 << 3 | WireType.VARINT);
      
      public static const HOUSESIDE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Treasure_EnterHouse_CS.houseSide","houseSide",2 << 3 | WireType.VARINT);
      
      public static const FORMATIONID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Treasure_EnterHouse_CS.formationId","formationId",3 << 3 | WireType.VARINT);
      
      public static const ONLYSAMEGUILD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Treasure_EnterHouse_CS.onlySameGuild","onlySameGuild",4 << 3 | WireType.VARINT);
       
      
      private var houseId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var houseSide$field:uint;
      
      private var formationId$field:uint;
      
      private var onlySameGuild$field:Boolean;
      
      public function Cmd_Treasure_EnterHouse_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Treasure_EnterHouse_CS.$MessageID;
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
      
      public function clearHouseSide() : void
      {
         this.hasField$0 &= 4294967293;
         this.houseSide$field = new uint();
      }
      
      public function get hasHouseSide() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set houseSide(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.houseSide$field = param1;
      }
      
      public function get houseSide() : uint
      {
         return this.houseSide$field;
      }
      
      public function clearFormationId() : void
      {
         this.hasField$0 &= 4294967291;
         this.formationId$field = new uint();
      }
      
      public function get hasFormationId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set formationId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.formationId$field = param1;
      }
      
      public function get formationId() : uint
      {
         return this.formationId$field;
      }
      
      public function clearOnlySameGuild() : void
      {
         this.hasField$0 &= 4294967287;
         this.onlySameGuild$field = new Boolean();
      }
      
      public function get hasOnlySameGuild() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set onlySameGuild(param1:Boolean) : void
      {
         this.hasField$0 |= 8;
         this.onlySameGuild$field = param1;
      }
      
      public function get onlySameGuild() : Boolean
      {
         return this.onlySameGuild$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasHouseId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.houseId$field);
         }
         if(this.hasHouseSide)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.houseSide$field);
         }
         if(this.hasFormationId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.formationId$field);
         }
         if(this.hasOnlySameGuild)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.onlySameGuild$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc7_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Treasure_EnterHouse_CS.houseId cannot be set twice.");
                  }
                  _loc3_++;
                  this.houseId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Treasure_EnterHouse_CS.houseSide cannot be set twice.");
                  }
                  _loc4_++;
                  this.houseSide = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Treasure_EnterHouse_CS.formationId cannot be set twice.");
                  }
                  _loc5_++;
                  this.formationId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Treasure_EnterHouse_CS.onlySameGuild cannot be set twice.");
                  }
                  _loc6_++;
                  this.onlySameGuild = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
