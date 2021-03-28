package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class FlexibleActivity_1008 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_1008";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1008.activityid","activityid",1 << 3 | WireType.VARINT);
      
      public static const NUTHAMMER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_1008.nutHammer","nutHammer",2 << 3 | WireType.LENGTH_DELIMITED,Dto_HalloweenHammer);
      
      public static const ENERGYPERNUTHAMMER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1008.energyPerNutHammer","energyPerNutHammer",3 << 3 | WireType.VARINT);
      
      public static const MAXTAKENUTHAMMER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1008.maxTakeNutHammer","maxTakeNutHammer",4 << 3 | WireType.VARINT);
      
      public static const DURIANHAMMER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_1008.durianHammer","durianHammer",5 << 3 | WireType.LENGTH_DELIMITED,Dto_HalloweenHammer);
      
      public static const PUMPKIN:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_1008.pumpkin","pumpkin",6 << 3 | WireType.LENGTH_DELIMITED,Dto_HalloweenPumpkin);
      
      public static const FINALREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_1008.finalReward","finalReward",7 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNumOdd);
      
      public static const MAXRESETTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1008.maxResetTimes","maxResetTimes",8 << 3 | WireType.VARINT);
      
      public static const RESETGOLDCOST:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1008.resetGoldCost","resetGoldCost",9 << 3 | WireType.VARINT);
      
      public static const FULLSERVERREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_1008.fullServerReward","fullServerReward",10 << 3 | WireType.LENGTH_DELIMITED,Dto_HalloweenFullServerReward);
      
      public static const FULLSERVERREWARDTIMES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_1008.fullServerRewardTimes","fullServerRewardTimes",11 << 3 | WireType.LENGTH_DELIMITED,Dto_HalloweenFullServerRewardTimes);
      
      public static const TIMESTAMP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1008.timestamp","timestamp",20 << 3 | WireType.VARINT);
      
      public static const COSTENERGY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1008.costEnergy","costEnergy",21 << 3 | WireType.VARINT);
      
      public static const CURTAKENUTHAMMER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1008.curTakeNutHammer","curTakeNutHammer",22 << 3 | WireType.VARINT);
      
      public static const PUMPKINDATA:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_1008.pumpkinData","pumpkinData",23 << 3 | WireType.LENGTH_DELIMITED,Dto_HalloweenPumpkinData);
      
      public static const HASTAKEFINALREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.FlexibleActivity_1008.hasTakeFinalReward","hasTakeFinalReward",24 << 3 | WireType.VARINT);
      
      public static const CURRESETTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1008.curResetTimes","curResetTimes",25 << 3 | WireType.VARINT);
      
      public static const PUMPKINNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1008.pumpkinNum","pumpkinNum",26 << 3 | WireType.VARINT);
      
      public static const FULLSERVERPUMPKINNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1008.fullServerPumpkinNum","fullServerPumpkinNum",27 << 3 | WireType.VARINT);
      
      public static const FULLSERVERREWARDDATA:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_1008.fullServerRewardData","fullServerRewardData",28 << 3 | WireType.VARINT);
       
      
      public var activityid:uint;
      
      private var nutHammer$field:Dto_HalloweenHammer;
      
      private var energyPerNutHammer$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var maxTakeNutHammer$field:uint;
      
      private var durianHammer$field:Dto_HalloweenHammer;
      
      public var pumpkin:Array;
      
      public var finalReward:Array;
      
      private var maxResetTimes$field:uint;
      
      private var resetGoldCost$field:uint;
      
      public var fullServerReward:Array;
      
      public var fullServerRewardTimes:Array;
      
      private var timestamp$field:uint;
      
      private var costEnergy$field:uint;
      
      private var curTakeNutHammer$field:uint;
      
      public var pumpkinData:Array;
      
      private var hasTakeFinalReward$field:Boolean;
      
      private var curResetTimes$field:uint;
      
      private var pumpkinNum$field:uint;
      
      private var fullServerPumpkinNum$field:uint;
      
      public var fullServerRewardData:Array;
      
      public function FlexibleActivity_1008()
      {
         this.pumpkin = [];
         this.finalReward = [];
         this.fullServerReward = [];
         this.fullServerRewardTimes = [];
         this.pumpkinData = [];
         this.fullServerRewardData = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_1008.$MessageID;
      }
      
      public function clearNutHammer() : void
      {
         this.nutHammer$field = null;
      }
      
      public function get hasNutHammer() : Boolean
      {
         return this.nutHammer$field != null;
      }
      
      public function set nutHammer(param1:Dto_HalloweenHammer) : void
      {
         this.nutHammer$field = param1;
      }
      
      public function get nutHammer() : Dto_HalloweenHammer
      {
         return this.nutHammer$field;
      }
      
      public function clearEnergyPerNutHammer() : void
      {
         this.hasField$0 &= 4294967294;
         this.energyPerNutHammer$field = new uint();
      }
      
      public function get hasEnergyPerNutHammer() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set energyPerNutHammer(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.energyPerNutHammer$field = param1;
      }
      
      public function get energyPerNutHammer() : uint
      {
         return this.energyPerNutHammer$field;
      }
      
      public function clearMaxTakeNutHammer() : void
      {
         this.hasField$0 &= 4294967293;
         this.maxTakeNutHammer$field = new uint();
      }
      
      public function get hasMaxTakeNutHammer() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set maxTakeNutHammer(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.maxTakeNutHammer$field = param1;
      }
      
      public function get maxTakeNutHammer() : uint
      {
         return this.maxTakeNutHammer$field;
      }
      
      public function clearDurianHammer() : void
      {
         this.durianHammer$field = null;
      }
      
      public function get hasDurianHammer() : Boolean
      {
         return this.durianHammer$field != null;
      }
      
      public function set durianHammer(param1:Dto_HalloweenHammer) : void
      {
         this.durianHammer$field = param1;
      }
      
      public function get durianHammer() : Dto_HalloweenHammer
      {
         return this.durianHammer$field;
      }
      
      public function clearMaxResetTimes() : void
      {
         this.hasField$0 &= 4294967291;
         this.maxResetTimes$field = new uint();
      }
      
      public function get hasMaxResetTimes() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set maxResetTimes(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.maxResetTimes$field = param1;
      }
      
      public function get maxResetTimes() : uint
      {
         return this.maxResetTimes$field;
      }
      
      public function clearResetGoldCost() : void
      {
         this.hasField$0 &= 4294967287;
         this.resetGoldCost$field = new uint();
      }
      
      public function get hasResetGoldCost() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set resetGoldCost(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.resetGoldCost$field = param1;
      }
      
      public function get resetGoldCost() : uint
      {
         return this.resetGoldCost$field;
      }
      
      public function clearTimestamp() : void
      {
         this.hasField$0 &= 4294967279;
         this.timestamp$field = new uint();
      }
      
      public function get hasTimestamp() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set timestamp(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.timestamp$field = param1;
      }
      
      public function get timestamp() : uint
      {
         return this.timestamp$field;
      }
      
      public function clearCostEnergy() : void
      {
         this.hasField$0 &= 4294967263;
         this.costEnergy$field = new uint();
      }
      
      public function get hasCostEnergy() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set costEnergy(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.costEnergy$field = param1;
      }
      
      public function get costEnergy() : uint
      {
         return this.costEnergy$field;
      }
      
      public function clearCurTakeNutHammer() : void
      {
         this.hasField$0 &= 4294967231;
         this.curTakeNutHammer$field = new uint();
      }
      
      public function get hasCurTakeNutHammer() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set curTakeNutHammer(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.curTakeNutHammer$field = param1;
      }
      
      public function get curTakeNutHammer() : uint
      {
         return this.curTakeNutHammer$field;
      }
      
      public function clearHasTakeFinalReward() : void
      {
         this.hasField$0 &= 4294967167;
         this.hasTakeFinalReward$field = new Boolean();
      }
      
      public function get hasHasTakeFinalReward() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set hasTakeFinalReward(param1:Boolean) : void
      {
         this.hasField$0 |= 128;
         this.hasTakeFinalReward$field = param1;
      }
      
      public function get hasTakeFinalReward() : Boolean
      {
         return this.hasTakeFinalReward$field;
      }
      
      public function clearCurResetTimes() : void
      {
         this.hasField$0 &= 4294967039;
         this.curResetTimes$field = new uint();
      }
      
      public function get hasCurResetTimes() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set curResetTimes(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.curResetTimes$field = param1;
      }
      
      public function get curResetTimes() : uint
      {
         return this.curResetTimes$field;
      }
      
      public function clearPumpkinNum() : void
      {
         this.hasField$0 &= 4294966783;
         this.pumpkinNum$field = new uint();
      }
      
      public function get hasPumpkinNum() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set pumpkinNum(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.pumpkinNum$field = param1;
      }
      
      public function get pumpkinNum() : uint
      {
         return this.pumpkinNum$field;
      }
      
      public function clearFullServerPumpkinNum() : void
      {
         this.hasField$0 &= 4294966271;
         this.fullServerPumpkinNum$field = new uint();
      }
      
      public function get hasFullServerPumpkinNum() : Boolean
      {
         return (this.hasField$0 & 1024) != 0;
      }
      
      public function set fullServerPumpkinNum(param1:uint) : void
      {
         this.hasField$0 |= 1024;
         this.fullServerPumpkinNum$field = param1;
      }
      
      public function get fullServerPumpkinNum() : uint
      {
         return this.fullServerPumpkinNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc8_:* = undefined;
         WriteUtils.writeTag(param1,WireType.VARINT,1);
         WriteUtils.write$TYPE_UINT32(param1,this.activityid);
         if(this.hasNutHammer)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.nutHammer$field);
         }
         if(this.hasEnergyPerNutHammer)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.energyPerNutHammer$field);
         }
         if(this.hasMaxTakeNutHammer)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.maxTakeNutHammer$field);
         }
         if(this.hasDurianHammer)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.durianHammer$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.pumpkin.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.pumpkin[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.finalReward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.finalReward[_loc3_]);
            _loc3_++;
         }
         if(this.hasMaxResetTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.maxResetTimes$field);
         }
         if(this.hasResetGoldCost)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.resetGoldCost$field);
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.fullServerReward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,10);
            WriteUtils.write$TYPE_MESSAGE(param1,this.fullServerReward[_loc4_]);
            _loc4_++;
         }
         var _loc5_:uint = 0;
         while(_loc5_ < this.fullServerRewardTimes.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,11);
            WriteUtils.write$TYPE_MESSAGE(param1,this.fullServerRewardTimes[_loc5_]);
            _loc5_++;
         }
         if(this.hasTimestamp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,20);
            WriteUtils.write$TYPE_UINT32(param1,this.timestamp$field);
         }
         if(this.hasCostEnergy)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,21);
            WriteUtils.write$TYPE_UINT32(param1,this.costEnergy$field);
         }
         if(this.hasCurTakeNutHammer)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,22);
            WriteUtils.write$TYPE_UINT32(param1,this.curTakeNutHammer$field);
         }
         var _loc6_:uint = 0;
         while(_loc6_ < this.pumpkinData.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,23);
            WriteUtils.write$TYPE_MESSAGE(param1,this.pumpkinData[_loc6_]);
            _loc6_++;
         }
         if(this.hasHasTakeFinalReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,24);
            WriteUtils.write$TYPE_BOOL(param1,this.hasTakeFinalReward$field);
         }
         if(this.hasCurResetTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,25);
            WriteUtils.write$TYPE_UINT32(param1,this.curResetTimes$field);
         }
         if(this.hasPumpkinNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,26);
            WriteUtils.write$TYPE_UINT32(param1,this.pumpkinNum$field);
         }
         if(this.hasFullServerPumpkinNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,27);
            WriteUtils.write$TYPE_UINT32(param1,this.fullServerPumpkinNum$field);
         }
         var _loc7_:uint = 0;
         while(_loc7_ < this.fullServerRewardData.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,28);
            WriteUtils.write$TYPE_UINT32(param1,this.fullServerRewardData[_loc7_]);
            _loc7_++;
         }
         for(_loc8_ in this)
         {
            super.writeUnknown(param1,_loc8_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc17_:uint = 0;
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
         while(param1.bytesAvailable > param2)
         {
            _loc17_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc17_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1008.activityid cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1008.nutHammer cannot be set twice.");
                  }
                  _loc4_++;
                  this.nutHammer = new Dto_HalloweenHammer();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.nutHammer);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1008.energyPerNutHammer cannot be set twice.");
                  }
                  _loc5_++;
                  this.energyPerNutHammer = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1008.maxTakeNutHammer cannot be set twice.");
                  }
                  _loc6_++;
                  this.maxTakeNutHammer = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1008.durianHammer cannot be set twice.");
                  }
                  _loc7_++;
                  this.durianHammer = new Dto_HalloweenHammer();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.durianHammer);
                  break;
               case 6:
                  this.pumpkin.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_HalloweenPumpkin()));
                  break;
               case 7:
                  this.finalReward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNumOdd()));
                  break;
               case 8:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1008.maxResetTimes cannot be set twice.");
                  }
                  _loc8_++;
                  this.maxResetTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1008.resetGoldCost cannot be set twice.");
                  }
                  _loc9_++;
                  this.resetGoldCost = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  this.fullServerReward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_HalloweenFullServerReward()));
                  break;
               case 11:
                  this.fullServerRewardTimes.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_HalloweenFullServerRewardTimes()));
                  break;
               case 20:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1008.timestamp cannot be set twice.");
                  }
                  _loc10_++;
                  this.timestamp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 21:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1008.costEnergy cannot be set twice.");
                  }
                  _loc11_++;
                  this.costEnergy = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 22:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1008.curTakeNutHammer cannot be set twice.");
                  }
                  _loc12_++;
                  this.curTakeNutHammer = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 23:
                  this.pumpkinData.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_HalloweenPumpkinData()));
                  break;
               case 24:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1008.hasTakeFinalReward cannot be set twice.");
                  }
                  _loc13_++;
                  this.hasTakeFinalReward = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 25:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1008.curResetTimes cannot be set twice.");
                  }
                  _loc14_++;
                  this.curResetTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 26:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1008.pumpkinNum cannot be set twice.");
                  }
                  _loc15_++;
                  this.pumpkinNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 27:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_1008.fullServerPumpkinNum cannot be set twice.");
                  }
                  _loc16_++;
                  this.fullServerPumpkinNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 28:
                  if((_loc17_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.fullServerRewardData);
                  }
                  else
                  {
                     this.fullServerRewardData.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               default:
                  super.readUnknown(param1,_loc17_);
                  break;
            }
         }
      }
   }
}
