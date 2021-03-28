package com.qq.modules.commEmbattle.command
{
   import PVZ.Cmd.Cmd_AllServerRankArena_GetAttackFormation_CS;
   import PVZ.Cmd.Cmd_AllServerRankArena_GetDefendFormation_CS;
   import PVZ.Cmd.Cmd_Arena_GetFormation_CS;
   import PVZ.Cmd.Cmd_ExpeditionFight_GetFormation_CS;
   import PVZ.Cmd.Cmd_GeneTest_GetFormation_CS;
   import PVZ.Cmd.Cmd_Guard_GetFormation_CS;
   import PVZ.Cmd.Cmd_Guard_GetGuardFormation_CS;
   import PVZ.Cmd.Cmd_GuildFight_GetFormation_CS;
   import PVZ.Cmd.Cmd_GuildFuben_GetFormation_CS;
   import PVZ.Cmd.Cmd_Melee_GetFormation_CS;
   import PVZ.Cmd.Cmd_NewScrewUp_GetFormation_CS;
   import PVZ.Cmd.Cmd_NewZombieIsland_GetFormation_CS;
   import PVZ.Cmd.Cmd_NoEndFuben_GetFormation_CS;
   import PVZ.Cmd.Cmd_PlantTest_GetFormation_CS;
   import PVZ.Cmd.Cmd_PuppetFuben_GetFormation_CS;
   import PVZ.Cmd.Cmd_RankArena_GetBattleFormation_CS;
   import PVZ.Cmd.Cmd_RankArena_GetDefenseFormation_CS;
   import PVZ.Cmd.Cmd_ScrewUp_GetFormation_CS;
   import PVZ.Cmd.Cmd_TopFight_GetFormation_CS;
   import PVZ.Cmd.Cmd_Treasure_GetSearchFormation_CS;
   import PVZ.Cmd.Cmd_Treasure_GetSeizeFormation_CS;
   import PVZ.Cmd.Cmd_WorldBoss_GetFormation_CS;
   import PVZ.Cmd.Cmd_ZombieIsland_GetFormation_CS;
   import com.qq.GameGloble;
   import com.qq.modules.embattle.constant.EmbattleConst;
   import com.qq.modules.embattle.model.EmbattleModel;
   import com.qq.modules.login.service.LoginService;
   import com.qq.modules.main.server.PvzSocketService;
   import com.tencent.protobuf.Message;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class CommEmbattleProxyCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var pvzService:PvzSocketService;
      
      [Inject]
      public var loginService:LoginService;
      
      public function CommEmbattleProxyCommand()
      {
         super();
      }
      
      public function getlineupFormation() : void
      {
         var _loc1_:Message = null;
         switch(EmbattleModel.getInstance().embattleMode)
         {
            case EmbattleConst.MODE_TRIAL_ROAD_NORMAL:
               _loc1_ = new Cmd_ScrewUp_GetFormation_CS();
               break;
            case EmbattleConst.MODE_TRIAL_ROAD_HARD:
               _loc1_ = new Cmd_NewScrewUp_GetFormation_CS();
               break;
            case EmbattleConst.MODE_LADDER:
               _loc1_ = new Cmd_RankArena_GetBattleFormation_CS();
               break;
            case EmbattleConst.MODE_UNION_FUBEN:
               GameGloble.actorModel.battleCardModel.changeFormationTeamId(EmbattleConst.MODE_UNION_FUBEN,0);
               _loc1_ = new Cmd_GuildFuben_GetFormation_CS();
               break;
            case EmbattleConst.MODE_ZOMBIE_ISLAND:
               _loc1_ = new Cmd_ZombieIsland_GetFormation_CS();
               break;
            case EmbattleConst.MODE_NOENDFUBEN:
               _loc1_ = new Cmd_NoEndFuben_GetFormation_CS();
               break;
            case EmbattleConst.MODE_SuperArena_Attack:
               _loc1_ = new Cmd_AllServerRankArena_GetAttackFormation_CS();
               break;
            case EmbattleConst.MODE_SuperArena_Defence:
               _loc1_ = new Cmd_AllServerRankArena_GetDefendFormation_CS();
               break;
            case EmbattleConst.MODE_ZOMBIE_ADV_ISLAND:
               _loc1_ = new Cmd_NewZombieIsland_GetFormation_CS();
               break;
            case EmbattleConst.MODE_WORLD_BOSS:
               _loc1_ = new Cmd_WorldBoss_GetFormation_CS();
               break;
            case EmbattleConst.MODE_PLANT_TEST:
               _loc1_ = new Cmd_PlantTest_GetFormation_CS();
               break;
            case EmbattleConst.MODE_HOLE_ATK:
               _loc1_ = new Cmd_Guard_GetFormation_CS();
               break;
            case EmbattleConst.MODE_CARDDNA_TEST:
               _loc1_ = new Cmd_GeneTest_GetFormation_CS();
               break;
            case EmbattleConst.MODE_DUMMY_FUBEN:
               _loc1_ = new Cmd_PuppetFuben_GetFormation_CS();
               break;
            case EmbattleConst.MODE_HOME:
            case EmbattleConst.MODE_MAP:
               this.loginService.getPlayerBattleCardInfo();
               break;
            case EmbattleConst.MODE_ARENA:
               _loc1_ = new Cmd_Arena_GetFormation_CS();
               break;
            case EmbattleConst.MODE_TREASURE_SEARCH:
               _loc1_ = new Cmd_Treasure_GetSearchFormation_CS();
               break;
            case EmbattleConst.MODE_TREASURE_SNATCH:
               _loc1_ = new Cmd_Treasure_GetSeizeFormation_CS();
               break;
            case EmbattleConst.MODE_LADDER_DEF:
               _loc1_ = new Cmd_RankArena_GetDefenseFormation_CS();
               break;
            case EmbattleConst.MODE_FUZION:
               _loc1_ = new Cmd_Melee_GetFormation_CS();
               break;
            case EmbattleConst.MODE_UNION_COMPETITION:
               _loc1_ = new Cmd_GuildFight_GetFormation_CS();
               break;
            case EmbattleConst.MODE_HOLE_DEF:
               _loc1_ = new Cmd_Guard_GetGuardFormation_CS();
               break;
            case EmbattleConst.MODE_TOP_KING:
               _loc1_ = new Cmd_TopFight_GetFormation_CS();
               break;
            case EmbattleConst.MODE_EXPEDITION:
               _loc1_ = new Cmd_ExpeditionFight_GetFormation_CS();
         }
         if(_loc1_)
         {
            this.pvzService.sendMessage(_loc1_);
         }
      }
   }
}
