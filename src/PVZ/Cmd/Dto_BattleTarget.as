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
   
   public final class Dto_BattleTarget extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_BattleTarget";
      
      public static const TYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_BattleTarget.type","type",1 << 3 | WireType.VARINT);
      
      public static const FUBENCHAPTERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_BattleTarget.fubenChapterId","fubenChapterId",2 << 3 | WireType.VARINT);
      
      public static const FUBENMODEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_BattleTarget.fubenModeId","fubenModeId",3 << 3 | WireType.VARINT);
      
      public static const FUBENSTAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_BattleTarget.fubenStageId","fubenStageId",4 << 3 | WireType.VARINT);
      
      public static const FRIENDZONEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_BattleTarget.friendZoneId","friendZoneId",5 << 3 | WireType.VARINT);
      
      public static const FRIENDROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_BattleTarget.friendRoleId","friendRoleId",6 << 3 | WireType.VARINT);
      
      public static const SCREWUPSTAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_BattleTarget.screwUpStageId","screwUpStageId",7 << 3 | WireType.VARINT);
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_BattleTarget.roleId","roleId",8 << 3 | WireType.VARINT);
      
      public static const GUILDFUBENCHAPTERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_BattleTarget.guildFubenChapterId","guildFubenChapterId",9 << 3 | WireType.VARINT);
      
      public static const GUILDFUBENSTAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_BattleTarget.guildFubenStageId","guildFubenStageId",10 << 3 | WireType.VARINT);
      
      public static const BOSSID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_BattleTarget.bossId","bossId",11 << 3 | WireType.VARINT);
      
      public static const PLANTTESTSTAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_BattleTarget.plantTestStageId","plantTestStageId",12 << 3 | WireType.VARINT);
      
      public static const PLANTTESTSUBCHAPTERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_BattleTarget.plantTestSubChapterid","plantTestSubChapterid",13 << 3 | WireType.VARINT);
      
      public static const GUARDMEMBERINDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_BattleTarget.guardMemberIndex","guardMemberIndex",14 << 3 | WireType.VARINT);
      
      public static const GENETESTSTAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_BattleTarget.geneTestStageId","geneTestStageId",15 << 3 | WireType.VARINT);
      
      public static const GENETESTSUBCHAPTERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_BattleTarget.geneTestSubChapterid","geneTestSubChapterid",16 << 3 | WireType.VARINT);
      
      public static const GENETESTSTAGEMODE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_BattleTarget.geneTestStageMode","geneTestStageMode",17 << 3 | WireType.VARINT);
      
      public static const PUPPETFUBENCHAPTERID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_BattleTarget.puppetFubenChapterId","puppetFubenChapterId",18 << 3 | WireType.VARINT);
      
      public static const PUPPETFUBENMODEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_BattleTarget.puppetFubenModeId","puppetFubenModeId",19 << 3 | WireType.VARINT);
      
      public static const PUPPETFUBENSTAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_BattleTarget.puppetFubenStageId","puppetFubenStageId",20 << 3 | WireType.VARINT);
      
      public static const PUPPETFUBENSUBSTAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_BattleTarget.puppetFubenSubStageId","puppetFubenSubStageId",21 << 3 | WireType.VARINT);
      
      public static const NOENDFUBENMODEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_BattleTarget.noEndFubenModeId","noEndFubenModeId",22 << 3 | WireType.VARINT);
      
      public static const NOENDFUBENSTAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_BattleTarget.noEndFubenStageId","noEndFubenStageId",23 << 3 | WireType.VARINT);
       
      
      private var type$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var fubenChapterId$field:uint;
      
      private var fubenModeId$field:uint;
      
      private var fubenStageId$field:uint;
      
      private var friendZoneId$field:uint;
      
      private var friendRoleId$field:Int64;
      
      private var screwUpStageId$field:uint;
      
      private var roleId$field:Int64;
      
      private var guildFubenChapterId$field:uint;
      
      private var guildFubenStageId$field:uint;
      
      private var bossId$field:uint;
      
      private var plantTestStageId$field:uint;
      
      private var plantTestSubChapterid$field:uint;
      
      private var guardMemberIndex$field:uint;
      
      private var geneTestStageId$field:uint;
      
      private var geneTestSubChapterid$field:uint;
      
      private var geneTestStageMode$field:uint;
      
      private var puppetFubenChapterId$field:uint;
      
      private var puppetFubenModeId$field:uint;
      
      private var puppetFubenStageId$field:uint;
      
      private var puppetFubenSubStageId$field:uint;
      
      private var noEndFubenModeId$field:uint;
      
      private var noEndFubenStageId$field:uint;
      
      public function Dto_BattleTarget()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_BattleTarget.$MessageID;
      }
      
      public function clearType() : void
      {
         this.hasField$0 &= 4294967294;
         this.type$field = new uint();
      }
      
      public function get hasType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set type(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.type$field = param1;
      }
      
      public function get type() : uint
      {
         return this.type$field;
      }
      
      public function clearFubenChapterId() : void
      {
         this.hasField$0 &= 4294967293;
         this.fubenChapterId$field = new uint();
      }
      
      public function get hasFubenChapterId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set fubenChapterId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.fubenChapterId$field = param1;
      }
      
      public function get fubenChapterId() : uint
      {
         return this.fubenChapterId$field;
      }
      
      public function clearFubenModeId() : void
      {
         this.hasField$0 &= 4294967291;
         this.fubenModeId$field = new uint();
      }
      
      public function get hasFubenModeId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set fubenModeId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.fubenModeId$field = param1;
      }
      
      public function get fubenModeId() : uint
      {
         return this.fubenModeId$field;
      }
      
      public function clearFubenStageId() : void
      {
         this.hasField$0 &= 4294967287;
         this.fubenStageId$field = new uint();
      }
      
      public function get hasFubenStageId() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set fubenStageId(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.fubenStageId$field = param1;
      }
      
      public function get fubenStageId() : uint
      {
         return this.fubenStageId$field;
      }
      
      public function clearFriendZoneId() : void
      {
         this.hasField$0 &= 4294967279;
         this.friendZoneId$field = new uint();
      }
      
      public function get hasFriendZoneId() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set friendZoneId(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.friendZoneId$field = param1;
      }
      
      public function get friendZoneId() : uint
      {
         return this.friendZoneId$field;
      }
      
      public function clearFriendRoleId() : void
      {
         this.friendRoleId$field = null;
      }
      
      public function get hasFriendRoleId() : Boolean
      {
         return this.friendRoleId$field != null;
      }
      
      public function set friendRoleId(param1:Int64) : void
      {
         this.friendRoleId$field = param1;
      }
      
      public function get friendRoleId() : Int64
      {
         return this.friendRoleId$field;
      }
      
      public function clearScrewUpStageId() : void
      {
         this.hasField$0 &= 4294967263;
         this.screwUpStageId$field = new uint();
      }
      
      public function get hasScrewUpStageId() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set screwUpStageId(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.screwUpStageId$field = param1;
      }
      
      public function get screwUpStageId() : uint
      {
         return this.screwUpStageId$field;
      }
      
      public function clearRoleId() : void
      {
         this.roleId$field = null;
      }
      
      public function get hasRoleId() : Boolean
      {
         return this.roleId$field != null;
      }
      
      public function set roleId(param1:Int64) : void
      {
         this.roleId$field = param1;
      }
      
      public function get roleId() : Int64
      {
         return this.roleId$field;
      }
      
      public function clearGuildFubenChapterId() : void
      {
         this.hasField$0 &= 4294967231;
         this.guildFubenChapterId$field = new uint();
      }
      
      public function get hasGuildFubenChapterId() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set guildFubenChapterId(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.guildFubenChapterId$field = param1;
      }
      
      public function get guildFubenChapterId() : uint
      {
         return this.guildFubenChapterId$field;
      }
      
      public function clearGuildFubenStageId() : void
      {
         this.hasField$0 &= 4294967167;
         this.guildFubenStageId$field = new uint();
      }
      
      public function get hasGuildFubenStageId() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set guildFubenStageId(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.guildFubenStageId$field = param1;
      }
      
      public function get guildFubenStageId() : uint
      {
         return this.guildFubenStageId$field;
      }
      
      public function clearBossId() : void
      {
         this.hasField$0 &= 4294967039;
         this.bossId$field = new uint();
      }
      
      public function get hasBossId() : Boolean
      {
         return (this.hasField$0 & 256) != 0;
      }
      
      public function set bossId(param1:uint) : void
      {
         this.hasField$0 |= 256;
         this.bossId$field = param1;
      }
      
      public function get bossId() : uint
      {
         return this.bossId$field;
      }
      
      public function clearPlantTestStageId() : void
      {
         this.hasField$0 &= 4294966783;
         this.plantTestStageId$field = new uint();
      }
      
      public function get hasPlantTestStageId() : Boolean
      {
         return (this.hasField$0 & 512) != 0;
      }
      
      public function set plantTestStageId(param1:uint) : void
      {
         this.hasField$0 |= 512;
         this.plantTestStageId$field = param1;
      }
      
      public function get plantTestStageId() : uint
      {
         return this.plantTestStageId$field;
      }
      
      public function clearPlantTestSubChapterid() : void
      {
         this.hasField$0 &= 4294966271;
         this.plantTestSubChapterid$field = new uint();
      }
      
      public function get hasPlantTestSubChapterid() : Boolean
      {
         return (this.hasField$0 & 1024) != 0;
      }
      
      public function set plantTestSubChapterid(param1:uint) : void
      {
         this.hasField$0 |= 1024;
         this.plantTestSubChapterid$field = param1;
      }
      
      public function get plantTestSubChapterid() : uint
      {
         return this.plantTestSubChapterid$field;
      }
      
      public function clearGuardMemberIndex() : void
      {
         this.hasField$0 &= 4294965247;
         this.guardMemberIndex$field = new uint();
      }
      
      public function get hasGuardMemberIndex() : Boolean
      {
         return (this.hasField$0 & 2048) != 0;
      }
      
      public function set guardMemberIndex(param1:uint) : void
      {
         this.hasField$0 |= 2048;
         this.guardMemberIndex$field = param1;
      }
      
      public function get guardMemberIndex() : uint
      {
         return this.guardMemberIndex$field;
      }
      
      public function clearGeneTestStageId() : void
      {
         this.hasField$0 &= 4294963199;
         this.geneTestStageId$field = new uint();
      }
      
      public function get hasGeneTestStageId() : Boolean
      {
         return (this.hasField$0 & 4096) != 0;
      }
      
      public function set geneTestStageId(param1:uint) : void
      {
         this.hasField$0 |= 4096;
         this.geneTestStageId$field = param1;
      }
      
      public function get geneTestStageId() : uint
      {
         return this.geneTestStageId$field;
      }
      
      public function clearGeneTestSubChapterid() : void
      {
         this.hasField$0 &= 4294959103;
         this.geneTestSubChapterid$field = new uint();
      }
      
      public function get hasGeneTestSubChapterid() : Boolean
      {
         return (this.hasField$0 & 8192) != 0;
      }
      
      public function set geneTestSubChapterid(param1:uint) : void
      {
         this.hasField$0 |= 8192;
         this.geneTestSubChapterid$field = param1;
      }
      
      public function get geneTestSubChapterid() : uint
      {
         return this.geneTestSubChapterid$field;
      }
      
      public function clearGeneTestStageMode() : void
      {
         this.hasField$0 &= 4294950911;
         this.geneTestStageMode$field = new uint();
      }
      
      public function get hasGeneTestStageMode() : Boolean
      {
         return (this.hasField$0 & 16384) != 0;
      }
      
      public function set geneTestStageMode(param1:uint) : void
      {
         this.hasField$0 |= 16384;
         this.geneTestStageMode$field = param1;
      }
      
      public function get geneTestStageMode() : uint
      {
         return this.geneTestStageMode$field;
      }
      
      public function clearPuppetFubenChapterId() : void
      {
         this.hasField$0 &= 4294934527;
         this.puppetFubenChapterId$field = new uint();
      }
      
      public function get hasPuppetFubenChapterId() : Boolean
      {
         return (this.hasField$0 & 32768) != 0;
      }
      
      public function set puppetFubenChapterId(param1:uint) : void
      {
         this.hasField$0 |= 32768;
         this.puppetFubenChapterId$field = param1;
      }
      
      public function get puppetFubenChapterId() : uint
      {
         return this.puppetFubenChapterId$field;
      }
      
      public function clearPuppetFubenModeId() : void
      {
         this.hasField$0 &= 4294901759;
         this.puppetFubenModeId$field = new uint();
      }
      
      public function get hasPuppetFubenModeId() : Boolean
      {
         return (this.hasField$0 & 65536) != 0;
      }
      
      public function set puppetFubenModeId(param1:uint) : void
      {
         this.hasField$0 |= 65536;
         this.puppetFubenModeId$field = param1;
      }
      
      public function get puppetFubenModeId() : uint
      {
         return this.puppetFubenModeId$field;
      }
      
      public function clearPuppetFubenStageId() : void
      {
         this.hasField$0 &= 4294836223;
         this.puppetFubenStageId$field = new uint();
      }
      
      public function get hasPuppetFubenStageId() : Boolean
      {
         return (this.hasField$0 & 131072) != 0;
      }
      
      public function set puppetFubenStageId(param1:uint) : void
      {
         this.hasField$0 |= 131072;
         this.puppetFubenStageId$field = param1;
      }
      
      public function get puppetFubenStageId() : uint
      {
         return this.puppetFubenStageId$field;
      }
      
      public function clearPuppetFubenSubStageId() : void
      {
         this.hasField$0 &= 4294705151;
         this.puppetFubenSubStageId$field = new uint();
      }
      
      public function get hasPuppetFubenSubStageId() : Boolean
      {
         return (this.hasField$0 & 262144) != 0;
      }
      
      public function set puppetFubenSubStageId(param1:uint) : void
      {
         this.hasField$0 |= 262144;
         this.puppetFubenSubStageId$field = param1;
      }
      
      public function get puppetFubenSubStageId() : uint
      {
         return this.puppetFubenSubStageId$field;
      }
      
      public function clearNoEndFubenModeId() : void
      {
         this.hasField$0 &= 4294443007;
         this.noEndFubenModeId$field = new uint();
      }
      
      public function get hasNoEndFubenModeId() : Boolean
      {
         return (this.hasField$0 & 524288) != 0;
      }
      
      public function set noEndFubenModeId(param1:uint) : void
      {
         this.hasField$0 |= 524288;
         this.noEndFubenModeId$field = param1;
      }
      
      public function get noEndFubenModeId() : uint
      {
         return this.noEndFubenModeId$field;
      }
      
      public function clearNoEndFubenStageId() : void
      {
         this.hasField$0 &= 4293918719;
         this.noEndFubenStageId$field = new uint();
      }
      
      public function get hasNoEndFubenStageId() : Boolean
      {
         return (this.hasField$0 & 1048576) != 0;
      }
      
      public function set noEndFubenStageId(param1:uint) : void
      {
         this.hasField$0 |= 1048576;
         this.noEndFubenStageId$field = param1;
      }
      
      public function get noEndFubenStageId() : uint
      {
         return this.noEndFubenStageId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.type$field);
         }
         if(this.hasFubenChapterId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.fubenChapterId$field);
         }
         if(this.hasFubenModeId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.fubenModeId$field);
         }
         if(this.hasFubenStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.fubenStageId$field);
         }
         if(this.hasFriendZoneId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.friendZoneId$field);
         }
         if(this.hasFriendRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_INT64(param1,this.friendRoleId$field);
         }
         if(this.hasScrewUpStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.screwUpStageId$field);
         }
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasGuildFubenChapterId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,9);
            WriteUtils.write$TYPE_UINT32(param1,this.guildFubenChapterId$field);
         }
         if(this.hasGuildFubenStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,10);
            WriteUtils.write$TYPE_UINT32(param1,this.guildFubenStageId$field);
         }
         if(this.hasBossId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,11);
            WriteUtils.write$TYPE_UINT32(param1,this.bossId$field);
         }
         if(this.hasPlantTestStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,12);
            WriteUtils.write$TYPE_UINT32(param1,this.plantTestStageId$field);
         }
         if(this.hasPlantTestSubChapterid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,13);
            WriteUtils.write$TYPE_UINT32(param1,this.plantTestSubChapterid$field);
         }
         if(this.hasGuardMemberIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,14);
            WriteUtils.write$TYPE_UINT32(param1,this.guardMemberIndex$field);
         }
         if(this.hasGeneTestStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,15);
            WriteUtils.write$TYPE_UINT32(param1,this.geneTestStageId$field);
         }
         if(this.hasGeneTestSubChapterid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,16);
            WriteUtils.write$TYPE_UINT32(param1,this.geneTestSubChapterid$field);
         }
         if(this.hasGeneTestStageMode)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,17);
            WriteUtils.write$TYPE_UINT32(param1,this.geneTestStageMode$field);
         }
         if(this.hasPuppetFubenChapterId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,18);
            WriteUtils.write$TYPE_UINT32(param1,this.puppetFubenChapterId$field);
         }
         if(this.hasPuppetFubenModeId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,19);
            WriteUtils.write$TYPE_UINT32(param1,this.puppetFubenModeId$field);
         }
         if(this.hasPuppetFubenStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,20);
            WriteUtils.write$TYPE_UINT32(param1,this.puppetFubenStageId$field);
         }
         if(this.hasPuppetFubenSubStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,21);
            WriteUtils.write$TYPE_UINT32(param1,this.puppetFubenSubStageId$field);
         }
         if(this.hasNoEndFubenModeId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,22);
            WriteUtils.write$TYPE_UINT32(param1,this.noEndFubenModeId$field);
         }
         if(this.hasNoEndFubenStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,23);
            WriteUtils.write$TYPE_UINT32(param1,this.noEndFubenStageId$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc26_:uint = 0;
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
         while(param1.bytesAvailable > param2)
         {
            _loc26_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc26_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.type cannot be set twice.");
                  }
                  _loc3_++;
                  this.type = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.fubenChapterId cannot be set twice.");
                  }
                  _loc4_++;
                  this.fubenChapterId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.fubenModeId cannot be set twice.");
                  }
                  _loc5_++;
                  this.fubenModeId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.fubenStageId cannot be set twice.");
                  }
                  _loc6_++;
                  this.fubenStageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.friendZoneId cannot be set twice.");
                  }
                  _loc7_++;
                  this.friendZoneId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.friendRoleId cannot be set twice.");
                  }
                  _loc8_++;
                  this.friendRoleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.screwUpStageId cannot be set twice.");
                  }
                  _loc9_++;
                  this.screwUpStageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.roleId cannot be set twice.");
                  }
                  _loc10_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.guildFubenChapterId cannot be set twice.");
                  }
                  _loc11_++;
                  this.guildFubenChapterId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.guildFubenStageId cannot be set twice.");
                  }
                  _loc12_++;
                  this.guildFubenStageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.bossId cannot be set twice.");
                  }
                  _loc13_++;
                  this.bossId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 12:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.plantTestStageId cannot be set twice.");
                  }
                  _loc14_++;
                  this.plantTestStageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 13:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.plantTestSubChapterid cannot be set twice.");
                  }
                  _loc15_++;
                  this.plantTestSubChapterid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 14:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.guardMemberIndex cannot be set twice.");
                  }
                  _loc16_++;
                  this.guardMemberIndex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 15:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.geneTestStageId cannot be set twice.");
                  }
                  _loc17_++;
                  this.geneTestStageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 16:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.geneTestSubChapterid cannot be set twice.");
                  }
                  _loc18_++;
                  this.geneTestSubChapterid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 17:
                  if(_loc19_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.geneTestStageMode cannot be set twice.");
                  }
                  _loc19_++;
                  this.geneTestStageMode = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 18:
                  if(_loc20_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.puppetFubenChapterId cannot be set twice.");
                  }
                  _loc20_++;
                  this.puppetFubenChapterId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 19:
                  if(_loc21_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.puppetFubenModeId cannot be set twice.");
                  }
                  _loc21_++;
                  this.puppetFubenModeId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 20:
                  if(_loc22_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.puppetFubenStageId cannot be set twice.");
                  }
                  _loc22_++;
                  this.puppetFubenStageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 21:
                  if(_loc23_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.puppetFubenSubStageId cannot be set twice.");
                  }
                  _loc23_++;
                  this.puppetFubenSubStageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 22:
                  if(_loc24_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.noEndFubenModeId cannot be set twice.");
                  }
                  _loc24_++;
                  this.noEndFubenModeId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 23:
                  if(_loc25_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_BattleTarget.noEndFubenStageId cannot be set twice.");
                  }
                  _loc25_++;
                  this.noEndFubenStageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc26_);
                  break;
            }
         }
      }
   }
}
