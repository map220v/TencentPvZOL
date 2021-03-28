package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Init_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Init_SC";
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Init_SC.name","name",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const EXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.exp","exp",2 << 3 | WireType.VARINT);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.level","level",3 << 3 | WireType.VARINT);
      
      public static const SUN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.sun","sun",4 << 3 | WireType.VARINT);
      
      public static const COIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.coin","coin",5 << 3 | WireType.VARINT);
      
      public static const LATESTTDLEVEL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Init_SC.latestTDLevel","latestTDLevel",7 << 3 | WireType.LENGTH_DELIMITED,Dto_TDLevelInfo);
      
      public static const NOW:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.now","now",8 << 3 | WireType.VARINT);
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Init_SC.roleID","roleID",9 << 3 | WireType.VARINT);
      
      public static const ENERGY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.energy","energy",10 << 3 | WireType.VARINT);
      
      public static const FRIENDPOINT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.friendPoint","friendPoint",11 << 3 | WireType.VARINT);
      
      public static const FACEAVATAR:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Init_SC.faceAvatar","faceAvatar",12 << 3 | WireType.LENGTH_DELIMITED,Dto_PlantInfo);
      
      public static const FACEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.faceId","faceId",13 << 3 | WireType.VARINT);
      
      public static const UNLOCKPLANTLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Init_SC.unlockPlantList","unlockPlantList",14 << 3 | WireType.LENGTH_DELIMITED,Dto_PlantInfo);
      
      public static const TICKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.ticket","ticket",15 << 3 | WireType.VARINT);
      
      public static const FAME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.fame","fame",16 << 3 | WireType.VARINT);
      
      public static const BUYENERGYNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.buyEnergyNum","buyEnergyNum",17 << 3 | WireType.VARINT);
      
      public static const HASNEWFORMATIONPOS:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Init_SC.hasNewFormationPos","hasNewFormationPos",18 << 3 | WireType.VARINT);
      
      public static const SERVERCONFIG:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Init_SC.serverConfig","serverConfig",19 << 3 | WireType.LENGTH_DELIMITED,Dto_ServerConfig);
      
      public static const TOWNDURABILITY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.townDurability","townDurability",20 << 3 | WireType.VARINT);
      
      public static const TOWNDURABILITYMAX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.townDurabilityMax","townDurabilityMax",21 << 3 | WireType.VARINT);
      
      public static const PRESENTTICKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.presentTicket","presentTicket",22 << 3 | WireType.VARINT);
      
      public static const QQFACEURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Init_SC.qqFaceURL","qqFaceURL",23 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ZONEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.zoneId","zoneId",24 << 3 | WireType.VARINT);
      
      public static const ISMINICLIENT:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Init_SC.isMiniClient","isMiniClient",25 << 3 | WireType.VARINT);
      
      public static const SEQID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.seqId","seqId",26 << 3 | WireType.VARINT);
      
      public static const NEWOFFLINEREWARD:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Init_SC.newOfflineReward","newOfflineReward",27 << 3 | WireType.VARINT);
      
      public static const REGTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.regTime","regTime",28 << 3 | WireType.VARINT);
      
      public static const SERVEROPENTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.serverOpenTime","serverOpenTime",29 << 3 | WireType.VARINT);
      
      public static const REGROLESYSTEMOPENTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.regRoleSystemOpenTime","regRoleSystemOpenTime",30 << 3 | WireType.VARINT);
      
      public static const UNLOCKSPECIALPLANT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Init_SC.unLockSpecialPlant","unLockSpecialPlant",31 << 3 | WireType.LENGTH_DELIMITED,Dto_PlantInfo);
      
      public static const FOSTERTICKET:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.fosterTicket","fosterTicket",32 << 3 | WireType.VARINT);
      
      public static const ISEQUIPATTACHENABLED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Init_SC.isEquipAttachEnabled","isEquipAttachEnabled",33 << 3 | WireType.VARINT);
      
      public static const ISPLAYZONETASK:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Init_SC.isPlayZoneTask","isPlayZoneTask",34 << 3 | WireType.VARINT);
      
      public static const FORBIDCARDAWAKEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Init_SC.forbidCardAwaken","forbidCardAwaken",35 << 3 | WireType.VARINT);
      
      public static const LUCKY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.lucky","lucky",36 << 3 | WireType.VARINT);
      
      public static const CONTRIBVAL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.contribVal","contribVal",37 << 3 | WireType.VARINT);
      
      public static const LIGHT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.light","light",38 << 3 | WireType.VARINT);
      
      public static const LASTPAYTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.lastPayTime","lastPayTime",39 << 3 | WireType.VARINT);
      
      public static const PUPPETSKILLVAL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.puppetSkillVal","puppetSkillVal",40 << 3 | WireType.VARINT);
      
      public static const PUPPETENERGY:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.puppetEnergy","puppetEnergy",41 << 3 | WireType.VARINT);
      
      public static const BUYPUPPETENERGYNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.buyPuppetEnergyNum","buyPuppetEnergyNum",42 << 3 | WireType.VARINT);
      
      public static const BUYPUPPETSKILLVALNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.buyPuppetSkillValNum","buyPuppetSkillValNum",43 << 3 | WireType.VARINT);
      
      public static const PRESTIGE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Init_SC.prestige","prestige",44 << 3 | WireType.VARINT);
       
      
      private var name$field:String;
      
      private var exp$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var level$field:uint;
      
      private var sun$field:uint;
      
      private var coin$field:uint;
      
      private var latestTDLevel$field:Dto_TDLevelInfo;
      
      private var now$field:uint;
      
      private var roleID$field:Int64;
      
      private var energy$field:uint;
      
      private var friendPoint$field:uint;
      
      private var faceAvatar$field:Dto_PlantInfo;
      
      private var faceId$field:uint;
      
      public var unlockPlantList:Array;
      
      private var ticket$field:uint;
      
      private var fame$field:uint;
      
      private var buyEnergyNum$field:uint;
      
      private var hasNewFormationPos$field:Boolean;
      
      public var serverConfig:Array;
      
      private var townDurability$field:uint;
      
      private var townDurabilityMax$field:uint;
      
      private var presentTicket$field:uint;
      
      private var qqFaceURL$field:String;
      
      private var zoneId$field:uint;
      
      private var isMiniClient$field:Boolean;
      
      private var seqId$field:uint;
      
      private var newOfflineReward$field:Boolean;
      
      private var regTime$field:uint;
      
      private var serverOpenTime$field:uint;
      
      private var regRoleSystemOpenTime$field:uint;
      
      public var unLockSpecialPlant:Array;
      
      private var fosterTicket$field:uint;
      
      private var isEquipAttachEnabled$field:Boolean;
      
      private var isPlayZoneTask$field:Boolean;
      
      private var forbidCardAwaken$field:Boolean;
      
      private var lucky$field:uint;
      
      private var contribVal$field:uint;
      
      private var light$field:uint;
      
      private var lastPayTime$field:uint;
      
      private var puppetSkillVal$field:uint;
      
      private var puppetEnergy$field:uint;
      
      private var buyPuppetEnergyNum$field:uint;
      
      private var hasField$1:uint = 0;
      
      private var buyPuppetSkillValNum$field:uint;
      
      private var prestige$field:uint;
      
      public function Cmd_Init_SC()
      {
         this.unlockPlantList = [];
         this.serverConfig = [];
         this.unLockSpecialPlant = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Init_SC.$MessageID;
      }
      
      public function clearName() : void
      {
         this.name$field = null;
      }
      
      public function get hasName() : Boolean
      {
         return this.name$field != null;
      }
      
      public function set name(param1:String) : void
      {
         this.name$field = param1;
      }
      
      public function get name() : String
      {
         return this.name$field;
      }
      
      public function clearExp() : void
      {
         this.hasField$0 &= 4294967294;
         this.exp$field = new uint();
      }
      
      public function get hasExp() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set exp(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.exp$field = param1;
      }
      
      public function get exp() : uint
      {
         return this.exp$field;
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
      
      public function clearSun() : void
      {
         this.hasField$0 &= 4294967291;
         this.sun$field = new uint();
      }
      
      public function get hasSun() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set sun(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.sun$field = param1;
      }
      
      public function get sun() : uint
      {
         return this.sun$field;
      }
      
      public function clearCoin() : void
      {
         this.hasField$0 &= 4294967287;
         this.coin$field = new uint();
      }
      
      public function get hasCoin() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set coin(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.coin$field = param1;
      }
      
      public function get coin() : uint
      {
         return this.coin$field;
      }
      
      public function clearLatestTDLevel() : void
      {
         this.latestTDLevel$field = null;
      }
      
      public function get hasLatestTDLevel() : Boolean
      {
         return this.latestTDLevel$field != null;
      }
      
      public function set latestTDLevel(param1:Dto_TDLevelInfo) : void
      {
         this.latestTDLevel$field = param1;
      }
      
      public function get latestTDLevel() : Dto_TDLevelInfo
      {
         return this.latestTDLevel$field;
      }
      
      public function clearNow() : void
      {
         this.hasField$0 &= 4294967279;
         this.now$field = new uint();
      }
      
      public function get hasNow() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set now(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.now$field = param1;
      }
      
      public function get now() : uint
      {
         return this.now$field;
      }
      
      public function clearRoleID() : void
      {
         this.roleID$field = null;
      }
      
      public function get hasRoleID() : Boolean
      {
         return this.roleID$field != null;
      }
      
      public function set roleID(param1:Int64) : void
      {
         this.roleID$field = param1;
      }
      
      public function get roleID() : Int64
      {
         return this.roleID$field;
      }
      
      public function clearEnergy() : void
      {
         this.hasField$0 &= 4294967263;
         this.energy$field = new uint();
      }
      
      public function get hasEnergy() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set energy(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.energy$field = param1;
      }
      
      public function get energy() : uint
      {
         return this.energy$field;
      }
      
      public function clearFriendPoint() : void
      {
         this.hasField$0 &= 4294967231;
         this.friendPoint$field = new uint();
      }
      
      public function get hasFriendPoint() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set friendPoint(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.friendPoint$field = param1;
      }
      
      public function get friendPoint() : uint
      {
         return this.friendPoint$field;
      }
      
      public function clearFaceAvatar() : void
      {
         this.faceAvatar$field = null;
      }
      
      public function get hasFaceAvatar() : Boolean
      {
         return this.faceAvatar$field != null;
      }
      
      public function set faceAvatar(param1:Dto_PlantInfo) : void
      {
         this.faceAvatar$field = param1;
      }
      
      public function get faceAvatar() : Dto_PlantInfo
      {
         return this.faceAvatar$field;
      }
      
      public function clearFaceId() : void
      {
         this.hasField$0 &= 4294967167;
         this.faceId$field = new uint();
      }
      
      public function get hasFaceId() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set faceId(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.faceId$field = param1;
      }
      
      public function get faceId() : uint
      {
         return this.faceId$field;
      }
      
      public function clearTicket() : void
      {
         this.hasField$0 &= 4294967039;
         this.ticket$field = new uint();
      }
      
      public function get hasTicket() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set ticket(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.ticket$field = param1;
      }
      
      public function get ticket() : uint
      {
         return this.ticket$field;
      }
      
      public function clearFame() : void
      {
         this.hasField$0 &= 4294966783;
         this.fame$field = new uint();
      }
      
      public function get hasFame() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set fame(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.fame$field = param1;
      }
      
      public function get fame() : uint
      {
         return this.fame$field;
      }
      
      public function clearBuyEnergyNum() : void
      {
         this.hasField$0 &= 4294966271;
         this.buyEnergyNum$field = new uint();
      }
      
      public function get hasBuyEnergyNum() : Boolean
      {
         return (this.hasField$0 & 1024) != 0;
      }
      
      public function set buyEnergyNum(param1:uint) : void
      {
         this.hasField$0 |= 1024;
         this.buyEnergyNum$field = param1;
      }
      
      public function get buyEnergyNum() : uint
      {
         return this.buyEnergyNum$field;
      }
      
      public function clearHasNewFormationPos() : void
      {
         this.hasField$0 &= 4294965247;
         this.hasNewFormationPos$field = new Boolean();
      }
      
      public function get hasHasNewFormationPos() : Boolean
      {
         return (this.hasField$0 & 2048) != 0;
      }
      
      public function set hasNewFormationPos(param1:Boolean) : void
      {
         this.hasField$0 |= 2048;
         this.hasNewFormationPos$field = param1;
      }
      
      public function get hasNewFormationPos() : Boolean
      {
         return this.hasNewFormationPos$field;
      }
      
      public function clearTownDurability() : void
      {
         this.hasField$0 &= 4294963199;
         this.townDurability$field = new uint();
      }
      
      public function get hasTownDurability() : Boolean
      {
         return (this.hasField$0 & 4096) != 0;
      }
      
      public function set townDurability(param1:uint) : void
      {
         this.hasField$0 |= 4096;
         this.townDurability$field = param1;
      }
      
      public function get townDurability() : uint
      {
         return this.townDurability$field;
      }
      
      public function clearTownDurabilityMax() : void
      {
         this.hasField$0 &= 4294959103;
         this.townDurabilityMax$field = new uint();
      }
      
      public function get hasTownDurabilityMax() : Boolean
      {
         return (this.hasField$0 & 8192) != 0;
      }
      
      public function set townDurabilityMax(param1:uint) : void
      {
         this.hasField$0 |= 8192;
         this.townDurabilityMax$field = param1;
      }
      
      public function get townDurabilityMax() : uint
      {
         return this.townDurabilityMax$field;
      }
      
      public function clearPresentTicket() : void
      {
         this.hasField$0 &= 4294950911;
         this.presentTicket$field = new uint();
      }
      
      public function get hasPresentTicket() : Boolean
      {
         return (this.hasField$0 & 16384) != 0;
      }
      
      public function set presentTicket(param1:uint) : void
      {
         this.hasField$0 |= 16384;
         this.presentTicket$field = param1;
      }
      
      public function get presentTicket() : uint
      {
         return this.presentTicket$field;
      }
      
      public function clearQqFaceURL() : void
      {
         this.qqFaceURL$field = null;
      }
      
      public function get hasQqFaceURL() : Boolean
      {
         return this.qqFaceURL$field != null;
      }
      
      public function set qqFaceURL(param1:String) : void
      {
         this.qqFaceURL$field = param1;
      }
      
      public function get qqFaceURL() : String
      {
         return this.qqFaceURL$field;
      }
      
      public function clearZoneId() : void
      {
         this.hasField$0 &= 4294934527;
         this.zoneId$field = new uint();
      }
      
      public function get hasZoneId() : Boolean
      {
         return (this.hasField$0 & 32768) != 0;
      }
      
      public function set zoneId(param1:uint) : void
      {
         this.hasField$0 |= 32768;
         this.zoneId$field = param1;
      }
      
      public function get zoneId() : uint
      {
         return this.zoneId$field;
      }
      
      public function clearIsMiniClient() : void
      {
         this.hasField$0 &= 4294901759;
         this.isMiniClient$field = new Boolean();
      }
      
      public function get hasIsMiniClient() : Boolean
      {
         return (this.hasField$0 & 65536) != 0;
      }
      
      public function set isMiniClient(param1:Boolean) : void
      {
         this.hasField$0 |= 65536;
         this.isMiniClient$field = param1;
      }
      
      public function get isMiniClient() : Boolean
      {
         return this.isMiniClient$field;
      }
      
      public function clearSeqId() : void
      {
         this.hasField$0 &= 4294836223;
         this.seqId$field = new uint();
      }
      
      public function get hasSeqId() : Boolean
      {
         return (this.hasField$0 & 131072) != 0;
      }
      
      public function set seqId(param1:uint) : void
      {
         this.hasField$0 |= 131072;
         this.seqId$field = param1;
      }
      
      public function get seqId() : uint
      {
         return this.seqId$field;
      }
      
      public function clearNewOfflineReward() : void
      {
         this.hasField$0 &= 4294705151;
         this.newOfflineReward$field = new Boolean();
      }
      
      public function get hasNewOfflineReward() : Boolean
      {
         return (this.hasField$0 & 262144) != 0;
      }
      
      public function set newOfflineReward(param1:Boolean) : void
      {
         this.hasField$0 |= 262144;
         this.newOfflineReward$field = param1;
      }
      
      public function get newOfflineReward() : Boolean
      {
         return this.newOfflineReward$field;
      }
      
      public function clearRegTime() : void
      {
         this.hasField$0 &= 4294443007;
         this.regTime$field = new uint();
      }
      
      public function get hasRegTime() : Boolean
      {
         return (this.hasField$0 & 524288) != 0;
      }
      
      public function set regTime(param1:uint) : void
      {
         this.hasField$0 |= 524288;
         this.regTime$field = param1;
      }
      
      public function get regTime() : uint
      {
         return this.regTime$field;
      }
      
      public function clearServerOpenTime() : void
      {
         this.hasField$0 &= 4293918719;
         this.serverOpenTime$field = new uint();
      }
      
      public function get hasServerOpenTime() : Boolean
      {
         return (this.hasField$0 & 1048576) != 0;
      }
      
      public function set serverOpenTime(param1:uint) : void
      {
         this.hasField$0 |= 1048576;
         this.serverOpenTime$field = param1;
      }
      
      public function get serverOpenTime() : uint
      {
         return this.serverOpenTime$field;
      }
      
      public function clearRegRoleSystemOpenTime() : void
      {
         this.hasField$0 &= 4292870143;
         this.regRoleSystemOpenTime$field = new uint();
      }
      
      public function get hasRegRoleSystemOpenTime() : Boolean
      {
         return (this.hasField$0 & 2097152) != 0;
      }
      
      public function set regRoleSystemOpenTime(param1:uint) : void
      {
         this.hasField$0 |= 2097152;
         this.regRoleSystemOpenTime$field = param1;
      }
      
      public function get regRoleSystemOpenTime() : uint
      {
         return this.regRoleSystemOpenTime$field;
      }
      
      public function clearFosterTicket() : void
      {
         this.hasField$0 &= 4290772991;
         this.fosterTicket$field = new uint();
      }
      
      public function get hasFosterTicket() : Boolean
      {
         return (this.hasField$0 & 4194304) != 0;
      }
      
      public function set fosterTicket(param1:uint) : void
      {
         this.hasField$0 |= 4194304;
         this.fosterTicket$field = param1;
      }
      
      public function get fosterTicket() : uint
      {
         return this.fosterTicket$field;
      }
      
      public function clearIsEquipAttachEnabled() : void
      {
         this.hasField$0 &= 4286578687;
         this.isEquipAttachEnabled$field = new Boolean();
      }
      
      public function get hasIsEquipAttachEnabled() : Boolean
      {
         return (this.hasField$0 & 8388608) != 0;
      }
      
      public function set isEquipAttachEnabled(param1:Boolean) : void
      {
         this.hasField$0 |= 8388608;
         this.isEquipAttachEnabled$field = param1;
      }
      
      public function get isEquipAttachEnabled() : Boolean
      {
         return this.isEquipAttachEnabled$field;
      }
      
      public function clearIsPlayZoneTask() : void
      {
         this.hasField$0 &= 4278190079;
         this.isPlayZoneTask$field = new Boolean();
      }
      
      public function get hasIsPlayZoneTask() : Boolean
      {
         return (this.hasField$0 & 16777216) != 0;
      }
      
      public function set isPlayZoneTask(param1:Boolean) : void
      {
         this.hasField$0 |= 16777216;
         this.isPlayZoneTask$field = param1;
      }
      
      public function get isPlayZoneTask() : Boolean
      {
         return this.isPlayZoneTask$field;
      }
      
      public function clearForbidCardAwaken() : void
      {
         this.hasField$0 &= 4261412863;
         this.forbidCardAwaken$field = new Boolean();
      }
      
      public function get hasForbidCardAwaken() : Boolean
      {
         return (this.hasField$0 & 33554432) != 0;
      }
      
      public function set forbidCardAwaken(param1:Boolean) : void
      {
         this.hasField$0 |= 33554432;
         this.forbidCardAwaken$field = param1;
      }
      
      public function get forbidCardAwaken() : Boolean
      {
         return this.forbidCardAwaken$field;
      }
      
      public function clearLucky() : void
      {
         this.hasField$0 &= 4227858431;
         this.lucky$field = new uint();
      }
      
      public function get hasLucky() : Boolean
      {
         return (this.hasField$0 & 67108864) != 0;
      }
      
      public function set lucky(param1:uint) : void
      {
         this.hasField$0 |= 67108864;
         this.lucky$field = param1;
      }
      
      public function get lucky() : uint
      {
         return this.lucky$field;
      }
      
      public function clearContribVal() : void
      {
         this.hasField$0 &= 4160749567;
         this.contribVal$field = new uint();
      }
      
      public function get hasContribVal() : Boolean
      {
         return (this.hasField$0 & 134217728) != 0;
      }
      
      public function set contribVal(param1:uint) : void
      {
         this.hasField$0 |= 134217728;
         this.contribVal$field = param1;
      }
      
      public function get contribVal() : uint
      {
         return this.contribVal$field;
      }
      
      public function clearLight() : void
      {
         this.hasField$0 &= 4026531839;
         this.light$field = new uint();
      }
      
      public function get hasLight() : Boolean
      {
         return (this.hasField$0 & 268435456) != 0;
      }
      
      public function set light(param1:uint) : void
      {
         this.hasField$0 |= 268435456;
         this.light$field = param1;
      }
      
      public function get light() : uint
      {
         return this.light$field;
      }
      
      public function clearLastPayTime() : void
      {
         this.hasField$0 &= 3758096383;
         this.lastPayTime$field = new uint();
      }
      
      public function get hasLastPayTime() : Boolean
      {
         return (this.hasField$0 & 536870912) != 0;
      }
      
      public function set lastPayTime(param1:uint) : void
      {
         this.hasField$0 |= 536870912;
         this.lastPayTime$field = param1;
      }
      
      public function get lastPayTime() : uint
      {
         return this.lastPayTime$field;
      }
      
      public function clearPuppetSkillVal() : void
      {
         this.hasField$0 &= 3221225471;
         this.puppetSkillVal$field = new uint();
      }
      
      public function get hasPuppetSkillVal() : Boolean
      {
         return (this.hasField$0 & 1073741824) != 0;
      }
      
      public function set puppetSkillVal(param1:uint) : void
      {
         this.hasField$0 |= 1073741824;
         this.puppetSkillVal$field = param1;
      }
      
      public function get puppetSkillVal() : uint
      {
         return this.puppetSkillVal$field;
      }
      
      public function clearPuppetEnergy() : void
      {
         this.hasField$0 &= 2147483647;
         this.puppetEnergy$field = new uint();
      }
      
      public function get hasPuppetEnergy() : Boolean
      {
         return (this.hasField$0 & 2147483648) != 0;
      }
      
      public function set puppetEnergy(param1:uint) : void
      {
         this.hasField$0 |= 2147483648;
         this.puppetEnergy$field = param1;
      }
      
      public function get puppetEnergy() : uint
      {
         return this.puppetEnergy$field;
      }
      
      public function clearBuyPuppetEnergyNum() : void
      {
         this.hasField$1 &= 4294967294;
         this.buyPuppetEnergyNum$field = new uint();
      }
      
      public function get hasBuyPuppetEnergyNum() : Boolean
      {
         return (this.hasField$1 & 1) != 0;
      }
      
      public function set buyPuppetEnergyNum(param1:uint) : void
      {
         this.hasField$1 |= 1;
         this.buyPuppetEnergyNum$field = param1;
      }
      
      public function get buyPuppetEnergyNum() : uint
      {
         return this.buyPuppetEnergyNum$field;
      }
      
      public function clearBuyPuppetSkillValNum() : void
      {
         this.hasField$1 &= 4294967293;
         this.buyPuppetSkillValNum$field = new uint();
      }
      
      public function get hasBuyPuppetSkillValNum() : Boolean
      {
         return (this.hasField$1 & 2) != 0;
      }
      
      public function set buyPuppetSkillValNum(param1:uint) : void
      {
         this.hasField$1 |= 2;
         this.buyPuppetSkillValNum$field = param1;
      }
      
      public function get buyPuppetSkillValNum() : uint
      {
         return this.buyPuppetSkillValNum$field;
      }
      
      public function clearPrestige() : void
      {
         this.hasField$1 &= 4294967291;
         this.prestige$field = new uint();
      }
      
      public function get hasPrestige() : Boolean
      {
         return (this.hasField$1 & 4) != 0;
      }
      
      public function set prestige(param1:uint) : void
      {
         this.hasField$1 |= 4;
         this.prestige$field = param1;
      }
      
      public function get prestige() : uint
      {
         return this.prestige$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = undefined;
         if(this.hasName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_STRING(param1,this.name$field);
         }
         if(this.hasExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.exp$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasSun)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.sun$field);
         }
         if(this.hasCoin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.coin$field);
         }
         if(this.hasLatestTDLevel)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.latestTDLevel$field);
         }
         if(this.hasNow)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.now$field);
         }
         if(this.hasRoleID)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_INT64(param1,this.roleID$field);
         }
         if(this.hasEnergy)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.energy$field);
         }
         if(this.hasFriendPoint)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.friendPoint$field);
         }
         if(this.hasFaceAvatar)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,12);
            WriteUtils.write$TYPE_MESSAGE(param1,this.faceAvatar$field);
         }
         if(this.hasFaceId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,13);
            WriteUtils.write$TYPE_UINT32(param1,this.faceId$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.unlockPlantList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,14);
            WriteUtils.write$TYPE_MESSAGE(param1,this.unlockPlantList[_loc2_]);
            _loc2_++;
         }
         if(this.hasTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,15);
            WriteUtils.write$TYPE_UINT32(param1,this.ticket$field);
         }
         if(this.hasFame)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,16);
            WriteUtils.write$TYPE_UINT32(param1,this.fame$field);
         }
         if(this.hasBuyEnergyNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,17);
            WriteUtils.write$TYPE_UINT32(param1,this.buyEnergyNum$field);
         }
         if(this.hasHasNewFormationPos)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,18);
            WriteUtils.write$TYPE_BOOL(param1,this.hasNewFormationPos$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.serverConfig.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,19);
            WriteUtils.write$TYPE_MESSAGE(param1,this.serverConfig[_loc3_]);
            _loc3_++;
         }
         if(this.hasTownDurability)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,20);
            WriteUtils.write$TYPE_UINT32(param1,this.townDurability$field);
         }
         if(this.hasTownDurabilityMax)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,21);
            WriteUtils.write$TYPE_UINT32(param1,this.townDurabilityMax$field);
         }
         if(this.hasPresentTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,22);
            WriteUtils.write$TYPE_UINT32(param1,this.presentTicket$field);
         }
         if(this.hasQqFaceURL)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,23);
            WriteUtils.write$TYPE_STRING(param1,this.qqFaceURL$field);
         }
         if(this.hasZoneId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,24);
            WriteUtils.write$TYPE_UINT32(param1,this.zoneId$field);
         }
         if(this.hasIsMiniClient)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,25);
            WriteUtils.write$TYPE_BOOL(param1,this.isMiniClient$field);
         }
         if(this.hasSeqId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,26);
            WriteUtils.write$TYPE_UINT32(param1,this.seqId$field);
         }
         if(this.hasNewOfflineReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,27);
            WriteUtils.write$TYPE_BOOL(param1,this.newOfflineReward$field);
         }
         if(this.hasRegTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,28);
            WriteUtils.write$TYPE_UINT32(param1,this.regTime$field);
         }
         if(this.hasServerOpenTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,29);
            WriteUtils.write$TYPE_UINT32(param1,this.serverOpenTime$field);
         }
         if(this.hasRegRoleSystemOpenTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,30);
            WriteUtils.write$TYPE_UINT32(param1,this.regRoleSystemOpenTime$field);
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.unLockSpecialPlant.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,31);
            WriteUtils.write$TYPE_MESSAGE(param1,this.unLockSpecialPlant[_loc4_]);
            _loc4_++;
         }
         if(this.hasFosterTicket)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,32);
            WriteUtils.write$TYPE_UINT32(param1,this.fosterTicket$field);
         }
         if(this.hasIsEquipAttachEnabled)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,33);
            WriteUtils.write$TYPE_BOOL(param1,this.isEquipAttachEnabled$field);
         }
         if(this.hasIsPlayZoneTask)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,34);
            WriteUtils.write$TYPE_BOOL(param1,this.isPlayZoneTask$field);
         }
         if(this.hasForbidCardAwaken)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,35);
            WriteUtils.write$TYPE_BOOL(param1,this.forbidCardAwaken$field);
         }
         if(this.hasLucky)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,36);
            WriteUtils.write$TYPE_UINT32(param1,this.lucky$field);
         }
         if(this.hasContribVal)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,37);
            WriteUtils.write$TYPE_UINT32(param1,this.contribVal$field);
         }
         if(this.hasLight)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,38);
            WriteUtils.write$TYPE_UINT32(param1,this.light$field);
         }
         if(this.hasLastPayTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,39);
            WriteUtils.write$TYPE_UINT32(param1,this.lastPayTime$field);
         }
         if(this.hasPuppetSkillVal)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,40);
            WriteUtils.write$TYPE_UINT32(param1,this.puppetSkillVal$field);
         }
         if(this.hasPuppetEnergy)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,41);
            WriteUtils.write$TYPE_UINT32(param1,this.puppetEnergy$field);
         }
         if(this.hasBuyPuppetEnergyNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,42);
            WriteUtils.write$TYPE_UINT32(param1,this.buyPuppetEnergyNum$field);
         }
         if(this.hasBuyPuppetSkillValNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,43);
            WriteUtils.write$TYPE_UINT32(param1,this.buyPuppetSkillValNum$field);
         }
         if(this.hasPrestige)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,44);
            WriteUtils.write$TYPE_UINT32(param1,this.prestige$field);
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc43_:uint = 0;
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
         var _loc23_:uint = 0;
         var _loc24_:uint = 0;
         var _loc25_:uint = 0;
         var _loc26_:uint = 0;
         var _loc27_:uint = 0;
         var _loc28_:uint = 0;
         var _loc29_:uint = 0;
         var _loc30_:uint = 0;
         var _loc31_:uint = 0;
         var _loc32_:uint = 0;
         var _loc33_:uint = 0;
         var _loc34_:uint = 0;
         var _loc35_:uint = 0;
         var _loc36_:uint = 0;
         var _loc37_:uint = 0;
         var _loc38_:uint = 0;
         var _loc39_:uint = 0;
         var _loc40_:uint = 0;
         var _loc41_:uint = 0;
         var _loc42_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc43_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc43_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.name cannot be set twice.");
                  }
                  _loc3_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.exp cannot be set twice.");
                  }
                  _loc4_++;
                  this.exp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.level cannot be set twice.");
                  }
                  _loc5_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.sun cannot be set twice.");
                  }
                  _loc6_++;
                  this.sun = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.coin cannot be set twice.");
                  }
                  _loc7_++;
                  this.coin = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.latestTDLevel cannot be set twice.");
                  }
                  _loc8_++;
                  this.latestTDLevel = new Dto_TDLevelInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.latestTDLevel);
                  break;
               case 8:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.now cannot be set twice.");
                  }
                  _loc9_++;
                  this.now = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 9:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.roleID cannot be set twice.");
                  }
                  _loc10_++;
                  this.roleID = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 10:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.energy cannot be set twice.");
                  }
                  _loc11_++;
                  this.energy = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.friendPoint cannot be set twice.");
                  }
                  _loc12_++;
                  this.friendPoint = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.faceAvatar cannot be set twice.");
                  }
                  _loc13_++;
                  this.faceAvatar = new Dto_PlantInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.faceAvatar);
                  break;
               case 13:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.faceId cannot be set twice.");
                  }
                  _loc14_++;
                  this.faceId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 14:
                  this.unlockPlantList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_PlantInfo()));
                  break;
               case 15:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.ticket cannot be set twice.");
                  }
                  _loc15_++;
                  this.ticket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 16:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.fame cannot be set twice.");
                  }
                  _loc16_++;
                  this.fame = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 17:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.buyEnergyNum cannot be set twice.");
                  }
                  _loc17_++;
                  this.buyEnergyNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 18:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.hasNewFormationPos cannot be set twice.");
                  }
                  _loc18_++;
                  this.hasNewFormationPos = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 19:
                  this.serverConfig.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ServerConfig()));
                  break;
               case 20:
                  if(_loc19_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.townDurability cannot be set twice.");
                  }
                  _loc19_++;
                  this.townDurability = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 21:
                  if(_loc20_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.townDurabilityMax cannot be set twice.");
                  }
                  _loc20_++;
                  this.townDurabilityMax = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 22:
                  if(_loc21_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.presentTicket cannot be set twice.");
                  }
                  _loc21_++;
                  this.presentTicket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 23:
                  if(_loc22_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.qqFaceURL cannot be set twice.");
                  }
                  _loc22_++;
                  this.qqFaceURL = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 24:
                  if(_loc23_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.zoneId cannot be set twice.");
                  }
                  _loc23_++;
                  this.zoneId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 25:
                  if(_loc24_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.isMiniClient cannot be set twice.");
                  }
                  _loc24_++;
                  this.isMiniClient = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 26:
                  if(_loc25_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.seqId cannot be set twice.");
                  }
                  _loc25_++;
                  this.seqId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 27:
                  if(_loc26_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.newOfflineReward cannot be set twice.");
                  }
                  _loc26_++;
                  this.newOfflineReward = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 28:
                  if(_loc27_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.regTime cannot be set twice.");
                  }
                  _loc27_++;
                  this.regTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 29:
                  if(_loc28_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.serverOpenTime cannot be set twice.");
                  }
                  _loc28_++;
                  this.serverOpenTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 30:
                  if(_loc29_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.regRoleSystemOpenTime cannot be set twice.");
                  }
                  _loc29_++;
                  this.regRoleSystemOpenTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 31:
                  this.unLockSpecialPlant.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_PlantInfo()));
                  break;
               case 32:
                  if(_loc30_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.fosterTicket cannot be set twice.");
                  }
                  _loc30_++;
                  this.fosterTicket = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 33:
                  if(_loc31_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.isEquipAttachEnabled cannot be set twice.");
                  }
                  _loc31_++;
                  this.isEquipAttachEnabled = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 34:
                  if(_loc32_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.isPlayZoneTask cannot be set twice.");
                  }
                  _loc32_++;
                  this.isPlayZoneTask = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 35:
                  if(_loc33_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.forbidCardAwaken cannot be set twice.");
                  }
                  _loc33_++;
                  this.forbidCardAwaken = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 36:
                  if(_loc34_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.lucky cannot be set twice.");
                  }
                  _loc34_++;
                  this.lucky = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 37:
                  if(_loc35_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.contribVal cannot be set twice.");
                  }
                  _loc35_++;
                  this.contribVal = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 38:
                  if(_loc36_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.light cannot be set twice.");
                  }
                  _loc36_++;
                  this.light = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 39:
                  if(_loc37_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.lastPayTime cannot be set twice.");
                  }
                  _loc37_++;
                  this.lastPayTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 40:
                  if(_loc38_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.puppetSkillVal cannot be set twice.");
                  }
                  _loc38_++;
                  this.puppetSkillVal = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 41:
                  if(_loc39_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.puppetEnergy cannot be set twice.");
                  }
                  _loc39_++;
                  this.puppetEnergy = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 42:
                  if(_loc40_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.buyPuppetEnergyNum cannot be set twice.");
                  }
                  _loc40_++;
                  this.buyPuppetEnergyNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 43:
                  if(_loc41_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.buyPuppetSkillValNum cannot be set twice.");
                  }
                  _loc41_++;
                  this.buyPuppetSkillValNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 44:
                  if(_loc42_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Init_SC.prestige cannot be set twice.");
                  }
                  _loc42_++;
                  this.prestige = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc43_);
                  break;
            }
         }
      }
   }
}
