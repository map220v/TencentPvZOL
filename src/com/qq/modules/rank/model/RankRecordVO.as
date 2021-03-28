package com.qq.modules.rank.model
{
   import PVZ.Cmd.Dto_AllServerNewScrewUp;
   import PVZ.Cmd.Dto_AllServerPuppetPower;
   import PVZ.Cmd.Dto_AllServerRankArena;
   import PVZ.Cmd.Dto_AllServerRolePower;
   import PVZ.Cmd.Dto_GuildFightPower;
   import PVZ.Cmd.Dto_GuildFubenSingleDamage;
   import PVZ.Cmd.Dto_GuildFubenStageDamage;
   import PVZ.Cmd.Dto_GuildFubenStageTime;
   import PVZ.Cmd.Dto_GuildFubenTotalDamage;
   import PVZ.Cmd.Dto_GuildFubenUsedTime;
   import PVZ.Cmd.Dto_NewScrewUpStage;
   import PVZ.Cmd.Dto_RankArenaRankInfo;
   import PVZ.Cmd.Dto_RoleAchievement;
   import PVZ.Cmd.Dto_RoleFightPower;
   import PVZ.Cmd.Dto_RolePlantStar;
   import PVZ.Cmd.Dto_ScrewUpStage;
   import com.qq.GameGloble;
   import com.qq.modules.fuben.model.templates.FubenTemplateFactory;
   import com.qq.modules.fuben.model.templates.ce.FubenChapterForUnionRankRewardTemplateCE;
   import com.qq.modules.rank.RankGlobal;
   import com.qq.modules.unionFuben.model.UnionFubenRankProxy;
   import com.qq.templates.font.FontNormal;
   import com.tencent.protobuf.Int64;
   
   public class RankRecordVO
   {
       
      
      private var m_aryProp:Array;
      
      private var m_roleID:Int64;
      
      private var m_roleName:String;
      
      private var m_zoneID:int;
      
      private var m_unionID:Int64;
      
      private var m_hasData:Boolean = false;
      
      private var m_cardDtoListVec:Vector.<Array>;
      
      public function RankRecordVO()
      {
         this.m_cardDtoListVec = new Vector.<Array>();
         super();
         this.m_aryProp = [];
      }
      
      public function reset() : void
      {
         this.m_aryProp.length = 0;
         this.m_hasData = false;
         this.m_roleID = null;
         this.m_unionID = null;
         this.m_roleName = null;
         this.m_zoneID = 0;
      }
      
      public function getData(param1:int) : Object
      {
         return this.m_aryProp[param1];
      }
      
      public function setData(param1:int, param2:Object) : void
      {
         this.m_aryProp[param1] = param2;
      }
      
      public function get hasData() : Boolean
      {
         return this.m_hasData;
      }
      
      public function set dto(param1:Object) : void
      {
         var _loc2_:UnionFubenRankProxy = null;
         var _loc3_:FubenChapterForUnionRankRewardTemplateCE = null;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:Array = null;
         this.m_hasData = param1 != null;
         if(param1 is Dto_RoleFightPower)
         {
            this.parseDto_RoleFightPower(param1 as Dto_RoleFightPower);
         }
         else if(param1 is Dto_RoleAchievement)
         {
            this.parseDto_RoleAchievement(param1 as Dto_RoleAchievement);
         }
         else if(param1 is Dto_GuildFightPower)
         {
            this.parseDto_GuildFightPower(param1 as Dto_GuildFightPower);
         }
         else if(param1 is Dto_ScrewUpStage)
         {
            this.parseDto_ScrewUpStage(param1 as Dto_ScrewUpStage);
         }
         else if(param1 is Dto_NewScrewUpStage)
         {
            this.parseDto_NewScrewUpStage(param1 as Dto_NewScrewUpStage);
         }
         else if(param1 is Dto_RankArenaRankInfo)
         {
            this.parseDto_RankArenaRankInfo(param1 as Dto_RankArenaRankInfo);
         }
         else if(param1 is Dto_RolePlantStar)
         {
            this.parseDto_RolePlantStar(param1 as Dto_RolePlantStar);
         }
         else if(param1 is Dto_GuildFubenSingleDamage)
         {
            this.parseDto_GuildFubenSingleDamage(param1 as Dto_GuildFubenSingleDamage);
            _loc2_ = GameGloble.injector.getInstance(UnionFubenRankProxy);
            _loc4_ = _loc2_.curChooseChapterId;
            _loc5_ = (param1 as Dto_GuildFubenSingleDamage).rank;
            _loc3_ = FubenTemplateFactory.instance.getUnionFubenSingleRankRewardWithIdAndRank(_loc4_,_loc5_);
            if(_loc3_)
            {
               this.setData(RankGlobal.PROPERTY_RANK_REWARD,_loc3_.reward);
            }
            else
            {
               this.setData(RankGlobal.PROPERTY_RANK_REWARD,"");
            }
         }
         else if(param1 is Dto_GuildFubenTotalDamage)
         {
            this.parseDto_GuildFubenTotalDamage(param1 as Dto_GuildFubenTotalDamage);
            _loc2_ = GameGloble.injector.getInstance(UnionFubenRankProxy);
            _loc4_ = _loc2_.curChooseChapterId;
            _loc5_ = (param1 as Dto_GuildFubenTotalDamage).rank;
            _loc3_ = FubenTemplateFactory.instance.getUnionFubenTotalRankRewardWithIdAndRank(_loc4_,_loc5_);
            if(_loc3_)
            {
               this.setData(RankGlobal.PROPERTY_RANK_REWARD,_loc3_.reward);
            }
            else
            {
               this.setData(RankGlobal.PROPERTY_RANK_REWARD,"");
            }
         }
         else if(param1 is Dto_GuildFubenUsedTime)
         {
            this.parseDto_GuildFubenUsedTime(param1 as Dto_GuildFubenUsedTime);
         }
         else if(param1 is Dto_GuildFubenStageDamage)
         {
            this.parseDto_GuildFubenStageDamage(param1 as Dto_GuildFubenStageDamage);
            this.m_cardDtoListVec = Vector.<Array>([]);
            if((_loc6_ = (param1 as Dto_GuildFubenStageDamage).formation).length > 0)
            {
               this.m_cardDtoListVec.push(_loc6_[0].cardinfo);
               this.m_cardDtoListVec.push(_loc6_[1].cardinfo);
            }
         }
         else if(param1 is Dto_GuildFubenStageTime)
         {
            this.parseDto_GuildFubenStageTime(param1 as Dto_GuildFubenStageTime);
            this.m_cardDtoListVec = Vector.<Array>([]);
            if((_loc6_ = (param1 as Dto_GuildFubenStageTime).formation).length > 0)
            {
               this.m_cardDtoListVec.push(_loc6_[0].cardinfo);
               this.m_cardDtoListVec.push(_loc6_[1].cardinfo);
            }
         }
         else if(param1 is Dto_AllServerRolePower)
         {
            this.parseDto_AllServerRolePower(param1 as Dto_AllServerRolePower);
         }
         else if(param1 is Dto_AllServerNewScrewUp)
         {
            this.parseDto_AllServerNewScrewUp(param1 as Dto_AllServerNewScrewUp);
         }
         else if(param1 is Dto_AllServerPuppetPower)
         {
            this.parseDto_AllServerPuppetPower(param1 as Dto_AllServerPuppetPower);
         }
         else if(param1 is Dto_AllServerRankArena)
         {
            this.parseDto_AllServerRankArena(param1 as Dto_AllServerRankArena);
         }
      }
      
      private function parseDto_GuildFubenStageTime(param1:Dto_GuildFubenStageTime) : void
      {
         this.setData(RankGlobal.PROPERTY_INDEX,param1.rank);
         this.setData(RankGlobal.PROPERTY_ROLE,param1.rolename);
         this.setData(RankGlobal.PROPERTY_LEVEL,param1.level);
         this.setData(RankGlobal.PROPERTY_STAGE_TIME,param1.time);
         this.setData(RankGlobal.PROPERTY_MULTY_VIEW,FontNormal.RANK_VIEW_TEAM);
         this.m_roleID = param1.roleid;
      }
      
      private function parseDto_GuildFubenStageDamage(param1:Dto_GuildFubenStageDamage) : void
      {
         this.setData(RankGlobal.PROPERTY_INDEX,param1.rank);
         this.setData(RankGlobal.PROPERTY_ROLE,param1.rolename);
         this.setData(RankGlobal.PROPERTY_UNION,param1.guildname);
         this.setData(RankGlobal.PROPERTY_SINGLE_DAMAGE,param1.damage.low);
         this.setData(RankGlobal.PROPERTY_MULTY_VIEW,FontNormal.RANK_VIEW_TEAM);
         this.m_roleID = param1.roleid;
         this.m_unionID = param1.guildid;
      }
      
      private function parseDto_GuildFubenUsedTime(param1:Dto_GuildFubenUsedTime) : void
      {
         this.setData(RankGlobal.PROPERTY_INDEX,param1.rank);
         this.setData(RankGlobal.PROPERTY_UNION,param1.guildname);
         this.setData(RankGlobal.PROPERTY_UNION_POWER,param1.fightPower);
         this.setData(RankGlobal.PROPERTY_USED_TIME,param1.usedtime);
         this.m_unionID = param1.guildid;
      }
      
      private function parseDto_GuildFubenTotalDamage(param1:Dto_GuildFubenTotalDamage) : void
      {
         this.setData(RankGlobal.PROPERTY_INDEX,param1.rank);
         this.setData(RankGlobal.PROPERTY_ROLE,param1.username);
         this.setData(RankGlobal.PROPERTY_LEVEL,param1.level);
         this.setData(RankGlobal.PROPERTY_UNION,param1.guildname);
         this.setData(RankGlobal.PROPERTY_TOTAL_DAMAGE,param1.damage);
         this.m_roleID = param1.roleid;
         this.m_unionID = param1.guildid;
      }
      
      private function parseDto_GuildFubenSingleDamage(param1:Dto_GuildFubenSingleDamage) : void
      {
         this.setData(RankGlobal.PROPERTY_INDEX,param1.rank);
         this.setData(RankGlobal.PROPERTY_ROLE,param1.username);
         this.setData(RankGlobal.PROPERTY_LEVEL,param1.level);
         this.setData(RankGlobal.PROPERTY_UNION,param1.guildname);
         this.setData(RankGlobal.PROPERTY_SINGLE_DAMAGE,param1.damage);
         this.m_roleID = param1.roleid;
         this.m_unionID = param1.guildid;
      }
      
      private function parseDto_RolePlantStar(param1:Dto_RolePlantStar) : void
      {
         this.setData(RankGlobal.PROPERTY_INDEX,param1.rank);
         this.setData(RankGlobal.PROPERTY_ROLE,param1.username);
         this.setData(RankGlobal.PROPERTY_LEVEL,param1.level);
         this.setData(RankGlobal.PROPERTY_STAR,param1.starnum);
         this.m_roleID = param1.roleid;
      }
      
      private function parseDto_RankArenaRankInfo(param1:Dto_RankArenaRankInfo) : void
      {
         this.setData(RankGlobal.PROPERTY_INDEX,param1.rank);
         this.setData(RankGlobal.PROPERTY_ROLE,param1.roleName);
         this.setData(RankGlobal.PROPERTY_LEVEL,param1.roleLevel);
         this.setData(RankGlobal.PROPERTY_ATTACK,param1.challengeWinCount);
         this.setData(RankGlobal.PROPERTY_DEFEND,param1.defenceWinCount);
         this.setData(RankGlobal.PROPERTY_VIEW,FontNormal.RANK_VIEW_TEAM);
         this.m_roleID = param1.roleId;
      }
      
      private function parseDto_RoleFightPower(param1:Dto_RoleFightPower) : void
      {
         this.setData(RankGlobal.PROPERTY_INDEX,param1.rank);
         this.setData(RankGlobal.PROPERTY_ROLE,param1.username);
         this.setData(RankGlobal.PROPERTY_LEVEL,param1.level);
         this.setData(RankGlobal.PROPERTY_UNION,param1.guildname);
         this.setData(RankGlobal.PROPERTY_POWER,param1.fightpower);
         this.m_roleID = param1.roleid;
         this.m_unionID = param1.guildid;
      }
      
      private function parseDto_AllServerRolePower(param1:Dto_AllServerRolePower) : void
      {
         this.setData(RankGlobal.PROPERTY_INDEX,param1.rank);
         this.setData(RankGlobal.PROPERTY_ROLE,param1.roleName);
         this.setData(RankGlobal.PROPERTY_LEVEL,param1.level);
         this.setData(RankGlobal.PROPERTY_ZONEID,param1.zoneId);
         this.setData(RankGlobal.PROPERTY_POWER,param1.power);
         this.m_roleName = param1.roleName;
         this.m_zoneID = param1.zoneId;
         this.m_roleID = null;
         this.m_unionID = null;
      }
      
      private function parseDto_RoleAchievement(param1:Dto_RoleAchievement) : void
      {
         this.setData(RankGlobal.PROPERTY_INDEX,param1.rank);
         this.setData(RankGlobal.PROPERTY_ROLE,param1.username);
         this.setData(RankGlobal.PROPERTY_LEVEL,param1.level);
         this.setData(RankGlobal.PROPERTY_ACHIEVE,param1.achievement);
         this.setData(RankGlobal.PROPERTY_DATE,param1.achievetime);
         this.m_roleID = param1.roleid;
      }
      
      private function parseDto_GuildFightPower(param1:Dto_GuildFightPower) : void
      {
         this.setData(RankGlobal.PROPERTY_INDEX,param1.rank);
         this.setData(RankGlobal.PROPERTY_UNION,param1.guildname);
         this.setData(RankGlobal.PROPERTY_LEVEL,param1.level);
         this.setData(RankGlobal.PROPERTY_MEMBER,param1.membernum + "/" + param1.memberlimit);
         this.setData(RankGlobal.PROPERTY_POWER,param1.fightpower);
         this.m_unionID = param1.guildid;
      }
      
      private function parseDto_ScrewUpStage(param1:Dto_ScrewUpStage) : void
      {
         this.setData(RankGlobal.PROPERTY_INDEX,param1.rank);
         this.setData(RankGlobal.PROPERTY_ROLE,param1.username);
         this.setData(RankGlobal.PROPERTY_LEVEL,param1.level);
         this.setData(RankGlobal.PROPERTY_TRIAL,param1.stagenum);
         this.setData(RankGlobal.PROPERTY_POWER,param1.fightpower);
         this.m_roleID = param1.roleid;
      }
      
      private function parseDto_NewScrewUpStage(param1:Dto_NewScrewUpStage) : void
      {
         this.setData(RankGlobal.PROPERTY_INDEX,param1.rank);
         this.setData(RankGlobal.PROPERTY_ROLE,param1.username);
         this.setData(RankGlobal.PROPERTY_LEVEL,param1.level);
         this.setData(RankGlobal.PROPERTY_TRIAL,param1.stagenum);
         this.setData(RankGlobal.PROPERTY_POWER,param1.fightpower);
         this.m_roleID = param1.roleid;
      }
      
      private function parseDto_AllServerNewScrewUp(param1:Dto_AllServerNewScrewUp) : void
      {
         this.setData(RankGlobal.PROPERTY_INDEX,param1.rank);
         this.setData(RankGlobal.PROPERTY_ROLE,param1.roleName);
         this.setData(RankGlobal.PROPERTY_ZONEID,param1.zoneId);
         this.setData(RankGlobal.PROPERTY_TRIAL,param1.stageId);
         this.setData(RankGlobal.PROPERTY_POWER,param1.power);
         this.m_roleName = param1.roleName;
         this.m_zoneID = param1.zoneId;
         this.m_roleID = null;
         this.m_unionID = null;
      }
      
      private function parseDto_AllServerPuppetPower(param1:Dto_AllServerPuppetPower) : void
      {
         this.setData(RankGlobal.PROPERTY_INDEX,param1.rank);
         this.setData(RankGlobal.PROPERTY_ROLE,param1.roleName);
         this.setData(RankGlobal.PROPERTY_LEVEL,param1.level);
         this.setData(RankGlobal.PROPERTY_ZONEID,param1.zoneId);
         this.setData(RankGlobal.PROPERTY_DUMMY_FP,param1.power);
         this.m_roleName = param1.roleName;
         this.m_zoneID = param1.zoneId;
         this.m_roleID = null;
         this.m_unionID = null;
      }
      
      private function parseDto_AllServerRankArena(param1:Dto_AllServerRankArena) : void
      {
         this.setData(RankGlobal.PROPERTY_INDEX,param1.rank);
         this.setData(RankGlobal.PROPERTY_ALLSERVER_ROLE,param1.roleName);
         this.setData(RankGlobal.PROPERTY_ZONEID,param1.zoneId);
         this.setData(RankGlobal.PROPERTY_ATTACK,param1.attackWin);
         this.setData(RankGlobal.PROPERTY_DEFEND,param1.defendWin);
         this.setData(RankGlobal.PROPERTY_ALLSERVER_ARENA_VIEW,FontNormal.RANK_VIEW_TEAM);
         this.m_roleName = param1.roleName;
         this.m_zoneID = param1.zoneId;
         this.m_roleID = param1.roleId;
         this.m_unionID = null;
      }
      
      public function get roleID() : Int64
      {
         return this.m_roleID;
      }
      
      public function get zoneID() : int
      {
         return this.m_zoneID;
      }
      
      public function get roleName() : String
      {
         return this.m_roleName;
      }
      
      public function get unionID() : Int64
      {
         return this.m_unionID;
      }
      
      public function get cardDtoListVec() : Vector.<Array>
      {
         return this.m_cardDtoListVec;
      }
   }
}
