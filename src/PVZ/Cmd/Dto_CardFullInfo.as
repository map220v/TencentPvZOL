package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.UInt64;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_FLOAT;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_CardFullInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_CardFullInfo";
      
      public static const BASE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_CardFullInfo.base","base",1 << 3 | WireType.LENGTH_DELIMITED,Dto_CardBaseInfo);
      
      public static const POWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardFullInfo.power","power",2 << 3 | WireType.VARINT);
      
      public static const ATTACK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardFullInfo.attack","attack",3 << 3 | WireType.VARINT);
      
      public static const DEFENSE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardFullInfo.defense","defense",4 << 3 | WireType.VARINT);
      
      public static const HP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("PVZ.Cmd.Dto_CardFullInfo.hp","hp",5 << 3 | WireType.VARINT);
      
      public static const SHIELD:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("PVZ.Cmd.Dto_CardFullInfo.shield","shield",6 << 3 | WireType.VARINT);
      
      public static const ABILITY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardFullInfo.ability","ability",7 << 3 | WireType.VARINT);
      
      public static const HIT:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("PVZ.Cmd.Dto_CardFullInfo.hit","hit",8 << 3 | WireType.FIXED_32_BIT);
      
      public static const DODGE:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("PVZ.Cmd.Dto_CardFullInfo.dodge","dodge",9 << 3 | WireType.FIXED_32_BIT);
      
      public static const CRITICAL:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("PVZ.Cmd.Dto_CardFullInfo.critical","critical",10 << 3 | WireType.FIXED_32_BIT);
      
      public static const TOUGH:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("PVZ.Cmd.Dto_CardFullInfo.tough","tough",11 << 3 | WireType.FIXED_32_BIT);
      
      public static const IMMUNE:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("PVZ.Cmd.Dto_CardFullInfo.immune","immune",12 << 3 | WireType.FIXED_32_BIT);
      
      public static const POWERELE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_CardFullInfo.powerEle","powerEle",13 << 3 | WireType.LENGTH_DELIMITED,Dto_CardPower);
      
      public static const NORMALADDDAMAGEVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardFullInfo.normalAddDamageValue","normalAddDamageValue",14 << 3 | WireType.VARINT);
      
      public static const NORMALSUBDAMAGEVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardFullInfo.normalSubDamageValue","normalSubDamageValue",15 << 3 | WireType.VARINT);
      
      public static const SKILLADDDAMAGEVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardFullInfo.skillAddDamageValue","skillAddDamageValue",16 << 3 | WireType.VARINT);
      
      public static const SKILLSUBDAMAGEVALUE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardFullInfo.skillSubDamageValue","skillSubDamageValue",17 << 3 | WireType.VARINT);
      
      public static const NORMALADDDAMAGEPERCENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardFullInfo.normalAddDamagePercent","normalAddDamagePercent",18 << 3 | WireType.VARINT);
      
      public static const NORMALSUBDAMAGEPERCENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardFullInfo.normalSubDamagePercent","normalSubDamagePercent",19 << 3 | WireType.VARINT);
      
      public static const SKILLADDDAMAGEPERCENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardFullInfo.skillAddDamagePercent","skillAddDamagePercent",20 << 3 | WireType.VARINT);
      
      public static const SKILLSUBDAMAGEPERCENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardFullInfo.skillSubDamagePercent","skillSubDamagePercent",21 << 3 | WireType.VARINT);
      
      public static const ARMORADDDAMAGEPERCENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardFullInfo.armorAddDamagePercent","armorAddDamagePercent",22 << 3 | WireType.VARINT);
      
      public static const ARMORSUBDAMAGEPERCENT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_CardFullInfo.armorSubDamagePercent","armorSubDamagePercent",23 << 3 | WireType.VARINT);
       
      
      private var base$field:Dto_CardBaseInfo;
      
      private var power$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var attack$field:uint;
      
      private var defense$field:uint;
      
      private var hp$field:UInt64;
      
      private var shield$field:UInt64;
      
      private var ability$field:uint;
      
      private var hit$field:Number;
      
      private var dodge$field:Number;
      
      private var critical$field:Number;
      
      private var tough$field:Number;
      
      private var immune$field:Number;
      
      public var powerEle:Array;
      
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
      
      public function Dto_CardFullInfo()
      {
         this.powerEle = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_CardFullInfo.$MessageID;
      }
      
      public function clearBase() : void
      {
         this.base$field = null;
      }
      
      public function get hasBase() : Boolean
      {
         return this.base$field != null;
      }
      
      public function set base(param1:Dto_CardBaseInfo) : void
      {
         this.base$field = param1;
      }
      
      public function get base() : Dto_CardBaseInfo
      {
         return this.base$field;
      }
      
      public function clearPower() : void
      {
         this.hasField$0 &= 4294967294;
         this.power$field = new uint();
      }
      
      public function get hasPower() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set power(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.power$field = param1;
      }
      
      public function get power() : uint
      {
         return this.power$field;
      }
      
      public function clearAttack() : void
      {
         this.hasField$0 &= 4294967293;
         this.attack$field = new uint();
      }
      
      public function get hasAttack() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set attack(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.attack$field = param1;
      }
      
      public function get attack() : uint
      {
         return this.attack$field;
      }
      
      public function clearDefense() : void
      {
         this.hasField$0 &= 4294967291;
         this.defense$field = new uint();
      }
      
      public function get hasDefense() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set defense(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.defense$field = param1;
      }
      
      public function get defense() : uint
      {
         return this.defense$field;
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
      
      public function clearAbility() : void
      {
         this.hasField$0 &= 4294967287;
         this.ability$field = new uint();
      }
      
      public function get hasAbility() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set ability(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.ability$field = param1;
      }
      
      public function get ability() : uint
      {
         return this.ability$field;
      }
      
      public function clearHit() : void
      {
         this.hasField$0 &= 4294967279;
         this.hit$field = new Number();
      }
      
      public function get hasHit() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set hit(param1:Number) : void
      {
         this.hasField$0 |= 16;
         this.hit$field = param1;
      }
      
      public function get hit() : Number
      {
         return this.hit$field;
      }
      
      public function clearDodge() : void
      {
         this.hasField$0 &= 4294967263;
         this.dodge$field = new Number();
      }
      
      public function get hasDodge() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set dodge(param1:Number) : void
      {
         this.hasField$0 |= 32;
         this.dodge$field = param1;
      }
      
      public function get dodge() : Number
      {
         return this.dodge$field;
      }
      
      public function clearCritical() : void
      {
         this.hasField$0 &= 4294967231;
         this.critical$field = new Number();
      }
      
      public function get hasCritical() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set critical(param1:Number) : void
      {
         this.hasField$0 |= 64;
         this.critical$field = param1;
      }
      
      public function get critical() : Number
      {
         return this.critical$field;
      }
      
      public function clearTough() : void
      {
         this.hasField$0 &= 4294967167;
         this.tough$field = new Number();
      }
      
      public function get hasTough() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set tough(param1:Number) : void
      {
         this.hasField$0 |= 128;
         this.tough$field = param1;
      }
      
      public function get tough() : Number
      {
         return this.tough$field;
      }
      
      public function clearImmune() : void
      {
         this.hasField$0 &= 4294967039;
         this.immune$field = new Number();
      }
      
      public function get hasImmune() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set immune(param1:Number) : void
      {
         this.hasField$0 |= 256;
         this.immune$field = param1;
      }
      
      public function get immune() : Number
      {
         return this.immune$field;
      }
      
      public function clearNormalAddDamageValue() : void
      {
         this.hasField$0 &= 4294966783;
         this.normalAddDamageValue$field = new uint();
      }
      
      public function get hasNormalAddDamageValue() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set normalAddDamageValue(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.normalAddDamageValue$field = param1;
      }
      
      public function get normalAddDamageValue() : uint
      {
         return this.normalAddDamageValue$field;
      }
      
      public function clearNormalSubDamageValue() : void
      {
         this.hasField$0 &= 4294966271;
         this.normalSubDamageValue$field = new uint();
      }
      
      public function get hasNormalSubDamageValue() : Boolean
      {
         return (this.hasField$0 & 1024) != 0;
      }
      
      public function set normalSubDamageValue(param1:uint) : void
      {
         this.hasField$0 |= 1024;
         this.normalSubDamageValue$field = param1;
      }
      
      public function get normalSubDamageValue() : uint
      {
         return this.normalSubDamageValue$field;
      }
      
      public function clearSkillAddDamageValue() : void
      {
         this.hasField$0 &= 4294965247;
         this.skillAddDamageValue$field = new uint();
      }
      
      public function get hasSkillAddDamageValue() : Boolean
      {
         return (this.hasField$0 & 2048) != 0;
      }
      
      public function set skillAddDamageValue(param1:uint) : void
      {
         this.hasField$0 |= 2048;
         this.skillAddDamageValue$field = param1;
      }
      
      public function get skillAddDamageValue() : uint
      {
         return this.skillAddDamageValue$field;
      }
      
      public function clearSkillSubDamageValue() : void
      {
         this.hasField$0 &= 4294963199;
         this.skillSubDamageValue$field = new uint();
      }
      
      public function get hasSkillSubDamageValue() : Boolean
      {
         return (this.hasField$0 & 4096) != 0;
      }
      
      public function set skillSubDamageValue(param1:uint) : void
      {
         this.hasField$0 |= 4096;
         this.skillSubDamageValue$field = param1;
      }
      
      public function get skillSubDamageValue() : uint
      {
         return this.skillSubDamageValue$field;
      }
      
      public function clearNormalAddDamagePercent() : void
      {
         this.hasField$0 &= 4294959103;
         this.normalAddDamagePercent$field = new uint();
      }
      
      public function get hasNormalAddDamagePercent() : Boolean
      {
         return (this.hasField$0 & 8192) != 0;
      }
      
      public function set normalAddDamagePercent(param1:uint) : void
      {
         this.hasField$0 |= 8192;
         this.normalAddDamagePercent$field = param1;
      }
      
      public function get normalAddDamagePercent() : uint
      {
         return this.normalAddDamagePercent$field;
      }
      
      public function clearNormalSubDamagePercent() : void
      {
         this.hasField$0 &= 4294950911;
         this.normalSubDamagePercent$field = new uint();
      }
      
      public function get hasNormalSubDamagePercent() : Boolean
      {
         return (this.hasField$0 & 16384) != 0;
      }
      
      public function set normalSubDamagePercent(param1:uint) : void
      {
         this.hasField$0 |= 16384;
         this.normalSubDamagePercent$field = param1;
      }
      
      public function get normalSubDamagePercent() : uint
      {
         return this.normalSubDamagePercent$field;
      }
      
      public function clearSkillAddDamagePercent() : void
      {
         this.hasField$0 &= 4294934527;
         this.skillAddDamagePercent$field = new uint();
      }
      
      public function get hasSkillAddDamagePercent() : Boolean
      {
         return (this.hasField$0 & 32768) != 0;
      }
      
      public function set skillAddDamagePercent(param1:uint) : void
      {
         this.hasField$0 |= 32768;
         this.skillAddDamagePercent$field = param1;
      }
      
      public function get skillAddDamagePercent() : uint
      {
         return this.skillAddDamagePercent$field;
      }
      
      public function clearSkillSubDamagePercent() : void
      {
         this.hasField$0 &= 4294901759;
         this.skillSubDamagePercent$field = new uint();
      }
      
      public function get hasSkillSubDamagePercent() : Boolean
      {
         return (this.hasField$0 & 65536) != 0;
      }
      
      public function set skillSubDamagePercent(param1:uint) : void
      {
         this.hasField$0 |= 65536;
         this.skillSubDamagePercent$field = param1;
      }
      
      public function get skillSubDamagePercent() : uint
      {
         return this.skillSubDamagePercent$field;
      }
      
      public function clearArmorAddDamagePercent() : void
      {
         this.hasField$0 &= 4294836223;
         this.armorAddDamagePercent$field = new uint();
      }
      
      public function get hasArmorAddDamagePercent() : Boolean
      {
         return (this.hasField$0 & 131072) != 0;
      }
      
      public function set armorAddDamagePercent(param1:uint) : void
      {
         this.hasField$0 |= 131072;
         this.armorAddDamagePercent$field = param1;
      }
      
      public function get armorAddDamagePercent() : uint
      {
         return this.armorAddDamagePercent$field;
      }
      
      public function clearArmorSubDamagePercent() : void
      {
         this.hasField$0 &= 4294705151;
         this.armorSubDamagePercent$field = new uint();
      }
      
      public function get hasArmorSubDamagePercent() : Boolean
      {
         return (this.hasField$0 & 262144) != 0;
      }
      
      public function set armorSubDamagePercent(param1:uint) : void
      {
         this.hasField$0 |= 262144;
         this.armorSubDamagePercent$field = param1;
      }
      
      public function get armorSubDamagePercent() : uint
      {
         return this.armorSubDamagePercent$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasBase)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.base$field);
         }
         if(this.hasPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.power$field);
         }
         if(this.hasAttack)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.attack$field);
         }
         if(this.hasDefense)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.defense$field);
         }
         if(this.hasHp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT64(param1,this.hp$field);
         }
         if(this.hasShield)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT64(param1,this.shield$field);
         }
         if(this.hasAbility)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.ability$field);
         }
         if(this.hasHit)
         {
            WriteUtils.writeTag(param1,WireType.FIXED_32_BIT,8);
            WriteUtils.write$TYPE_FLOAT(param1,this.hit$field);
         }
         if(this.hasDodge)
         {
            WriteUtils.writeTag(param1,WireType.FIXED_32_BIT,9);
            WriteUtils.write$TYPE_FLOAT(param1,this.dodge$field);
         }
         if(this.hasCritical)
         {
            WriteUtils.writeTag(param1,WireType.FIXED_32_BIT,10);
            WriteUtils.write$TYPE_FLOAT(param1,this.critical$field);
         }
         if(this.hasTough)
         {
            WriteUtils.writeTag(param1,WireType.FIXED_32_BIT,11);
            WriteUtils.write$TYPE_FLOAT(param1,this.tough$field);
         }
         if(this.hasImmune)
         {
            WriteUtils.writeTag(param1,WireType.FIXED_32_BIT,12);
            WriteUtils.write$TYPE_FLOAT(param1,this.immune$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.powerEle.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,13);
            WriteUtils.write$TYPE_MESSAGE(param1,this.powerEle[_loc2_]);
            _loc2_++;
         }
         if(this.hasNormalAddDamageValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,14);
            WriteUtils.write$TYPE_UINT32(param1,this.normalAddDamageValue$field);
         }
         if(this.hasNormalSubDamageValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,15);
            WriteUtils.write$TYPE_UINT32(param1,this.normalSubDamageValue$field);
         }
         if(this.hasSkillAddDamageValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,16);
            WriteUtils.write$TYPE_UINT32(param1,this.skillAddDamageValue$field);
         }
         if(this.hasSkillSubDamageValue)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,17);
            WriteUtils.write$TYPE_UINT32(param1,this.skillSubDamageValue$field);
         }
         if(this.hasNormalAddDamagePercent)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,18);
            WriteUtils.write$TYPE_UINT32(param1,this.normalAddDamagePercent$field);
         }
         if(this.hasNormalSubDamagePercent)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,19);
            WriteUtils.write$TYPE_UINT32(param1,this.normalSubDamagePercent$field);
         }
         if(this.hasSkillAddDamagePercent)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,20);
            WriteUtils.write$TYPE_UINT32(param1,this.skillAddDamagePercent$field);
         }
         if(this.hasSkillSubDamagePercent)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,21);
            WriteUtils.write$TYPE_UINT32(param1,this.skillSubDamagePercent$field);
         }
         if(this.hasArmorAddDamagePercent)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,22);
            WriteUtils.write$TYPE_UINT32(param1,this.armorAddDamagePercent$field);
         }
         if(this.hasArmorSubDamagePercent)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,23);
            WriteUtils.write$TYPE_UINT32(param1,this.armorSubDamagePercent$field);
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
                     throw new IOError("Bad data format: Dto_CardFullInfo.base cannot be set twice.");
                  }
                  _loc3_++;
                  this.base = new Dto_CardBaseInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.base);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.power cannot be set twice.");
                  }
                  _loc4_++;
                  this.power = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.attack cannot be set twice.");
                  }
                  _loc5_++;
                  this.attack = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.defense cannot be set twice.");
                  }
                  _loc6_++;
                  this.defense = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.hp cannot be set twice.");
                  }
                  _loc7_++;
                  this.hp = ReadUtils.read$TYPE_UINT64(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.shield cannot be set twice.");
                  }
                  _loc8_++;
                  this.shield = ReadUtils.read$TYPE_UINT64(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.ability cannot be set twice.");
                  }
                  _loc9_++;
                  this.ability = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.hit cannot be set twice.");
                  }
                  _loc10_++;
                  this.hit = ReadUtils.read$TYPE_FLOAT(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.dodge cannot be set twice.");
                  }
                  _loc11_++;
                  this.dodge = ReadUtils.read$TYPE_FLOAT(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.critical cannot be set twice.");
                  }
                  _loc12_++;
                  this.critical = ReadUtils.read$TYPE_FLOAT(param1);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.tough cannot be set twice.");
                  }
                  _loc13_++;
                  this.tough = ReadUtils.read$TYPE_FLOAT(param1);
                  break;
               case 12:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.immune cannot be set twice.");
                  }
                  _loc14_++;
                  this.immune = ReadUtils.read$TYPE_FLOAT(param1);
                  break;
               case 13:
                  this.powerEle.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_CardPower()));
                  break;
               case 14:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.normalAddDamageValue cannot be set twice.");
                  }
                  _loc15_++;
                  this.normalAddDamageValue = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 15:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.normalSubDamageValue cannot be set twice.");
                  }
                  _loc16_++;
                  this.normalSubDamageValue = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 16:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.skillAddDamageValue cannot be set twice.");
                  }
                  _loc17_++;
                  this.skillAddDamageValue = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 17:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.skillSubDamageValue cannot be set twice.");
                  }
                  _loc18_++;
                  this.skillSubDamageValue = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 18:
                  if(_loc19_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.normalAddDamagePercent cannot be set twice.");
                  }
                  _loc19_++;
                  this.normalAddDamagePercent = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 19:
                  if(_loc20_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.normalSubDamagePercent cannot be set twice.");
                  }
                  _loc20_++;
                  this.normalSubDamagePercent = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 20:
                  if(_loc21_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.skillAddDamagePercent cannot be set twice.");
                  }
                  _loc21_++;
                  this.skillAddDamagePercent = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 21:
                  if(_loc22_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.skillSubDamagePercent cannot be set twice.");
                  }
                  _loc22_++;
                  this.skillSubDamagePercent = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 22:
                  if(_loc23_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.armorAddDamagePercent cannot be set twice.");
                  }
                  _loc23_++;
                  this.armorAddDamagePercent = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 23:
                  if(_loc24_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_CardFullInfo.armorSubDamagePercent cannot be set twice.");
                  }
                  _loc24_++;
                  this.armorSubDamagePercent = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc25_);
                  break;
            }
         }
      }
   }
}
