package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.UInt64;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_FLOAT;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT64;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_AvatarAllAttr extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_AvatarAllAttr";
      
      public static const ATTACK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AvatarAllAttr.attack","attack",1 << 3 | WireType.VARINT);
      
      public static const DEFENSE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AvatarAllAttr.defense","defense",2 << 3 | WireType.VARINT);
      
      public static const HP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("PVZ.Cmd.Dto_AvatarAllAttr.hp","hp",3 << 3 | WireType.VARINT);
      
      public static const SHIELD:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("PVZ.Cmd.Dto_AvatarAllAttr.shield","shield",4 << 3 | WireType.VARINT);
      
      public static const ABILITY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_AvatarAllAttr.ability","ability",5 << 3 | WireType.VARINT);
      
      public static const HIT:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("PVZ.Cmd.Dto_AvatarAllAttr.hit","hit",6 << 3 | WireType.FIXED_32_BIT);
      
      public static const DODGE:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("PVZ.Cmd.Dto_AvatarAllAttr.dodge","dodge",7 << 3 | WireType.FIXED_32_BIT);
      
      public static const CRITICAL:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("PVZ.Cmd.Dto_AvatarAllAttr.critical","critical",8 << 3 | WireType.FIXED_32_BIT);
      
      public static const TOUGH:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("PVZ.Cmd.Dto_AvatarAllAttr.tough","tough",9 << 3 | WireType.FIXED_32_BIT);
      
      public static const IMMUNE:FieldDescriptor$TYPE_FLOAT = new FieldDescriptor$TYPE_FLOAT("PVZ.Cmd.Dto_AvatarAllAttr.immune","immune",10 << 3 | WireType.FIXED_32_BIT);
       
      
      private var attack$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var defense$field:uint;
      
      private var hp$field:UInt64;
      
      private var shield$field:UInt64;
      
      private var ability$field:uint;
      
      private var hit$field:Number;
      
      private var dodge$field:Number;
      
      private var critical$field:Number;
      
      private var tough$field:Number;
      
      private var immune$field:Number;
      
      public function Dto_AvatarAllAttr()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_AvatarAllAttr.$MessageID;
      }
      
      public function clearAttack() : void
      {
         this.hasField$0 &= 4294967294;
         this.attack$field = new uint();
      }
      
      public function get hasAttack() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set attack(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.attack$field = param1;
      }
      
      public function get attack() : uint
      {
         return this.attack$field;
      }
      
      public function clearDefense() : void
      {
         this.hasField$0 &= 4294967293;
         this.defense$field = new uint();
      }
      
      public function get hasDefense() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set defense(param1:uint) : void
      {
         this.hasField$0 |= 2;
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
         this.hasField$0 &= 4294967291;
         this.ability$field = new uint();
      }
      
      public function get hasAbility() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set ability(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.ability$field = param1;
      }
      
      public function get ability() : uint
      {
         return this.ability$field;
      }
      
      public function clearHit() : void
      {
         this.hasField$0 &= 4294967287;
         this.hit$field = new Number();
      }
      
      public function get hasHit() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set hit(param1:Number) : void
      {
         this.hasField$0 |= 8;
         this.hit$field = param1;
      }
      
      public function get hit() : Number
      {
         return this.hit$field;
      }
      
      public function clearDodge() : void
      {
         this.hasField$0 &= 4294967279;
         this.dodge$field = new Number();
      }
      
      public function get hasDodge() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set dodge(param1:Number) : void
      {
         this.hasField$0 |= 16;
         this.dodge$field = param1;
      }
      
      public function get dodge() : Number
      {
         return this.dodge$field;
      }
      
      public function clearCritical() : void
      {
         this.hasField$0 &= 4294967263;
         this.critical$field = new Number();
      }
      
      public function get hasCritical() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set critical(param1:Number) : void
      {
         this.hasField$0 |= 32;
         this.critical$field = param1;
      }
      
      public function get critical() : Number
      {
         return this.critical$field;
      }
      
      public function clearTough() : void
      {
         this.hasField$0 &= 4294967231;
         this.tough$field = new Number();
      }
      
      public function get hasTough() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set tough(param1:Number) : void
      {
         this.hasField$0 |= 64;
         this.tough$field = param1;
      }
      
      public function get tough() : Number
      {
         return this.tough$field;
      }
      
      public function clearImmune() : void
      {
         this.hasField$0 &= 4294967167;
         this.immune$field = new Number();
      }
      
      public function get hasImmune() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set immune(param1:Number) : void
      {
         this.hasField$0 |= 128;
         this.immune$field = param1;
      }
      
      public function get immune() : Number
      {
         return this.immune$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasAttack)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.attack$field);
         }
         if(this.hasDefense)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.defense$field);
         }
         if(this.hasHp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT64(param1,this.hp$field);
         }
         if(this.hasShield)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT64(param1,this.shield$field);
         }
         if(this.hasAbility)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.ability$field);
         }
         if(this.hasHit)
         {
            WriteUtils.writeTag(param1,WireType.FIXED_32_BIT,6);
            WriteUtils.write$TYPE_FLOAT(param1,this.hit$field);
         }
         if(this.hasDodge)
         {
            WriteUtils.writeTag(param1,WireType.FIXED_32_BIT,7);
            WriteUtils.write$TYPE_FLOAT(param1,this.dodge$field);
         }
         if(this.hasCritical)
         {
            WriteUtils.writeTag(param1,WireType.FIXED_32_BIT,8);
            WriteUtils.write$TYPE_FLOAT(param1,this.critical$field);
         }
         if(this.hasTough)
         {
            WriteUtils.writeTag(param1,WireType.FIXED_32_BIT,9);
            WriteUtils.write$TYPE_FLOAT(param1,this.tough$field);
         }
         if(this.hasImmune)
         {
            WriteUtils.writeTag(param1,WireType.FIXED_32_BIT,10);
            WriteUtils.write$TYPE_FLOAT(param1,this.immune$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc13_:uint = 0;
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
         while(param1.bytesAvailable > param2)
         {
            _loc13_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc13_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AvatarAllAttr.attack cannot be set twice.");
                  }
                  _loc3_++;
                  this.attack = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AvatarAllAttr.defense cannot be set twice.");
                  }
                  _loc4_++;
                  this.defense = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AvatarAllAttr.hp cannot be set twice.");
                  }
                  _loc5_++;
                  this.hp = ReadUtils.read$TYPE_UINT64(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AvatarAllAttr.shield cannot be set twice.");
                  }
                  _loc6_++;
                  this.shield = ReadUtils.read$TYPE_UINT64(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AvatarAllAttr.ability cannot be set twice.");
                  }
                  _loc7_++;
                  this.ability = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AvatarAllAttr.hit cannot be set twice.");
                  }
                  _loc8_++;
                  this.hit = ReadUtils.read$TYPE_FLOAT(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AvatarAllAttr.dodge cannot be set twice.");
                  }
                  _loc9_++;
                  this.dodge = ReadUtils.read$TYPE_FLOAT(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AvatarAllAttr.critical cannot be set twice.");
                  }
                  _loc10_++;
                  this.critical = ReadUtils.read$TYPE_FLOAT(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AvatarAllAttr.tough cannot be set twice.");
                  }
                  _loc11_++;
                  this.tough = ReadUtils.read$TYPE_FLOAT(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_AvatarAllAttr.immune cannot be set twice.");
                  }
                  _loc12_++;
                  this.immune = ReadUtils.read$TYPE_FLOAT(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc13_);
                  break;
            }
         }
      }
   }
}
