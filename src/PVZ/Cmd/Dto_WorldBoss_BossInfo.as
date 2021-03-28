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
   
   public final class Dto_WorldBoss_BossInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_WorldBoss_BossInfo";
      
      public static const BOSSID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldBoss_BossInfo.bossId","bossId",1 << 3 | WireType.VARINT);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldBoss_BossInfo.level","level",2 << 3 | WireType.VARINT);
      
      public static const DEADTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldBoss_BossInfo.deadTime","deadTime",5 << 3 | WireType.VARINT);
      
      public static const INSTANCEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldBoss_BossInfo.instanceId","instanceId",6 << 3 | WireType.VARINT);
      
      public static const RELIVETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldBoss_BossInfo.reliveTimes","reliveTimes",7 << 3 | WireType.VARINT);
      
      public static const JOINCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_WorldBoss_BossInfo.joinCount","joinCount",8 << 3 | WireType.VARINT);
      
      public static const HP:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_WorldBoss_BossInfo.hp","hp",9 << 3 | WireType.VARINT);
      
      public static const MAXHP:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_WorldBoss_BossInfo.maxHp","maxHp",10 << 3 | WireType.VARINT);
       
      
      private var bossId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var level$field:uint;
      
      private var deadTime$field:uint;
      
      private var instanceId$field:uint;
      
      private var reliveTimes$field:uint;
      
      private var joinCount$field:uint;
      
      private var hp$field:Int64;
      
      private var maxHp$field:Int64;
      
      public function Dto_WorldBoss_BossInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_WorldBoss_BossInfo.$MessageID;
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
      
      public function clearLevel() : void
      {
         this.hasField$0 &= 4294967293;
         this.level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.level$field = param1;
      }
      
      public function get level() : uint
      {
         return this.level$field;
      }
      
      public function clearDeadTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.deadTime$field = new uint();
      }
      
      public function get hasDeadTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set deadTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.deadTime$field = param1;
      }
      
      public function get deadTime() : uint
      {
         return this.deadTime$field;
      }
      
      public function clearInstanceId() : void
      {
         this.hasField$0 &= 4294967287;
         this.instanceId$field = new uint();
      }
      
      public function get hasInstanceId() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set instanceId(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.instanceId$field = param1;
      }
      
      public function get instanceId() : uint
      {
         return this.instanceId$field;
      }
      
      public function clearReliveTimes() : void
      {
         this.hasField$0 &= 4294967279;
         this.reliveTimes$field = new uint();
      }
      
      public function get hasReliveTimes() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set reliveTimes(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.reliveTimes$field = param1;
      }
      
      public function get reliveTimes() : uint
      {
         return this.reliveTimes$field;
      }
      
      public function clearJoinCount() : void
      {
         this.hasField$0 &= 4294967263;
         this.joinCount$field = new uint();
      }
      
      public function get hasJoinCount() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set joinCount(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.joinCount$field = param1;
      }
      
      public function get joinCount() : uint
      {
         return this.joinCount$field;
      }
      
      public function clearHp() : void
      {
         this.hp$field = null;
      }
      
      public function get hasHp() : Boolean
      {
         return this.hp$field != null;
      }
      
      public function set hp(param1:Int64) : void
      {
         this.hp$field = param1;
      }
      
      public function get hp() : Int64
      {
         return this.hp$field;
      }
      
      public function clearMaxHp() : void
      {
         this.maxHp$field = null;
      }
      
      public function get hasMaxHp() : Boolean
      {
         return this.maxHp$field != null;
      }
      
      public function set maxHp(param1:Int64) : void
      {
         this.maxHp$field = param1;
      }
      
      public function get maxHp() : Int64
      {
         return this.maxHp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasBossId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.bossId$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasDeadTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.deadTime$field);
         }
         if(this.hasInstanceId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.instanceId$field);
         }
         if(this.hasReliveTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.reliveTimes$field);
         }
         if(this.hasJoinCount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.joinCount$field);
         }
         if(this.hasHp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_INT64(param1,this.hp$field);
         }
         if(this.hasMaxHp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_INT64(param1,this.maxHp$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc11_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc11_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc11_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldBoss_BossInfo.bossId cannot be set twice.");
                  }
                  _loc3_++;
                  this.bossId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldBoss_BossInfo.level cannot be set twice.");
                  }
                  _loc4_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldBoss_BossInfo.deadTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.deadTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldBoss_BossInfo.instanceId cannot be set twice.");
                  }
                  _loc6_++;
                  this.instanceId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldBoss_BossInfo.reliveTimes cannot be set twice.");
                  }
                  _loc7_++;
                  this.reliveTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldBoss_BossInfo.joinCount cannot be set twice.");
                  }
                  _loc8_++;
                  this.joinCount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldBoss_BossInfo.hp cannot be set twice.");
                  }
                  _loc9_++;
                  this.hp = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 10:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_WorldBoss_BossInfo.maxHp cannot be set twice.");
                  }
                  _loc10_++;
                  this.maxHp = ReadUtils.read$TYPE_INT64(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc11_);
                  break;
            }
         }
      }
   }
}
