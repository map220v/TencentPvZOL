package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.UInt64;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_CardBaseInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_CardBaseInfo";
      
      public static const UID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_CardBaseInfo.uid","uid",1 << 3 | WireType.VARINT);
      
      public static const CARDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardBaseInfo.cardId","cardId",2 << 3 | WireType.VARINT);
      
      public static const EXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardBaseInfo.exp","exp",3 << 3 | WireType.VARINT);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardBaseInfo.level","level",4 << 3 | WireType.VARINT);
      
      public static const FORGELEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardBaseInfo.forgeLevel","forgeLevel",5 << 3 | WireType.VARINT);
      
      public static const CURRENTHP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("PVZ.Cmd.Dto_CardBaseInfo.currentHp","currentHp",6 << 3 | WireType.VARINT);
      
      public static const HEALTH:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardBaseInfo.health","health",7 << 3 | WireType.VARINT);
      
      public static const ZOMBIEISLANDHP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardBaseInfo.ZombieIslandHp","zombieIslandHp",8 << 3 | WireType.VARINT);
      
      public static const AVATARID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardBaseInfo.avatarId","avatarId",9 << 3 | WireType.VARINT);
      
      public static const QUALITY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardBaseInfo.quality","quality",10 << 3 | WireType.VARINT);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardBaseInfo.rank","rank",11 << 3 | WireType.VARINT);
      
      public static const MELEEHP:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_CardBaseInfo.meleeHp","meleeHp",12 << 3 | WireType.VARINT);
      
      public static const GENEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardBaseInfo.geneId","geneId",13 << 3 | WireType.VARINT);
      
      public static const NEWZOMBIEISLANDHP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardBaseInfo.newZombieIslandHp","newZombieIslandHp",14 << 3 | WireType.VARINT);
      
      public static const ARMORTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardBaseInfo.armorType","armorType",15 << 3 | WireType.VARINT);
      
      public static const ARMORSTAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardBaseInfo.armorStar","armorStar",16 << 3 | WireType.VARINT);
      
      public static const EVOLVELEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardBaseInfo.evolveLevel","evolveLevel",17 << 3 | WireType.VARINT);
       
      
      private var uid$field:Int64;
      
      private var cardId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var exp$field:uint;
      
      private var level$field:uint;
      
      private var forgeLevel$field:uint;
      
      private var currentHp$field:UInt64;
      
      private var health$field:uint;
      
      private var ZombieIslandHp$field:uint;
      
      private var avatarId$field:uint;
      
      private var quality$field:uint;
      
      private var rank$field:uint;
      
      private var meleeHp$field:Int64;
      
      private var geneId$field:uint;
      
      private var newZombieIslandHp$field:uint;
      
      private var armorType$field:uint;
      
      private var armorStar$field:uint;
      
      private var evolveLevel$field:uint;
      
      public function Dto_CardBaseInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_CardBaseInfo.$MessageID;
      }
      
      public function clearUid() : void
      {
         this.uid$field = null;
      }
      
      public function get hasUid() : Boolean
      {
         return this.uid$field != null;
      }
      
      public function set uid(param1:Int64) : void
      {
         this.uid$field = param1;
      }
      
      public function get uid() : Int64
      {
         return this.uid$field;
      }
      
      public function clearCardId() : void
      {
         this.hasField$0 &= 4294967294;
         this.cardId$field = new uint();
      }
      
      public function get hasCardId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set cardId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.cardId$field = param1;
      }
      
      public function get cardId() : uint
      {
         return this.cardId$field;
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
      
      public function clearCurrentHp() : void
      {
         this.currentHp$field = null;
      }
      
      public function get hasCurrentHp() : Boolean
      {
         return this.currentHp$field != null;
      }
      
      public function set currentHp(param1:UInt64) : void
      {
         this.currentHp$field = param1;
      }
      
      public function get currentHp() : UInt64
      {
         return this.currentHp$field;
      }
      
      public function clearHealth() : void
      {
         this.hasField$0 &= 4294967279;
         this.health$field = new uint();
      }
      
      public function get hasHealth() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set health(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.health$field = param1;
      }
      
      public function get health() : uint
      {
         return this.health$field;
      }
      
      public function clearZombieIslandHp() : void
      {
         this.hasField$0 &= 4294967263;
         this.ZombieIslandHp$field = new uint();
      }
      
      public function get hasZombieIslandHp() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set zombieIslandHp(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.ZombieIslandHp$field = param1;
      }
      
      public function get zombieIslandHp() : uint
      {
         return this.ZombieIslandHp$field;
      }
      
      public function clearAvatarId() : void
      {
         this.hasField$0 &= 4294967231;
         this.avatarId$field = new uint();
      }
      
      public function get hasAvatarId() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set avatarId(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.avatarId$field = param1;
      }
      
      public function get avatarId() : uint
      {
         return this.avatarId$field;
      }
      
      public function clearQuality() : void
      {
         this.hasField$0 &= 4294967167;
         this.quality$field = new uint();
      }
      
      public function get hasQuality() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set quality(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.quality$field = param1;
      }
      
      public function get quality() : uint
      {
         return this.quality$field;
      }
      
      public function clearRank() : void
      {
         this.hasField$0 &= 4294967039;
         this.rank$field = new uint();
      }
      
      public function get hasRank() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set rank(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.rank$field = param1;
      }
      
      public function get rank() : uint
      {
         return this.rank$field;
      }
      
      public function clearMeleeHp() : void
      {
         this.meleeHp$field = null;
      }
      
      public function get hasMeleeHp() : Boolean
      {
         return this.meleeHp$field != null;
      }
      
      public function set meleeHp(param1:Int64) : void
      {
         this.meleeHp$field = param1;
      }
      
      public function get meleeHp() : Int64
      {
         return this.meleeHp$field;
      }
      
      public function clearGeneId() : void
      {
         this.hasField$0 &= 4294966783;
         this.geneId$field = new uint();
      }
      
      public function get hasGeneId() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set geneId(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.geneId$field = param1;
      }
      
      public function get geneId() : uint
      {
         return this.geneId$field;
      }
      
      public function clearNewZombieIslandHp() : void
      {
         this.hasField$0 &= 4294966271;
         this.newZombieIslandHp$field = new uint();
      }
      
      public function get hasNewZombieIslandHp() : Boolean
      {
         return (this.hasField$0 & 1024) != 0;
      }
      
      public function set newZombieIslandHp(param1:uint) : void
      {
         this.hasField$0 |= 1024;
         this.newZombieIslandHp$field = param1;
      }
      
      public function get newZombieIslandHp() : uint
      {
         return this.newZombieIslandHp$field;
      }
      
      public function clearArmorType() : void
      {
         this.hasField$0 &= 4294965247;
         this.armorType$field = new uint();
      }
      
      public function get hasArmorType() : Boolean
      {
         return (this.hasField$0 & 2048) != 0;
      }
      
      public function set armorType(param1:uint) : void
      {
         this.hasField$0 |= 2048;
         this.armorType$field = param1;
      }
      
      public function get armorType() : uint
      {
         return this.armorType$field;
      }
      
      public function clearArmorStar() : void
      {
         this.hasField$0 &= 4294963199;
         this.armorStar$field = new uint();
      }
      
      public function get hasArmorStar() : Boolean
      {
         return (this.hasField$0 & 4096) != 0;
      }
      
      public function set armorStar(param1:uint) : void
      {
         this.hasField$0 |= 4096;
         this.armorStar$field = param1;
      }
      
      public function get armorStar() : uint
      {
         return this.armorStar$field;
      }
      
      public function clearEvolveLevel() : void
      {
         this.hasField$0 &= 4294959103;
         this.evolveLevel$field = new uint();
      }
      
      public function get hasEvolveLevel() : Boolean
      {
         return (this.hasField$0 & 8192) != 0;
      }
      
      public function set evolveLevel(param1:uint) : void
      {
         this.hasField$0 |= 8192;
         this.evolveLevel$field = param1;
      }
      
      public function get evolveLevel() : uint
      {
         return this.evolveLevel$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasUid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.uid$field);
         }
         if(this.hasCardId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.cardId$field);
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
         if(this.hasCurrentHp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT64(param1,this.currentHp$field);
         }
         if(this.hasHealth)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.health$field);
         }
         if(this.hasZombieIslandHp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.ZombieIslandHp$field);
         }
         if(this.hasAvatarId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.avatarId$field);
         }
         if(this.hasQuality)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.quality$field);
         }
         if(this.hasRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.rank$field);
         }
         if(this.hasMeleeHp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_INT64(param1,this.meleeHp$field);
         }
         if(this.hasGeneId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,13);
            WriteUtils.write$TYPE_UINT32(param1,this.geneId$field);
         }
         if(this.hasNewZombieIslandHp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,14);
            WriteUtils.write$TYPE_UINT32(param1,this.newZombieIslandHp$field);
         }
         if(this.hasArmorType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,15);
            WriteUtils.write$TYPE_UINT32(param1,this.armorType$field);
         }
         if(this.hasArmorStar)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,16);
            WriteUtils.write$TYPE_UINT32(param1,this.armorStar$field);
         }
         if(this.hasEvolveLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,17);
            WriteUtils.write$TYPE_UINT32(param1,this.evolveLevel$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc20_:uint = 0;
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
         var _loc15_:uint = 0;
         var _loc16_:uint = 0;
         var _loc17_:uint = 0;
         var _loc18_:uint = 0;
         var _loc19_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc20_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc20_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.uid cannot be set twice.");
                  }
                  _loc3_++;
                  this.uid = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.cardId cannot be set twice.");
                  }
                  _loc4_++;
                  this.cardId = ReadUtils.read$TYPE_UINT32(param1);
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
                     throw new IOError("Bad data format: Dto_CardBaseInfo.currentHp cannot be set twice.");
                  }
                  _loc8_++;
                  this.currentHp = ReadUtils.read$TYPE_UINT64(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.health cannot be set twice.");
                  }
                  _loc9_++;
                  this.health = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.zombieIslandHp cannot be set twice.");
                  }
                  _loc10_++;
                  this.zombieIslandHp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.avatarId cannot be set twice.");
                  }
                  _loc11_++;
                  this.avatarId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.quality cannot be set twice.");
                  }
                  _loc12_++;
                  this.quality = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.rank cannot be set twice.");
                  }
                  _loc13_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.meleeHp cannot be set twice.");
                  }
                  _loc14_++;
                  this.meleeHp = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 13:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.geneId cannot be set twice.");
                  }
                  _loc15_++;
                  this.geneId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 14:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.newZombieIslandHp cannot be set twice.");
                  }
                  _loc16_++;
                  this.newZombieIslandHp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 15:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.armorType cannot be set twice.");
                  }
                  _loc17_++;
                  this.armorType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 16:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.armorStar cannot be set twice.");
                  }
                  _loc18_++;
                  this.armorStar = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 17:
                  if(_loc19_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardBaseInfo.evolveLevel cannot be set twice.");
                  }
                  _loc19_++;
                  this.evolveLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc20_);
                  break;
            }
         }
      }
   }
}
