package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_FlexibleActivityLimitFuben extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FlexibleActivityLimitFuben";
      
      public static const COOLDOWN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityLimitFuben.coolDown","coolDown",1 << 3 | WireType.VARINT);
      
      public static const LASTCHALLENGETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityLimitFuben.lastChallengeTime","lastChallengeTime",2 << 3 | WireType.VARINT);
      
      public static const TIMESLIMIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityLimitFuben.timesLimit","timesLimit",3 << 3 | WireType.VARINT);
      
      public static const REALTIMESLIMIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityLimitFuben.realTimesLimit","realTimesLimit",4 << 3 | WireType.VARINT);
      
      public static const CHALLENGETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityLimitFuben.challengeTimes","challengeTimes",5 << 3 | WireType.VARINT);
      
      public static const FUBENID:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityLimitFuben.fubenId","fubenId",6 << 3 | WireType.VARINT);
      
      public static const ENERGYCOST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityLimitFuben.energyCost","energyCost",7 << 3 | WireType.VARINT);
      
      public static const LEFTCOOLDOWN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityLimitFuben.leftCoolDown","leftCoolDown",8 << 3 | WireType.VARINT);
      
      public static const NEEDPRIVILEGETYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_FlexibleActivityLimitFuben.needPrivilegeType","needPrivilegeType",9 << 3 | WireType.VARINT);
      
      public static const TIMESPRIVILEGETYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_FlexibleActivityLimitFuben.timesPrivilegeType","timesPrivilegeType",10 << 3 | WireType.VARINT);
      
      public static const BUYTIMESCOSTID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityLimitFuben.buyTimesCostId","buyTimesCostId",11 << 3 | WireType.VARINT);
      
      public static const BUYTIMESCOSTVALUE:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityLimitFuben.buyTimesCostValue","buyTimesCostValue",12 << 3 | WireType.VARINT);
       
      
      private var coolDown$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var lastChallengeTime$field:uint;
      
      private var timesLimit$field:uint;
      
      private var realTimesLimit$field:uint;
      
      private var challengeTimes$field:uint;
      
      public var fubenId:Array;
      
      private var energyCost$field:uint;
      
      private var leftCoolDown$field:uint;
      
      private var needPrivilegeType$field:int;
      
      private var timesPrivilegeType$field:int;
      
      private var buyTimesCostId$field:uint;
      
      public var buyTimesCostValue:Array;
      
      public function Dto_FlexibleActivityLimitFuben()
      {
         this.fubenId = [];
         this.buyTimesCostValue = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FlexibleActivityLimitFuben.$MessageID;
      }
      
      public function clearCoolDown() : void
      {
         this.hasField$0 &= 4294967294;
         this.coolDown$field = new uint();
      }
      
      public function get hasCoolDown() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set coolDown(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.coolDown$field = param1;
      }
      
      public function get coolDown() : uint
      {
         return this.coolDown$field;
      }
      
      public function clearLastChallengeTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.lastChallengeTime$field = new uint();
      }
      
      public function get hasLastChallengeTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set lastChallengeTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.lastChallengeTime$field = param1;
      }
      
      public function get lastChallengeTime() : uint
      {
         return this.lastChallengeTime$field;
      }
      
      public function clearTimesLimit() : void
      {
         this.hasField$0 &= 4294967291;
         this.timesLimit$field = new uint();
      }
      
      public function get hasTimesLimit() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set timesLimit(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.timesLimit$field = param1;
      }
      
      public function get timesLimit() : uint
      {
         return this.timesLimit$field;
      }
      
      public function clearRealTimesLimit() : void
      {
         this.hasField$0 &= 4294967287;
         this.realTimesLimit$field = new uint();
      }
      
      public function get hasRealTimesLimit() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set realTimesLimit(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.realTimesLimit$field = param1;
      }
      
      public function get realTimesLimit() : uint
      {
         return this.realTimesLimit$field;
      }
      
      public function clearChallengeTimes() : void
      {
         this.hasField$0 &= 4294967279;
         this.challengeTimes$field = new uint();
      }
      
      public function get hasChallengeTimes() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set challengeTimes(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.challengeTimes$field = param1;
      }
      
      public function get challengeTimes() : uint
      {
         return this.challengeTimes$field;
      }
      
      public function clearEnergyCost() : void
      {
         this.hasField$0 &= 4294967263;
         this.energyCost$field = new uint();
      }
      
      public function get hasEnergyCost() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set energyCost(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.energyCost$field = param1;
      }
      
      public function get energyCost() : uint
      {
         return this.energyCost$field;
      }
      
      public function clearLeftCoolDown() : void
      {
         this.hasField$0 &= 4294967231;
         this.leftCoolDown$field = new uint();
      }
      
      public function get hasLeftCoolDown() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set leftCoolDown(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.leftCoolDown$field = param1;
      }
      
      public function get leftCoolDown() : uint
      {
         return this.leftCoolDown$field;
      }
      
      public function clearNeedPrivilegeType() : void
      {
         this.hasField$0 &= 4294967167;
         this.needPrivilegeType$field = new int();
      }
      
      public function get hasNeedPrivilegeType() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set needPrivilegeType(param1:int) : void
      {
         this.hasField$0 |= 128;
         this.needPrivilegeType$field = param1;
      }
      
      public function get needPrivilegeType() : int
      {
         return this.needPrivilegeType$field;
      }
      
      public function clearTimesPrivilegeType() : void
      {
         this.hasField$0 &= 4294967039;
         this.timesPrivilegeType$field = new int();
      }
      
      public function get hasTimesPrivilegeType() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set timesPrivilegeType(param1:int) : void
      {
         this.hasField$0 |= 256;
         this.timesPrivilegeType$field = param1;
      }
      
      public function get timesPrivilegeType() : int
      {
         return this.timesPrivilegeType$field;
      }
      
      public function clearBuyTimesCostId() : void
      {
         this.hasField$0 &= 4294966783;
         this.buyTimesCostId$field = new uint();
      }
      
      public function get hasBuyTimesCostId() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set buyTimesCostId(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.buyTimesCostId$field = param1;
      }
      
      public function get buyTimesCostId() : uint
      {
         return this.buyTimesCostId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasCoolDown)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.coolDown$field);
         }
         if(this.hasLastChallengeTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.lastChallengeTime$field);
         }
         if(this.hasTimesLimit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.timesLimit$field);
         }
         if(this.hasRealTimesLimit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.realTimesLimit$field);
         }
         if(this.hasChallengeTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.challengeTimes$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.fubenId.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.fubenId[_loc2_]);
            _loc2_++;
         }
         if(this.hasEnergyCost)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.energyCost$field);
         }
         if(this.hasLeftCoolDown)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.leftCoolDown$field);
         }
         if(this.hasNeedPrivilegeType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_INT32(param1,this.needPrivilegeType$field);
         }
         if(this.hasTimesPrivilegeType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_INT32(param1,this.timesPrivilegeType$field);
         }
         if(this.hasBuyTimesCostId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.buyTimesCostId$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.buyTimesCostValue.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_UINT32(param1,this.buyTimesCostValue[_loc3_]);
            _loc3_++;
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
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
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitFuben.coolDown cannot be set twice.");
                  }
                  _loc3_++;
                  this.coolDown = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitFuben.lastChallengeTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.lastChallengeTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitFuben.timesLimit cannot be set twice.");
                  }
                  _loc5_++;
                  this.timesLimit = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitFuben.realTimesLimit cannot be set twice.");
                  }
                  _loc6_++;
                  this.realTimesLimit = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitFuben.challengeTimes cannot be set twice.");
                  }
                  _loc7_++;
                  this.challengeTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if((_loc13_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.fubenId);
                  }
                  else
                  {
                     this.fubenId.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitFuben.energyCost cannot be set twice.");
                  }
                  _loc8_++;
                  this.energyCost = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitFuben.leftCoolDown cannot be set twice.");
                  }
                  _loc9_++;
                  this.leftCoolDown = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitFuben.needPrivilegeType cannot be set twice.");
                  }
                  _loc10_++;
                  this.needPrivilegeType = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 10:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitFuben.timesPrivilegeType cannot be set twice.");
                  }
                  _loc11_++;
                  this.timesPrivilegeType = ReadUtils.read$TYPE_INT32(param1);
                  break;
               case 11:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitFuben.buyTimesCostId cannot be set twice.");
                  }
                  _loc12_++;
                  this.buyTimesCostId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if((_loc13_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.buyTimesCostValue);
                  }
                  else
                  {
                     this.buyTimesCostValue.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               default:
                  super.readUnknown(param1,_loc13_);
                  break;
            }
         }
      }
   }
}
