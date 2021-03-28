package com.qq.modules.rank.model
{
   import PVZ.Cmd.Cmd_GetRankList_SC;
   import PVZ.Cmd.Cmd_GetSelfRank_SC;
   import PVZ.Cmd.Dto_GuildFubenStageDamage;
   import PVZ.Cmd.E_RankType;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.rank.RankGlobal;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class RankProxy extends BasicProxy
   {
       
      
      [Inject]
      public var actorModel:ActorModel;
      
      private var m_type:int;
      
      private var m_vecRecord:Vector.<RankRecordVO>;
      
      private var m_totalCount:int;
      
      private var m_selfRecord:RankRecordVO;
      
      public function RankProxy()
      {
         this.m_vecRecord = new Vector.<RankRecordVO>();
         this.m_selfRecord = new RankRecordVO();
         var _loc1_:int = 0;
         while(_loc1_ < RankGlobal.PAGE_BOUNDS)
         {
            this.m_vecRecord.push(new RankRecordVO());
            _loc1_++;
         }
         super();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_GetRankList_SC.$MessageID,this.onCmd_GetRankList_SC],[Cmd_GetSelfRank_SC.$MessageID,this.onCmd_SelfRank_SC]];
      }
      
      private function onCmd_SelfRank_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_GetSelfRank_SC = param1.socketData as Cmd_GetSelfRank_SC;
         switch(_loc2_.ranktype)
         {
            case E_RankType.E_RankType_GuildFightPower:
               this.selfData = _loc2_.guildfightpower;
               break;
            case E_RankType.E_RankType_RoleAchievement:
               this.selfData = _loc2_.roleachievement;
               break;
            case E_RankType.E_RankType_RoleFightPower:
               this.selfData = _loc2_.rolefightpower;
               break;
            case E_RankType.E_RankType_ScrewUpStage:
               this.selfData = _loc2_.screwupstage;
               break;
            case E_RankType.E_RankType_NewScrewUpStage:
               this.selfData = _loc2_.newscrewupstage;
               break;
            case E_RankType.E_RankType_RankArena:
               this.selfData = _loc2_.rankarena;
               break;
            case E_RankType.E_RankType_AllServerRankArena:
               this.selfData = _loc2_.allServerRankArena;
               break;
            case E_RankType.E_RankType_PlantStar:
               this.selfData = _loc2_.roleplantstar;
               break;
            case E_RankType.E_RankType_GuildFubenSingleDamage:
               this.selfData = _loc2_.guildFubenSingleDamage;
               break;
            case E_RankType.E_RankType_GuildFubenTotalDamage:
               this.selfData = _loc2_.guildFubenTotalDamage;
               break;
            case E_RankType.E_RankType_GuildFubenUsedTime:
               this.selfData = _loc2_.guildFubenUsedTime;
               break;
            case E_RankType.E_RankType_GuildFubenStageDamage:
               this.selfData = _loc2_.guildFubenStageDamage;
               break;
            case E_RankType.E_RankType_GuildFubenStageTime:
               this.selfData = _loc2_.guildFubenStageTime;
               break;
            case E_RankType.E_RankType_AllServerRolePower:
               this.selfData = _loc2_.allServerRolePower;
               break;
            case E_RankType.E_RankType_AllServerNewScrewUp:
               this.selfData = _loc2_.allServerNewScrewUp;
               break;
            case E_RankType.E_RankType_AllServerNoEndFuben:
               this.selfData = _loc2_.allServerNoEndFuben;
               break;
            case E_RankType.E_RankType_AllServerPuppetPower:
               this.selfData = _loc2_.allServerPuppetPower;
         }
      }
      
      private function onCmd_GetRankList_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:Dto_GuildFubenStageDamage = null;
         var _loc2_:Cmd_GetRankList_SC = param1.socketData as Cmd_GetRankList_SC;
         this.m_totalCount = _loc2_.ranknum;
         switch(_loc2_.ranktype)
         {
            case E_RankType.E_RankType_GuildFightPower:
               this.rankData = _loc2_.guildfightpower;
               break;
            case E_RankType.E_RankType_RoleAchievement:
               this.rankData = _loc2_.roleachievement;
               break;
            case E_RankType.E_RankType_RoleFightPower:
               this.rankData = _loc2_.rolefightpower;
               break;
            case E_RankType.E_RankType_ScrewUpStage:
               this.rankData = _loc2_.screwupstage;
               break;
            case E_RankType.E_RankType_NewScrewUpStage:
               this.rankData = _loc2_.newscrewupstage;
               break;
            case E_RankType.E_RankType_RankArena:
               this.rankData = _loc2_.rankArena;
               break;
            case E_RankType.E_RankType_AllServerRankArena:
               this.rankData = _loc2_.allServerRankArena;
               break;
            case E_RankType.E_RankType_PlantStar:
               this.rankData = _loc2_.roleplantstar;
               break;
            case E_RankType.E_RankType_GuildFubenSingleDamage:
               this.rankData = _loc2_.guildFubenSingleDamage;
               break;
            case E_RankType.E_RankType_GuildFubenTotalDamage:
               this.rankData = _loc2_.guildFubenTotalDamage;
               break;
            case E_RankType.E_RankType_GuildFubenUsedTime:
               this.rankData = _loc2_.guildFubenUsedTime;
               break;
            case E_RankType.E_RankType_GuildFubenStageDamage:
               this.rankData = _loc2_.guildFubenStageDamage;
               this.selfData = null;
               for each(_loc3_ in _loc2_.guildFubenStageDamage)
               {
                  if(_loc3_.roleid.compare(this.actorModel.roleId))
                  {
                     this.selfData = _loc3_;
                     break;
                  }
               }
               break;
            case E_RankType.E_RankType_GuildFubenStageTime:
               this.rankData = _loc2_.guildFubenStageTime;
               this.selfData = null;
               for each(_loc3_ in _loc2_.guildFubenStageDamage)
               {
                  if(_loc3_.roleid.compare(this.actorModel.roleId))
                  {
                     this.selfData = _loc3_;
                     break;
                  }
               }
               break;
            case E_RankType.E_RankType_AllServerRolePower:
               this.rankData = _loc2_.allServerRolePower;
               break;
            case E_RankType.E_RankType_AllServerNewScrewUp:
               this.rankData = _loc2_.allServerNewScrewUp;
               break;
            case E_RankType.E_RankType_AllServerNoEndFuben:
               this.rankData = _loc2_.allServerNoEndFuben;
               break;
            case E_RankType.E_RankType_AllServerPuppetPower:
               this.rankData = _loc2_.allServerPuppetPower;
         }
      }
      
      public function get rankList() : Vector.<RankRecordVO>
      {
         return this.m_vecRecord;
      }
      
      public function get selfRank() : RankRecordVO
      {
         return this.m_selfRecord;
      }
      
      public function get totalCount() : int
      {
         return this.m_totalCount;
      }
      
      private function set selfData(param1:Object) : void
      {
         if(param1)
         {
            this.m_selfRecord.dto = param1;
         }
         else
         {
            this.m_selfRecord.reset();
            this.m_selfRecord.setData(RankGlobal.PROPERTY_INDEX,-1);
         }
         this.dispatch(new CommonEvent(RankGlobal.EVENT_RANK_SELF_UPDATE));
      }
      
      private function set rankData(param1:Array) : void
      {
         var _loc3_:RankRecordVO = null;
         var _loc2_:int = param1.length;
         var _loc4_:int = 0;
         while(_loc4_ < RankGlobal.PAGE_BOUNDS)
         {
            _loc3_ = this.m_vecRecord[_loc4_];
            _loc3_.reset();
            if(_loc4_ < _loc2_)
            {
               _loc3_.dto = param1[_loc4_];
            }
            _loc4_++;
         }
         this.dispatch(new CommonEvent(RankGlobal.EVENT_RANK_LIST_UPDATE));
      }
   }
}
