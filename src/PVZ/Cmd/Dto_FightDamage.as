package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_FightDamage extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FightDamage";
      
      public static const TARGETINDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightDamage.targetIndex","targetIndex",1 << 3 | WireType.VARINT);
      
      public static const CHANGEHP:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_FightDamage.changeHp","changeHp",2 << 3 | WireType.VARINT);
      
      public static const DAMAGETYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_FightDamage.damageType","damageType",3 << 3 | WireType.VARINT,E_DamageType);
      
      public static const CHANGERAGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_FightDamage.changeRage","changeRage",4 << 3 | WireType.VARINT);
      
      public static const BUFFID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightDamage.buffId","buffId",5 << 3 | WireType.VARINT);
      
      public static const CHANGESHIELD:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_FightDamage.changeShield","changeShield",6 << 3 | WireType.VARINT);
      
      public static const ISDEAD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_FightDamage.isDead","isDead",7 << 3 | WireType.VARINT);
      
      public static const BUFFLEFTROUND:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightDamage.buffLeftRound","buffLeftRound",8 << 3 | WireType.VARINT);
      
      public static const ISADDBUFF:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_FightDamage.isAddBuff","isAddBuff",9 << 3 | WireType.VARINT);
      
      public static const ISRELIVE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_FightDamage.isRelive","isRelive",10 << 3 | WireType.VARINT);
      
      public static const CHANGEMAXHP:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_FightDamage.changeMaxHp","changeMaxHp",11 << 3 | WireType.VARINT);
      
      public static const PUPPETBUFFID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightDamage.puppetBuffId","puppetBuffId",12 << 3 | WireType.VARINT);
       
      
      private var targetIndex$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var changeHp$field:Int64;
      
      private var damageType$field:int;
      
      private var changeRage$field:int;
      
      private var buffId$field:uint;
      
      private var changeShield$field:Int64;
      
      private var isDead$field:Boolean;
      
      private var buffLeftRound$field:uint;
      
      private var isAddBuff$field:Boolean;
      
      private var isRelive$field:Boolean;
      
      private var changeMaxHp$field:Int64;
      
      private var puppetBuffId$field:uint;
      
      public function Dto_FightDamage()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FightDamage.$MessageID;
      }
      
      public function clearTargetIndex() : void
      {
         this.hasField$0 &= 4294967294;
         this.targetIndex$field = new uint();
      }
      
      public function get hasTargetIndex() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set targetIndex(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.targetIndex$field = param1;
      }
      
      public function get targetIndex() : uint
      {
         return this.targetIndex$field;
      }
      
      public function clearChangeHp() : void
      {
         this.changeHp$field = null;
      }
      
      public function get hasChangeHp() : Boolean
      {
         return this.changeHp$field != null;
      }
      
      public function set changeHp(param1:Int64) : void
      {
         this.changeHp$field = param1;
      }
      
      public function get changeHp() : Int64
      {
         return this.changeHp$field;
      }
      
      public function clearDamageType() : void
      {
         this.hasField$0 &= 4294967293;
         this.damageType$field = new int();
      }
      
      public function get hasDamageType() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set damageType(param1:int) : void
      {
         this.hasField$0 |= 2;
         this.damageType$field = param1;
      }
      
      public function get damageType() : int
      {
         return this.damageType$field;
      }
      
      public function clearChangeRage() : void
      {
         this.hasField$0 &= 4294967291;
         this.changeRage$field = new int();
      }
      
      public function get hasChangeRage() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set changeRage(param1:int) : void
      {
         this.hasField$0 |= 4;
         this.changeRage$field = param1;
      }
      
      public function get changeRage() : int
      {
         return this.changeRage$field;
      }
      
      public function clearBuffId() : void
      {
         this.hasField$0 &= 4294967287;
         this.buffId$field = new uint();
      }
      
      public function get hasBuffId() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set buffId(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.buffId$field = param1;
      }
      
      public function get buffId() : uint
      {
         return this.buffId$field;
      }
      
      public function clearChangeShield() : void
      {
         this.changeShield$field = null;
      }
      
      public function get hasChangeShield() : Boolean
      {
         return this.changeShield$field != null;
      }
      
      public function set changeShield(param1:Int64) : void
      {
         this.changeShield$field = param1;
      }
      
      public function get changeShield() : Int64
      {
         return this.changeShield$field;
      }
      
      public function clearIsDead() : void
      {
         this.hasField$0 &= 4294967279;
         this.isDead$field = new Boolean();
      }
      
      public function get hasIsDead() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set isDead(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.isDead$field = param1;
      }
      
      public function get isDead() : Boolean
      {
         return this.isDead$field;
      }
      
      public function clearBuffLeftRound() : void
      {
         this.hasField$0 &= 4294967263;
         this.buffLeftRound$field = new uint();
      }
      
      public function get hasBuffLeftRound() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set buffLeftRound(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.buffLeftRound$field = param1;
      }
      
      public function get buffLeftRound() : uint
      {
         if(!this.hasBuffLeftRound)
         {
            return 1;
         }
         return this.buffLeftRound$field;
      }
      
      public function clearIsAddBuff() : void
      {
         this.hasField$0 &= 4294967231;
         this.isAddBuff$field = new Boolean();
      }
      
      public function get hasIsAddBuff() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set isAddBuff(param1:Boolean) : void
      {
         this.hasField$0 |= 64;
         this.isAddBuff$field = param1;
      }
      
      public function get isAddBuff() : Boolean
      {
         if(!this.hasIsAddBuff)
         {
            return false;
         }
         return this.isAddBuff$field;
      }
      
      public function clearIsRelive() : void
      {
         this.hasField$0 &= 4294967167;
         this.isRelive$field = new Boolean();
      }
      
      public function get hasIsRelive() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set isRelive(param1:Boolean) : void
      {
         this.hasField$0 |= 128;
         this.isRelive$field = param1;
      }
      
      public function get isRelive() : Boolean
      {
         return this.isRelive$field;
      }
      
      public function clearChangeMaxHp() : void
      {
         this.changeMaxHp$field = null;
      }
      
      public function get hasChangeMaxHp() : Boolean
      {
         return this.changeMaxHp$field != null;
      }
      
      public function set changeMaxHp(param1:Int64) : void
      {
         this.changeMaxHp$field = param1;
      }
      
      public function get changeMaxHp() : Int64
      {
         return this.changeMaxHp$field;
      }
      
      public function clearPuppetBuffId() : void
      {
         this.hasField$0 &= 4294967039;
         this.puppetBuffId$field = new uint();
      }
      
      public function get hasPuppetBuffId() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set puppetBuffId(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.puppetBuffId$field = param1;
      }
      
      public function get puppetBuffId() : uint
      {
         return this.puppetBuffId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasTargetIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.targetIndex$field);
         }
         if(this.hasChangeHp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_INT64(param1,this.changeHp$field);
         }
         if(this.hasDamageType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_ENUM(param1,this.damageType$field);
         }
         if(this.hasChangeRage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_INT32(param1,this.changeRage$field);
         }
         if(this.hasBuffId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.buffId$field);
         }
         if(this.hasChangeShield)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_INT64(param1,this.changeShield$field);
         }
         if(this.hasIsDead)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_BOOL(param1,this.isDead$field);
         }
         if(this.hasBuffLeftRound)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.buffLeftRound$field);
         }
         if(this.hasIsAddBuff)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_BOOL(param1,this.isAddBuff$field);
         }
         if(this.hasIsRelive)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_BOOL(param1,this.isRelive$field);
         }
         if(this.hasChangeMaxHp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_INT64(param1,this.changeMaxHp$field);
         }
         if(this.hasPuppetBuffId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_UINT32(param1,this.puppetBuffId$field);
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
                     throw new IOError("Bad data format: Dto_FightDamage.targetIndex cannot be set twice.");
                  }
                  _loc3_++;
                  this.targetIndex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightDamage.changeHp cannot be set twice.");
                  }
                  _loc4_++;
                  this.changeHp = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightDamage.damageType cannot be set twice.");
                  }
                  _loc5_++;
                  this.damageType = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightDamage.changeRage cannot be set twice.");
                  }
                  _loc6_++;
                  this.changeRage = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightDamage.buffId cannot be set twice.");
                  }
                  _loc7_++;
                  this.buffId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightDamage.changeShield cannot be set twice.");
                  }
                  _loc8_++;
                  this.changeShield = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightDamage.isDead cannot be set twice.");
                  }
                  _loc9_++;
                  this.isDead = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightDamage.buffLeftRound cannot be set twice.");
                  }
                  _loc10_++;
                  this.buffLeftRound = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightDamage.isAddBuff cannot be set twice.");
                  }
                  _loc11_++;
                  this.isAddBuff = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightDamage.isRelive cannot be set twice.");
                  }
                  _loc12_++;
                  this.isRelive = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightDamage.changeMaxHp cannot be set twice.");
                  }
                  _loc13_++;
                  this.changeMaxHp = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 12:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightDamage.puppetBuffId cannot be set twice.");
                  }
                  _loc14_++;
                  this.puppetBuffId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc15_);
                  break;
            }
         }
      }
   }
}
