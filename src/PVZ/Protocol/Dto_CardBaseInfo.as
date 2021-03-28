package PVZ.Protocol
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
   
   public final class Dto_CardBaseInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Protocol.Dto_CardBaseInfo";
      
      public static const UID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Protocol.Dto_CardBaseInfo.UId","uId",1 << 3 | WireType.VARINT);
      
      public static const CARDBASEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardBaseInfo.cardBaseId","cardBaseId",2 << 3 | WireType.VARINT);
      
      public static const EXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardBaseInfo.exp","exp",3 << 3 | WireType.VARINT);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardBaseInfo.level","level",4 << 3 | WireType.VARINT);
      
      public static const FORGELEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardBaseInfo.forgeLevel","forgeLevel",5 << 3 | WireType.VARINT);
      
      public static const POS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardBaseInfo.pos","pos",6 << 3 | WireType.VARINT);
      
      public static const AVATARID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardBaseInfo.avatarId","avatarId",7 << 3 | WireType.VARINT);
      
      public static const QUALITY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardBaseInfo.quality","quality",8 << 3 | WireType.VARINT);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardBaseInfo.rank","rank",9 << 3 | WireType.VARINT);
      
      public static const GENEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardBaseInfo.geneId","geneId",10 << 3 | WireType.VARINT);
      
      public static const ARMORTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardBaseInfo.armorType","armorType",11 << 3 | WireType.VARINT);
      
      public static const ARMORSTAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardBaseInfo.armorStar","armorStar",12 << 3 | WireType.VARINT);
       
      
      private var UId$field:Int64;
      
      private var cardBaseId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var exp$field:uint;
      
      private var level$field:uint;
      
      private var forgeLevel$field:uint;
      
      private var pos$field:uint;
      
      private var avatarId$field:uint;
      
      private var quality$field:uint;
      
      private var rank$field:uint;
      
      private var geneId$field:uint;
      
      private var armorType$field:uint;
      
      private var armorStar$field:uint;
      
      public function Dto_CardBaseInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_CardBaseInfo.$MessageID;
      }
      
      public function clearUId() : void
      {
         this.UId$field = null;
      }
      
      public function get hasUId() : Boolean
      {
         return this.UId$field != null;
      }
      
      public function set uId(param1:Int64) : void
      {
         this.UId$field = param1;
      }
      
      public function get uId() : Int64
      {
         return this.UId$field;
      }
      
      public function clearCardBaseId() : void
      {
         this.hasField$0 &= 4294967294;
         this.cardBaseId$field = new uint();
      }
      
      public function get hasCardBaseId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set cardBaseId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.cardBaseId$field = param1;
      }
      
      public function get cardBaseId() : uint
      {
         return this.cardBaseId$field;
      }
      
      public function clearExp() : void
      {
         this.hasField$0 &= 4294967293;
         this.exp$field = new uint();
      }
      
      public function get hasExp() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set exp(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.exp$field = param1;
      }
      
      public function get exp() : uint
      {
         return this.exp$field;
      }
      
      public function clearLevel() : void
      {
         this.hasField$0 &= 4294967291;
         this.level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.level$field = param1;
      }
      
      public function get level() : uint
      {
         return this.level$field;
      }
      
      public function clearForgeLevel() : void
      {
         this.hasField$0 &= 4294967287;
         this.forgeLevel$field = new uint();
      }
      
      public function get hasForgeLevel() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set forgeLevel(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.forgeLevel$field = param1;
      }
      
      public function get forgeLevel() : uint
      {
         return this.forgeLevel$field;
      }
      
      public function clearPos() : void
      {
         this.hasField$0 &= 4294967279;
         this.pos$field = new uint();
      }
      
      public function get hasPos() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set pos(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.pos$field = param1;
      }
      
      public function get pos() : uint
      {
         return this.pos$field;
      }
      
      public function clearAvatarId() : void
      {
         this.hasField$0 &= 4294967263;
         this.avatarId$field = new uint();
      }
      
      public function get hasAvatarId() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set avatarId(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.avatarId$field = param1;
      }
      
      public function get avatarId() : uint
      {
         return this.avatarId$field;
      }
      
      public function clearQuality() : void
      {
         this.hasField$0 &= 4294967231;
         this.quality$field = new uint();
      }
      
      public function get hasQuality() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set quality(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.quality$field = param1;
      }
      
      public function get quality() : uint
      {
         return this.quality$field;
      }
      
      public function clearRank() : void
      {
         this.hasField$0 &= 4294967167;
         this.rank$field = new uint();
      }
      
      public function get hasRank() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set rank(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.rank$field = param1;
      }
      
      public function get rank() : uint
      {
         return this.rank$field;
      }
      
      public function clearGeneId() : void
      {
         this.hasField$0 &= 4294967039;
         this.geneId$field = new uint();
      }
      
      public function get hasGeneId() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set geneId(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.geneId$field = param1;
      }
      
      public function get geneId() : uint
      {
         return this.geneId$field;
      }
      
      public function clearArmorType() : void
      {
         this.hasField$0 &= 4294966783;
         this.armorType$field = new uint();
      }
      
      public function get hasArmorType() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set armorType(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.armorType$field = param1;
      }
      
      public function get armorType() : uint
      {
         return this.armorType$field;
      }
      
      public function clearArmorStar() : void
      {
         this.hasField$0 &= 4294966271;
         this.armorStar$field = new uint();
      }
      
      public function get hasArmorStar() : Boolean
      {
         return (this.hasField$0 & 1024) != 0;
      }
      
      public function set armorStar(param1:uint) : void
      {
         this.hasField$0 |= 1024;
         this.armorStar$field = param1;
      }
      
      public function get armorStar() : uint
      {
         return this.armorStar$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasUId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.UId$field);
         }
         if(this.hasCardBaseId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.cardBaseId$field);
         }
         if(this.hasExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.exp$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasForgeLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.forgeLevel$field);
         }
         if(this.hasPos)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.pos$field);
         }
         if(this.hasAvatarId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.avatarId$field);
         }
         if(this.hasQuality)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.quality$field);
         }
         if(this.hasRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.rank$field);
         }
         if(this.hasGeneId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.geneId$field);
         }
         if(this.hasArmorType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.armorType$field);
         }
         if(this.hasArmorStar)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_UINT32(param1,this.armorStar$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc15_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         var _loc13_:uint = 0;
         var _loc14_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc15_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc15_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.uId cannot be set twice.");
                  }
                  _loc3_++;
                  this.uId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.cardBaseId cannot be set twice.");
                  }
                  _loc4_++;
                  this.cardBaseId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.exp cannot be set twice.");
                  }
                  _loc5_++;
                  this.exp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.level cannot be set twice.");
                  }
                  _loc6_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.forgeLevel cannot be set twice.");
                  }
                  _loc7_++;
                  this.forgeLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.pos cannot be set twice.");
                  }
                  _loc8_++;
                  this.pos = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.avatarId cannot be set twice.");
                  }
                  _loc9_++;
                  this.avatarId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.quality cannot be set twice.");
                  }
                  _loc10_++;
                  this.quality = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.rank cannot be set twice.");
                  }
                  _loc11_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.geneId cannot be set twice.");
                  }
                  _loc12_++;
                  this.geneId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.armorType cannot be set twice.");
                  }
                  _loc13_++;
                  this.armorType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.armorStar cannot be set twice.");
                  }
                  _loc14_++;
                  this.armorStar = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc15_);
                  break;
            }
         }
      }
   }
}
