package PVZ.Protocol
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_CardAttributeTerm extends Message
   {
      
      public static const $MessageID:String = "PVZ.Protocol.Dto_CardAttributeTerm";
      
      public static const ATTACK:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Protocol.Dto_CardAttributeTerm.attack","attack",1 << 3 | WireType.VARINT);
      
      public static const DEFENSE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Protocol.Dto_CardAttributeTerm.defense","defense",2 << 3 | WireType.VARINT);
      
      public static const HP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Protocol.Dto_CardAttributeTerm.hp","hp",3 << 3 | WireType.VARINT);
      
      public static const SHIELD:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Protocol.Dto_CardAttributeTerm.shield","shield",4 << 3 | WireType.VARINT);
      
      public static const ABILITY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Protocol.Dto_CardAttributeTerm.ability","ability",5 << 3 | WireType.VARINT);
      
      public static const HIT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Protocol.Dto_CardAttributeTerm.hit","hit",6 << 3 | WireType.VARINT);
      
      public static const DODGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Protocol.Dto_CardAttributeTerm.dodge","dodge",7 << 3 | WireType.VARINT);
      
      public static const CRITICAL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Protocol.Dto_CardAttributeTerm.critical","critical",8 << 3 | WireType.VARINT);
      
      public static const TOUGH:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Protocol.Dto_CardAttributeTerm.tough","tough",9 << 3 | WireType.VARINT);
      
      public static const IMMUNE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Protocol.Dto_CardAttributeTerm.immune","immune",10 << 3 | WireType.VARINT);
      
      public static const NORMALDAMAGEPARAM:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Protocol.Dto_CardAttributeTerm.normalDamageParam","normalDamageParam",11 << 3 | WireType.VARINT);
      
      public static const NORMALDEFENSEPARAM:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Protocol.Dto_CardAttributeTerm.normalDefenseParam","normalDefenseParam",12 << 3 | WireType.VARINT);
      
      public static const SKILLDAMAGEPARAM:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Protocol.Dto_CardAttributeTerm.skillDamageParam","skillDamageParam",13 << 3 | WireType.VARINT);
      
      public static const SKILLDEFENSEPARAM:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Protocol.Dto_CardAttributeTerm.skillDefenseParam","skillDefenseParam",14 << 3 | WireType.VARINT);
      
      public static const SPEED:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Protocol.Dto_CardAttributeTerm.speed","speed",15 << 3 | WireType.VARINT);
      
      public static const NORMALADDDAMAGEVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardAttributeTerm.normalAddDamageValue","normalAddDamageValue",16 << 3 | WireType.VARINT);
      
      public static const NORMALSUBDAMAGEVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardAttributeTerm.normalSubDamageValue","normalSubDamageValue",17 << 3 | WireType.VARINT);
      
      public static const SKILLADDDAMAGEVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardAttributeTerm.skillAddDamageValue","skillAddDamageValue",18 << 3 | WireType.VARINT);
      
      public static const SKILLSUBDAMAGEVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardAttributeTerm.skillSubDamageValue","skillSubDamageValue",19 << 3 | WireType.VARINT);
      
      public static const NORMALADDDAMAGEPERCENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardAttributeTerm.normalAddDamagePercent","normalAddDamagePercent",20 << 3 | WireType.VARINT);
      
      public static const NORMALSUBDAMAGEPERCENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardAttributeTerm.normalSubDamagePercent","normalSubDamagePercent",21 << 3 | WireType.VARINT);
      
      public static const SKILLADDDAMAGEPERCENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardAttributeTerm.skillAddDamagePercent","skillAddDamagePercent",22 << 3 | WireType.VARINT);
      
      public static const SKILLSUBDAMAGEPERCENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardAttributeTerm.skillSubDamagePercent","skillSubDamagePercent",23 << 3 | WireType.VARINT);
      
      public static const ARMORADDDAMAGEPERCENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardAttributeTerm.armorAddDamagePercent","armorAddDamagePercent",24 << 3 | WireType.VARINT);
      
      public static const ARMORSUBDAMAGEPERCENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_CardAttributeTerm.armorSubDamagePercent","armorSubDamagePercent",25 << 3 | WireType.VARINT);
       
      
      private var attack$field:int;
      
      private var hasField$0:uint = 0;
      
      private var defense$field:int;
      
      private var hp$field:int;
      
      private var shield$field:int;
      
      private var ability$field:int;
      
      private var hit$field:int;
      
      private var dodge$field:int;
      
      private var critical$field:int;
      
      private var tough$field:int;
      
      private var immune$field:int;
      
      private var normalDamageParam$field:int;
      
      private var normalDefenseParam$field:int;
      
      private var skillDamageParam$field:int;
      
      private var skillDefenseParam$field:int;
      
      private var speed$field:Int64;
      
      private var normalAddDamageValue$field:uint;
      
      private var normalSubDamageValue$field:uint;
      
      private var skillAddDamageValue$field:uint;
      
      private var skillSubDamageValue$field:uint;
      
      private var normalAddDamagePercent$field:uint;
      
      private var normalSubDamagePercent$field:uint;
      
      private var skillAddDamagePercent$field:uint;
      
      private var skillSubDamagePercent$field:uint;
      
      private var armorAddDamagePercent$field:uint;
      
      private var armorSubDamagePercent$field:uint;
      
      public function Dto_CardAttributeTerm()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_CardAttributeTerm.$MessageID;
      }
      
      public function clearAttack() : void
      {
         this.hasField$0 &= 4294967294;
         this.attack$field = new int();
      }
      
      public function get hasAttack() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set attack(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.attack$field = param1;
      }
      
      public function get attack() : int
      {
         return this.attack$field;
      }
      
      public function clearDefense() : void
      {
         this.hasField$0 &= 4294967293;
         this.defense$field = new int();
      }
      
      public function get hasDefense() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set defense(param1:int) : void
      {
         this.hasField$0 |= 2;
         this.defense$field = param1;
      }
      
      public function get defense() : int
      {
         return this.defense$field;
      }
      
      public function clearHp() : void
      {
         this.hasField$0 &= 4294967291;
         this.hp$field = new int();
      }
      
      public function get hasHp() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set hp(param1:int) : void
      {
         this.hasField$0 |= 4;
         this.hp$field = param1;
      }
      
      public function get hp() : int
      {
         return this.hp$field;
      }
      
      public function clearShield() : void
      {
         this.hasField$0 &= 4294967287;
         this.shield$field = new int();
      }
      
      public function get hasShield() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set shield(param1:int) : void
      {
         this.hasField$0 |= 8;
         this.shield$field = param1;
      }
      
      public function get shield() : int
      {
         return this.shield$field;
      }
      
      public function clearAbility() : void
      {
         this.hasField$0 &= 4294967279;
         this.ability$field = new int();
      }
      
      public function get hasAbility() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set ability(param1:int) : void
      {
         this.hasField$0 |= 16;
         this.ability$field = param1;
      }
      
      public function get ability() : int
      {
         return this.ability$field;
      }
      
      public function clearHit() : void
      {
         this.hasField$0 &= 4294967263;
         this.hit$field = new int();
      }
      
      public function get hasHit() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set hit(param1:int) : void
      {
         this.hasField$0 |= 32;
         this.hit$field = param1;
      }
      
      public function get hit() : int
      {
         return this.hit$field;
      }
      
      public function clearDodge() : void
      {
         this.hasField$0 &= 4294967231;
         this.dodge$field = new int();
      }
      
      public function get hasDodge() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set dodge(param1:int) : void
      {
         this.hasField$0 |= 64;
         this.dodge$field = param1;
      }
      
      public function get dodge() : int
      {
         return this.dodge$field;
      }
      
      public function clearCritical() : void
      {
         this.hasField$0 &= 4294967167;
         this.critical$field = new int();
      }
      
      public function get hasCritical() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set critical(param1:int) : void
      {
         this.hasField$0 |= 128;
         this.critical$field = param1;
      }
      
      public function get critical() : int
      {
         return this.critical$field;
      }
      
      public function clearTough() : void
      {
         this.hasField$0 &= 4294967039;
         this.tough$field = new int();
      }
      
      public function get hasTough() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set tough(param1:int) : void
      {
         this.hasField$0 |= 256;
         this.tough$field = param1;
      }
      
      public function get tough() : int
      {
         return this.tough$field;
      }
      
      public function clearImmune() : void
      {
         this.hasField$0 &= 4294966783;
         this.immune$field = new int();
      }
      
      public function get hasImmune() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set immune(param1:int) : void
      {
         this.hasField$0 |= 512;
         this.immune$field = param1;
      }
      
      public function get immune() : int
      {
         return this.immune$field;
      }
      
      public function clearNormalDamageParam() : void
      {
         this.hasField$0 &= 4294966271;
         this.normalDamageParam$field = new int();
      }
      
      public function get hasNormalDamageParam() : Boolean
      {
         return (this.hasField$0 & 1024) != 0;
      }
      
      public function set normalDamageParam(param1:int) : void
      {
         this.hasField$0 |= 1024;
         this.normalDamageParam$field = param1;
      }
      
      public function get normalDamageParam() : int
      {
         return this.normalDamageParam$field;
      }
      
      public function clearNormalDefenseParam() : void
      {
         this.hasField$0 &= 4294965247;
         this.normalDefenseParam$field = new int();
      }
      
      public function get hasNormalDefenseParam() : Boolean
      {
         return (this.hasField$0 & 2048) != 0;
      }
      
      public function set normalDefenseParam(param1:int) : void
      {
         this.hasField$0 |= 2048;
         this.normalDefenseParam$field = param1;
      }
      
      public function get normalDefenseParam() : int
      {
         return this.normalDefenseParam$field;
      }
      
      public function clearSkillDamageParam() : void
      {
         this.hasField$0 &= 4294963199;
         this.skillDamageParam$field = new int();
      }
      
      public function get hasSkillDamageParam() : Boolean
      {
         return (this.hasField$0 & 4096) != 0;
      }
      
      public function set skillDamageParam(param1:int) : void
      {
         this.hasField$0 |= 4096;
         this.skillDamageParam$field = param1;
      }
      
      public function get skillDamageParam() : int
      {
         return this.skillDamageParam$field;
      }
      
      public function clearSkillDefenseParam() : void
      {
         this.hasField$0 &= 4294959103;
         this.skillDefenseParam$field = new int();
      }
      
      public function get hasSkillDefenseParam() : Boolean
      {
         return (this.hasField$0 & 8192) != 0;
      }
      
      public function set skillDefenseParam(param1:int) : void
      {
         this.hasField$0 |= 8192;
         this.skillDefenseParam$field = param1;
      }
      
      public function get skillDefenseParam() : int
      {
         return this.skillDefenseParam$field;
      }
      
      public function clearSpeed() : void
      {
         this.speed$field = null;
      }
      
      public function get hasSpeed() : Boolean
      {
         return this.speed$field != null;
      }
      
      public function set speed(param1:Int64) : void
      {
         this.speed$field = param1;
      }
      
      public function get speed() : Int64
      {
         return this.speed$field;
      }
      
      public function clearNormalAddDamageValue() : void
      {
         this.hasField$0 &= 4294950911;
         this.normalAddDamageValue$field = new uint();
      }
      
      public function get hasNormalAddDamageValue() : Boolean
      {
         return (this.hasField$0 & 16384) != 0;
      }
      
      public function set normalAddDamageValue(param1:uint) : void
      {
         this.hasField$0 |= 16384;
         this.normalAddDamageValue$field = param1;
      }
      
      public function get normalAddDamageValue() : uint
      {
         return this.normalAddDamageValue$field;
      }
      
      public function clearNormalSubDamageValue() : void
      {
         this.hasField$0 &= 4294934527;
         this.normalSubDamageValue$field = new uint();
      }
      
      public function get hasNormalSubDamageValue() : Boolean
      {
         return (this.hasField$0 & 32768) != 0;
      }
      
      public function set normalSubDamageValue(param1:uint) : void
      {
         this.hasField$0 |= 32768;
         this.normalSubDamageValue$field = param1;
      }
      
      public function get normalSubDamageValue() : uint
      {
         return this.normalSubDamageValue$field;
      }
      
      public function clearSkillAddDamageValue() : void
      {
         this.hasField$0 &= 4294901759;
         this.skillAddDamageValue$field = new uint();
      }
      
      public function get hasSkillAddDamageValue() : Boolean
      {
         return (this.hasField$0 & 65536) != 0;
      }
      
      public function set skillAddDamageValue(param1:uint) : void
      {
         this.hasField$0 |= 65536;
         this.skillAddDamageValue$field = param1;
      }
      
      public function get skillAddDamageValue() : uint
      {
         return this.skillAddDamageValue$field;
      }
      
      public function clearSkillSubDamageValue() : void
      {
         this.hasField$0 &= 4294836223;
         this.skillSubDamageValue$field = new uint();
      }
      
      public function get hasSkillSubDamageValue() : Boolean
      {
         return (this.hasField$0 & 131072) != 0;
      }
      
      public function set skillSubDamageValue(param1:uint) : void
      {
         this.hasField$0 |= 131072;
         this.skillSubDamageValue$field = param1;
      }
      
      public function get skillSubDamageValue() : uint
      {
         return this.skillSubDamageValue$field;
      }
      
      public function clearNormalAddDamagePercent() : void
      {
         this.hasField$0 &= 4294705151;
         this.normalAddDamagePercent$field = new uint();
      }
      
      public function get hasNormalAddDamagePercent() : Boolean
      {
         return (this.hasField$0 & 262144) != 0;
      }
      
      public function set normalAddDamagePercent(param1:uint) : void
      {
         this.hasField$0 |= 262144;
         this.normalAddDamagePercent$field = param1;
      }
      
      public function get normalAddDamagePercent() : uint
      {
         return this.normalAddDamagePercent$field;
      }
      
      public function clearNormalSubDamagePercent() : void
      {
         this.hasField$0 &= 4294443007;
         this.normalSubDamagePercent$field = new uint();
      }
      
      public function get hasNormalSubDamagePercent() : Boolean
      {
         return (this.hasField$0 & 524288) != 0;
      }
      
      public function set normalSubDamagePercent(param1:uint) : void
      {
         this.hasField$0 |= 524288;
         this.normalSubDamagePercent$field = param1;
      }
      
      public function get normalSubDamagePercent() : uint
      {
         return this.normalSubDamagePercent$field;
      }
      
      public function clearSkillAddDamagePercent() : void
      {
         this.hasField$0 &= 4293918719;
         this.skillAddDamagePercent$field = new uint();
      }
      
      public function get hasSkillAddDamagePercent() : Boolean
      {
         return (this.hasField$0 & 1048576) != 0;
      }
      
      public function set skillAddDamagePercent(param1:uint) : void
      {
         this.hasField$0 |= 1048576;
         this.skillAddDamagePercent$field = param1;
      }
      
      public function get skillAddDamagePercent() : uint
      {
         return this.skillAddDamagePercent$field;
      }
      
      public function clearSkillSubDamagePercent() : void
      {
         this.hasField$0 &= 4292870143;
         this.skillSubDamagePercent$field = new uint();
      }
      
      public function get hasSkillSubDamagePercent() : Boolean
      {
         return (this.hasField$0 & 2097152) != 0;
      }
      
      public function set skillSubDamagePercent(param1:uint) : void
      {
         this.hasField$0 |= 2097152;
         this.skillSubDamagePercent$field = param1;
      }
      
      public function get skillSubDamagePercent() : uint
      {
         return this.skillSubDamagePercent$field;
      }
      
      public function clearArmorAddDamagePercent() : void
      {
         this.hasField$0 &= 4290772991;
         this.armorAddDamagePercent$field = new uint();
      }
      
      public function get hasArmorAddDamagePercent() : Boolean
      {
         return (this.hasField$0 & 4194304) != 0;
      }
      
      public function set armorAddDamagePercent(param1:uint) : void
      {
         this.hasField$0 |= 4194304;
         this.armorAddDamagePercent$field = param1;
      }
      
      public function get armorAddDamagePercent() : uint
      {
         return this.armorAddDamagePercent$field;
      }
      
      public function clearArmorSubDamagePercent() : void
      {
         this.hasField$0 &= 4286578687;
         this.armorSubDamagePercent$field = new uint();
      }
      
      public function get hasArmorSubDamagePercent() : Boolean
      {
         return (this.hasField$0 & 8388608) != 0;
      }
      
      public function set armorSubDamagePercent(param1:uint) : void
      {
         this.hasField$0 |= 8388608;
         this.armorSubDamagePercent$field = param1;
      }
      
      public function get armorSubDamagePercent() : uint
      {
         return this.armorSubDamagePercent$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasAttack)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT32(param1,this.attack$field);
         }
         if(this.hasDefense)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT32(param1,this.defense$field);
         }
         if(this.hasHp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_INT32(param1,this.hp$field);
         }
         if(this.hasShield)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_INT32(param1,this.shield$field);
         }
         if(this.hasAbility)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_INT32(param1,this.ability$field);
         }
         if(this.hasHit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_INT32(param1,this.hit$field);
         }
         if(this.hasDodge)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_INT32(param1,this.dodge$field);
         }
         if(this.hasCritical)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_INT32(param1,this.critical$field);
         }
         if(this.hasTough)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_INT32(param1,this.tough$field);
         }
         if(this.hasImmune)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_INT32(param1,this.immune$field);
         }
         if(this.hasNormalDamageParam)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_INT32(param1,this.normalDamageParam$field);
         }
         if(this.hasNormalDefenseParam)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_INT32(param1,this.normalDefenseParam$field);
         }
         if(this.hasSkillDamageParam)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,13);
            WriteUtils.write$TYPE_INT32(param1,this.skillDamageParam$field);
         }
         if(this.hasSkillDefenseParam)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,14);
            WriteUtils.write$TYPE_INT32(param1,this.skillDefenseParam$field);
         }
         if(this.hasSpeed)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,15);
            WriteUtils.write$TYPE_INT64(param1,this.speed$field);
         }
         if(this.hasNormalAddDamageValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,16);
            WriteUtils.write$TYPE_UINT32(param1,this.normalAddDamageValue$field);
         }
         if(this.hasNormalSubDamageValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,17);
            WriteUtils.write$TYPE_UINT32(param1,this.normalSubDamageValue$field);
         }
         if(this.hasSkillAddDamageValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,18);
            WriteUtils.write$TYPE_UINT32(param1,this.skillAddDamageValue$field);
         }
         if(this.hasSkillSubDamageValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,19);
            WriteUtils.write$TYPE_UINT32(param1,this.skillSubDamageValue$field);
         }
         if(this.hasNormalAddDamagePercent)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,20);
            WriteUtils.write$TYPE_UINT32(param1,this.normalAddDamagePercent$field);
         }
         if(this.hasNormalSubDamagePercent)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,21);
            WriteUtils.write$TYPE_UINT32(param1,this.normalSubDamagePercent$field);
         }
         if(this.hasSkillAddDamagePercent)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,22);
            WriteUtils.write$TYPE_UINT32(param1,this.skillAddDamagePercent$field);
         }
         if(this.hasSkillSubDamagePercent)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,23);
            WriteUtils.write$TYPE_UINT32(param1,this.skillSubDamagePercent$field);
         }
         if(this.hasArmorAddDamagePercent)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,24);
            WriteUtils.write$TYPE_UINT32(param1,this.armorAddDamagePercent$field);
         }
         if(this.hasArmorSubDamagePercent)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,25);
            WriteUtils.write$TYPE_UINT32(param1,this.armorSubDamagePercent$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc28_:uint = 0;
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
         var _loc25_:uint = 0;
         var _loc26_:uint = 0;
         var _loc27_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc28_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc28_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.attack cannot be set twice.");
                  }
                  _loc3_++;
                  this.attack = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.defense cannot be set twice.");
                  }
                  _loc4_++;
                  this.defense = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.hp cannot be set twice.");
                  }
                  _loc5_++;
                  this.hp = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.shield cannot be set twice.");
                  }
                  _loc6_++;
                  this.shield = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.ability cannot be set twice.");
                  }
                  _loc7_++;
                  this.ability = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.hit cannot be set twice.");
                  }
                  _loc8_++;
                  this.hit = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.dodge cannot be set twice.");
                  }
                  _loc9_++;
                  this.dodge = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.critical cannot be set twice.");
                  }
                  _loc10_++;
                  this.critical = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.tough cannot be set twice.");
                  }
                  _loc11_++;
                  this.tough = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.immune cannot be set twice.");
                  }
                  _loc12_++;
                  this.immune = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.normalDamageParam cannot be set twice.");
                  }
                  _loc13_++;
                  this.normalDamageParam = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 12:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.normalDefenseParam cannot be set twice.");
                  }
                  _loc14_++;
                  this.normalDefenseParam = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 13:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.skillDamageParam cannot be set twice.");
                  }
                  _loc15_++;
                  this.skillDamageParam = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 14:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.skillDefenseParam cannot be set twice.");
                  }
                  _loc16_++;
                  this.skillDefenseParam = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 15:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.speed cannot be set twice.");
                  }
                  _loc17_++;
                  this.speed = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 16:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.normalAddDamageValue cannot be set twice.");
                  }
                  _loc18_++;
                  this.normalAddDamageValue = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 17:
                  if(_loc19_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.normalSubDamageValue cannot be set twice.");
                  }
                  _loc19_++;
                  this.normalSubDamageValue = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 18:
                  if(_loc20_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.skillAddDamageValue cannot be set twice.");
                  }
                  _loc20_++;
                  this.skillAddDamageValue = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 19:
                  if(_loc21_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.skillSubDamageValue cannot be set twice.");
                  }
                  _loc21_++;
                  this.skillSubDamageValue = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 20:
                  if(_loc22_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.normalAddDamagePercent cannot be set twice.");
                  }
                  _loc22_++;
                  this.normalAddDamagePercent = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 21:
                  if(_loc23_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.normalSubDamagePercent cannot be set twice.");
                  }
                  _loc23_++;
                  this.normalSubDamagePercent = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 22:
                  if(_loc24_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.skillAddDamagePercent cannot be set twice.");
                  }
                  _loc24_++;
                  this.skillAddDamagePercent = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 23:
                  if(_loc25_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.skillSubDamagePercent cannot be set twice.");
                  }
                  _loc25_++;
                  this.skillSubDamagePercent = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 24:
                  if(_loc26_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.armorAddDamagePercent cannot be set twice.");
                  }
                  _loc26_++;
                  this.armorAddDamagePercent = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 25:
                  if(_loc27_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardAttributeTerm.armorSubDamagePercent cannot be set twice.");
                  }
                  _loc27_++;
                  this.armorSubDamagePercent = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc28_);
                  break;
            }
         }
      }
   }
}
