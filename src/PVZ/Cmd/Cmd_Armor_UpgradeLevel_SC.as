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
   
   public final class Cmd_Armor_UpgradeLevel_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Armor_UpgradeLevel_SC";
      
      public static const CARDUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Armor_UpgradeLevel_SC.cardUId","cardUId",1 << 3 | WireType.VARINT);
      
      public static const ARMORTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Armor_UpgradeLevel_SC.armorType","armorType",2 << 3 | WireType.VARINT);
      
      public static const ITEMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Armor_UpgradeLevel_SC.itemId","itemId",3 << 3 | WireType.VARINT);
      
      public static const ITEMNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Armor_UpgradeLevel_SC.itemNum","itemNum",4 << 3 | WireType.VARINT);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Armor_UpgradeLevel_SC.level","level",5 << 3 | WireType.VARINT);
      
      public static const EXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Armor_UpgradeLevel_SC.exp","exp",6 << 3 | WireType.VARINT);
       
      
      private var cardUId$field:Int64;
      
      private var armorType$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var itemId$field:uint;
      
      private var itemNum$field:uint;
      
      private var level$field:uint;
      
      private var exp$field:uint;
      
      public function Cmd_Armor_UpgradeLevel_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Armor_UpgradeLevel_SC.$MessageID;
      }
      
      public function clearCardUId() : void
      {
         this.cardUId$field = null;
      }
      
      public function get hasCardUId() : Boolean
      {
         return this.cardUId$field != null;
      }
      
      public function set cardUId(param1:Int64) : void
      {
         this.cardUId$field = param1;
      }
      
      public function get cardUId() : Int64
      {
         return this.cardUId$field;
      }
      
      public function clearArmorType() : void
      {
         this.hasField$0 &= 4294967294;
         this.armorType$field = new uint();
      }
      
      public function get hasArmorType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set armorType(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.armorType$field = param1;
      }
      
      public function get armorType() : uint
      {
         return this.armorType$field;
      }
      
      public function clearItemId() : void
      {
         this.hasField$0 &= 4294967293;
         this.itemId$field = new uint();
      }
      
      public function get hasItemId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set itemId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.itemId$field = param1;
      }
      
      public function get itemId() : uint
      {
         return this.itemId$field;
      }
      
      public function clearItemNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.itemNum$field = new uint();
      }
      
      public function get hasItemNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set itemNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.itemNum$field = param1;
      }
      
      public function get itemNum() : uint
      {
         return this.itemNum$field;
      }
      
      public function clearLevel() : void
      {
         this.hasField$0 &= 4294967287;
         this.level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.level$field = param1;
      }
      
      public function get level() : uint
      {
         return this.level$field;
      }
      
      public function clearExp() : void
      {
         this.hasField$0 &= 4294967279;
         this.exp$field = new uint();
      }
      
      public function get hasExp() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set exp(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.exp$field = param1;
      }
      
      public function get exp() : uint
      {
         return this.exp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasCardUId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.cardUId$field);
         }
         if(this.hasArmorType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.armorType$field);
         }
         if(this.hasItemId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.itemId$field);
         }
         if(this.hasItemNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.itemNum$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.exp$field);
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
                     throw new IOError("Bad data format: Cmd_Armor_UpgradeLevel_SC.cardUId cannot be set twice.");
                  }
                  _loc3_++;
                  this.cardUId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Armor_UpgradeLevel_SC.armorType cannot be set twice.");
                  }
                  _loc4_++;
                  this.armorType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Armor_UpgradeLevel_SC.itemId cannot be set twice.");
                  }
                  _loc5_++;
                  this.itemId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Armor_UpgradeLevel_SC.itemNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.itemNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Armor_UpgradeLevel_SC.level cannot be set twice.");
                  }
                  _loc7_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Armor_UpgradeLevel_SC.exp cannot be set twice.");
                  }
                  _loc8_++;
                  this.exp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
