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
   
   public final class Dto_WorldBoss_RoleBossInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_WorldBoss_RoleBossInfo";
      
      public static const BOSSID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldBoss_RoleBossInfo.bossId","bossId",1 << 3 | WireType.VARINT);
      
      public static const INSTANCEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldBoss_RoleBossInfo.instanceId","instanceId",6 << 3 | WireType.VARINT);
      
      public static const FIGHTTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldBoss_RoleBossInfo.fightTime","fightTime",2 << 3 | WireType.VARINT);
      
      public static const RELIVETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldBoss_RoleBossInfo.reliveTimes","reliveTimes",3 << 3 | WireType.VARINT);
      
      public static const DAMAGEHP:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_WorldBoss_RoleBossInfo.damageHp","damageHp",4 << 3 | WireType.VARINT);
      
      public static const ATKTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldBoss_RoleBossInfo.atkTimes","atkTimes",5 << 3 | WireType.VARINT);
       
      
      private var bossId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var instanceId$field:uint;
      
      private var fightTime$field:uint;
      
      private var reliveTimes$field:uint;
      
      private var damageHp$field:Int64;
      
      private var atkTimes$field:uint;
      
      public function Dto_WorldBoss_RoleBossInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_WorldBoss_RoleBossInfo.$MessageID;
      }
      
      public function clearBossId() : void
      {
         this.hasField$0 &= 4294967294;
         this.bossId$field = new uint();
      }
      
      public function get hasBossId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set bossId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.bossId$field = param1;
      }
      
      public function get bossId() : uint
      {
         return this.bossId$field;
      }
      
      public function clearInstanceId() : void
      {
         this.hasField$0 &= 4294967293;
         this.instanceId$field = new uint();
      }
      
      public function get hasInstanceId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set instanceId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.instanceId$field = param1;
      }
      
      public function get instanceId() : uint
      {
         return this.instanceId$field;
      }
      
      public function clearFightTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.fightTime$field = new uint();
      }
      
      public function get hasFightTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set fightTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.fightTime$field = param1;
      }
      
      public function get fightTime() : uint
      {
         return this.fightTime$field;
      }
      
      public function clearReliveTimes() : void
      {
         this.hasField$0 &= 4294967287;
         this.reliveTimes$field = new uint();
      }
      
      public function get hasReliveTimes() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set reliveTimes(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.reliveTimes$field = param1;
      }
      
      public function get reliveTimes() : uint
      {
         return this.reliveTimes$field;
      }
      
      public function clearDamageHp() : void
      {
         this.damageHp$field = null;
      }
      
      public function get hasDamageHp() : Boolean
      {
         return this.damageHp$field != null;
      }
      
      public function set damageHp(param1:Int64) : void
      {
         this.damageHp$field = param1;
      }
      
      public function get damageHp() : Int64
      {
         return this.damageHp$field;
      }
      
      public function clearAtkTimes() : void
      {
         this.hasField$0 &= 4294967279;
         this.atkTimes$field = new uint();
      }
      
      public function get hasAtkTimes() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set atkTimes(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.atkTimes$field = param1;
      }
      
      public function get atkTimes() : uint
      {
         return this.atkTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasBossId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.bossId$field);
         }
         if(this.hasInstanceId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.instanceId$field);
         }
         if(this.hasFightTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.fightTime$field);
         }
         if(this.hasReliveTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.reliveTimes$field);
         }
         if(this.hasDamageHp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_INT64(param1,this.damageHp$field);
         }
         if(this.hasAtkTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.atkTimes$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc9_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc9_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldBoss_RoleBossInfo.bossId cannot be set twice.");
                  }
                  _loc3_++;
                  this.bossId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldBoss_RoleBossInfo.instanceId cannot be set twice.");
                  }
                  _loc4_++;
                  this.instanceId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldBoss_RoleBossInfo.fightTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.fightTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldBoss_RoleBossInfo.reliveTimes cannot be set twice.");
                  }
                  _loc6_++;
                  this.reliveTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldBoss_RoleBossInfo.damageHp cannot be set twice.");
                  }
                  _loc7_++;
                  this.damageHp = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 5:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldBoss_RoleBossInfo.atkTimes cannot be set twice.");
                  }
                  _loc8_++;
                  this.atkTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
