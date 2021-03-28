package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BYTES;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public final class Dto_FlexibleActivityCommon extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FlexibleActivityCommon";
      
      public static const ACTIVITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityCommon.activityId","activityId",1 << 3 | WireType.VARINT);
      
      public static const ACTIVITYTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityCommon.activityType","activityType",2 << 3 | WireType.VARINT);
      
      public static const ACTIVITYICONID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityCommon.activityIconId","activityIconId",3 << 3 | WireType.VARINT);
      
      public static const ACTIVITYPANELID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityCommon.activityPanelId","activityPanelId",4 << 3 | WireType.VARINT);
      
      public static const BEGINDATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityCommon.beginDate","beginDate",5 << 3 | WireType.VARINT);
      
      public static const ENDDATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityCommon.endDate","endDate",6 << 3 | WireType.VARINT);
      
      public static const PLATFORMPRIVILEGES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityCommon.platformPrivileges","platformPrivileges",7 << 3 | WireType.LENGTH_DELIMITED,Dto_FlexibleActivityPlatformPrivilege);
      
      public static const SHOWLIMIT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityCommon.showLimit","showLimit",8 << 3 | WireType.LENGTH_DELIMITED,Dto_FlexibleActivityLimitCondtion);
      
      public static const LIMIT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityCommon.limit","limit",9 << 3 | WireType.LENGTH_DELIMITED,Dto_FlexibleActivityLimitCondtion);
      
      public static const SERVERPARAMS:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("PVZ.Cmd.Dto_FlexibleActivityCommon.serverParams","serverParams",10 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const CLIENTPARAMS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FlexibleActivityCommon.clientParams","clientParams",11 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const DAILYBEGINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityCommon.dailyBeginTime","dailyBeginTime",12 << 3 | WireType.VARINT);
      
      public static const DAILYENDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityCommon.dailyEndTime","dailyEndTime",13 << 3 | WireType.VARINT);
      
      public static const RAWDAILYBEGINTIME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FlexibleActivityCommon.rawDailyBeginTime","rawDailyBeginTime",14 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const RAWDAILYENDTIME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FlexibleActivityCommon.rawDailyEndTime","rawDailyEndTime",15 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const RAWPLATFORMPRIVILEGES:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FlexibleActivityCommon.rawPlatformPrivileges","rawPlatformPrivileges",16 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const RAWSHOWLIMIT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FlexibleActivityCommon.rawShowLimit","rawShowLimit",17 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const RAWLIMIT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FlexibleActivityCommon.rawLimit","rawLimit",18 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const RAWSERVERPARAMS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FlexibleActivityCommon.rawServerParams","rawServerParams",19 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const RAWCLIENTPARAMS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FlexibleActivityCommon.rawClientParams","rawClientParams",20 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const RAWNOTE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_FlexibleActivityCommon.rawNote","rawNote",21 << 3 | WireType.LENGTH_DELIMITED);
       
      
      public var activityId:uint;
      
      public var activityType:uint;
      
      private var activityIconId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var activityPanelId$field:uint;
      
      private var beginDate$field:uint;
      
      private var endDate$field:uint;
      
      public var platformPrivileges:Array;
      
      private var showLimit$field:Dto_FlexibleActivityLimitCondtion;
      
      private var limit$field:Dto_FlexibleActivityLimitCondtion;
      
      private var serverParams$field:ByteArray;
      
      private var clientParams$field:String;
      
      private var dailyBeginTime$field:uint;
      
      private var dailyEndTime$field:uint;
      
      private var rawDailyBeginTime$field:String;
      
      private var rawDailyEndTime$field:String;
      
      private var rawPlatformPrivileges$field:String;
      
      private var rawShowLimit$field:String;
      
      private var rawLimit$field:String;
      
      private var rawServerParams$field:String;
      
      private var rawClientParams$field:String;
      
      private var rawNote$field:String;
      
      public function Dto_FlexibleActivityCommon()
      {
         this.platformPrivileges = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FlexibleActivityCommon.$MessageID;
      }
      
      public function clearActivityIconId() : void
      {
         this.hasField$0 &= 4294967294;
         this.activityIconId$field = new uint();
      }
      
      public function get hasActivityIconId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set activityIconId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.activityIconId$field = param1;
      }
      
      public function get activityIconId() : uint
      {
         return this.activityIconId$field;
      }
      
      public function clearActivityPanelId() : void
      {
         this.hasField$0 &= 4294967293;
         this.activityPanelId$field = new uint();
      }
      
      public function get hasActivityPanelId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set activityPanelId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.activityPanelId$field = param1;
      }
      
      public function get activityPanelId() : uint
      {
         return this.activityPanelId$field;
      }
      
      public function clearBeginDate() : void
      {
         this.hasField$0 &= 4294967291;
         this.beginDate$field = new uint();
      }
      
      public function get hasBeginDate() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set beginDate(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.beginDate$field = param1;
      }
      
      public function get beginDate() : uint
      {
         return this.beginDate$field;
      }
      
      public function clearEndDate() : void
      {
         this.hasField$0 &= 4294967287;
         this.endDate$field = new uint();
      }
      
      public function get hasEndDate() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set endDate(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.endDate$field = param1;
      }
      
      public function get endDate() : uint
      {
         return this.endDate$field;
      }
      
      public function clearShowLimit() : void
      {
         this.showLimit$field = null;
      }
      
      public function get hasShowLimit() : Boolean
      {
         return this.showLimit$field != null;
      }
      
      public function set showLimit(param1:Dto_FlexibleActivityLimitCondtion) : void
      {
         this.showLimit$field = param1;
      }
      
      public function get showLimit() : Dto_FlexibleActivityLimitCondtion
      {
         return this.showLimit$field;
      }
      
      public function clearLimit() : void
      {
         this.limit$field = null;
      }
      
      public function get hasLimit() : Boolean
      {
         return this.limit$field != null;
      }
      
      public function set limit(param1:Dto_FlexibleActivityLimitCondtion) : void
      {
         this.limit$field = param1;
      }
      
      public function get limit() : Dto_FlexibleActivityLimitCondtion
      {
         return this.limit$field;
      }
      
      public function clearServerParams() : void
      {
         this.serverParams$field = null;
      }
      
      public function get hasServerParams() : Boolean
      {
         return this.serverParams$field != null;
      }
      
      public function set serverParams(param1:ByteArray) : void
      {
         this.serverParams$field = param1;
      }
      
      public function get serverParams() : ByteArray
      {
         return this.serverParams$field;
      }
      
      public function clearClientParams() : void
      {
         this.clientParams$field = null;
      }
      
      public function get hasClientParams() : Boolean
      {
         return this.clientParams$field != null;
      }
      
      public function set clientParams(param1:String) : void
      {
         this.clientParams$field = param1;
      }
      
      public function get clientParams() : String
      {
         return this.clientParams$field;
      }
      
      public function clearDailyBeginTime() : void
      {
         this.hasField$0 &= 4294967279;
         this.dailyBeginTime$field = new uint();
      }
      
      public function get hasDailyBeginTime() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set dailyBeginTime(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.dailyBeginTime$field = param1;
      }
      
      public function get dailyBeginTime() : uint
      {
         return this.dailyBeginTime$field;
      }
      
      public function clearDailyEndTime() : void
      {
         this.hasField$0 &= 4294967263;
         this.dailyEndTime$field = new uint();
      }
      
      public function get hasDailyEndTime() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set dailyEndTime(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.dailyEndTime$field = param1;
      }
      
      public function get dailyEndTime() : uint
      {
         return this.dailyEndTime$field;
      }
      
      public function clearRawDailyBeginTime() : void
      {
         this.rawDailyBeginTime$field = null;
      }
      
      public function get hasRawDailyBeginTime() : Boolean
      {
         return this.rawDailyBeginTime$field != null;
      }
      
      public function set rawDailyBeginTime(param1:String) : void
      {
         this.rawDailyBeginTime$field = param1;
      }
      
      public function get rawDailyBeginTime() : String
      {
         return this.rawDailyBeginTime$field;
      }
      
      public function clearRawDailyEndTime() : void
      {
         this.rawDailyEndTime$field = null;
      }
      
      public function get hasRawDailyEndTime() : Boolean
      {
         return this.rawDailyEndTime$field != null;
      }
      
      public function set rawDailyEndTime(param1:String) : void
      {
         this.rawDailyEndTime$field = param1;
      }
      
      public function get rawDailyEndTime() : String
      {
         return this.rawDailyEndTime$field;
      }
      
      public function clearRawPlatformPrivileges() : void
      {
         this.rawPlatformPrivileges$field = null;
      }
      
      public function get hasRawPlatformPrivileges() : Boolean
      {
         return this.rawPlatformPrivileges$field != null;
      }
      
      public function set rawPlatformPrivileges(param1:String) : void
      {
         this.rawPlatformPrivileges$field = param1;
      }
      
      public function get rawPlatformPrivileges() : String
      {
         return this.rawPlatformPrivileges$field;
      }
      
      public function clearRawShowLimit() : void
      {
         this.rawShowLimit$field = null;
      }
      
      public function get hasRawShowLimit() : Boolean
      {
         return this.rawShowLimit$field != null;
      }
      
      public function set rawShowLimit(param1:String) : void
      {
         this.rawShowLimit$field = param1;
      }
      
      public function get rawShowLimit() : String
      {
         return this.rawShowLimit$field;
      }
      
      public function clearRawLimit() : void
      {
         this.rawLimit$field = null;
      }
      
      public function get hasRawLimit() : Boolean
      {
         return this.rawLimit$field != null;
      }
      
      public function set rawLimit(param1:String) : void
      {
         this.rawLimit$field = param1;
      }
      
      public function get rawLimit() : String
      {
         return this.rawLimit$field;
      }
      
      public function clearRawServerParams() : void
      {
         this.rawServerParams$field = null;
      }
      
      public function get hasRawServerParams() : Boolean
      {
         return this.rawServerParams$field != null;
      }
      
      public function set rawServerParams(param1:String) : void
      {
         this.rawServerParams$field = param1;
      }
      
      public function get rawServerParams() : String
      {
         return this.rawServerParams$field;
      }
      
      public function clearRawClientParams() : void
      {
         this.rawClientParams$field = null;
      }
      
      public function get hasRawClientParams() : Boolean
      {
         return this.rawClientParams$field != null;
      }
      
      public function set rawClientParams(param1:String) : void
      {
         this.rawClientParams$field = param1;
      }
      
      public function get rawClientParams() : String
      {
         return this.rawClientParams$field;
      }
      
      public function clearRawNote() : void
      {
         this.rawNote$field = null;
      }
      
      public function get hasRawNote() : Boolean
      {
         return this.rawNote$field != null;
      }
      
      public function set rawNote(param1:String) : void
      {
         this.rawNote$field = param1;
      }
      
      public function get rawNote() : String
      {
         return this.rawNote$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         WriteUtils.writeTag(param1,WireType.VARINT,1);
         WriteUtils.write$TYPE_UINT32(param1,this.activityId);
         WriteUtils.writeTag(param1,WireType.VARINT,2);
         WriteUtils.write$TYPE_UINT32(param1,this.activityType);
         if(this.hasActivityIconId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.activityIconId$field);
         }
         if(this.hasActivityPanelId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.activityPanelId$field);
         }
         if(this.hasBeginDate)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.beginDate$field);
         }
         if(this.hasEndDate)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.endDate$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.platformPrivileges.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.platformPrivileges[_loc2_]);
            _loc2_++;
         }
         if(this.hasShowLimit)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.showLimit$field);
         }
         if(this.hasLimit)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_MESSAGE(param1,this.limit$field);
         }
         if(this.hasServerParams)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,10);
            WriteUtils.write$TYPE_BYTES(param1,this.serverParams$field);
         }
         if(this.hasClientParams)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,11);
            WriteUtils.write$TYPE_STRING(param1,this.clientParams$field);
         }
         if(this.hasDailyBeginTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_UINT32(param1,this.dailyBeginTime$field);
         }
         if(this.hasDailyEndTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,13);
            WriteUtils.write$TYPE_UINT32(param1,this.dailyEndTime$field);
         }
         if(this.hasRawDailyBeginTime)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,14);
            WriteUtils.write$TYPE_STRING(param1,this.rawDailyBeginTime$field);
         }
         if(this.hasRawDailyEndTime)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,15);
            WriteUtils.write$TYPE_STRING(param1,this.rawDailyEndTime$field);
         }
         if(this.hasRawPlatformPrivileges)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,16);
            WriteUtils.write$TYPE_STRING(param1,this.rawPlatformPrivileges$field);
         }
         if(this.hasRawShowLimit)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,17);
            WriteUtils.write$TYPE_STRING(param1,this.rawShowLimit$field);
         }
         if(this.hasRawLimit)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,18);
            WriteUtils.write$TYPE_STRING(param1,this.rawLimit$field);
         }
         if(this.hasRawServerParams)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,19);
            WriteUtils.write$TYPE_STRING(param1,this.rawServerParams$field);
         }
         if(this.hasRawClientParams)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,20);
            WriteUtils.write$TYPE_STRING(param1,this.rawClientParams$field);
         }
         if(this.hasRawNote)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,21);
            WriteUtils.write$TYPE_STRING(param1,this.rawNote$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Dto_FlexibleActivityCommon.activityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.activityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCommon.activityType cannot be set twice.");
                  }
                  _loc4_++;
                  this.activityType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCommon.activityIconId cannot be set twice.");
                  }
                  _loc5_++;
                  this.activityIconId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCommon.activityPanelId cannot be set twice.");
                  }
                  _loc6_++;
                  this.activityPanelId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCommon.beginDate cannot be set twice.");
                  }
                  _loc7_++;
                  this.beginDate = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCommon.endDate cannot be set twice.");
                  }
                  _loc8_++;
                  this.endDate = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  this.platformPrivileges.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FlexibleActivityPlatformPrivilege()));
                  break;
               case 8:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCommon.showLimit cannot be set twice.");
                  }
                  _loc9_++;
                  this.showLimit = new Dto_FlexibleActivityLimitCondtion();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.showLimit);
                  break;
               case 9:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCommon.limit cannot be set twice.");
                  }
                  _loc10_++;
                  this.limit = new Dto_FlexibleActivityLimitCondtion();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.limit);
                  break;
               case 10:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCommon.serverParams cannot be set twice.");
                  }
                  _loc11_++;
                  this.serverParams = ReadUtils.read$TYPE_BYTES(param1);
                  break;
               case 11:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCommon.clientParams cannot be set twice.");
                  }
                  _loc12_++;
                  this.clientParams = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 12:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCommon.dailyBeginTime cannot be set twice.");
                  }
                  _loc13_++;
                  this.dailyBeginTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 13:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCommon.dailyEndTime cannot be set twice.");
                  }
                  _loc14_++;
                  this.dailyEndTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 14:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCommon.rawDailyBeginTime cannot be set twice.");
                  }
                  _loc15_++;
                  this.rawDailyBeginTime = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 15:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCommon.rawDailyEndTime cannot be set twice.");
                  }
                  _loc16_++;
                  this.rawDailyEndTime = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 16:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCommon.rawPlatformPrivileges cannot be set twice.");
                  }
                  _loc17_++;
                  this.rawPlatformPrivileges = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 17:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCommon.rawShowLimit cannot be set twice.");
                  }
                  _loc18_++;
                  this.rawShowLimit = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 18:
                  if(_loc19_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCommon.rawLimit cannot be set twice.");
                  }
                  _loc19_++;
                  this.rawLimit = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 19:
                  if(_loc20_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCommon.rawServerParams cannot be set twice.");
                  }
                  _loc20_++;
                  this.rawServerParams = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 20:
                  if(_loc21_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCommon.rawClientParams cannot be set twice.");
                  }
                  _loc21_++;
                  this.rawClientParams = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 21:
                  if(_loc22_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityCommon.rawNote cannot be set twice.");
                  }
                  _loc22_++;
                  this.rawNote = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc23_);
                  break;
            }
         }
      }
   }
}
