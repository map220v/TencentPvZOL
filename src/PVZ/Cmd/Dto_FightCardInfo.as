package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.UInt64;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_FightCardInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FightCardInfo";
      
      public static const POSINDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightCardInfo.posIndex","posIndex",1 << 3 | WireType.VARINT);
      
      public static const CARDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightCardInfo.cardId","cardId",2 << 3 | WireType.VARINT);
      
      public static const HP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("PVZ.Cmd.Dto_FightCardInfo.hp","hp",3 << 3 | WireType.VARINT);
      
      public static const RAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightCardInfo.rage","rage",4 << 3 | WireType.VARINT);
      
      public static const SHIELD:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("PVZ.Cmd.Dto_FightCardInfo.shield","shield",5 << 3 | WireType.VARINT);
      
      public static const MAXHP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("PVZ.Cmd.Dto_FightCardInfo.maxHp","maxHp",6 << 3 | WireType.VARINT);
      
      public static const MAXRAGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightCardInfo.maxRage","maxRage",7 << 3 | WireType.VARINT);
      
      public static const MAXSHIELD:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("PVZ.Cmd.Dto_FightCardInfo.maxShield","maxShield",8 << 3 | WireType.VARINT);
      
      public static const ISLEADER:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_FightCardInfo.isLeader","isLeader",9 << 3 | WireType.VARINT);
      
      public static const EXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightCardInfo.exp","exp",10 << 3 | WireType.VARINT);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightCardInfo.level","level",11 << 3 | WireType.VARINT);
      
      public static const ISHELPCARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_FightCardInfo.isHelpCard","isHelpCard",12 << 3 | WireType.VARINT);
      
      public static const FORGELEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightCardInfo.forgeLevel","forgeLevel",13 << 3 | WireType.VARINT);
      
      public static const HEALTH:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightCardInfo.health","health",14 << 3 | WireType.VARINT);
      
      public static const AVATARID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightCardInfo.avatarId","avatarId",15 << 3 | WireType.VARINT);
      
      public static const CARDPOWER:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("PVZ.Cmd.Dto_FightCardInfo.cardPower","cardPower",16 << 3 | WireType.VARINT);
      
      public static const ISLIVE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_FightCardInfo.isLive","isLive",17 << 3 | WireType.VARINT);
      
      public static const POWERELE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FightCardInfo.powerEle","powerEle",18 << 3 | WireType.LENGTH_DELIMITED,Dto_CardPower);
      
      public static const QUALITY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightCardInfo.quality","quality",19 << 3 | WireType.VARINT);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightCardInfo.rank","rank",20 << 3 | WireType.VARINT);
      
      public static const GENEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightCardInfo.geneId","geneId",21 << 3 | WireType.VARINT);
      
      public static const ARMORTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightCardInfo.armorType","armorType",22 << 3 | WireType.VARINT);
      
      public static const ARMORSTAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightCardInfo.armorStar","armorStar",23 << 3 | WireType.VARINT);
       
      
      private var posIndex$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var cardId$field:uint;
      
      private var hp$field:UInt64;
      
      private var rage$field:uint;
      
      private var shield$field:UInt64;
      
      private var maxHp$field:UInt64;
      
      private var maxRage$field:uint;
      
      private var maxShield$field:UInt64;
      
      private var isLeader$field:Boolean;
      
      private var exp$field:uint;
      
      private var level$field:uint;
      
      private var isHelpCard$field:Boolean;
      
      private var forgeLevel$field:uint;
      
      private var health$field:uint;
      
      private var avatarId$field:uint;
      
      private var cardPower$field:UInt64;
      
      private var isLive$field:Boolean;
      
      public var powerEle:Array;
      
      private var quality$field:uint;
      
      private var rank$field:uint;
      
      private var geneId$field:uint;
      
      private var armorType$field:uint;
      
      private var armorStar$field:uint;
      
      public function Dto_FightCardInfo()
      {
         this.powerEle = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FightCardInfo.$MessageID;
      }
      
      public function clearPosIndex() : void
      {
         this.hasField$0 &= 4294967294;
         this.posIndex$field = new uint();
      }
      
      public function get hasPosIndex() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set posIndex(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.posIndex$field = param1;
      }
      
      public function get posIndex() : uint
      {
         return this.posIndex$field;
      }
      
      public function clearCardId() : void
      {
         this.hasField$0 &= 4294967293;
         this.cardId$field = new uint();
      }
      
      public function get hasCardId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set cardId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.cardId$field = param1;
      }
      
      public function get cardId() : uint
      {
         return this.cardId$field;
      }
      
      public function clearHp() : void
      {
         this.hp$field = null;
      }
      
      public function get hasHp() : Boolean
      {
         return this.hp$field != null;
      }
      
      public function set hp(param1:UInt64) : void
      {
         this.hp$field = param1;
      }
      
      public function get hp() : UInt64
      {
         return this.hp$field;
      }
      
      public function clearRage() : void
      {
         this.hasField$0 &= 4294967291;
         this.rage$field = new uint();
      }
      
      public function get hasRage() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set rage(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.rage$field = param1;
      }
      
      public function get rage() : uint
      {
         return this.rage$field;
      }
      
      public function clearShield() : void
      {
         this.shield$field = null;
      }
      
      public function get hasShield() : Boolean
      {
         return this.shield$field != null;
      }
      
      public function set shield(param1:UInt64) : void
      {
         this.shield$field = param1;
      }
      
      public function get shield() : UInt64
      {
         return this.shield$field;
      }
      
      public function clearMaxHp() : void
      {
         this.maxHp$field = null;
      }
      
      public function get hasMaxHp() : Boolean
      {
         return this.maxHp$field != null;
      }
      
      public function set maxHp(param1:UInt64) : void
      {
         this.maxHp$field = param1;
      }
      
      public function get maxHp() : UInt64
      {
         return this.maxHp$field;
      }
      
      public function clearMaxRage() : void
      {
         this.hasField$0 &= 4294967287;
         this.maxRage$field = new uint();
      }
      
      public function get hasMaxRage() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set maxRage(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.maxRage$field = param1;
      }
      
      public function get maxRage() : uint
      {
         return this.maxRage$field;
      }
      
      public function clearMaxShield() : void
      {
         this.maxShield$field = null;
      }
      
      public function get hasMaxShield() : Boolean
      {
         return this.maxShield$field != null;
      }
      
      public function set maxShield(param1:UInt64) : void
      {
         this.maxShield$field = param1;
      }
      
      public function get maxShield() : UInt64
      {
         return this.maxShield$field;
      }
      
      public function clearIsLeader() : void
      {
         this.hasField$0 &= 4294967279;
         this.isLeader$field = new Boolean();
      }
      
      public function get hasIsLeader() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set isLeader(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.isLeader$field = param1;
      }
      
      public function get isLeader() : Boolean
      {
         return this.isLeader$field;
      }
      
      public function clearExp() : void
      {
         this.hasField$0 &= 4294967263;
         this.exp$field = new uint();
      }
      
      public function get hasExp() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set exp(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.exp$field = param1;
      }
      
      public function get exp() : uint
      {
         return this.exp$field;
      }
      
      public function clearLevel() : void
      {
         this.hasField$0 &= 4294967231;
         this.level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.level$field = param1;
      }
      
      public function get level() : uint
      {
         return this.level$field;
      }
      
      public function clearIsHelpCard() : void
      {
         this.hasField$0 &= 4294967167;
         this.isHelpCard$field = new Boolean();
      }
      
      public function get hasIsHelpCard() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set isHelpCard(param1:Boolean) : void
      {
         this.hasField$0 |= 128;
         this.isHelpCard$field = param1;
      }
      
      public function get isHelpCard() : Boolean
      {
         return this.isHelpCard$field;
      }
      
      public function clearForgeLevel() : void
      {
         this.hasField$0 &= 4294967039;
         this.forgeLevel$field = new uint();
      }
      
      public function get hasForgeLevel() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set forgeLevel(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.forgeLevel$field = param1;
      }
      
      public function get forgeLevel() : uint
      {
         return this.forgeLevel$field;
      }
      
      public function clearHealth() : void
      {
         this.hasField$0 &= 4294966783;
         this.health$field = new uint();
      }
      
      public function get hasHealth() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set health(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.health$field = param1;
      }
      
      public function get health() : uint
      {
         return this.health$field;
      }
      
      public function clearAvatarId() : void
      {
         this.hasField$0 &= 4294966271;
         this.avatarId$field = new uint();
      }
      
      public function get hasAvatarId() : Boolean
      {
         return (this.hasField$0 & 1024) != 0;
      }
      
      public function set avatarId(param1:uint) : void
      {
         this.hasField$0 |= 1024;
         this.avatarId$field = param1;
      }
      
      public function get avatarId() : uint
      {
         return this.avatarId$field;
      }
      
      public function clearCardPower() : void
      {
         this.cardPower$field = null;
      }
      
      public function get hasCardPower() : Boolean
      {
         return this.cardPower$field != null;
      }
      
      public function set cardPower(param1:UInt64) : void
      {
         this.cardPower$field = param1;
      }
      
      public function get cardPower() : UInt64
      {
         return this.cardPower$field;
      }
      
      public function clearIsLive() : void
      {
         this.hasField$0 &= 4294965247;
         this.isLive$field = new Boolean();
      }
      
      public function get hasIsLive() : Boolean
      {
         return (this.hasField$0 & 2048) != 0;
      }
      
      public function set isLive(param1:Boolean) : void
      {
         this.hasField$0 |= 2048;
         this.isLive$field = param1;
      }
      
      public function get isLive() : Boolean
      {
         return this.isLive$field;
      }
      
      public function clearQuality() : void
      {
         this.hasField$0 &= 4294963199;
         this.quality$field = new uint();
      }
      
      public function get hasQuality() : Boolean
      {
         return (this.hasField$0 & 4096) != 0;
      }
      
      public function set quality(param1:uint) : void
      {
         this.hasField$0 |= 4096;
         this.quality$field = param1;
      }
      
      public function get quality() : uint
      {
         return this.quality$field;
      }
      
      public function clearRank() : void
      {
         this.hasField$0 &= 4294959103;
         this.rank$field = new uint();
      }
      
      public function get hasRank() : Boolean
      {
         return (this.hasField$0 & 8192) != 0;
      }
      
      public function set rank(param1:uint) : void
      {
         this.hasField$0 |= 8192;
         this.rank$field = param1;
      }
      
      public function get rank() : uint
      {
         return this.rank$field;
      }
      
      public function clearGeneId() : void
      {
         this.hasField$0 &= 4294950911;
         this.geneId$field = new uint();
      }
      
      public function get hasGeneId() : Boolean
      {
         return (this.hasField$0 & 16384) != 0;
      }
      
      public function set geneId(param1:uint) : void
      {
         this.hasField$0 |= 16384;
         this.geneId$field = param1;
      }
      
      public function get geneId() : uint
      {
         return this.geneId$field;
      }
      
      public function clearArmorType() : void
      {
         this.hasField$0 &= 4294934527;
         this.armorType$field = new uint();
      }
      
      public function get hasArmorType() : Boolean
      {
         return (this.hasField$0 & 32768) != 0;
      }
      
      public function set armorType(param1:uint) : void
      {
         this.hasField$0 |= 32768;
         this.armorType$field = param1;
      }
      
      public function get armorType() : uint
      {
         return this.armorType$field;
      }
      
      public function clearArmorStar() : void
      {
         this.hasField$0 &= 4294901759;
         this.armorStar$field = new uint();
      }
      
      public function get hasArmorStar() : Boolean
      {
         return (this.hasField$0 & 65536) != 0;
      }
      
      public function set armorStar(param1:uint) : void
      {
         this.hasField$0 |= 65536;
         this.armorStar$field = param1;
      }
      
      public function get armorStar() : uint
      {
         return this.armorStar$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasPosIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.posIndex$field);
         }
         if(this.hasCardId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.cardId$field);
         }
         if(this.hasHp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT64(param1,this.hp$field);
         }
         if(this.hasRage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.rage$field);
         }
         if(this.hasShield)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT64(param1,this.shield$field);
         }
         if(this.hasMaxHp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT64(param1,this.maxHp$field);
         }
         if(this.hasMaxRage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.maxRage$field);
         }
         if(this.hasMaxShield)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT64(param1,this.maxShield$field);
         }
         if(this.hasIsLeader)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_BOOL(param1,this.isLeader$field);
         }
         if(this.hasExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.exp$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasIsHelpCard)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_BOOL(param1,this.isHelpCard$field);
         }
         if(this.hasForgeLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,13);
            WriteUtils.write$TYPE_UINT32(param1,this.forgeLevel$field);
         }
         if(this.hasHealth)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,14);
            WriteUtils.write$TYPE_UINT32(param1,this.health$field);
         }
         if(this.hasAvatarId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,15);
            WriteUtils.write$TYPE_UINT32(param1,this.avatarId$field);
         }
         if(this.hasCardPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,16);
            WriteUtils.write$TYPE_UINT64(param1,this.cardPower$field);
         }
         if(this.hasIsLive)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,17);
            WriteUtils.write$TYPE_BOOL(param1,this.isLive$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.powerEle.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,18);
            WriteUtils.write$TYPE_MESSAGE(param1,this.powerEle[_loc2_]);
            _loc2_++;
         }
         if(this.hasQuality)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,19);
            WriteUtils.write$TYPE_UINT32(param1,this.quality$field);
         }
         if(this.hasRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,20);
            WriteUtils.write$TYPE_UINT32(param1,this.rank$field);
         }
         if(this.hasGeneId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,21);
            WriteUtils.write$TYPE_UINT32(param1,this.geneId$field);
         }
         if(this.hasArmorType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,22);
            WriteUtils.write$TYPE_UINT32(param1,this.armorType$field);
         }
         if(this.hasArmorStar)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,23);
            WriteUtils.write$TYPE_UINT32(param1,this.armorStar$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc25_:uint = 0;
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
         var _loc20_:uint = 0;
         var _loc21_:uint = 0;
         var _loc22_:uint = 0;
         var _loc23_:uint = 0;
         var _loc24_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc25_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc25_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightCardInfo.posIndex cannot be set twice.");
                  }
                  _loc3_++;
                  this.posIndex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightCardInfo.cardId cannot be set twice.");
                  }
                  _loc4_++;
                  this.cardId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightCardInfo.hp cannot be set twice.");
                  }
                  _loc5_++;
                  this.hp = ReadUtils.read$TYPE_UINT64(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightCardInfo.rage cannot be set twice.");
                  }
                  _loc6_++;
                  this.rage = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightCardInfo.shield cannot be set twice.");
                  }
                  _loc7_++;
                  this.shield = ReadUtils.read$TYPE_UINT64(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightCardInfo.maxHp cannot be set twice.");
                  }
                  _loc8_++;
                  this.maxHp = ReadUtils.read$TYPE_UINT64(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightCardInfo.maxRage cannot be set twice.");
                  }
                  _loc9_++;
                  this.maxRage = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightCardInfo.maxShield cannot be set twice.");
                  }
                  _loc10_++;
                  this.maxShield = ReadUtils.read$TYPE_UINT64(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightCardInfo.isLeader cannot be set twice.");
                  }
                  _loc11_++;
                  this.isLeader = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightCardInfo.exp cannot be set twice.");
                  }
                  _loc12_++;
                  this.exp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightCardInfo.level cannot be set twice.");
                  }
                  _loc13_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightCardInfo.isHelpCard cannot be set twice.");
                  }
                  _loc14_++;
                  this.isHelpCard = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 13:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightCardInfo.forgeLevel cannot be set twice.");
                  }
                  _loc15_++;
                  this.forgeLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 14:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightCardInfo.health cannot be set twice.");
                  }
                  _loc16_++;
                  this.health = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 15:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightCardInfo.avatarId cannot be set twice.");
                  }
                  _loc17_++;
                  this.avatarId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 16:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightCardInfo.cardPower cannot be set twice.");
                  }
                  _loc18_++;
                  this.cardPower = ReadUtils.read$TYPE_UINT64(param1);
                  break;
               case 17:
                  if(_loc19_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightCardInfo.isLive cannot be set twice.");
                  }
                  _loc19_++;
                  this.isLive = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 18:
                  this.powerEle.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_CardPower()));
                  break;
               case 19:
                  if(_loc20_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightCardInfo.quality cannot be set twice.");
                  }
                  _loc20_++;
                  this.quality = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 20:
                  if(_loc21_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightCardInfo.rank cannot be set twice.");
                  }
                  _loc21_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 21:
                  if(_loc22_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightCardInfo.geneId cannot be set twice.");
                  }
                  _loc22_++;
                  this.geneId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 22:
                  if(_loc23_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightCardInfo.armorType cannot be set twice.");
                  }
                  _loc23_++;
                  this.armorType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 23:
                  if(_loc24_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightCardInfo.armorStar cannot be set twice.");
                  }
                  _loc24_++;
                  this.armorStar = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc25_);
                  break;
            }
         }
      }
   }
}
