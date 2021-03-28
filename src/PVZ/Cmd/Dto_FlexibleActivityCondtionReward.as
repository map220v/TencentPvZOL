package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_FlexibleActivityCondtionReward extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FlexibleActivityCondtionReward";
      
      public static const PRIVILEGE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityCondtionReward.privilege","privilege",1 << 3 | WireType.LENGTH_DELIMITED,Dto_FlexibleActivityPlatformPrivilegeInfo);
      
      public static const LEVEL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityCondtionReward.level","level",2 << 3 | WireType.LENGTH_DELIMITED,Dto_Uint32Compare);
      
      public static const LOGINNUM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityCondtionReward.loginNum","loginNum",3 << 3 | WireType.LENGTH_DELIMITED,Dto_Uint32Tracker);
      
      public static const LOGINDATE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityCondtionReward.loginDate","loginDate",4 << 3 | WireType.LENGTH_DELIMITED,Dto_Uint32Compare);
      
      public static const SAVETICKET:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityCondtionReward.saveTicket","saveTicket",5 << 3 | WireType.LENGTH_DELIMITED,Dto_Uint32Tracker);
      
      public static const TIMESLIMIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityCondtionReward.timesLimit","timesLimit",6 << 3 | WireType.VARINT);
      
      public static const USEDTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityCondtionReward.usedTimes","usedTimes",7 << 3 | WireType.VARINT);
      
      public static const OPERATECOUNT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityCondtionReward.operateCount","operateCount",8 << 3 | WireType.LENGTH_DELIMITED,Dto_Uint32Tracker);
      
      public static const SIGNTIMES:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityCondtionReward.signTimes","signTimes",9 << 3 | WireType.LENGTH_DELIMITED,Dto_Uint32Tracker);
      
      public static const SIGNDATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityCondtionReward.signDate","signDate",10 << 3 | WireType.VARINT);
      
      public static const FLEXIBLEVALUE1:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityCondtionReward.flexibleValue1","flexibleValue1",11 << 3 | WireType.VARINT);
      
      public static const FLEXIBLEVALUE2:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityCondtionReward.flexibleValue2","flexibleValue2",12 << 3 | WireType.VARINT);
      
      public static const TODAYSCORE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityCondtionReward.todayscore","todayscore",13 << 3 | WireType.LENGTH_DELIMITED,Dto_Uint32Tracker);
      
      public static const TOTALSCORE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityCondtionReward.totalscore","totalscore",14 << 3 | WireType.LENGTH_DELIMITED,Dto_Uint32Tracker);
      
      public static const ZOMBIENUM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityCondtionReward.zombieNum","zombieNum",15 << 3 | WireType.LENGTH_DELIMITED,Dto_Uint32Tracker);
      
      public static const COSTGOLDTICKET:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityCondtionReward.costGoldTicket","costGoldTicket",16 << 3 | WireType.LENGTH_DELIMITED,Dto_Uint32Tracker);
      
      public static const MERGESERVERLOGINNUM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityCondtionReward.mergeServerLoginNum","mergeServerLoginNum",17 << 3 | WireType.LENGTH_DELIMITED,Dto_Uint32Tracker);
      
      public static const WATCHVIDEO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityCondtionReward.watchVideo","watchVideo",18 << 3 | WireType.LENGTH_DELIMITED,Dto_Uint32Tracker);
      
      public static const REWARD:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityCondtionReward.reward","reward",100 << 3 | WireType.LENGTH_DELIMITED,Dto_FlexibleActivityReward);
       
      
      private var privilege$field:Dto_FlexibleActivityPlatformPrivilegeInfo;
      
      private var level$field:Dto_Uint32Compare;
      
      private var loginNum$field:Dto_Uint32Tracker;
      
      private var loginDate$field:Dto_Uint32Compare;
      
      private var saveTicket$field:Dto_Uint32Tracker;
      
      private var timesLimit$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var usedTimes$field:uint;
      
      private var operateCount$field:Dto_Uint32Tracker;
      
      private var signTimes$field:Dto_Uint32Tracker;
      
      private var signDate$field:uint;
      
      private var flexibleValue1$field:uint;
      
      private var flexibleValue2$field:uint;
      
      private var todayscore$field:Dto_Uint32Tracker;
      
      private var totalscore$field:Dto_Uint32Tracker;
      
      private var zombieNum$field:Dto_Uint32Tracker;
      
      private var costGoldTicket$field:Dto_Uint32Tracker;
      
      private var mergeServerLoginNum$field:Dto_Uint32Tracker;
      
      private var watchVideo$field:Dto_Uint32Tracker;
      
      public var reward:Dto_FlexibleActivityReward;
      
      public function Dto_FlexibleActivityCondtionReward()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FlexibleActivityCondtionReward.$MessageID;
      }
      
      public function clearPrivilege() : void
      {
         this.privilege$field = null;
      }
      
      public function get hasPrivilege() : Boolean
      {
         return this.privilege$field != null;
      }
      
      public function set privilege(param1:Dto_FlexibleActivityPlatformPrivilegeInfo) : void
      {
         this.privilege$field = param1;
      }
      
      public function get privilege() : Dto_FlexibleActivityPlatformPrivilegeInfo
      {
         return this.privilege$field;
      }
      
      public function clearLevel() : void
      {
         this.level$field = null;
      }
      
      public function get hasLevel() : Boolean
      {
         return this.level$field != null;
      }
      
      public function set level(param1:Dto_Uint32Compare) : void
      {
         this.level$field = param1;
      }
      
      public function get level() : Dto_Uint32Compare
      {
         return this.level$field;
      }
      
      public function clearLoginNum() : void
      {
         this.loginNum$field = null;
      }
      
      public function get hasLoginNum() : Boolean
      {
         return this.loginNum$field != null;
      }
      
      public function set loginNum(param1:Dto_Uint32Tracker) : void
      {
         this.loginNum$field = param1;
      }
      
      public function get loginNum() : Dto_Uint32Tracker
      {
         return this.loginNum$field;
      }
      
      public function clearLoginDate() : void
      {
         this.loginDate$field = null;
      }
      
      public function get hasLoginDate() : Boolean
      {
         return this.loginDate$field != null;
      }
      
      public function set loginDate(param1:Dto_Uint32Compare) : void
      {
         this.loginDate$field = param1;
      }
      
      public function get loginDate() : Dto_Uint32Compare
      {
         return this.loginDate$field;
      }
      
      public function clearSaveTicket() : void
      {
         this.saveTicket$field = null;
      }
      
      public function get hasSaveTicket() : Boolean
      {
         return this.saveTicket$field != null;
      }
      
      public function set saveTicket(param1:Dto_Uint32Tracker) : void
      {
         this.saveTicket$field = param1;
      }
      
      public function get saveTicket() : Dto_Uint32Tracker
      {
         return this.saveTicket$field;
      }
      
      public function clearTimesLimit() : void
      {
         this.hasField$0 &= 4294967294;
         this.timesLimit$field = new uint();
      }
      
      public function get hasTimesLimit() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set timesLimit(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.timesLimit$field = param1;
      }
      
      public function get timesLimit() : uint
      {
         return this.timesLimit$field;
      }
      
      public function clearUsedTimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.usedTimes$field = new uint();
      }
      
      public function get hasUsedTimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set usedTimes(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.usedTimes$field = param1;
      }
      
      public function get usedTimes() : uint
      {
         return this.usedTimes$field;
      }
      
      public function clearOperateCount() : void
      {
         this.operateCount$field = null;
      }
      
      public function get hasOperateCount() : Boolean
      {
         return this.operateCount$field != null;
      }
      
      public function set operateCount(param1:Dto_Uint32Tracker) : void
      {
         this.operateCount$field = param1;
      }
      
      public function get operateCount() : Dto_Uint32Tracker
      {
         return this.operateCount$field;
      }
      
      public function clearSignTimes() : void
      {
         this.signTimes$field = null;
      }
      
      public function get hasSignTimes() : Boolean
      {
         return this.signTimes$field != null;
      }
      
      public function set signTimes(param1:Dto_Uint32Tracker) : void
      {
         this.signTimes$field = param1;
      }
      
      public function get signTimes() : Dto_Uint32Tracker
      {
         return this.signTimes$field;
      }
      
      public function clearSignDate() : void
      {
         this.hasField$0 &= 4294967291;
         this.signDate$field = new uint();
      }
      
      public function get hasSignDate() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set signDate(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.signDate$field = param1;
      }
      
      public function get signDate() : uint
      {
         return this.signDate$field;
      }
      
      public function clearFlexibleValue1() : void
      {
         this.hasField$0 &= 4294967287;
         this.flexibleValue1$field = new uint();
      }
      
      public function get hasFlexibleValue1() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set flexibleValue1(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.flexibleValue1$field = param1;
      }
      
      public function get flexibleValue1() : uint
      {
         return this.flexibleValue1$field;
      }
      
      public function clearFlexibleValue2() : void
      {
         this.hasField$0 &= 4294967279;
         this.flexibleValue2$field = new uint();
      }
      
      public function get hasFlexibleValue2() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set flexibleValue2(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.flexibleValue2$field = param1;
      }
      
      public function get flexibleValue2() : uint
      {
         return this.flexibleValue2$field;
      }
      
      public function clearTodayscore() : void
      {
         this.todayscore$field = null;
      }
      
      public function get hasTodayscore() : Boolean
      {
         return this.todayscore$field != null;
      }
      
      public function set todayscore(param1:Dto_Uint32Tracker) : void
      {
         this.todayscore$field = param1;
      }
      
      public function get todayscore() : Dto_Uint32Tracker
      {
         return this.todayscore$field;
      }
      
      public function clearTotalscore() : void
      {
         this.totalscore$field = null;
      }
      
      public function get hasTotalscore() : Boolean
      {
         return this.totalscore$field != null;
      }
      
      public function set totalscore(param1:Dto_Uint32Tracker) : void
      {
         this.totalscore$field = param1;
      }
      
      public function get totalscore() : Dto_Uint32Tracker
      {
         return this.totalscore$field;
      }
      
      public function clearZombieNum() : void
      {
         this.zombieNum$field = null;
      }
      
      public function get hasZombieNum() : Boolean
      {
         return this.zombieNum$field != null;
      }
      
      public function set zombieNum(param1:Dto_Uint32Tracker) : void
      {
         this.zombieNum$field = param1;
      }
      
      public function get zombieNum() : Dto_Uint32Tracker
      {
         return this.zombieNum$field;
      }
      
      public function clearCostGoldTicket() : void
      {
         this.costGoldTicket$field = null;
      }
      
      public function get hasCostGoldTicket() : Boolean
      {
         return this.costGoldTicket$field != null;
      }
      
      public function set costGoldTicket(param1:Dto_Uint32Tracker) : void
      {
         this.costGoldTicket$field = param1;
      }
      
      public function get costGoldTicket() : Dto_Uint32Tracker
      {
         return this.costGoldTicket$field;
      }
      
      public function clearMergeServerLoginNum() : void
      {
         this.mergeServerLoginNum$field = null;
      }
      
      public function get hasMergeServerLoginNum() : Boolean
      {
         return this.mergeServerLoginNum$field != null;
      }
      
      public function set mergeServerLoginNum(param1:Dto_Uint32Tracker) : void
      {
         this.mergeServerLoginNum$field = param1;
      }
      
      public function get mergeServerLoginNum() : Dto_Uint32Tracker
      {
         return this.mergeServerLoginNum$field;
      }
      
      public function clearWatchVideo() : void
      {
         this.watchVideo$field = null;
      }
      
      public function get hasWatchVideo() : Boolean
      {
         return this.watchVideo$field != null;
      }
      
      public function set watchVideo(param1:Dto_Uint32Tracker) : void
      {
         this.watchVideo$field = param1;
      }
      
      public function get watchVideo() : Dto_Uint32Tracker
      {
         return this.watchVideo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasPrivilege)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.privilege$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.level$field);
         }
         if(this.hasLoginNum)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.loginNum$field);
         }
         if(this.hasLoginDate)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.loginDate$field);
         }
         if(this.hasSaveTicket)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.saveTicket$field);
         }
         if(this.hasTimesLimit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.timesLimit$field);
         }
         if(this.hasUsedTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.usedTimes$field);
         }
         if(this.hasOperateCount)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.operateCount$field);
         }
         if(this.hasSignTimes)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_MESSAGE(param1,this.signTimes$field);
         }
         if(this.hasSignDate)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.signDate$field);
         }
         if(this.hasFlexibleValue1)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.flexibleValue1$field);
         }
         if(this.hasFlexibleValue2)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_UINT32(param1,this.flexibleValue2$field);
         }
         if(this.hasTodayscore)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,13);
            WriteUtils.write$TYPE_MESSAGE(param1,this.todayscore$field);
         }
         if(this.hasTotalscore)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,14);
            WriteUtils.write$TYPE_MESSAGE(param1,this.totalscore$field);
         }
         if(this.hasZombieNum)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,15);
            WriteUtils.write$TYPE_MESSAGE(param1,this.zombieNum$field);
         }
         if(this.hasCostGoldTicket)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,16);
            WriteUtils.write$TYPE_MESSAGE(param1,this.costGoldTicket$field);
         }
         if(this.hasMergeServerLoginNum)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,17);
            WriteUtils.write$TYPE_MESSAGE(param1,this.mergeServerLoginNum$field);
         }
         if(this.hasWatchVideo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,18);
            WriteUtils.write$TYPE_MESSAGE(param1,this.watchVideo$field);
         }
         WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,100);
         WriteUtils.write$TYPE_MESSAGE(param1,this.reward);
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc22_:uint = 0;
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
         while(param1.bytesAvailable > param2)
         {
            _loc22_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc22_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCondtionReward.privilege cannot be set twice.");
                  }
                  _loc3_++;
                  this.privilege = new Dto_FlexibleActivityPlatformPrivilegeInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.privilege);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCondtionReward.level cannot be set twice.");
                  }
                  _loc4_++;
                  this.level = new Dto_Uint32Compare();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.level);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCondtionReward.loginNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.loginNum = new Dto_Uint32Tracker();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.loginNum);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCondtionReward.loginDate cannot be set twice.");
                  }
                  _loc6_++;
                  this.loginDate = new Dto_Uint32Compare();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.loginDate);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCondtionReward.saveTicket cannot be set twice.");
                  }
                  _loc7_++;
                  this.saveTicket = new Dto_Uint32Tracker();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.saveTicket);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCondtionReward.timesLimit cannot be set twice.");
                  }
                  _loc8_++;
                  this.timesLimit = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCondtionReward.usedTimes cannot be set twice.");
                  }
                  _loc9_++;
                  this.usedTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCondtionReward.operateCount cannot be set twice.");
                  }
                  _loc10_++;
                  this.operateCount = new Dto_Uint32Tracker();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.operateCount);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCondtionReward.signTimes cannot be set twice.");
                  }
                  _loc11_++;
                  this.signTimes = new Dto_Uint32Tracker();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.signTimes);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCondtionReward.signDate cannot be set twice.");
                  }
                  _loc12_++;
                  this.signDate = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCondtionReward.flexibleValue1 cannot be set twice.");
                  }
                  _loc13_++;
                  this.flexibleValue1 = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCondtionReward.flexibleValue2 cannot be set twice.");
                  }
                  _loc14_++;
                  this.flexibleValue2 = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 13:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCondtionReward.todayscore cannot be set twice.");
                  }
                  _loc15_++;
                  this.todayscore = new Dto_Uint32Tracker();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.todayscore);
                  break;
               case 14:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCondtionReward.totalscore cannot be set twice.");
                  }
                  _loc16_++;
                  this.totalscore = new Dto_Uint32Tracker();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.totalscore);
                  break;
               case 15:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCondtionReward.zombieNum cannot be set twice.");
                  }
                  _loc17_++;
                  this.zombieNum = new Dto_Uint32Tracker();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.zombieNum);
                  break;
               case 16:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCondtionReward.costGoldTicket cannot be set twice.");
                  }
                  _loc18_++;
                  this.costGoldTicket = new Dto_Uint32Tracker();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.costGoldTicket);
                  break;
               case 17:
                  if(_loc19_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCondtionReward.mergeServerLoginNum cannot be set twice.");
                  }
                  _loc19_++;
                  this.mergeServerLoginNum = new Dto_Uint32Tracker();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.mergeServerLoginNum);
                  break;
               case 18:
                  if(_loc20_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCondtionReward.watchVideo cannot be set twice.");
                  }
                  _loc20_++;
                  this.watchVideo = new Dto_Uint32Tracker();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.watchVideo);
                  break;
               case 100:
                  if(_loc21_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCondtionReward.reward cannot be set twice.");
                  }
                  _loc21_++;
                  this.reward = new Dto_FlexibleActivityReward();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.reward);
                  break;
               default:
                  super.readUnknown(param1,_loc22_);
                  break;
            }
         }
      }
   }
}
