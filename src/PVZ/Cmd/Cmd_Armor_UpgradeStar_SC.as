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
   
   public final class Cmd_Armor_UpgradeStar_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Armor_UpgradeStar_SC";
      
      public static const CARDUID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Armor_UpgradeStar_SC.cardUId","cardUId",1 << 3 | WireType.VARINT);
      
      public static const ARMORTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Armor_UpgradeStar_SC.armorType","armorType",2 << 3 | WireType.VARINT);
      
      public static const STAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Armor_UpgradeStar_SC.star","star",3 << 3 | WireType.VARINT);
      
      public static const SUBSTAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Armor_UpgradeStar_SC.subStar","subStar",4 << 3 | WireType.VARINT);
       
      
      private var cardUId$field:Int64;
      
      private var armorType$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var star$field:uint;
      
      private var subStar$field:uint;
      
      public function Cmd_Armor_UpgradeStar_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Armor_UpgradeStar_SC.$MessageID;
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
      
      public function clearStar() : void
      {
         this.hasField$0 &= 4294967293;
         this.star$field = new uint();
      }
      
      public function get hasStar() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set star(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.star$field = param1;
      }
      
      public function get star() : uint
      {
         return this.star$field;
      }
      
      public function clearSubStar() : void
      {
         this.hasField$0 &= 4294967291;
         this.subStar$field = new uint();
      }
      
      public function get hasSubStar() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set subStar(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.subStar$field = param1;
      }
      
      public function get subStar() : uint
      {
         return this.subStar$field;
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
         if(this.hasStar)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.star$field);
         }
         if(this.hasSubStar)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.subStar$field);
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
                     throw new IOError("Bad data format: Cmd_Armor_UpgradeStar_SC.cardUId cannot be set twice.");
                  }
                  _loc3_++;
                  this.cardUId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Armor_UpgradeStar_SC.armorType cannot be set twice.");
                  }
                  _loc4_++;
                  this.armorType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Armor_UpgradeStar_SC.star cannot be set twice.");
                  }
                  _loc5_++;
                  this.star = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Armor_UpgradeStar_SC.subStar cannot be set twice.");
                  }
                  _loc6_++;
                  this.subStar = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
