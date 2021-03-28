package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class FlexibleActivity_6 extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.FlexibleActivity_6";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_6.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const FUBENEXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_6.fubenExp","fubenExp",2 << 3 | WireType.VARINT);
      
      public static const FUBENGOLD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_6.fubenGold","fubenGold",3 << 3 | WireType.VARINT);
      
      public static const FUBENCARDEXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_6.fubenCardExp","fubenCardExp",4 << 3 | WireType.VARINT);
      
      public static const FUBENCARDPIECETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_6.fubenCardPieceTimes","fubenCardPieceTimes",5 << 3 | WireType.VARINT);
      
      public static const ELITEFUBENEXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_6.eliteFubenExp","eliteFubenExp",6 << 3 | WireType.VARINT);
      
      public static const ELITEFUBENGOLD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_6.eliteFubenGold","eliteFubenGold",7 << 3 | WireType.VARINT);
      
      public static const ELITEFUBENCARDEXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_6.eliteFubenCardExp","eliteFubenCardExp",8 << 3 | WireType.VARINT);
      
      public static const ELITEFUBENCARDPIECETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_6.eliteFubenCardPieceTimes","eliteFubenCardPieceTimes",9 << 3 | WireType.VARINT);
      
      public static const ELITEFUBENNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_6.eliteFubenNum","eliteFubenNum",10 << 3 | WireType.VARINT);
      
      public static const ELITEFUBENDEBRISTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_6.eliteFubenDebrisTimes","eliteFubenDebrisTimes",11 << 3 | WireType.VARINT);
      
      public static const ACTIVITYFUBENNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_6.activityFubenNum","activityFubenNum",12 << 3 | WireType.VARINT);
      
      public static const GOLDEXCHANGE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_6.goldExchange","goldExchange",13 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNumOdd);
      
      public static const NUTRITIONDISCOUNT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_6.nutritionDiscount","nutritionDiscount",15 << 3 | WireType.VARINT);
      
      public static const SCREWUPADDNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_6.screwUpAddNum","screwUpAddNum",16 << 3 | WireType.VARINT);
      
      public static const SCREWUPADDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_6.screwUpAddTime","screwUpAddTime",17 << 3 | WireType.VARINT);
      
      public static const SCREWUPADDNUMUSED:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_6.screwUpAddNumUsed","screwUpAddNumUsed",18 << 3 | WireType.VARINT);
      
      public static const RANKARENAREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_6.rankArenaReward","rankArenaReward",19 << 3 | WireType.LENGTH_DELIMITED,Dto_ArenaReward);
      
      public static const LEVELARENAREWARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_6.levelArenaReward","levelArenaReward",20 << 3 | WireType.LENGTH_DELIMITED,Dto_ArenaReward);
      
      public static const BUYENERGYPRICE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.FlexibleActivity_6.buyEnergyPrice","buyEnergyPrice",21 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const GARDENEXPRATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_6.gardenExpRate","gardenExpRate",22 << 3 | WireType.VARINT);
      
      public static const IGNOREBUYENERGYVIPLIMIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_6.ignoreBuyEnergyVipLimit","ignoreBuyEnergyVipLimit",23 << 3 | WireType.VARINT);
      
      public static const AVAILABLEBUYENERGYNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.FlexibleActivity_6.availableBuyEnergyNum","availableBuyEnergyNum",24 << 3 | WireType.VARINT);
       
      
      private var activityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var fubenExp$field:uint;
      
      private var fubenGold$field:uint;
      
      private var fubenCardExp$field:uint;
      
      private var fubenCardPieceTimes$field:uint;
      
      private var eliteFubenExp$field:uint;
      
      private var eliteFubenGold$field:uint;
      
      private var eliteFubenCardExp$field:uint;
      
      private var eliteFubenCardPieceTimes$field:uint;
      
      private var eliteFubenNum$field:uint;
      
      private var eliteFubenDebrisTimes$field:uint;
      
      private var activityFubenNum$field:uint;
      
      private var goldExchange$field:Dto_IdNumOdd;
      
      private var nutritionDiscount$field:uint;
      
      private var screwUpAddNum$field:uint;
      
      private var screwUpAddTime$field:uint;
      
      private var screwUpAddNumUsed$field:uint;
      
      public var rankArenaReward:Array;
      
      public var levelArenaReward:Array;
      
      public var buyEnergyPrice:Array;
      
      private var gardenExpRate$field:uint;
      
      private var ignoreBuyEnergyVipLimit$field:uint;
      
      private var availableBuyEnergyNum$field:uint;
      
      public function FlexibleActivity_6()
      {
         this.rankArenaReward = [];
         this.levelArenaReward = [];
         this.buyEnergyPrice = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return FlexibleActivity_6.$MessageID;
      }
      
      public function clearActivityId() : void
      {
         this.hasField$0 &= 4294967294;
         this.activityId$field = new uint();
      }
      
      public function get hasActivityId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set activityId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.activityId$field = param1;
      }
      
      public function get activityId() : uint
      {
         return this.activityId$field;
      }
      
      public function clearFubenExp() : void
      {
         this.hasField$0 &= 4294967293;
         this.fubenExp$field = new uint();
      }
      
      public function get hasFubenExp() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set fubenExp(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.fubenExp$field = param1;
      }
      
      public function get fubenExp() : uint
      {
         return this.fubenExp$field;
      }
      
      public function clearFubenGold() : void
      {
         this.hasField$0 &= 4294967291;
         this.fubenGold$field = new uint();
      }
      
      public function get hasFubenGold() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set fubenGold(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.fubenGold$field = param1;
      }
      
      public function get fubenGold() : uint
      {
         return this.fubenGold$field;
      }
      
      public function clearFubenCardExp() : void
      {
         this.hasField$0 &= 4294967287;
         this.fubenCardExp$field = new uint();
      }
      
      public function get hasFubenCardExp() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set fubenCardExp(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.fubenCardExp$field = param1;
      }
      
      public function get fubenCardExp() : uint
      {
         return this.fubenCardExp$field;
      }
      
      public function clearFubenCardPieceTimes() : void
      {
         this.hasField$0 &= 4294967279;
         this.fubenCardPieceTimes$field = new uint();
      }
      
      public function get hasFubenCardPieceTimes() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set fubenCardPieceTimes(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.fubenCardPieceTimes$field = param1;
      }
      
      public function get fubenCardPieceTimes() : uint
      {
         return this.fubenCardPieceTimes$field;
      }
      
      public function clearEliteFubenExp() : void
      {
         this.hasField$0 &= 4294967263;
         this.eliteFubenExp$field = new uint();
      }
      
      public function get hasEliteFubenExp() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set eliteFubenExp(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.eliteFubenExp$field = param1;
      }
      
      public function get eliteFubenExp() : uint
      {
         return this.eliteFubenExp$field;
      }
      
      public function clearEliteFubenGold() : void
      {
         this.hasField$0 &= 4294967231;
         this.eliteFubenGold$field = new uint();
      }
      
      public function get hasEliteFubenGold() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set eliteFubenGold(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.eliteFubenGold$field = param1;
      }
      
      public function get eliteFubenGold() : uint
      {
         return this.eliteFubenGold$field;
      }
      
      public function clearEliteFubenCardExp() : void
      {
         this.hasField$0 &= 4294967167;
         this.eliteFubenCardExp$field = new uint();
      }
      
      public function get hasEliteFubenCardExp() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set eliteFubenCardExp(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.eliteFubenCardExp$field = param1;
      }
      
      public function get eliteFubenCardExp() : uint
      {
         return this.eliteFubenCardExp$field;
      }
      
      public function clearEliteFubenCardPieceTimes() : void
      {
         this.hasField$0 &= 4294967039;
         this.eliteFubenCardPieceTimes$field = new uint();
      }
      
      public function get hasEliteFubenCardPieceTimes() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set eliteFubenCardPieceTimes(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.eliteFubenCardPieceTimes$field = param1;
      }
      
      public function get eliteFubenCardPieceTimes() : uint
      {
         return this.eliteFubenCardPieceTimes$field;
      }
      
      public function clearEliteFubenNum() : void
      {
         this.hasField$0 &= 4294966783;
         this.eliteFubenNum$field = new uint();
      }
      
      public function get hasEliteFubenNum() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set eliteFubenNum(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.eliteFubenNum$field = param1;
      }
      
      public function get eliteFubenNum() : uint
      {
         return this.eliteFubenNum$field;
      }
      
      public function clearEliteFubenDebrisTimes() : void
      {
         this.hasField$0 &= 4294966271;
         this.eliteFubenDebrisTimes$field = new uint();
      }
      
      public function get hasEliteFubenDebrisTimes() : Boolean
      {
         return (this.hasField$0 & 1024) != 0;
      }
      
      public function set eliteFubenDebrisTimes(param1:uint) : void
      {
         this.hasField$0 |= 1024;
         this.eliteFubenDebrisTimes$field = param1;
      }
      
      public function get eliteFubenDebrisTimes() : uint
      {
         return this.eliteFubenDebrisTimes$field;
      }
      
      public function clearActivityFubenNum() : void
      {
         this.hasField$0 &= 4294965247;
         this.activityFubenNum$field = new uint();
      }
      
      public function get hasActivityFubenNum() : Boolean
      {
         return (this.hasField$0 & 2048) != 0;
      }
      
      public function set activityFubenNum(param1:uint) : void
      {
         this.hasField$0 |= 2048;
         this.activityFubenNum$field = param1;
      }
      
      public function get activityFubenNum() : uint
      {
         return this.activityFubenNum$field;
      }
      
      public function clearGoldExchange() : void
      {
         this.goldExchange$field = null;
      }
      
      public function get hasGoldExchange() : Boolean
      {
         return this.goldExchange$field != null;
      }
      
      public function set goldExchange(param1:Dto_IdNumOdd) : void
      {
         this.goldExchange$field = param1;
      }
      
      public function get goldExchange() : Dto_IdNumOdd
      {
         return this.goldExchange$field;
      }
      
      public function clearNutritionDiscount() : void
      {
         this.hasField$0 &= 4294963199;
         this.nutritionDiscount$field = new uint();
      }
      
      public function get hasNutritionDiscount() : Boolean
      {
         return (this.hasField$0 & 4096) != 0;
      }
      
      public function set nutritionDiscount(param1:uint) : void
      {
         this.hasField$0 |= 4096;
         this.nutritionDiscount$field = param1;
      }
      
      public function get nutritionDiscount() : uint
      {
         return this.nutritionDiscount$field;
      }
      
      public function clearScrewUpAddNum() : void
      {
         this.hasField$0 &= 4294959103;
         this.screwUpAddNum$field = new uint();
      }
      
      public function get hasScrewUpAddNum() : Boolean
      {
         return (this.hasField$0 & 8192) != 0;
      }
      
      public function set screwUpAddNum(param1:uint) : void
      {
         this.hasField$0 |= 8192;
         this.screwUpAddNum$field = param1;
      }
      
      public function get screwUpAddNum() : uint
      {
         return this.screwUpAddNum$field;
      }
      
      public function clearScrewUpAddTime() : void
      {
         this.hasField$0 &= 4294950911;
         this.screwUpAddTime$field = new uint();
      }
      
      public function get hasScrewUpAddTime() : Boolean
      {
         return (this.hasField$0 & 16384) != 0;
      }
      
      public function set screwUpAddTime(param1:uint) : void
      {
         this.hasField$0 |= 16384;
         this.screwUpAddTime$field = param1;
      }
      
      public function get screwUpAddTime() : uint
      {
         return this.screwUpAddTime$field;
      }
      
      public function clearScrewUpAddNumUsed() : void
      {
         this.hasField$0 &= 4294934527;
         this.screwUpAddNumUsed$field = new uint();
      }
      
      public function get hasScrewUpAddNumUsed() : Boolean
      {
         return (this.hasField$0 & 32768) != 0;
      }
      
      public function set screwUpAddNumUsed(param1:uint) : void
      {
         this.hasField$0 |= 32768;
         this.screwUpAddNumUsed$field = param1;
      }
      
      public function get screwUpAddNumUsed() : uint
      {
         return this.screwUpAddNumUsed$field;
      }
      
      public function clearGardenExpRate() : void
      {
         this.hasField$0 &= 4294901759;
         this.gardenExpRate$field = new uint();
      }
      
      public function get hasGardenExpRate() : Boolean
      {
         return (this.hasField$0 & 65536) != 0;
      }
      
      public function set gardenExpRate(param1:uint) : void
      {
         this.hasField$0 |= 65536;
         this.gardenExpRate$field = param1;
      }
      
      public function get gardenExpRate() : uint
      {
         return this.gardenExpRate$field;
      }
      
      public function clearIgnoreBuyEnergyVipLimit() : void
      {
         this.hasField$0 &= 4294836223;
         this.ignoreBuyEnergyVipLimit$field = new uint();
      }
      
      public function get hasIgnoreBuyEnergyVipLimit() : Boolean
      {
         return (this.hasField$0 & 131072) != 0;
      }
      
      public function set ignoreBuyEnergyVipLimit(param1:uint) : void
      {
         this.hasField$0 |= 131072;
         this.ignoreBuyEnergyVipLimit$field = param1;
      }
      
      public function get ignoreBuyEnergyVipLimit() : uint
      {
         return this.ignoreBuyEnergyVipLimit$field;
      }
      
      public function clearAvailableBuyEnergyNum() : void
      {
         this.hasField$0 &= 4294705151;
         this.availableBuyEnergyNum$field = new uint();
      }
      
      public function get hasAvailableBuyEnergyNum() : Boolean
      {
         return (this.hasField$0 & 262144) != 0;
      }
      
      public function set availableBuyEnergyNum(param1:uint) : void
      {
         this.hasField$0 |= 262144;
         this.availableBuyEnergyNum$field = param1;
      }
      
      public function get availableBuyEnergyNum() : uint
      {
         return this.availableBuyEnergyNum$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = undefined;
         if(this.hasActivityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.activityId$field);
         }
         if(this.hasFubenExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.fubenExp$field);
         }
         if(this.hasFubenGold)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.fubenGold$field);
         }
         if(this.hasFubenCardExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.fubenCardExp$field);
         }
         if(this.hasFubenCardPieceTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.fubenCardPieceTimes$field);
         }
         if(this.hasEliteFubenExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.eliteFubenExp$field);
         }
         if(this.hasEliteFubenGold)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.eliteFubenGold$field);
         }
         if(this.hasEliteFubenCardExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.eliteFubenCardExp$field);
         }
         if(this.hasEliteFubenCardPieceTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.eliteFubenCardPieceTimes$field);
         }
         if(this.hasEliteFubenNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.eliteFubenNum$field);
         }
         if(this.hasEliteFubenDebrisTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.eliteFubenDebrisTimes$field);
         }
         if(this.hasActivityFubenNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_UINT32(param1,this.activityFubenNum$field);
         }
         if(this.hasGoldExchange)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,13);
            WriteUtils.write$TYPE_MESSAGE(param1,this.goldExchange$field);
         }
         if(this.hasNutritionDiscount)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,15);
            WriteUtils.write$TYPE_UINT32(param1,this.nutritionDiscount$field);
         }
         if(this.hasScrewUpAddNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,16);
            WriteUtils.write$TYPE_UINT32(param1,this.screwUpAddNum$field);
         }
         if(this.hasScrewUpAddTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,17);
            WriteUtils.write$TYPE_UINT32(param1,this.screwUpAddTime$field);
         }
         if(this.hasScrewUpAddNumUsed)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,18);
            WriteUtils.write$TYPE_UINT32(param1,this.screwUpAddNumUsed$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.rankArenaReward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,19);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rankArenaReward[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.levelArenaReward.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,20);
            WriteUtils.write$TYPE_MESSAGE(param1,this.levelArenaReward[_loc3_]);
            _loc3_++;
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.buyEnergyPrice.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,21);
            WriteUtils.write$TYPE_MESSAGE(param1,this.buyEnergyPrice[_loc4_]);
            _loc4_++;
         }
         if(this.hasGardenExpRate)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,22);
            WriteUtils.write$TYPE_UINT32(param1,this.gardenExpRate$field);
         }
         if(this.hasIgnoreBuyEnergyVipLimit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,23);
            WriteUtils.write$TYPE_UINT32(param1,this.ignoreBuyEnergyVipLimit$field);
         }
         if(this.hasAvailableBuyEnergyNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,24);
            WriteUtils.write$TYPE_UINT32(param1,this.availableBuyEnergyNum$field);
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc23_:uint = 0;
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
         while(param1.bytesAvailable > param2)
         {
            _loc23_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc23_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_6.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_6.fubenExp cannot be set twice.");
                  }
                  _loc4_++;
                  this.fubenExp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_6.fubenGold cannot be set twice.");
                  }
                  _loc5_++;
                  this.fubenGold = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_6.fubenCardExp cannot be set twice.");
                  }
                  _loc6_++;
                  this.fubenCardExp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_6.fubenCardPieceTimes cannot be set twice.");
                  }
                  _loc7_++;
                  this.fubenCardPieceTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_6.eliteFubenExp cannot be set twice.");
                  }
                  _loc8_++;
                  this.eliteFubenExp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_6.eliteFubenGold cannot be set twice.");
                  }
                  _loc9_++;
                  this.eliteFubenGold = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_6.eliteFubenCardExp cannot be set twice.");
                  }
                  _loc10_++;
                  this.eliteFubenCardExp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_6.eliteFubenCardPieceTimes cannot be set twice.");
                  }
                  _loc11_++;
                  this.eliteFubenCardPieceTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_6.eliteFubenNum cannot be set twice.");
                  }
                  _loc12_++;
                  this.eliteFubenNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_6.eliteFubenDebrisTimes cannot be set twice.");
                  }
                  _loc13_++;
                  this.eliteFubenDebrisTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_6.activityFubenNum cannot be set twice.");
                  }
                  _loc14_++;
                  this.activityFubenNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 13:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_6.goldExchange cannot be set twice.");
                  }
                  _loc15_++;
                  this.goldExchange = new Dto_IdNumOdd();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.goldExchange);
                  break;
               case 15:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_6.nutritionDiscount cannot be set twice.");
                  }
                  _loc16_++;
                  this.nutritionDiscount = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 16:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_6.screwUpAddNum cannot be set twice.");
                  }
                  _loc17_++;
                  this.screwUpAddNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 17:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_6.screwUpAddTime cannot be set twice.");
                  }
                  _loc18_++;
                  this.screwUpAddTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 18:
                  if(_loc19_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_6.screwUpAddNumUsed cannot be set twice.");
                  }
                  _loc19_++;
                  this.screwUpAddNumUsed = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 19:
                  this.rankArenaReward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ArenaReward()));
                  break;
               case 20:
                  this.levelArenaReward.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ArenaReward()));
                  break;
               case 21:
                  this.buyEnergyPrice.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 22:
                  if(_loc20_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_6.gardenExpRate cannot be set twice.");
                  }
                  _loc20_++;
                  this.gardenExpRate = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 23:
                  if(_loc21_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_6.ignoreBuyEnergyVipLimit cannot be set twice.");
                  }
                  _loc21_++;
                  this.ignoreBuyEnergyVipLimit = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 24:
                  if(_loc22_ != 0)
                  {
                     throw new IOError("Bad data format: FlexibleActivity_6.availableBuyEnergyNum cannot be set twice.");
                  }
                  _loc22_++;
                  this.availableBuyEnergyNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc23_);
                  break;
            }
         }
      }
   }
}
