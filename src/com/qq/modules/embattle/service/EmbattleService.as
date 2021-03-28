package com.qq.modules.embattle.service
{
   import PVZ.Cmd.Cmd_AllServerRankArena_GetDefendFormation_SC;
   import PVZ.Cmd.Cmd_AllServerRankArena_SetDefendFormation_CS;
   import PVZ.Cmd.Cmd_Arena_GetFormation_SC;
   import PVZ.Cmd.Cmd_Arena_SetFormation_CS;
   import PVZ.Cmd.Cmd_Battle_CancelDefendTeam_CS;
   import PVZ.Cmd.Cmd_Battle_GetAutoRestoreDefenceTeamHealthHp_CS;
   import PVZ.Cmd.Cmd_Battle_GetAutoRestoreDefenceTeamHealthHp_SC;
   import PVZ.Cmd.Cmd_Battle_SeeNewFormationPos_CS;
   import PVZ.Cmd.Cmd_Battle_SetAutoRestoreDefenceTeamHealthHp_CS;
   import PVZ.Cmd.Cmd_Battle_SetAutoRestoreDefenceTeamHealthHp_SC;
   import PVZ.Cmd.Cmd_Battle_SetDefaultTeam_CS;
   import PVZ.Cmd.Cmd_Battle_SetDefaultTeam_SC;
   import PVZ.Cmd.Cmd_Battle_SetDefendTeam_CS;
   import PVZ.Cmd.Cmd_Battle_SetFormation_CS;
   import PVZ.Cmd.Cmd_ExpeditionFight_SetFormation_CS;
   import PVZ.Cmd.Cmd_ExpeditionFight_SyncFormation_SC;
   import PVZ.Cmd.Cmd_GeneTest_SetFormation_CS;
   import PVZ.Cmd.Cmd_Guard_SetGuardFormation_CS;
   import PVZ.Cmd.Cmd_Guard_SyncGuardFormation_SC;
   import PVZ.Cmd.Cmd_GuildFight_GetFormation_SC;
   import PVZ.Cmd.Cmd_GuildFight_SetFormation_CS;
   import PVZ.Cmd.Cmd_Melee_GetFormation_SC;
   import PVZ.Cmd.Cmd_Melee_SetFormation_CS;
   import PVZ.Cmd.Cmd_Mine_SetOutTeam_SC;
   import PVZ.Cmd.Cmd_PlantTest_SetFormation_CS;
   import PVZ.Cmd.Cmd_PuppetFuben_SetFormation_CS;
   import PVZ.Cmd.Cmd_RankArena_GetDefenseFormation_SC;
   import PVZ.Cmd.Cmd_RankArena_SetDefenseFormation_CS;
   import PVZ.Cmd.Cmd_Temple_SetOut_SC;
   import PVZ.Cmd.Cmd_TopFight_SetFormation_CS;
   import PVZ.Cmd.Cmd_TopFight_SyncFormation_SC;
   import PVZ.Cmd.Cmd_Treasure_GetSearchFormation_SC;
   import PVZ.Cmd.Cmd_Treasure_GetSeizeFormation_SC;
   import PVZ.Cmd.Cmd_Treasure_SetSearchFormation_CS;
   import PVZ.Cmd.Cmd_Treasure_SetSeizeFormation_CS;
   import PVZ.Cmd.Cmd_War_PreSetOut_CS;
   import PVZ.Cmd.Cmd_War_PreSetOut_SC;
   import PVZ.Cmd.Cmd_War_RecoverHp_CS;
   import PVZ.Cmd.Cmd_War_SetOut_CS;
   import PVZ.Cmd.Cmd_War_SetOut_SC;
   import PVZ.Cmd.Cmd_ZombieIsland_SyncFormation_SC;
   import PVZ.Cmd.Dto_CardPosInfo;
   import PVZ.Cmd.Dto_FormationInfo;
   import PVZ.Cmd.Dto_WorldMap_Pos;
   import PVZ.Cmd.E_WarType;
   import PVZ.Cmd.SetoutTimesType;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.battleLineup.constant.BattleLineupConst;
   import com.qq.modules.card.model.vo.CardItemVO;
   import com.qq.modules.commEmbattle.command.CommEmbattleProxyCmd;
   import com.qq.modules.embattle.constant.EmbattleConst;
   import com.qq.modules.embattle.model.EmbattleModel;
   import com.qq.modules.exped.command.ExpedProxyCmd;
   import com.qq.modules.login.service.LoginService;
   import com.qq.modules.main.model.vo.BattleCardFormationVO;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.mine.command.MineProxyCmd;
   import com.qq.modules.temple.command.TempleProxyCmd;
   import com.qq.utils.CommandDispatcher;
   import com.tencent.protobuf.Int64;
   import flash.events.Event;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class EmbattleService extends BasicProxy
   {
       
      
      [Inject]
      public var pvzServer:PvzSocketService;
      
      [Inject]
      public var loginService:LoginService;
      
      public function EmbattleService()
      {
         super();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_Battle_SetDefaultTeam_SC.$MessageID,this.cmdHandler],[Cmd_War_PreSetOut_SC.$MessageID,this.cmdHandler],[Cmd_War_SetOut_SC.$MessageID,this.cmdHandler],[Cmd_Arena_GetFormation_SC.$MessageID,this.cmdHandler],[Cmd_Mine_SetOutTeam_SC.$MessageID,this.cmdHandler],[Cmd_ZombieIsland_SyncFormation_SC.$MessageID,this.cmdHandler],[Cmd_Treasure_GetSearchFormation_SC.$MessageID,this.cmdHandler],[Cmd_Treasure_GetSeizeFormation_SC.$MessageID,this.cmdHandler],[Cmd_RankArena_GetDefenseFormation_SC.$MessageID,this.cmdHandler],[Cmd_Melee_GetFormation_SC.$MessageID,this.cmdHandler],[Cmd_Battle_SetAutoRestoreDefenceTeamHealthHp_SC.$MessageID,this.cmdHandler],[Cmd_Battle_GetAutoRestoreDefenceTeamHealthHp_SC.$MessageID,this.cmdHandler],[Cmd_Guard_SyncGuardFormation_SC.$MessageID,this.cmdHandler],[Cmd_GuildFight_GetFormation_SC.$MessageID,this.cmdHandler],[Cmd_TopFight_SyncFormation_SC.$MessageID,this.cmdHandler],[Cmd_ExpeditionFight_SyncFormation_SC.$MessageID,this.cmdHandler],[Cmd_AllServerRankArena_GetDefendFormation_SC.$MessageID,this.cmdHandler]];
      }
      
      private function cmdHandler(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Arena_GetFormation_SC = null;
         var _loc3_:Cmd_Treasure_GetSearchFormation_SC = null;
         var _loc4_:Cmd_Treasure_GetSeizeFormation_SC = null;
         var _loc5_:Cmd_Guard_SyncGuardFormation_SC = null;
         var _loc6_:Cmd_RankArena_GetDefenseFormation_SC = null;
         var _loc7_:Cmd_Melee_GetFormation_SC = null;
         var _loc8_:Cmd_Battle_GetAutoRestoreDefenceTeamHealthHp_SC = null;
         var _loc9_:Cmd_Battle_SetAutoRestoreDefenceTeamHealthHp_SC = null;
         var _loc10_:Cmd_GuildFight_GetFormation_SC = null;
         var _loc11_:Cmd_TopFight_SyncFormation_SC = null;
         var _loc12_:Cmd_ExpeditionFight_SyncFormation_SC = null;
         var _loc13_:Cmd_AllServerRankArena_GetDefendFormation_SC = null;
         var _loc14_:Cmd_War_PreSetOut_SC = null;
         var _loc15_:Cmd_Battle_SetDefaultTeam_SC = null;
         switch(param1.type)
         {
            case Cmd_War_PreSetOut_SC.$MessageID:
               _loc14_ = param1.socketData as Cmd_War_PreSetOut_SC;
               EmbattleModel.getInstance().warTimeCost = _loc14_.period;
               eventDispatcher.dispatchEvent(new Event(EmbattleConst.EMBATTLE_WAR_TIME_UPDATE));
               break;
            case Cmd_War_SetOut_SC.$MessageID:
               ExpedProxyCmd.queryTimes(SetoutTimesType.SetoutTimesType_City);
            case Cmd_Mine_SetOutTeam_SC.$MessageID:
            case Cmd_Temple_SetOut_SC.$MessageID:
               eventDispatcher.dispatchEvent(new Event(EmbattleConst.EMBATTLE_WAR_STARTED));
               break;
            case Cmd_Battle_SetDefaultTeam_SC.$MessageID:
               _loc15_ = param1.socketData as Cmd_Battle_SetDefaultTeam_SC;
               eventDispatcher.dispatchEvent(new Event(BattleLineupConst.LINEUP_UPDATE));
               break;
            case Cmd_Arena_GetFormation_SC.$MessageID:
               _loc2_ = param1.socketData as Cmd_Arena_GetFormation_SC;
               GameGloble.actorModel.battleCardModel.setFormationInfo(EmbattleConst.MODE_ARENA,_loc2_.formation);
               eventDispatcher.dispatchEvent(new Event(BattleLineupConst.LINEUP_UPDATE));
               break;
            case Cmd_Treasure_GetSearchFormation_SC.$MessageID:
               _loc3_ = param1.socketData as Cmd_Treasure_GetSearchFormation_SC;
               GameGloble.actorModel.battleCardModel.updateFormationTeams(EmbattleConst.MODE_TREASURE_SEARCH,_loc3_.formationInfo);
               GameGloble.actorModel.battleCardModel.searchUseArr = _loc3_.cardUsedCount;
               eventDispatcher.dispatchEvent(new Event(BattleLineupConst.LINEUP_UPDATE));
               break;
            case Cmd_Treasure_GetSeizeFormation_SC.$MessageID:
               _loc4_ = param1.socketData as Cmd_Treasure_GetSeizeFormation_SC;
               GameGloble.actorModel.battleCardModel.updateFormationTeams(EmbattleConst.MODE_TREASURE_SNATCH,_loc4_.formationInfo);
               GameGloble.actorModel.battleCardModel.snatchUseArr = _loc4_.cardUsedCount;
               eventDispatcher.dispatchEvent(new Event(BattleLineupConst.LINEUP_UPDATE));
               break;
            case Cmd_Guard_SyncGuardFormation_SC.$MessageID:
               (_loc5_ = param1.socketData as Cmd_Guard_SyncGuardFormation_SC).formation = this.checkCardInLineup(_loc5_.formation);
               GameGloble.actorModel.battleCardModel.setFormationInfo(EmbattleConst.MODE_HOLE_DEF,_loc5_.formation);
               EmbattleModel.getInstance().historyLineupIndex = _loc5_.index;
               eventDispatcher.dispatchEvent(new Event(BattleLineupConst.LINEUP_UPDATE));
               break;
            case Cmd_RankArena_GetDefenseFormation_SC.$MessageID:
               _loc6_ = param1.socketData as Cmd_RankArena_GetDefenseFormation_SC;
               GameGloble.actorModel.battleCardModel.setFormationInfo(EmbattleConst.MODE_LADDER_DEF,_loc6_.formation);
               eventDispatcher.dispatchEvent(new Event(BattleLineupConst.LINEUP_UPDATE));
               break;
            case Cmd_Melee_GetFormation_SC.$MessageID:
               _loc7_ = param1.socketData as Cmd_Melee_GetFormation_SC;
               GameGloble.actorModel.battleCardModel.updateFormationTeams(EmbattleConst.MODE_FUZION,_loc7_.formation);
               eventDispatcher.dispatchEvent(new Event(BattleLineupConst.LINEUP_UPDATE));
               break;
            case Cmd_Battle_GetAutoRestoreDefenceTeamHealthHp_SC.$MessageID:
               _loc8_ = param1.socketData as Cmd_Battle_GetAutoRestoreDefenceTeamHealthHp_SC;
               CommandDispatcher.send(EmbattleConst.EMBATTLE_AUTO_FIX_HP_CHANGE,[_loc8_.healthLimit,_loc8_.open]);
               break;
            case Cmd_Battle_SetAutoRestoreDefenceTeamHealthHp_SC.$MessageID:
               _loc9_ = param1.socketData as Cmd_Battle_SetAutoRestoreDefenceTeamHealthHp_SC;
               CommandDispatcher.send(EmbattleConst.EMBATTLE_AUTO_FIX_HP_CHANGE,[_loc9_.healthLimit,_loc9_.open]);
               break;
            case Cmd_GuildFight_GetFormation_SC.$MessageID:
               _loc10_ = param1.socketData as Cmd_GuildFight_GetFormation_SC;
               GameGloble.actorModel.battleCardModel.updateFormationTeams(EmbattleConst.MODE_UNION_COMPETITION,_loc10_.formation);
               eventDispatcher.dispatchEvent(new Event(BattleLineupConst.LINEUP_UPDATE));
               break;
            case Cmd_TopFight_SyncFormation_SC.$MessageID:
               (_loc11_ = param1.socketData as Cmd_TopFight_SyncFormation_SC).formation = this.checkCardInLineup(_loc11_.formation);
               GameGloble.actorModel.battleCardModel.setFormationInfo(EmbattleConst.MODE_TOP_KING,_loc11_.formation);
               eventDispatcher.dispatchEvent(new Event(BattleLineupConst.LINEUP_UPDATE));
               break;
            case Cmd_ExpeditionFight_SyncFormation_SC.$MessageID:
               (_loc12_ = param1.socketData as Cmd_ExpeditionFight_SyncFormation_SC).formation = this.checkCardInLineup(_loc12_.formation);
               if(_loc12_.cityId != 0)
               {
                  GameGloble.expeditionTargetCityType = _loc12_.cityId;
               }
               GameGloble.actorModel.battleCardModel.setFormationInfo(EmbattleConst.MODE_EXPEDITION,_loc12_.formation);
               eventDispatcher.dispatchEvent(new Event(BattleLineupConst.LINEUP_UPDATE));
               break;
            case Cmd_AllServerRankArena_GetDefendFormation_SC.$MessageID:
               (_loc13_ = param1.socketData as Cmd_AllServerRankArena_GetDefendFormation_SC).formation = this.checkCardInLineup(_loc13_.formation);
               GameGloble.actorModel.battleCardModel.setFormationInfo(EmbattleConst.MODE_SuperArena_Defence,_loc13_.formation);
               eventDispatcher.dispatchEvent(new Event(BattleLineupConst.LINEUP_UPDATE));
         }
      }
      
      public function removeNewFormationPos() : void
      {
         var _loc1_:Cmd_Battle_SeeNewFormationPos_CS = null;
         if(GameGloble.actorModel.hasNewFormationPos)
         {
            _loc1_ = new Cmd_Battle_SeeNewFormationPos_CS();
            this.pvzServer.sendMessage(_loc1_);
            GameGloble.actorModel.hasNewFormationPos = false;
            CommandDispatcher.send(CommandName.ChangeFormation);
         }
      }
      
      private function checkCardInLineup(param1:Dto_FormationInfo) : Dto_FormationInfo
      {
         var _loc5_:Dto_CardPosInfo = null;
         var _loc6_:Boolean = false;
         var _loc7_:BattleCardFormationVO = null;
         var _loc8_:Dto_CardPosInfo = null;
         var _loc2_:Vector.<BattleCardFormationVO> = GameGloble.actorModel.battleCardModel.getEmbattleTeam(EmbattleModel.getInstance().embattleMode);
         var _loc3_:Array = new Array();
         var _loc4_:Int64 = param1.leaderUid;
         for each(_loc5_ in param1.cardPos)
         {
            _loc6_ = true;
            for each(_loc7_ in _loc2_)
            {
               if(_loc7_.hasCardByUid(_loc5_.uid))
               {
                  _loc6_ = false;
                  if(param1.leaderUid.compare(_loc5_.uid))
                  {
                     _loc4_ = null;
                  }
                  break;
               }
            }
            if(_loc6_)
            {
               _loc3_.push(_loc5_);
            }
         }
         if(_loc4_ == null && _loc3_.length > 0)
         {
            _loc4_ = (_loc8_ = _loc3_[0]).uid;
         }
         param1.cardPos = _loc3_;
         param1.leaderUid = _loc4_;
         if(_loc4_ != null)
         {
            param1.teamId = _loc4_.high;
         }
         return param1;
      }
      
      public function setLineup(param1:CardItemVO, param2:int, param3:Int64 = null, param4:uint = 0) : int
      {
         var _loc7_:Cmd_Arena_SetFormation_CS = null;
         var _loc8_:Cmd_Treasure_SetSearchFormation_CS = null;
         var _loc9_:Cmd_Treasure_SetSeizeFormation_CS = null;
         var _loc10_:Cmd_RankArena_SetDefenseFormation_CS = null;
         var _loc11_:Cmd_Melee_SetFormation_CS = null;
         var _loc12_:Cmd_GuildFight_SetFormation_CS = null;
         var _loc13_:Cmd_PlantTest_SetFormation_CS = null;
         var _loc14_:Cmd_Guard_SetGuardFormation_CS = null;
         var _loc15_:Cmd_TopFight_SetFormation_CS = null;
         var _loc16_:Cmd_ExpeditionFight_SetFormation_CS = null;
         var _loc17_:Cmd_GeneTest_SetFormation_CS = null;
         var _loc18_:Cmd_PuppetFuben_SetFormation_CS = null;
         var _loc19_:Cmd_AllServerRankArena_SetDefendFormation_CS = null;
         var _loc20_:Cmd_Battle_SetFormation_CS = null;
         var _loc5_:Dto_FormationInfo;
         if(!(_loc5_ = GameGloble.cloneBattleFormation(GameGloble.actorModel.battleCardModel.getTargetVo(EmbattleModel.getInstance().embattleMode).dto)))
         {
            return 5;
         }
         var _loc6_:BattleCardFormationVO = new BattleCardFormationVO(_loc5_);
         _loc5_.formationId = param4;
         _loc6_.updateCardPos(param1.uid,param2);
         if(param3)
         {
            _loc5_.leaderUid = param3;
         }
         if(!_loc6_.isMatchRule)
         {
            return 3;
         }
         if(!_loc6_.getCardByUid(_loc5_.leaderUid))
         {
            if(_loc6_.cardNum != 0)
            {
               _loc5_.leaderUid = _loc6_.getCardByIndex(0).uid;
            }
            else
            {
               _loc5_.leaderUid = Int64.fromNumber(0);
            }
         }
         if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_ARENA)
         {
            (_loc7_ = new Cmd_Arena_SetFormation_CS()).formation = _loc5_;
            _loc7_.formation.teamId = 0;
            this.pvzServer.sendMessage(_loc7_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_TREASURE_SEARCH)
         {
            if(GameGloble.actorModel.battleCardModel.searchTeamIsUsed(GameGloble.actorModel.battleCardModel.getFormationTeamId(EmbattleConst.MODE_TREASURE_SEARCH)))
            {
               return 2;
            }
            (_loc8_ = new Cmd_Treasure_SetSearchFormation_CS()).formationInfo = _loc5_;
            _loc8_.formationInfo.teamId = _loc6_.teamId;
            this.pvzServer.sendMessage(_loc8_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_TREASURE_SNATCH)
         {
            if(GameGloble.actorModel.battleCardModel.snatchTeamIsUsed(GameGloble.actorModel.battleCardModel.getFormationTeamId(EmbattleConst.MODE_TREASURE_SNATCH)))
            {
               return 2;
            }
            (_loc9_ = new Cmd_Treasure_SetSeizeFormation_CS()).formationInfo = _loc5_;
            _loc9_.formationInfo.teamId = _loc6_.teamId;
            this.pvzServer.sendMessage(_loc9_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_LADDER_DEF)
         {
            (_loc10_ = new Cmd_RankArena_SetDefenseFormation_CS()).formation = _loc5_;
            _loc10_.formation.teamId = _loc6_.teamId;
            this.pvzServer.sendMessage(_loc10_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_FUZION)
         {
            (_loc11_ = new Cmd_Melee_SetFormation_CS()).formation = _loc5_;
            _loc11_.formation.teamId = _loc6_.teamId;
            this.pvzServer.sendMessage(_loc11_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_UNION_COMPETITION)
         {
            (_loc12_ = new Cmd_GuildFight_SetFormation_CS()).formation = _loc5_;
            _loc12_.formation.teamId = _loc6_.teamId;
            this.pvzServer.sendMessage(_loc12_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_PLANT_TEST)
         {
            (_loc13_ = new Cmd_PlantTest_SetFormation_CS()).formation = _loc5_;
            this.pvzServer.sendMessage(_loc13_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_HOLE_DEF)
         {
            (_loc14_ = new Cmd_Guard_SetGuardFormation_CS()).formation = _loc5_;
            _loc14_.index = EmbattleModel.getInstance().historyLineupIndex;
            this.pvzServer.sendMessage(_loc14_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_TOP_KING)
         {
            (_loc15_ = new Cmd_TopFight_SetFormation_CS()).formation = _loc5_;
            this.pvzServer.sendMessage(_loc15_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_EXPEDITION)
         {
            (_loc16_ = new Cmd_ExpeditionFight_SetFormation_CS()).formation = _loc5_;
            _loc16_.cityId = GameGloble.expeditionTargetCityType;
            this.pvzServer.sendMessage(_loc16_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_CARDDNA_TEST)
         {
            (_loc17_ = new Cmd_GeneTest_SetFormation_CS()).formation = _loc5_;
            this.pvzServer.sendMessage(_loc17_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_DUMMY_FUBEN)
         {
            (_loc18_ = new Cmd_PuppetFuben_SetFormation_CS()).formation = _loc5_;
            this.pvzServer.sendMessage(_loc18_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_SuperArena_Defence)
         {
            (_loc19_ = new Cmd_AllServerRankArena_SetDefendFormation_CS()).formation = _loc5_;
            this.pvzServer.sendMessage(_loc19_);
         }
         else
         {
            (_loc20_ = new Cmd_Battle_SetFormation_CS()).formation = _loc5_;
            _loc20_.formation.teamId = _loc6_.teamId;
            this.pvzServer.sendMessage(_loc20_);
         }
         return 1;
      }
      
      public function setLeader(param1:Int64) : void
      {
         var _loc3_:Cmd_Arena_SetFormation_CS = null;
         var _loc4_:Cmd_Treasure_SetSearchFormation_CS = null;
         var _loc5_:Cmd_Treasure_SetSeizeFormation_CS = null;
         var _loc6_:Cmd_RankArena_SetDefenseFormation_CS = null;
         var _loc7_:Cmd_Melee_SetFormation_CS = null;
         var _loc8_:Cmd_GuildFight_SetFormation_CS = null;
         var _loc9_:Cmd_PlantTest_SetFormation_CS = null;
         var _loc10_:Cmd_Guard_SetGuardFormation_CS = null;
         var _loc11_:Cmd_TopFight_SetFormation_CS = null;
         var _loc12_:Cmd_ExpeditionFight_SetFormation_CS = null;
         var _loc13_:Cmd_GeneTest_SetFormation_CS = null;
         var _loc14_:Cmd_PuppetFuben_SetFormation_CS = null;
         var _loc15_:Cmd_AllServerRankArena_SetDefendFormation_CS = null;
         var _loc16_:Cmd_Battle_SetFormation_CS = null;
         if(!param1)
         {
            return;
         }
         GameGloble.actorModel.battleCardModel.getTargetVo(EmbattleModel.getInstance().embattleMode).dto.leaderUid = param1;
         if(!GameGloble.actorModel.battleCardModel.getTargetVo(EmbattleModel.getInstance().embattleMode).getCardByUid(GameGloble.actorModel.battleCardModel.getTargetVo(EmbattleModel.getInstance().embattleMode).dto.leaderUid))
         {
            GameGloble.actorModel.battleCardModel.getTargetVo(EmbattleModel.getInstance().embattleMode).dto.leaderUid = GameGloble.actorModel.battleCardModel.getTargetVo(EmbattleModel.getInstance().embattleMode).getCardByIndex(0).uid;
         }
         var _loc2_:Dto_FormationInfo = new Dto_FormationInfo();
         _loc2_.formationId = 0;
         _loc2_.leaderUid = GameGloble.actorModel.battleCardModel.getTargetVo(EmbattleModel.getInstance().embattleMode).dto.leaderUid;
         _loc2_.cardPos = GameGloble.actorModel.battleCardModel.getTargetVo(EmbattleModel.getInstance().embattleMode).dto.cardPos;
         _loc2_.teamId = GameGloble.actorModel.battleCardModel.getTargetVo(EmbattleModel.getInstance().embattleMode).teamId;
         if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_ARENA)
         {
            _loc3_ = new Cmd_Arena_SetFormation_CS();
            _loc3_.formation = _loc2_;
            this.pvzServer.sendMessage(_loc3_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_TREASURE_SEARCH)
         {
            (_loc4_ = new Cmd_Treasure_SetSearchFormation_CS()).formationInfo = _loc2_;
            this.pvzServer.sendMessage(_loc4_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_TREASURE_SNATCH)
         {
            (_loc5_ = new Cmd_Treasure_SetSeizeFormation_CS()).formationInfo = _loc2_;
            this.pvzServer.sendMessage(_loc5_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_LADDER_DEF)
         {
            (_loc6_ = new Cmd_RankArena_SetDefenseFormation_CS()).formation = _loc2_;
            this.pvzServer.sendMessage(_loc6_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_FUZION)
         {
            (_loc7_ = new Cmd_Melee_SetFormation_CS()).formation = _loc2_;
            this.pvzServer.sendMessage(_loc7_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_UNION_COMPETITION)
         {
            (_loc8_ = new Cmd_GuildFight_SetFormation_CS()).formation = _loc2_;
            this.pvzServer.sendMessage(_loc8_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_PLANT_TEST)
         {
            (_loc9_ = new Cmd_PlantTest_SetFormation_CS()).formation = _loc2_;
            this.pvzServer.sendMessage(_loc9_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_HOLE_DEF)
         {
            (_loc10_ = new Cmd_Guard_SetGuardFormation_CS()).formation = _loc2_;
            _loc10_.index = EmbattleModel.getInstance().historyLineupIndex;
            this.pvzServer.sendMessage(_loc10_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_TOP_KING)
         {
            (_loc11_ = new Cmd_TopFight_SetFormation_CS()).formation = _loc2_;
            this.pvzServer.sendMessage(_loc11_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_EXPEDITION)
         {
            (_loc12_ = new Cmd_ExpeditionFight_SetFormation_CS()).formation = _loc2_;
            this.pvzServer.sendMessage(_loc12_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_CARDDNA_TEST)
         {
            _loc13_ = new Cmd_GeneTest_SetFormation_CS();
            _loc9_.formation = _loc2_;
            this.pvzServer.sendMessage(_loc13_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_DUMMY_FUBEN)
         {
            (_loc14_ = new Cmd_PuppetFuben_SetFormation_CS()).formation = _loc2_;
            this.pvzServer.sendMessage(_loc14_);
         }
         else if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_SuperArena_Defence)
         {
            (_loc15_ = new Cmd_AllServerRankArena_SetDefendFormation_CS()).formation = _loc2_;
            this.pvzServer.sendMessage(_loc15_);
         }
         else
         {
            (_loc16_ = new Cmd_Battle_SetFormation_CS()).formation = _loc2_;
            this.pvzServer.sendMessage(_loc16_);
         }
      }
      
      public function setDefendTeam(param1:uint) : void
      {
         var _loc2_:Cmd_Battle_SetDefendTeam_CS = new Cmd_Battle_SetDefendTeam_CS();
         _loc2_.teamId = param1;
         this.pvzServer.sendMessage(_loc2_);
      }
      
      public function cancelDefendTeam(param1:uint) : void
      {
         var _loc2_:Cmd_Battle_CancelDefendTeam_CS = new Cmd_Battle_CancelDefendTeam_CS();
         _loc2_.teamId = param1;
         this.pvzServer.sendMessage(_loc2_);
      }
      
      public function setAutoFixHp(param1:int, param2:Boolean) : void
      {
         var _loc3_:Cmd_Battle_SetAutoRestoreDefenceTeamHealthHp_CS = new Cmd_Battle_SetAutoRestoreDefenceTeamHealthHp_CS();
         _loc3_.healthLimit = param1;
         _loc3_.open = param2;
         this.pvzServer.sendMessage(_loc3_);
      }
      
      public function getAutoFixHp() : void
      {
         var _loc1_:Cmd_Battle_GetAutoRestoreDefenceTeamHealthHp_CS = new Cmd_Battle_GetAutoRestoreDefenceTeamHealthHp_CS();
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function setDefaultFormation(param1:uint) : void
      {
         var _loc2_:Cmd_Battle_SetDefaultTeam_CS = new Cmd_Battle_SetDefaultTeam_CS();
         _loc2_.teamId = param1;
         this.pvzServer.sendMessage(_loc2_);
      }
      
      public function preWar() : void
      {
         var _loc1_:Cmd_War_PreSetOut_CS = new Cmd_War_PreSetOut_CS();
         _loc1_.targetPos = new Dto_WorldMap_Pos();
         _loc1_.targetPos.posX = EmbattleModel.getInstance().mapTargetPoint.x;
         _loc1_.targetPos.posY = EmbattleModel.getInstance().mapTargetPoint.y;
         _loc1_.type = EmbattleModel.getInstance().warType;
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function startWar() : void
      {
         switch(EmbattleModel.getInstance().mapChildType)
         {
            case EmbattleConst.MAP_CHILD_MODE_MINE:
               ExpedProxyCmd.checkPlantHP(this.mineWarStart);
               break;
            case EmbattleConst.MAP_CHILD_MODE_TEMPLE:
               ExpedProxyCmd.checkPlantHP(this.templeWarStart);
               break;
            case EmbattleConst.MAP_CHILD_MODE_NOMAL:
               if(EmbattleModel.getInstance().warType == E_WarType.E_WarType_Reinforce)
               {
                  ExpedProxyCmd.checkPlantHP(this.defaultWarStart);
               }
               else
               {
                  ExpedProxyCmd.checkAndExped(this.defaultWarStart);
               }
               break;
            default:
               this.defaultWarStart();
         }
      }
      
      private function mineWarStart() : void
      {
         MineProxyCmd.doSetOut(EmbattleModel.getInstance().mapTargetPoint.x,EmbattleModel.getInstance().mapTargetPoint.y,GameGloble.actorModel.battleCardModel.defaultTeamId);
         eventDispatcher.dispatchEvent(new Event(EmbattleConst.EMBATTLE_WAR_STARTED));
      }
      
      private function templeWarStart() : void
      {
         TempleProxyCmd.doSetOut(EmbattleModel.getInstance().mapTargetPoint.x,EmbattleModel.getInstance().mapTargetPoint.y,GameGloble.actorModel.battleCardModel.defaultTeamId);
         eventDispatcher.dispatchEvent(new Event(EmbattleConst.EMBATTLE_WAR_STARTED));
      }
      
      private function defaultWarStart() : void
      {
         var _loc1_:Cmd_War_SetOut_CS = new Cmd_War_SetOut_CS();
         _loc1_.type = EmbattleModel.getInstance().warType;
         _loc1_.targetPos = new Dto_WorldMap_Pos();
         _loc1_.targetPos.posX = EmbattleModel.getInstance().mapTargetPoint.x;
         _loc1_.targetPos.posY = EmbattleModel.getInstance().mapTargetPoint.y;
         _loc1_.teamId = GameGloble.actorModel.battleCardModel.defaultTeamId;
         this.pvzServer.sendMessage(_loc1_);
      }
      
      public function getFormation() : void
      {
         CommEmbattleProxyCmd.getlineupFormation();
      }
      
      public function fixHP(param1:uint) : void
      {
         var _loc2_:Cmd_War_RecoverHp_CS = new Cmd_War_RecoverHp_CS();
         _loc2_.teamId = param1;
         this.pvzServer.sendMessage(_loc2_);
      }
   }
}
