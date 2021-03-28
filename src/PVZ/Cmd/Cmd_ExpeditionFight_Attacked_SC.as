package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_ExpeditionFight_Attacked_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ExpeditionFight_Attacked_SC";
      
      public static const BANACTIONTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_Attacked_SC.banActionType","banActionType",1 << 3 | WireType.VARINT);
      
      public static const BANACTIONTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_Attacked_SC.banActionTime","banActionTime",2 << 3 | WireType.VARINT);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_Attacked_SC.score","score",3 << 3 | WireType.VARINT);
      
      public static const ATTACKZONEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_Attacked_SC.attackZoneId","attackZoneId",4 << 3 | WireType.VARINT);
      
      public static const ATTACKUIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_Attacked_SC.attackUin","attackUin",5 << 3 | WireType.VARINT);
      
      public static const ATTACKPOWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_Attacked_SC.attackPower","attackPower",6 << 3 | WireType.VARINT);
      
      public static const POWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_Attacked_SC.power","power",7 << 3 | WireType.VARINT);
       
      
      private var banActionType$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var banActionTime$field:uint;
      
      private var score$field:uint;
      
      private var attackZoneId$field:uint;
      
      private var attackUin$field:uint;
      
      private var attackPower$field:uint;
      
      private var power$field:uint;
      
      public function Cmd_ExpeditionFight_Attacked_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ExpeditionFight_Attacked_SC.$MessageID;
      }
      
      public function clearBanActionType() : void
      {
         this.hasField$0 &= 4294967294;
         this.banActionType$field = new uint();
      }
      
      public function get hasBanActionType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set banActionType(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.banActionType$field = param1;
      }
      
      public function get banActionType() : uint
      {
         return this.banActionType$field;
      }
      
      public function clearBanActionTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.banActionTime$field = new uint();
      }
      
      public function get hasBanActionTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set banActionTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.banActionTime$field = param1;
      }
      
      public function get banActionTime() : uint
      {
         return this.banActionTime$field;
      }
      
      public function clearScore() : void
      {
         this.hasField$0 &= 4294967291;
         this.score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.score$field = param1;
      }
      
      public function get score() : uint
      {
         return this.score$field;
      }
      
      public function clearAttackZoneId() : void
      {
         this.hasField$0 &= 4294967287;
         this.attackZoneId$field = new uint();
      }
      
      public function get hasAttackZoneId() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set attackZoneId(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.attackZoneId$field = param1;
      }
      
      public function get attackZoneId() : uint
      {
         return this.attackZoneId$field;
      }
      
      public function clearAttackUin() : void
      {
         this.hasField$0 &= 4294967279;
         this.attackUin$field = new uint();
      }
      
      public function get hasAttackUin() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set attackUin(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.attackUin$field = param1;
      }
      
      public function get attackUin() : uint
      {
         return this.attackUin$field;
      }
      
      public function clearAttackPower() : void
      {
         this.hasField$0 &= 4294967263;
         this.attackPower$field = new uint();
      }
      
      public function get hasAttackPower() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set attackPower(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.attackPower$field = param1;
      }
      
      public function get attackPower() : uint
      {
         return this.attackPower$field;
      }
      
      public function clearPower() : void
      {
         this.hasField$0 &= 4294967231;
         this.power$field = new uint();
      }
      
      public function get hasPower() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set power(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.power$field = param1;
      }
      
      public function get power() : uint
      {
         return this.power$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasBanActionType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.banActionType$field);
         }
         if(this.hasBanActionTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.banActionTime$field);
         }
         if(this.hasScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.score$field);
         }
         if(this.hasAttackZoneId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.attackZoneId$field);
         }
         if(this.hasAttackUin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.attackUin$field);
         }
         if(this.hasAttackPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.attackPower$field);
         }
         if(this.hasPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.power$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc10_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc10_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc10_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Attacked_SC.banActionType cannot be set twice.");
                  }
                  _loc3_++;
                  this.banActionType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Attacked_SC.banActionTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.banActionTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Attacked_SC.score cannot be set twice.");
                  }
                  _loc5_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Attacked_SC.attackZoneId cannot be set twice.");
                  }
                  _loc6_++;
                  this.attackZoneId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Attacked_SC.attackUin cannot be set twice.");
                  }
                  _loc7_++;
                  this.attackUin = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Attacked_SC.attackPower cannot be set twice.");
                  }
                  _loc8_++;
                  this.attackPower = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_Attacked_SC.power cannot be set twice.");
                  }
                  _loc9_++;
                  this.power = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
