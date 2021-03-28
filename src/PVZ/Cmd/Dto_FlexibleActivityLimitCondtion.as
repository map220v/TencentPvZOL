package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_FlexibleActivityLimitCondtion extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FlexibleActivityLimitCondtion";
      
      public static const MIN_LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityLimitCondtion.min_level","minLevel",1 << 3 | WireType.VARINT);
      
      public static const MAX_LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityLimitCondtion.max_level","maxLevel",2 << 3 | WireType.VARINT);
      
      public static const BEGIN_TIME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FlexibleActivityLimitCondtion.begin_time","beginTime",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const END_TIME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FlexibleActivityLimitCondtion.end_time","endTime",4 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const START_DAY_FROM_SERVER_PUBLISH:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityLimitCondtion.start_day_from_server_publish","startDayFromServerPublish",5 << 3 | WireType.VARINT);
      
      public static const START_DAY_FROM_CREATE_ROLE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityLimitCondtion.start_day_from_create_role","startDayFromCreateRole",6 << 3 | WireType.VARINT);
      
      public static const DURATION_DAY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityLimitCondtion.duration_day","durationDay",7 << 3 | WireType.VARINT);
      
      public static const OPEN_WEEK_DAY:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityLimitCondtion.open_week_day","openWeekDay",8 << 3 | WireType.VARINT);
      
      public static const PRIVILEGE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityLimitCondtion.privilege","privilege",9 << 3 | WireType.LENGTH_DELIMITED,Dto_FlexibleActivityPlatformPrivilege);
      
      public static const KEEP_DAYS_AFTER_CLOSE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityLimitCondtion.keep_days_after_close","keepDaysAfterClose",10 << 3 | WireType.VARINT);
      
      public static const SHOW_AFTER_FINISH:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_FlexibleActivityLimitCondtion.show_after_finish","showAfterFinish",11 << 3 | WireType.VARINT);
      
      public static const ZONE_LIST:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FlexibleActivityLimitCondtion.zone_list","zoneList",14 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ZONE_LIST_EXCLUDE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FlexibleActivityLimitCondtion.zone_list_exclude","zoneListExclude",15 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const SERVER_PUBLISH_TIME:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityLimitCondtion.server_publish_time","serverPublishTime",16 << 3 | WireType.LENGTH_DELIMITED,Dto_StringCompare);
      
      public static const START_DAY_FROM_GET_ACTIVITY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityLimitCondtion.start_day_from_get_activity","startDayFromGetActivity",17 << 3 | WireType.VARINT);
      
      public static const PUBLISH_BEFORE_TIME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FlexibleActivityLimitCondtion.publish_before_time","publishBeforeTime",18 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const IBEGINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityLimitCondtion.iBeginTime","iBeginTime",100 << 3 | WireType.VARINT);
      
      public static const IENDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityLimitCondtion.iEndTime","iEndTime",101 << 3 | WireType.VARINT);
      
      public static const ZONE_ID:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityLimitCondtion.zone_id","zoneId",102 << 3 | WireType.VARINT);
      
      public static const ZONE_ID_EXCLUDE:RepeatedFieldDescriptor$TYPE_UINT32 = new RepeatedFieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityLimitCondtion.zone_id_exclude","zoneIdExclude",103 << 3 | WireType.VARINT);
      
      public static const SERVER_PUBLISH_TIME_REAL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityLimitCondtion.server_publish_time_real","serverPublishTimeReal",104 << 3 | WireType.LENGTH_DELIMITED,Dto_Uint32Compare);
       
      
      private var min_level$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var max_level$field:uint;
      
      private var begin_time$field:String;
      
      private var end_time$field:String;
      
      private var start_day_from_server_publish$field:uint;
      
      private var start_day_from_create_role$field:uint;
      
      private var duration_day$field:uint;
      
      public var openWeekDay:Array;
      
      public var privilege:Array;
      
      private var keep_days_after_close$field:uint;
      
      private var show_after_finish$field:Boolean;
      
      private var zone_list$field:String;
      
      private var zone_list_exclude$field:String;
      
      private var server_publish_time$field:Dto_StringCompare;
      
      private var start_day_from_get_activity$field:uint;
      
      private var publish_before_time$field:String;
      
      private var iBeginTime$field:uint;
      
      private var iEndTime$field:uint;
      
      public var zoneId:Array;
      
      public var zoneIdExclude:Array;
      
      private var server_publish_time_real$field:Dto_Uint32Compare;
      
      public function Dto_FlexibleActivityLimitCondtion()
      {
         this.openWeekDay = [];
         this.privilege = [];
         this.zoneId = [];
         this.zoneIdExclude = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FlexibleActivityLimitCondtion.$MessageID;
      }
      
      public function clearMinLevel() : void
      {
         this.hasField$0 &= 4294967294;
         this.min_level$field = new uint();
      }
      
      public function get hasMinLevel() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set minLevel(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.min_level$field = param1;
      }
      
      public function get minLevel() : uint
      {
         return this.min_level$field;
      }
      
      public function clearMaxLevel() : void
      {
         this.hasField$0 &= 4294967293;
         this.max_level$field = new uint();
      }
      
      public function get hasMaxLevel() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set maxLevel(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.max_level$field = param1;
      }
      
      public function get maxLevel() : uint
      {
         return this.max_level$field;
      }
      
      public function clearBeginTime() : void
      {
         this.begin_time$field = null;
      }
      
      public function get hasBeginTime() : Boolean
      {
         return this.begin_time$field != null;
      }
      
      public function set beginTime(param1:String) : void
      {
         this.begin_time$field = param1;
      }
      
      public function get beginTime() : String
      {
         return this.begin_time$field;
      }
      
      public function clearEndTime() : void
      {
         this.end_time$field = null;
      }
      
      public function get hasEndTime() : Boolean
      {
         return this.end_time$field != null;
      }
      
      public function set endTime(param1:String) : void
      {
         this.end_time$field = param1;
      }
      
      public function get endTime() : String
      {
         return this.end_time$field;
      }
      
      public function clearStartDayFromServerPublish() : void
      {
         this.hasField$0 &= 4294967291;
         this.start_day_from_server_publish$field = new uint();
      }
      
      public function get hasStartDayFromServerPublish() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set startDayFromServerPublish(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.start_day_from_server_publish$field = param1;
      }
      
      public function get startDayFromServerPublish() : uint
      {
         return this.start_day_from_server_publish$field;
      }
      
      public function clearStartDayFromCreateRole() : void
      {
         this.hasField$0 &= 4294967287;
         this.start_day_from_create_role$field = new uint();
      }
      
      public function get hasStartDayFromCreateRole() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set startDayFromCreateRole(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.start_day_from_create_role$field = param1;
      }
      
      public function get startDayFromCreateRole() : uint
      {
         return this.start_day_from_create_role$field;
      }
      
      public function clearDurationDay() : void
      {
         this.hasField$0 &= 4294967279;
         this.duration_day$field = new uint();
      }
      
      public function get hasDurationDay() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set durationDay(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.duration_day$field = param1;
      }
      
      public function get durationDay() : uint
      {
         return this.duration_day$field;
      }
      
      public function clearKeepDaysAfterClose() : void
      {
         this.hasField$0 &= 4294967263;
         this.keep_days_after_close$field = new uint();
      }
      
      public function get hasKeepDaysAfterClose() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set keepDaysAfterClose(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.keep_days_after_close$field = param1;
      }
      
      public function get keepDaysAfterClose() : uint
      {
         return this.keep_days_after_close$field;
      }
      
      public function clearShowAfterFinish() : void
      {
         this.hasField$0 &= 4294967231;
         this.show_after_finish$field = new Boolean();
      }
      
      public function get hasShowAfterFinish() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set showAfterFinish(param1:Boolean) : void
      {
         this.hasField$0 |= 64;
         this.show_after_finish$field = param1;
      }
      
      public function get showAfterFinish() : Boolean
      {
         return this.show_after_finish$field;
      }
      
      public function clearZoneList() : void
      {
         this.zone_list$field = null;
      }
      
      public function get hasZoneList() : Boolean
      {
         return this.zone_list$field != null;
      }
      
      public function set zoneList(param1:String) : void
      {
         this.zone_list$field = param1;
      }
      
      public function get zoneList() : String
      {
         return this.zone_list$field;
      }
      
      public function clearZoneListExclude() : void
      {
         this.zone_list_exclude$field = null;
      }
      
      public function get hasZoneListExclude() : Boolean
      {
         return this.zone_list_exclude$field != null;
      }
      
      public function set zoneListExclude(param1:String) : void
      {
         this.zone_list_exclude$field = param1;
      }
      
      public function get zoneListExclude() : String
      {
         return this.zone_list_exclude$field;
      }
      
      public function clearServerPublishTime() : void
      {
         this.server_publish_time$field = null;
      }
      
      public function get hasServerPublishTime() : Boolean
      {
         return this.server_publish_time$field != null;
      }
      
      public function set serverPublishTime(param1:Dto_StringCompare) : void
      {
         this.server_publish_time$field = param1;
      }
      
      public function get serverPublishTime() : Dto_StringCompare
      {
         return this.server_publish_time$field;
      }
      
      public function clearStartDayFromGetActivity() : void
      {
         this.hasField$0 &= 4294967167;
         this.start_day_from_get_activity$field = new uint();
      }
      
      public function get hasStartDayFromGetActivity() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set startDayFromGetActivity(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.start_day_from_get_activity$field = param1;
      }
      
      public function get startDayFromGetActivity() : uint
      {
         return this.start_day_from_get_activity$field;
      }
      
      public function clearPublishBeforeTime() : void
      {
         this.publish_before_time$field = null;
      }
      
      public function get hasPublishBeforeTime() : Boolean
      {
         return this.publish_before_time$field != null;
      }
      
      public function set publishBeforeTime(param1:String) : void
      {
         this.publish_before_time$field = param1;
      }
      
      public function get publishBeforeTime() : String
      {
         return this.publish_before_time$field;
      }
      
      public function clearIBeginTime() : void
      {
         this.hasField$0 &= 4294967039;
         this.iBeginTime$field = new uint();
      }
      
      public function get hasIBeginTime() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set iBeginTime(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.iBeginTime$field = param1;
      }
      
      public function get iBeginTime() : uint
      {
         return this.iBeginTime$field;
      }
      
      public function clearIEndTime() : void
      {
         this.hasField$0 &= 4294966783;
         this.iEndTime$field = new uint();
      }
      
      public function get hasIEndTime() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set iEndTime(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.iEndTime$field = param1;
      }
      
      public function get iEndTime() : uint
      {
         return this.iEndTime$field;
      }
      
      public function clearServerPublishTimeReal() : void
      {
         this.server_publish_time_real$field = null;
      }
      
      public function get hasServerPublishTimeReal() : Boolean
      {
         return this.server_publish_time_real$field != null;
      }
      
      public function set serverPublishTimeReal(param1:Dto_Uint32Compare) : void
      {
         this.server_publish_time_real$field = param1;
      }
      
      public function get serverPublishTimeReal() : Dto_Uint32Compare
      {
         return this.server_publish_time_real$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc6_:* = undefined;
         if(this.hasMinLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.min_level$field);
         }
         if(this.hasMaxLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.max_level$field);
         }
         if(this.hasBeginTime)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.begin_time$field);
         }
         if(this.hasEndTime)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_STRING(param1,this.end_time$field);
         }
         if(this.hasStartDayFromServerPublish)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.start_day_from_server_publish$field);
         }
         if(this.hasStartDayFromCreateRole)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.start_day_from_create_role$field);
         }
         if(this.hasDurationDay)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.duration_day$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.openWeekDay.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.openWeekDay[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.privilege.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_MESSAGE(param1,this.privilege[_loc3_]);
            _loc3_++;
         }
         if(this.hasKeepDaysAfterClose)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.keep_days_after_close$field);
         }
         if(this.hasShowAfterFinish)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_BOOL(param1,this.show_after_finish$field);
         }
         if(this.hasZoneList)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,14);
            WriteUtils.write$TYPE_STRING(param1,this.zone_list$field);
         }
         if(this.hasZoneListExclude)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,15);
            WriteUtils.write$TYPE_STRING(param1,this.zone_list_exclude$field);
         }
         if(this.hasServerPublishTime)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,16);
            WriteUtils.write$TYPE_MESSAGE(param1,this.server_publish_time$field);
         }
         if(this.hasStartDayFromGetActivity)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,17);
            WriteUtils.write$TYPE_UINT32(param1,this.start_day_from_get_activity$field);
         }
         if(this.hasPublishBeforeTime)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,18);
            WriteUtils.write$TYPE_STRING(param1,this.publish_before_time$field);
         }
         if(this.hasIBeginTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,100);
            WriteUtils.write$TYPE_UINT32(param1,this.iBeginTime$field);
         }
         if(this.hasIEndTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,101);
            WriteUtils.write$TYPE_UINT32(param1,this.iEndTime$field);
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.zoneId.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,102);
            WriteUtils.write$TYPE_UINT32(param1,this.zoneId[_loc4_]);
            _loc4_++;
         }
         var _loc5_:uint = 0;
         while(_loc5_ < this.zoneIdExclude.length)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,103);
            WriteUtils.write$TYPE_UINT32(param1,this.zoneIdExclude[_loc5_]);
            _loc5_++;
         }
         if(this.hasServerPublishTimeReal)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,104);
            WriteUtils.write$TYPE_MESSAGE(param1,this.server_publish_time_real$field);
         }
         for(_loc6_ in this)
         {
            super.writeUnknown(param1,_loc6_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc20_:uint = 0;
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
         while(param1.bytesAvailable > param2)
         {
            _loc20_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc20_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitCondtion.minLevel cannot be set twice.");
                  }
                  _loc3_++;
                  this.minLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitCondtion.maxLevel cannot be set twice.");
                  }
                  _loc4_++;
                  this.maxLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitCondtion.beginTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.beginTime = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitCondtion.endTime cannot be set twice.");
                  }
                  _loc6_++;
                  this.endTime = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitCondtion.startDayFromServerPublish cannot be set twice.");
                  }
                  _loc7_++;
                  this.startDayFromServerPublish = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitCondtion.startDayFromCreateRole cannot be set twice.");
                  }
                  _loc8_++;
                  this.startDayFromCreateRole = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitCondtion.durationDay cannot be set twice.");
                  }
                  _loc9_++;
                  this.durationDay = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if((_loc20_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.openWeekDay);
                  }
                  else
                  {
                     this.openWeekDay.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 9:
                  this.privilege.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FlexibleActivityPlatformPrivilege()));
                  break;
               case 10:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitCondtion.keepDaysAfterClose cannot be set twice.");
                  }
                  _loc10_++;
                  this.keepDaysAfterClose = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitCondtion.showAfterFinish cannot be set twice.");
                  }
                  _loc11_++;
                  this.showAfterFinish = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 14:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitCondtion.zoneList cannot be set twice.");
                  }
                  _loc12_++;
                  this.zoneList = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 15:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitCondtion.zoneListExclude cannot be set twice.");
                  }
                  _loc13_++;
                  this.zoneListExclude = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 16:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitCondtion.serverPublishTime cannot be set twice.");
                  }
                  _loc14_++;
                  this.serverPublishTime = new Dto_StringCompare();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.serverPublishTime);
                  break;
               case 17:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitCondtion.startDayFromGetActivity cannot be set twice.");
                  }
                  _loc15_++;
                  this.startDayFromGetActivity = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 18:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitCondtion.publishBeforeTime cannot be set twice.");
                  }
                  _loc16_++;
                  this.publishBeforeTime = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 100:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitCondtion.iBeginTime cannot be set twice.");
                  }
                  _loc17_++;
                  this.iBeginTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 101:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitCondtion.iEndTime cannot be set twice.");
                  }
                  _loc18_++;
                  this.iEndTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 102:
                  if((_loc20_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.zoneId);
                  }
                  else
                  {
                     this.zoneId.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 103:
                  if((_loc20_ & 7) == WireType.LENGTH_DELIMITED)
                  {
                     ReadUtils.readPackedRepeated(param1,ReadUtils.read$TYPE_UINT32,this.zoneIdExclude);
                  }
                  else
                  {
                     this.zoneIdExclude.push(ReadUtils.read$TYPE_UINT32(param1));
                  }
                  break;
               case 104:
                  if(_loc19_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityLimitCondtion.serverPublishTimeReal cannot be set twice.");
                  }
                  _loc19_++;
                  this.serverPublishTimeReal = new Dto_Uint32Compare();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.serverPublishTimeReal);
                  break;
               default:
                  super.readUnknown(param1,_loc20_);
                  break;
            }
         }
      }
   }
}
