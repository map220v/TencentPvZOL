package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_GetSelfRank_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_GetSelfRank_SC";
      
      public static const RANKTYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Cmd_GetSelfRank_SC.ranktype","ranktype",1 << 3 | WireType.VARINT,E_RankType);
      
      public static const ROLEFIGHTPOWER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetSelfRank_SC.rolefightpower","rolefightpower",2 << 3 | WireType.LENGTH_DELIMITED,Dto_RoleFightPower);
      
      public static const ROLEACHIEVEMENT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetSelfRank_SC.roleachievement","roleachievement",3 << 3 | WireType.LENGTH_DELIMITED,Dto_RoleAchievement);
      
      public static const GUILDFIGHTPOWER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetSelfRank_SC.guildfightpower","guildfightpower",4 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFightPower);
      
      public static const SCREWUPSTAGE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetSelfRank_SC.screwupstage","screwupstage",5 << 3 | WireType.LENGTH_DELIMITED,Dto_ScrewUpStage);
      
      public static const RANKARENA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetSelfRank_SC.rankarena","rankarena",6 << 3 | WireType.LENGTH_DELIMITED,Dto_RankArenaRankInfo);
      
      public static const ROLEPLANTSTAR:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetSelfRank_SC.roleplantstar","roleplantstar",7 << 3 | WireType.LENGTH_DELIMITED,Dto_RolePlantStar);
      
      public static const GUILDFUBENSINGLEDAMAGE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetSelfRank_SC.guildFubenSingleDamage","guildFubenSingleDamage",8 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFubenSingleDamage);
      
      public static const GUILDFUBENTOTALDAMAGE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetSelfRank_SC.guildFubenTotalDamage","guildFubenTotalDamage",9 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFubenTotalDamage);
      
      public static const GUILDFUBENUSEDTIME:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetSelfRank_SC.guildFubenUsedTime","guildFubenUsedTime",10 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFubenUsedTime);
      
      public static const GUILDFUBENSTAGEDAMAGE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetSelfRank_SC.guildFubenStageDamage","guildFubenStageDamage",11 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFubenStageDamage);
      
      public static const GUILDFUBENSTAGETIME:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetSelfRank_SC.guildFubenStageTime","guildFubenStageTime",12 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFubenStageTime);
      
      public static const NEWSCREWUPSTAGE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetSelfRank_SC.newscrewupstage","newscrewupstage",15 << 3 | WireType.LENGTH_DELIMITED,Dto_NewScrewUpStage);
      
      public static const ALLSERVERROLEPOWER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetSelfRank_SC.allServerRolePower","allServerRolePower",101 << 3 | WireType.LENGTH_DELIMITED,Dto_AllServerRolePower);
      
      public static const ALLSERVERNEWSCREWUP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetSelfRank_SC.allServerNewScrewUp","allServerNewScrewUp",102 << 3 | WireType.LENGTH_DELIMITED,Dto_AllServerNewScrewUp);
      
      public static const ALLSERVERNOENDFUBEN:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetSelfRank_SC.allServerNoEndFuben","allServerNoEndFuben",103 << 3 | WireType.LENGTH_DELIMITED,Dto_AllServerNoEndFuben);
      
      public static const ALLSERVERPUPPETPOWER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetSelfRank_SC.allServerPuppetPower","allServerPuppetPower",104 << 3 | WireType.LENGTH_DELIMITED,Dto_AllServerPuppetPower);
      
      public static const ALLSERVERRANKARENA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GetSelfRank_SC.allServerRankArena","allServerRankArena",105 << 3 | WireType.LENGTH_DELIMITED,Dto_AllServerRankArena);
       
      
      private var ranktype$field:int;
      
      private var hasField$0:uint = 0;
      
      private var rolefightpower$field:Dto_RoleFightPower;
      
      private var roleachievement$field:Dto_RoleAchievement;
      
      private var guildfightpower$field:Dto_GuildFightPower;
      
      private var screwupstage$field:Dto_ScrewUpStage;
      
      private var rankarena$field:Dto_RankArenaRankInfo;
      
      private var roleplantstar$field:Dto_RolePlantStar;
      
      private var guildFubenSingleDamage$field:Dto_GuildFubenSingleDamage;
      
      private var guildFubenTotalDamage$field:Dto_GuildFubenTotalDamage;
      
      private var guildFubenUsedTime$field:Dto_GuildFubenUsedTime;
      
      private var guildFubenStageDamage$field:Dto_GuildFubenStageDamage;
      
      private var guildFubenStageTime$field:Dto_GuildFubenStageTime;
      
      private var newscrewupstage$field:Dto_NewScrewUpStage;
      
      private var allServerRolePower$field:Dto_AllServerRolePower;
      
      private var allServerNewScrewUp$field:Dto_AllServerNewScrewUp;
      
      private var allServerNoEndFuben$field:Dto_AllServerNoEndFuben;
      
      private var allServerPuppetPower$field:Dto_AllServerPuppetPower;
      
      private var allServerRankArena$field:Dto_AllServerRankArena;
      
      public function Cmd_GetSelfRank_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_GetSelfRank_SC.$MessageID;
      }
      
      public function clearRanktype() : void
      {
         this.hasField$0 &= 4294967294;
         this.ranktype$field = new int();
      }
      
      public function get hasRanktype() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set ranktype(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.ranktype$field = param1;
      }
      
      public function get ranktype() : int
      {
         return this.ranktype$field;
      }
      
      public function clearRolefightpower() : void
      {
         this.rolefightpower$field = null;
      }
      
      public function get hasRolefightpower() : Boolean
      {
         return this.rolefightpower$field != null;
      }
      
      public function set rolefightpower(param1:Dto_RoleFightPower) : void
      {
         this.rolefightpower$field = param1;
      }
      
      public function get rolefightpower() : Dto_RoleFightPower
      {
         return this.rolefightpower$field;
      }
      
      public function clearRoleachievement() : void
      {
         this.roleachievement$field = null;
      }
      
      public function get hasRoleachievement() : Boolean
      {
         return this.roleachievement$field != null;
      }
      
      public function set roleachievement(param1:Dto_RoleAchievement) : void
      {
         this.roleachievement$field = param1;
      }
      
      public function get roleachievement() : Dto_RoleAchievement
      {
         return this.roleachievement$field;
      }
      
      public function clearGuildfightpower() : void
      {
         this.guildfightpower$field = null;
      }
      
      public function get hasGuildfightpower() : Boolean
      {
         return this.guildfightpower$field != null;
      }
      
      public function set guildfightpower(param1:Dto_GuildFightPower) : void
      {
         this.guildfightpower$field = param1;
      }
      
      public function get guildfightpower() : Dto_GuildFightPower
      {
         return this.guildfightpower$field;
      }
      
      public function clearScrewupstage() : void
      {
         this.screwupstage$field = null;
      }
      
      public function get hasScrewupstage() : Boolean
      {
         return this.screwupstage$field != null;
      }
      
      public function set screwupstage(param1:Dto_ScrewUpStage) : void
      {
         this.screwupstage$field = param1;
      }
      
      public function get screwupstage() : Dto_ScrewUpStage
      {
         return this.screwupstage$field;
      }
      
      public function clearRankarena() : void
      {
         this.rankarena$field = null;
      }
      
      public function get hasRankarena() : Boolean
      {
         return this.rankarena$field != null;
      }
      
      public function set rankarena(param1:Dto_RankArenaRankInfo) : void
      {
         this.rankarena$field = param1;
      }
      
      public function get rankarena() : Dto_RankArenaRankInfo
      {
         return this.rankarena$field;
      }
      
      public function clearRoleplantstar() : void
      {
         this.roleplantstar$field = null;
      }
      
      public function get hasRoleplantstar() : Boolean
      {
         return this.roleplantstar$field != null;
      }
      
      public function set roleplantstar(param1:Dto_RolePlantStar) : void
      {
         this.roleplantstar$field = param1;
      }
      
      public function get roleplantstar() : Dto_RolePlantStar
      {
         return this.roleplantstar$field;
      }
      
      public function clearGuildFubenSingleDamage() : void
      {
         this.guildFubenSingleDamage$field = null;
      }
      
      public function get hasGuildFubenSingleDamage() : Boolean
      {
         return this.guildFubenSingleDamage$field != null;
      }
      
      public function set guildFubenSingleDamage(param1:Dto_GuildFubenSingleDamage) : void
      {
         this.guildFubenSingleDamage$field = param1;
      }
      
      public function get guildFubenSingleDamage() : Dto_GuildFubenSingleDamage
      {
         return this.guildFubenSingleDamage$field;
      }
      
      public function clearGuildFubenTotalDamage() : void
      {
         this.guildFubenTotalDamage$field = null;
      }
      
      public function get hasGuildFubenTotalDamage() : Boolean
      {
         return this.guildFubenTotalDamage$field != null;
      }
      
      public function set guildFubenTotalDamage(param1:Dto_GuildFubenTotalDamage) : void
      {
         this.guildFubenTotalDamage$field = param1;
      }
      
      public function get guildFubenTotalDamage() : Dto_GuildFubenTotalDamage
      {
         return this.guildFubenTotalDamage$field;
      }
      
      public function clearGuildFubenUsedTime() : void
      {
         this.guildFubenUsedTime$field = null;
      }
      
      public function get hasGuildFubenUsedTime() : Boolean
      {
         return this.guildFubenUsedTime$field != null;
      }
      
      public function set guildFubenUsedTime(param1:Dto_GuildFubenUsedTime) : void
      {
         this.guildFubenUsedTime$field = param1;
      }
      
      public function get guildFubenUsedTime() : Dto_GuildFubenUsedTime
      {
         return this.guildFubenUsedTime$field;
      }
      
      public function clearGuildFubenStageDamage() : void
      {
         this.guildFubenStageDamage$field = null;
      }
      
      public function get hasGuildFubenStageDamage() : Boolean
      {
         return this.guildFubenStageDamage$field != null;
      }
      
      public function set guildFubenStageDamage(param1:Dto_GuildFubenStageDamage) : void
      {
         this.guildFubenStageDamage$field = param1;
      }
      
      public function get guildFubenStageDamage() : Dto_GuildFubenStageDamage
      {
         return this.guildFubenStageDamage$field;
      }
      
      public function clearGuildFubenStageTime() : void
      {
         this.guildFubenStageTime$field = null;
      }
      
      public function get hasGuildFubenStageTime() : Boolean
      {
         return this.guildFubenStageTime$field != null;
      }
      
      public function set guildFubenStageTime(param1:Dto_GuildFubenStageTime) : void
      {
         this.guildFubenStageTime$field = param1;
      }
      
      public function get guildFubenStageTime() : Dto_GuildFubenStageTime
      {
         return this.guildFubenStageTime$field;
      }
      
      public function clearNewscrewupstage() : void
      {
         this.newscrewupstage$field = null;
      }
      
      public function get hasNewscrewupstage() : Boolean
      {
         return this.newscrewupstage$field != null;
      }
      
      public function set newscrewupstage(param1:Dto_NewScrewUpStage) : void
      {
         this.newscrewupstage$field = param1;
      }
      
      public function get newscrewupstage() : Dto_NewScrewUpStage
      {
         return this.newscrewupstage$field;
      }
      
      public function clearAllServerRolePower() : void
      {
         this.allServerRolePower$field = null;
      }
      
      public function get hasAllServerRolePower() : Boolean
      {
         return this.allServerRolePower$field != null;
      }
      
      public function set allServerRolePower(param1:Dto_AllServerRolePower) : void
      {
         this.allServerRolePower$field = param1;
      }
      
      public function get allServerRolePower() : Dto_AllServerRolePower
      {
         return this.allServerRolePower$field;
      }
      
      public function clearAllServerNewScrewUp() : void
      {
         this.allServerNewScrewUp$field = null;
      }
      
      public function get hasAllServerNewScrewUp() : Boolean
      {
         return this.allServerNewScrewUp$field != null;
      }
      
      public function set allServerNewScrewUp(param1:Dto_AllServerNewScrewUp) : void
      {
         this.allServerNewScrewUp$field = param1;
      }
      
      public function get allServerNewScrewUp() : Dto_AllServerNewScrewUp
      {
         return this.allServerNewScrewUp$field;
      }
      
      public function clearAllServerNoEndFuben() : void
      {
         this.allServerNoEndFuben$field = null;
      }
      
      public function get hasAllServerNoEndFuben() : Boolean
      {
         return this.allServerNoEndFuben$field != null;
      }
      
      public function set allServerNoEndFuben(param1:Dto_AllServerNoEndFuben) : void
      {
         this.allServerNoEndFuben$field = param1;
      }
      
      public function get allServerNoEndFuben() : Dto_AllServerNoEndFuben
      {
         return this.allServerNoEndFuben$field;
      }
      
      public function clearAllServerPuppetPower() : void
      {
         this.allServerPuppetPower$field = null;
      }
      
      public function get hasAllServerPuppetPower() : Boolean
      {
         return this.allServerPuppetPower$field != null;
      }
      
      public function set allServerPuppetPower(param1:Dto_AllServerPuppetPower) : void
      {
         this.allServerPuppetPower$field = param1;
      }
      
      public function get allServerPuppetPower() : Dto_AllServerPuppetPower
      {
         return this.allServerPuppetPower$field;
      }
      
      public function clearAllServerRankArena() : void
      {
         this.allServerRankArena$field = null;
      }
      
      public function get hasAllServerRankArena() : Boolean
      {
         return this.allServerRankArena$field != null;
      }
      
      public function set allServerRankArena(param1:Dto_AllServerRankArena) : void
      {
         this.allServerRankArena$field = param1;
      }
      
      public function get allServerRankArena() : Dto_AllServerRankArena
      {
         return this.allServerRankArena$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRanktype)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_ENUM(param1,this.ranktype$field);
         }
         if(this.hasRolefightpower)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rolefightpower$field);
         }
         if(this.hasRoleachievement)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.roleachievement$field);
         }
         if(this.hasGuildfightpower)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guildfightpower$field);
         }
         if(this.hasScrewupstage)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.screwupstage$field);
         }
         if(this.hasRankarena)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rankarena$field);
         }
         if(this.hasRoleplantstar)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_MESSAGE(param1,this.roleplantstar$field);
         }
         if(this.hasGuildFubenSingleDamage)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,8);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guildFubenSingleDamage$field);
         }
         if(this.hasGuildFubenTotalDamage)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,9);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guildFubenTotalDamage$field);
         }
         if(this.hasGuildFubenUsedTime)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,10);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guildFubenUsedTime$field);
         }
         if(this.hasGuildFubenStageDamage)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,11);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guildFubenStageDamage$field);
         }
         if(this.hasGuildFubenStageTime)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,12);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guildFubenStageTime$field);
         }
         if(this.hasNewscrewupstage)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,15);
            WriteUtils.write$TYPE_MESSAGE(param1,this.newscrewupstage$field);
         }
         if(this.hasAllServerRolePower)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,101);
            WriteUtils.write$TYPE_MESSAGE(param1,this.allServerRolePower$field);
         }
         if(this.hasAllServerNewScrewUp)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,102);
            WriteUtils.write$TYPE_MESSAGE(param1,this.allServerNewScrewUp$field);
         }
         if(this.hasAllServerNoEndFuben)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,103);
            WriteUtils.write$TYPE_MESSAGE(param1,this.allServerNoEndFuben$field);
         }
         if(this.hasAllServerPuppetPower)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,104);
            WriteUtils.write$TYPE_MESSAGE(param1,this.allServerPuppetPower$field);
         }
         if(this.hasAllServerRankArena)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,105);
            WriteUtils.write$TYPE_MESSAGE(param1,this.allServerRankArena$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc21_:uint = 0;
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
         while(param1.bytesAvailable > param2)
         {
            _loc21_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc21_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetSelfRank_SC.ranktype cannot be set twice.");
                  }
                  _loc3_++;
                  this.ranktype = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetSelfRank_SC.rolefightpower cannot be set twice.");
                  }
                  _loc4_++;
                  this.rolefightpower = new Dto_RoleFightPower();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.rolefightpower);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetSelfRank_SC.roleachievement cannot be set twice.");
                  }
                  _loc5_++;
                  this.roleachievement = new Dto_RoleAchievement();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.roleachievement);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetSelfRank_SC.guildfightpower cannot be set twice.");
                  }
                  _loc6_++;
                  this.guildfightpower = new Dto_GuildFightPower();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.guildfightpower);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetSelfRank_SC.screwupstage cannot be set twice.");
                  }
                  _loc7_++;
                  this.screwupstage = new Dto_ScrewUpStage();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.screwupstage);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetSelfRank_SC.rankarena cannot be set twice.");
                  }
                  _loc8_++;
                  this.rankarena = new Dto_RankArenaRankInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.rankarena);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetSelfRank_SC.roleplantstar cannot be set twice.");
                  }
                  _loc9_++;
                  this.roleplantstar = new Dto_RolePlantStar();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.roleplantstar);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetSelfRank_SC.guildFubenSingleDamage cannot be set twice.");
                  }
                  _loc10_++;
                  this.guildFubenSingleDamage = new Dto_GuildFubenSingleDamage();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.guildFubenSingleDamage);
                  break;
               case 9:
                  if(_loc11_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetSelfRank_SC.guildFubenTotalDamage cannot be set twice.");
                  }
                  _loc11_++;
                  this.guildFubenTotalDamage = new Dto_GuildFubenTotalDamage();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.guildFubenTotalDamage);
                  break;
               case 10:
                  if(_loc12_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetSelfRank_SC.guildFubenUsedTime cannot be set twice.");
                  }
                  _loc12_++;
                  this.guildFubenUsedTime = new Dto_GuildFubenUsedTime();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.guildFubenUsedTime);
                  break;
               case 11:
                  if(_loc13_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetSelfRank_SC.guildFubenStageDamage cannot be set twice.");
                  }
                  _loc13_++;
                  this.guildFubenStageDamage = new Dto_GuildFubenStageDamage();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.guildFubenStageDamage);
                  break;
               case 12:
                  if(_loc14_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetSelfRank_SC.guildFubenStageTime cannot be set twice.");
                  }
                  _loc14_++;
                  this.guildFubenStageTime = new Dto_GuildFubenStageTime();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.guildFubenStageTime);
                  break;
               case 15:
                  if(_loc15_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetSelfRank_SC.newscrewupstage cannot be set twice.");
                  }
                  _loc15_++;
                  this.newscrewupstage = new Dto_NewScrewUpStage();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.newscrewupstage);
                  break;
               case 101:
                  if(_loc16_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetSelfRank_SC.allServerRolePower cannot be set twice.");
                  }
                  _loc16_++;
                  this.allServerRolePower = new Dto_AllServerRolePower();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.allServerRolePower);
                  break;
               case 102:
                  if(_loc17_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetSelfRank_SC.allServerNewScrewUp cannot be set twice.");
                  }
                  _loc17_++;
                  this.allServerNewScrewUp = new Dto_AllServerNewScrewUp();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.allServerNewScrewUp);
                  break;
               case 103:
                  if(_loc18_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetSelfRank_SC.allServerNoEndFuben cannot be set twice.");
                  }
                  _loc18_++;
                  this.allServerNoEndFuben = new Dto_AllServerNoEndFuben();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.allServerNoEndFuben);
                  break;
               case 104:
                  if(_loc19_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetSelfRank_SC.allServerPuppetPower cannot be set twice.");
                  }
                  _loc19_++;
                  this.allServerPuppetPower = new Dto_AllServerPuppetPower();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.allServerPuppetPower);
                  break;
               case 105:
                  if(_loc20_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GetSelfRank_SC.allServerRankArena cannot be set twice.");
                  }
                  _loc20_++;
                  this.allServerRankArena = new Dto_AllServerRankArena();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.allServerRankArena);
                  break;
               default:
                  super.readUnknown(param1,_loc21_);
                  break;
            }
         }
      }
   }
}
