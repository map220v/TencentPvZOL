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
   
   public final class Dto_EnemyCardInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_EnemyCardInfo";
      
      public static const POSINDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_EnemyCardInfo.posIndex","posIndex",1 << 3 | WireType.VARINT);
      
      public static const CARDID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_EnemyCardInfo.cardId","cardId",2 << 3 | WireType.VARINT);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_EnemyCardInfo.level","level",3 << 3 | WireType.VARINT);
      
      public static const ISLEADER:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_EnemyCardInfo.isLeader","isLeader",4 << 3 | WireType.VARINT);
      
      public static const POWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_EnemyCardInfo.power","power",5 << 3 | WireType.VARINT);
      
      public static const AVATARID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_EnemyCardInfo.avatarId","avatarId",6 << 3 | WireType.VARINT);
      
      public static const HP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("PVZ.Cmd.Dto_EnemyCardInfo.hp","hp",7 << 3 | WireType.VARINT);
      
      public static const MAXHP:FieldDescriptor$TYPE_UINT64 = new FieldDescriptor$TYPE_UINT64("PVZ.Cmd.Dto_EnemyCardInfo.maxhp","maxhp",8 << 3 | WireType.VARINT);
      
      public static const POWERELE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_EnemyCardInfo.powerEle","powerEle",9 << 3 | WireType.LENGTH_DELIMITED,Dto_CardPower);
      
      public static const FORGELEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_EnemyCardInfo.forgeLevel","forgeLevel",10 << 3 | WireType.VARINT);
      
      public static const QUALITY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_EnemyCardInfo.quality","quality",11 << 3 | WireType.VARINT);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_EnemyCardInfo.rank","rank",12 << 3 | WireType.VARINT);
       
      
      private var posIndex$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var cardId$field:uint;
      
      private var level$field:uint;
      
      private var isLeader$field:Boolean;
      
      private var power$field:uint;
      
      private var avatarId$field:uint;
      
      private var hp$field:UInt64;
      
      private var maxhp$field:UInt64;
      
      public var powerEle:Array;
      
      private var forgeLevel$field:uint;
      
      private var quality$field:uint;
      
      private var rank$field:uint;
      
      public function Dto_EnemyCardInfo()
      {
         this.powerEle = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_EnemyCardInfo.$MessageID;
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
      
      public function clearIsLeader() : void
      {
         this.hasField$0 &= 4294967287;
         this.isLeader$field = new Boolean();
      }
      
      public function get hasIsLeader() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set isLeader(param1:Boolean) : void
      {
         this.hasField$0 |= 8;
         this.isLeader$field = param1;
      }
      
      public function get isLeader() : Boolean
      {
         return this.isLeader$field;
      }
      
      public function clearPower() : void
      {
         this.hasField$0 &= 4294967279;
         this.power$field = new uint();
      }
      
      public function get hasPower() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set power(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.power$field = param1;
      }
      
      public function get power() : uint
      {
         return this.power$field;
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
      
      public function clearMaxhp() : void
      {
         this.maxhp$field = null;
      }
      
      public function get hasMaxhp() : Boolean
      {
         return this.maxhp$field != null;
      }
      
      public function set maxhp(param1:UInt64) : void
      {
         this.maxhp$field = param1;
      }
      
      public function get maxhp() : UInt64
      {
         return this.maxhp$field;
      }
      
      public function clearForgeLevel() : void
      {
         this.hasField$0 &= 4294967231;
         this.forgeLevel$field = new uint();
      }
      
      public function get hasForgeLevel() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set forgeLevel(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.forgeLevel$field = param1;
      }
      
      public function get forgeLevel() : uint
      {
         return this.forgeLevel$field;
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
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasIsLeader)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.isLeader$field);
         }
         if(this.hasPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.power$field);
         }
         if(this.hasAvatarId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.avatarId$field);
         }
         if(this.hasHp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT64(param1,this.hp$field);
         }
         if(this.hasMaxhp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT64(param1,this.maxhp$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.powerEle.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_MESSAGE(param1,this.powerEle[_loc2_]);
            _loc2_++;
         }
         if(this.hasForgeLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.forgeLevel$field);
         }
         if(this.hasQuality)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.quality$field);
         }
         if(this.hasRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_UINT32(param1,this.rank$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc14_:uint = 0;
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
         while(param1.bytesAvailable > param2)
         {
            _loc14_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc14_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_EnemyCardInfo.posIndex cannot be set twice.");
                  }
                  _loc3_++;
                  this.posIndex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_EnemyCardInfo.cardId cannot be set twice.");
                  }
                  _loc4_++;
                  this.cardId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_EnemyCardInfo.level cannot be set twice.");
                  }
                  _loc5_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_EnemyCardInfo.isLeader cannot be set twice.");
                  }
                  _loc6_++;
                  this.isLeader = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_EnemyCardInfo.power cannot be set twice.");
                  }
                  _loc7_++;
                  this.power = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_EnemyCardInfo.avatarId cannot be set twice.");
                  }
                  _loc8_++;
                  this.avatarId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_EnemyCardInfo.hp cannot be set twice.");
                  }
                  _loc9_++;
                  this.hp = ReadUtils.read$TYPE_UINT64(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_EnemyCardInfo.maxhp cannot be set twice.");
                  }
                  _loc10_++;
                  this.maxhp = ReadUtils.read$TYPE_UINT64(param1);
                  break;
               case 9:
                  this.powerEle.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_CardPower()));
                  break;
               case 10:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_EnemyCardInfo.forgeLevel cannot be set twice.");
                  }
                  _loc11_++;
                  this.forgeLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_EnemyCardInfo.quality cannot be set twice.");
                  }
                  _loc12_++;
                  this.quality = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_EnemyCardInfo.rank cannot be set twice.");
                  }
                  _loc13_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc14_);
                  break;
            }
         }
      }
   }
}
