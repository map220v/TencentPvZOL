package com.qq.modules.commEmbattle.model
{
   import PVZ.Cmd.BattleTargetType;
   import PVZ.Cmd.Cmd_AllServerRankArena_GetAttackFormation_SC;
   import PVZ.Cmd.Cmd_AllServerRankArena_GetOpponentFormation_CS;
   import PVZ.Cmd.Cmd_AllServerRankArena_GetOpponentFormation_SC;
   import PVZ.Cmd.Cmd_AllServerRankArena_SetAttackFormation_CS;
   import PVZ.Cmd.Cmd_Arena_SetFormation_CS;
   import PVZ.Cmd.Cmd_BalancePk_SetFormation_CS;
   import PVZ.Cmd.Cmd_BalancePk_SetFormation_SC;
   import PVZ.Cmd.Cmd_Battle_GetFightInfo_CS;
   import PVZ.Cmd.Cmd_Battle_GetFightInfo_SC;
   import PVZ.Cmd.Cmd_Battle_GetFormation_SC;
   import PVZ.Cmd.Cmd_Battle_SetFormation_CS;
   import PVZ.Cmd.Cmd_GeneTest_GetFormation_SC;
   import PVZ.Cmd.Cmd_GeneTest_SetFormation_CS;
   import PVZ.Cmd.Cmd_Guard_SetFormation_CS;
   import PVZ.Cmd.Cmd_GuildFuben_GetFormation_SC;
   import PVZ.Cmd.Cmd_GuildFuben_SetFormation_CS;
   import PVZ.Cmd.Cmd_NewScrewUp_SendFormation_SC;
   import PVZ.Cmd.Cmd_NewScrewUp_SetFormation_CS;
   import PVZ.Cmd.Cmd_NewZombieIsland_SetFormation_CS;
   import PVZ.Cmd.Cmd_NewZombieIsland_SyncFormation_SC;
   import PVZ.Cmd.Cmd_NoEndFuben_SetFormation_CS;
   import PVZ.Cmd.Cmd_NoEndFuben_SyncFormation_SC;
   import PVZ.Cmd.Cmd_PlantTest_GetFormation_SC;
   import PVZ.Cmd.Cmd_PlantTest_SetFormation_CS;
   import PVZ.Cmd.Cmd_PuppetFuben_GetFormation_SC;
   import PVZ.Cmd.Cmd_PuppetFuben_SetFormation_CS;
   import PVZ.Cmd.Cmd_RankArena_GetBattleFormation_SC;
   import PVZ.Cmd.Cmd_RankArena_SetBattleFormation_CS;
   import PVZ.Cmd.Cmd_ScrewUp_SendFormation_SC;
   import PVZ.Cmd.Cmd_ScrewUp_SetFormation_CS;
   import PVZ.Cmd.Cmd_WorldBoss_GetFormation_SC;
   import PVZ.Cmd.Cmd_WorldBoss_SetFormation_CS;
   import PVZ.Cmd.Cmd_ZombieIsland_SetFormation_CS;
   import PVZ.Cmd.Cmd_ZombieIsland_SyncFormation_SC;
   import PVZ.Cmd.Dto_BattleTarget;
   import PVZ.Cmd.Dto_CardPosInfo;
   import PVZ.Cmd.Dto_CardPower;
   import PVZ.Cmd.Dto_EnemyCardInfo;
   import PVZ.Cmd.Dto_FormationInfo;
   import PVZ.Cmd.E_PowerEle;
   import com.qq.GameGloble;
   import com.qq.display.QAlert;
   import com.qq.modules.balance.BalanceConst;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.card.model.templates.CardDeckDetailInfo;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.card.model.vo.CardItemVO;
   import com.qq.modules.commEmbattle.CommEmbattleConst;
   import com.qq.modules.embattle.constant.EmbattleConst;
   import com.qq.modules.main.model.settings.battle.BattleLineupTemplateFactory;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.modules.main.model.vo.BattleCardFormationVO;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.net.PvzUtil;
   import com.qq.templates.font.FontNormal;
   import com.tencent.protobuf.Int64;
   import flash.events.Event;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class CommEmbattleProxy extends BasicProxy
   {
       
      
      [Inject]
      public var pvzServer:PvzSocketService;
      
      public var curShowEmbattleIsLeft:Boolean;
      
      public var dragCurCardUid:Int64;
      
      public var isSetLeader:Boolean;
      
      public var embattleType:uint;
      
      public var backFunc:Function;
      
      public var backParams:Array;
      
      public var enemyCards:Array;
      
      public var dummyInfoList:Array;
      
      public var enemyCardsList:Vector.<Array>;
      
      public var multy:Boolean;
      
      private var _cardVec:Vector.<CardItemVO>;
      
      public function CommEmbattleProxy()
      {
         super();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_Battle_GetFormation_SC.$MessageID,this.onCmd_Battle_GetFormation_SC],[Cmd_ScrewUp_SendFormation_SC.$MessageID,this.onCmd_ScrewUp_SendFormation_SC],[Cmd_NewScrewUp_SendFormation_SC.$MessageID,this.onCmd_NewScrewUp_SendFormation_SC],[Cmd_Battle_GetFightInfo_SC.$MessageID,this.onCmd_Battle_GetFightInfo_SC],[Cmd_AllServerRankArena_GetOpponentFormation_SC.$MessageID,this.onCmd_AllServerRankArena_GetOpponentFormation_SC],[Cmd_RankArena_GetBattleFormation_SC.$MessageID,this.onCmd_RankArena_GetBattleFormation_SC],[Cmd_GuildFuben_GetFormation_SC.$MessageID,this.onCmd_GuildFuben_GetFormation_SC],[Cmd_ZombieIsland_SyncFormation_SC.$MessageID,this.onCmd_ZombieIsland_SyncFormation_SC],[Cmd_NewZombieIsland_SyncFormation_SC.$MessageID,this.onCmd_NewZombieIsland_SyncFormation_SC],[Cmd_WorldBoss_GetFormation_SC.$MessageID,this.onCmd_WorldBoss_GetFormation_SC],[Cmd_PlantTest_GetFormation_SC.$MessageID,this.onCmd_PlantTest_GetFormation_SC],[Cmd_BalancePk_SetFormation_SC.$MessageID,this.onCmd_BalancePk_SetFormation_SC],[Cmd_GeneTest_GetFormation_SC.$MessageID,this.onCmd_GeneTest_GetFormation_SC],[Cmd_PuppetFuben_GetFormation_SC.$MessageID,this.onCmd_PuppetFuben_GetFormation_SC],[Cmd_NoEndFuben_SyncFormation_SC.$MessageID,this.onCmd_NoEndFuben_SyncFormation_SC],[Cmd_AllServerRankArena_GetAttackFormation_SC.$MessageID,this.onCmd_SuperArean_Attack_SyncFormation_SC]];
      }
      
      private function onCmd_NoEndFuben_SyncFormation_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_NoEndFuben_SyncFormation_SC = param1.socketData as Cmd_NoEndFuben_SyncFormation_SC;
         GameGloble.actorModel.battleCardModel.setFormationInfo(EmbattleConst.MODE_NOENDFUBEN,_loc2_.formation);
         dispatch(new Event(CommEmbattleConst.COMM_EMBATTLE_EVT_UPDATE_ALL));
      }
      
      private function onCmd_SuperArean_Attack_SyncFormation_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_AllServerRankArena_GetAttackFormation_SC = param1.socketData as Cmd_AllServerRankArena_GetAttackFormation_SC;
         GameGloble.actorModel.battleCardModel.setFormationInfo(EmbattleConst.MODE_SuperArena_Attack,_loc2_.formation);
         dispatch(new Event(CommEmbattleConst.COMM_EMBATTLE_EVT_UPDATE_ALL));
      }
      
      private function onCmd_Battle_GetFormation_SC(param1:SocketServiceEvent) : void
      {
         dispatch(new Event(CommEmbattleConst.COMM_EMBATTLE_EVT_UPDATE_ALL));
      }
      
      private function onCmd_AllServerRankArena_GetOpponentFormation_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:Dto_EnemyCardInfo = null;
         var _loc2_:Cmd_AllServerRankArena_GetOpponentFormation_SC = param1.socketData as Cmd_AllServerRankArena_GetOpponentFormation_SC;
         this.enemyCards = _loc2_.enemyCard;
         if(_loc2_.puppetformation != null)
         {
            this.dummyInfoList = _loc2_.puppetformation.puppetInfo;
         }
         else
         {
            this.dummyInfoList = null;
         }
         for each(_loc3_ in this.enemyCards)
         {
            if(_loc3_.posIndex % 2 != 0)
            {
               _loc3_.posIndex += 1;
            }
         }
         dispatch(new Event(CommEmbattleConst.COMM_EMBATTLE_EVT_UPDATE_RIGHT));
      }
      
      private function onCmd_Battle_GetFightInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:Dto_EnemyCardInfo = null;
         var _loc2_:Cmd_Battle_GetFightInfo_SC = param1.socketData as Cmd_Battle_GetFightInfo_SC;
         this.enemyCards = _loc2_.enemyCard;
         if(_loc2_.puppetformation != null)
         {
            this.dummyInfoList = _loc2_.puppetformation.puppetInfo;
         }
         else
         {
            this.dummyInfoList = null;
         }
         for each(_loc3_ in this.enemyCards)
         {
            if(_loc3_.posIndex % 2 != 0)
            {
               _loc3_.posIndex += 1;
            }
         }
         dispatch(new Event(CommEmbattleConst.COMM_EMBATTLE_EVT_UPDATE_RIGHT));
      }
      
      private function onCmd_ScrewUp_SendFormation_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_ScrewUp_SendFormation_SC = param1.socketData as Cmd_ScrewUp_SendFormation_SC;
         GameGloble.actorModel.battleCardModel.setFormationInfo(EmbattleConst.MODE_TRIAL_ROAD_NORMAL,_loc2_.formation);
         dispatch(new Event(CommEmbattleConst.COMM_EMBATTLE_EVT_UPDATE_ALL));
      }
      
      private function onCmd_NewScrewUp_SendFormation_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_NewScrewUp_SendFormation_SC = param1.socketData as Cmd_NewScrewUp_SendFormation_SC;
         GameGloble.actorModel.battleCardModel.setFormationInfo(EmbattleConst.MODE_TRIAL_ROAD_NORMAL,_loc2_.formation);
         dispatch(new Event(CommEmbattleConst.COMM_EMBATTLE_EVT_UPDATE_ALL));
      }
      
      private function onCmd_RankArena_GetBattleFormation_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_RankArena_GetBattleFormation_SC = param1.socketData as Cmd_RankArena_GetBattleFormation_SC;
         GameGloble.actorModel.battleCardModel.setFormationInfo(EmbattleConst.MODE_LADDER,_loc2_.formation);
         dispatch(new Event(CommEmbattleConst.COMM_EMBATTLE_EVT_UPDATE_ALL));
      }
      
      private function onCmd_GuildFuben_GetFormation_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_GuildFuben_GetFormation_SC = param1.socketData as Cmd_GuildFuben_GetFormation_SC;
         GameGloble.actorModel.battleCardModel.updateFormationTeams(EmbattleConst.MODE_UNION_FUBEN,_loc2_.formationInfo);
         dispatch(new Event(CommEmbattleConst.COMM_EMBATTLE_EVT_UPDATE_ALL));
      }
      
      private function onCmd_PlantTest_GetFormation_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_PlantTest_GetFormation_SC = param1.socketData as Cmd_PlantTest_GetFormation_SC;
         GameGloble.actorModel.battleCardModel.setFormationInfo(EmbattleConst.MODE_PLANT_TEST,_loc2_.formation);
         dispatch(new Event(CommEmbattleConst.COMM_EMBATTLE_EVT_UPDATE_ALL));
      }
      
      private function onCmd_GeneTest_GetFormation_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_GeneTest_GetFormation_SC = param1.socketData as Cmd_GeneTest_GetFormation_SC;
         GameGloble.actorModel.battleCardModel.setFormationInfo(EmbattleConst.MODE_CARDDNA_TEST,_loc2_.formation);
         dispatch(new Event(CommEmbattleConst.COMM_EMBATTLE_EVT_UPDATE_ALL));
      }
      
      private function onCmd_PuppetFuben_GetFormation_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_PuppetFuben_GetFormation_SC = param1.socketData as Cmd_PuppetFuben_GetFormation_SC;
         GameGloble.actorModel.battleCardModel.setFormationInfo(EmbattleConst.MODE_DUMMY_FUBEN,_loc2_.formation);
         dispatch(new Event(CommEmbattleConst.COMM_EMBATTLE_EVT_UPDATE_ALL));
      }
      
      private function onCmd_BalancePk_SetFormation_SC(param1:SocketServiceEvent) : void
      {
         var _loc4_:CardItemVO = null;
         var _loc5_:Dto_CardPosInfo = null;
         var _loc2_:Cmd_BalancePk_SetFormation_SC = param1.socketData as Cmd_BalancePk_SetFormation_SC;
         GameGloble.actorModel.battleCardModel.setFormationInfo(EmbattleConst.MODE_PLANT_BALANCE,_loc2_.formation);
         var _loc3_:BattleCardFormationVO = GameGloble.actorModel.battleCardModel.getFormationInfo(EmbattleConst.MODE_PLANT_BALANCE);
         for each(_loc5_ in _loc3_.dto.cardPos)
         {
            _loc4_ = this.getCardInfoByUid(_loc5_.uid);
            _loc5_.curHp = _loc4_.currentHp;
            _loc5_.maxHp = _loc4_.hp;
            _loc5_.powerEle = _loc4_.dto.powerEle;
         }
         dispatch(new Event(CommEmbattleConst.COMM_EMBATTLE_EVT_UPDATE_ALL));
      }
      
      private function onCmd_ZombieIsland_SyncFormation_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_ZombieIsland_SyncFormation_SC = param1.socketData as Cmd_ZombieIsland_SyncFormation_SC;
         GameGloble.actorModel.battleCardModel.setFormationInfo(EmbattleConst.MODE_ZOMBIE_ISLAND,_loc2_.plantFormation);
         dispatch(new Event(CommEmbattleConst.COMM_EMBATTLE_EVT_UPDATE_ALL));
      }
      
      private function onCmd_NewZombieIsland_SyncFormation_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_NewZombieIsland_SyncFormation_SC = param1.socketData as Cmd_NewZombieIsland_SyncFormation_SC;
         GameGloble.actorModel.battleCardModel.setFormationInfo(EmbattleConst.MODE_ZOMBIE_ADV_ISLAND,_loc2_.formation);
         dispatch(new Event(CommEmbattleConst.COMM_EMBATTLE_EVT_UPDATE_ALL));
      }
      
      private function onCmd_WorldBoss_GetFormation_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_WorldBoss_GetFormation_SC = param1.socketData as Cmd_WorldBoss_GetFormation_SC;
         GameGloble.actorModel.battleCardModel.setFormationInfo(EmbattleConst.MODE_WORLD_BOSS,_loc2_.formation);
         dispatch(new Event(CommEmbattleConst.COMM_EMBATTLE_EVT_UPDATE_ALL));
      }
      
      public function get cardList() : Vector.<CardItemVO>
      {
         if(!this._cardVec)
         {
            switch(this.embattleType)
            {
               case EmbattleConst.MODE_ZOMBIE_ISLAND:
                  this._cardVec = PvzUtil.sortCardArr(GameGloble.actorModel.battleCardModel.getZombieIslandCard());
                  break;
               case EmbattleConst.MODE_ZOMBIE_ADV_ISLAND:
                  this._cardVec = PvzUtil.sortCardArr(GameGloble.actorModel.battleCardModel.getAdvZombieIslandCard());
                  break;
               case EmbattleConst.MODE_PLANT_BALANCE:
                  this._cardVec = BalanceConst.sortCards(GameGloble.actorModel.battleCardModel.getBalanceCard());
                  break;
               case EmbattleConst.MODE_NOENDFUBEN:
                  this._cardVec = GameGloble.actorModel.battleCardModel.getCardPrepareList();
                  break;
               default:
                  this._cardVec = PvzUtil.sortCardArr(GameGloble.actorModel.battleCardModel.battleCardList);
            }
         }
         return this._cardVec;
      }
      
      public function get formationVo() : BattleCardFormationVO
      {
         return GameGloble.actorModel.battleCardModel.getTargetVo(this.embattleType);
      }
      
      public function getEnemySpeed() : Number
      {
         var _loc2_:Dto_EnemyCardInfo = null;
         var _loc3_:Dto_CardPower = null;
         var _loc1_:Number = 0;
         if(this.enemyCards)
         {
            for each(_loc2_ in this.enemyCards)
            {
               for each(_loc3_ in _loc2_.powerEle)
               {
                  if(_loc3_.ele == E_PowerEle.E_PowerEle_total)
                  {
                     _loc1_ += _loc3_.speed.toNumber();
                  }
               }
            }
         }
         return _loc1_;
      }
      
      public function getEnemyPower() : Number
      {
         var _loc2_:Dto_EnemyCardInfo = null;
         var _loc3_:Dto_CardPower = null;
         var _loc1_:Number = 0;
         if(this.enemyCards)
         {
            for each(_loc2_ in this.enemyCards)
            {
               for each(_loc3_ in _loc2_.powerEle)
               {
                  if(_loc3_.ele == E_PowerEle.E_PowerEle_total)
                  {
                     _loc1_ += _loc3_.value.toNumber();
                  }
               }
            }
         }
         return _loc1_;
      }
      
      public function getCardInfoByUid(param1:Int64) : CardItemVO
      {
         return GameGloble.actorModel.battleCardModel.getBattleCardFullInfo(param1);
      }
      
      public function sortCardList() : void
      {
         this._cardVec = PvzUtil.sortCardArr(GameGloble.actorModel.battleCardModel.battleCardList);
      }
      
      public function get maxPlant() : uint
      {
         return GameGloble.actorModel.levelTemplate.battleCardMax;
      }
      
      public function changeFormationTeam(param1:uint) : void
      {
         GameGloble.actorModel.battleCardModel.changeFormationTeamId(this.embattleType,param1);
         dispatch(new Event(CommEmbattleConst.COMM_EMBATTLE_EVT_UPDATE_EMBATTLE_PLANT));
      }
      
      public function setLineup(param1:Int64, param2:int, param3:Int64 = null) : int
      {
         var _loc7_:Cmd_Arena_SetFormation_CS = null;
         var _loc8_:Cmd_ScrewUp_SetFormation_CS = null;
         var _loc9_:Cmd_NewScrewUp_SetFormation_CS = null;
         var _loc10_:Cmd_RankArena_SetBattleFormation_CS = null;
         var _loc11_:Cmd_GuildFuben_SetFormation_CS = null;
         var _loc12_:Cmd_ZombieIsland_SetFormation_CS = null;
         var _loc13_:Cmd_NewZombieIsland_SetFormation_CS = null;
         var _loc14_:Cmd_WorldBoss_SetFormation_CS = null;
         var _loc15_:Cmd_PlantTest_SetFormation_CS = null;
         var _loc16_:Cmd_BalancePk_SetFormation_CS = null;
         var _loc17_:Cmd_Guard_SetFormation_CS = null;
         var _loc18_:Cmd_GeneTest_SetFormation_CS = null;
         var _loc19_:Cmd_PuppetFuben_SetFormation_CS = null;
         var _loc20_:Cmd_NoEndFuben_SetFormation_CS = null;
         var _loc21_:Cmd_AllServerRankArena_SetAttackFormation_CS = null;
         var _loc22_:Cmd_Battle_SetFormation_CS = null;
         var _loc4_:CardItemVO = this.getCardInfoByUid(this.dragCurCardUid);
         var _loc5_:Dto_FormationInfo = GameGloble.cloneBattleFormation(GameGloble.actorModel.battleCardModel.getTargetVo(this.embattleType).dto);
         var _loc6_:BattleCardFormationVO = new BattleCardFormationVO(_loc5_);
         _loc5_.formationId = 0;
         if(_loc4_)
         {
            _loc6_.updateCardPos(_loc4_.uid,param2);
         }
         if(param3)
         {
            _loc5_.leaderUid = param3;
         }
         if(!_loc6_.isMatchRule)
         {
            return 3;
         }
         if(_loc6_.cardNum > this.maxPlant)
         {
            return 4;
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
         switch(this.embattleType)
         {
            case EmbattleConst.MODE_ARENA:
               (_loc7_ = new Cmd_Arena_SetFormation_CS()).formation = _loc5_;
               _loc7_.formation.teamId = 0;
               this.pvzServer.sendMessage(_loc7_);
               break;
            case EmbattleConst.MODE_TRIAL_ROAD_NORMAL:
               (_loc8_ = new Cmd_ScrewUp_SetFormation_CS()).formation = _loc5_;
               _loc8_.formation.teamId = 0;
               this.pvzServer.sendMessage(_loc8_);
               break;
            case EmbattleConst.MODE_TRIAL_ROAD_HARD:
               (_loc9_ = new Cmd_NewScrewUp_SetFormation_CS()).formation = _loc5_;
               _loc9_.formation.teamId = 0;
               this.pvzServer.sendMessage(_loc9_);
               break;
            case EmbattleConst.MODE_LADDER:
               (_loc10_ = new Cmd_RankArena_SetBattleFormation_CS()).formation = _loc5_;
               _loc10_.formation.teamId = 0;
               this.pvzServer.sendMessage(_loc10_);
               break;
            case EmbattleConst.MODE_UNION_FUBEN:
               (_loc11_ = new Cmd_GuildFuben_SetFormation_CS()).formationInfo = _loc5_;
               this.pvzServer.sendMessage(_loc11_);
               break;
            case EmbattleConst.MODE_ZOMBIE_ISLAND:
               if(_loc6_.cardNum == 0)
               {
                  return 4;
               }
               (_loc12_ = new Cmd_ZombieIsland_SetFormation_CS()).plantFormation = _loc5_;
               _loc12_.plantFormation.teamId = 0;
               this.pvzServer.sendMessage(_loc12_);
               break;
            case EmbattleConst.MODE_ZOMBIE_ADV_ISLAND:
               if(_loc6_.cardNum == 0)
               {
                  return 4;
               }
               (_loc13_ = new Cmd_NewZombieIsland_SetFormation_CS()).formation = _loc5_;
               _loc13_.formation.teamId = 0;
               this.pvzServer.sendMessage(_loc13_);
               break;
            case EmbattleConst.MODE_WORLD_BOSS:
               (_loc14_ = new Cmd_WorldBoss_SetFormation_CS()).formation = _loc5_;
               _loc14_.formation.teamId = 0;
               this.pvzServer.sendMessage(_loc14_);
               break;
            case EmbattleConst.MODE_PLANT_TEST:
               (_loc15_ = new Cmd_PlantTest_SetFormation_CS()).formation = _loc5_;
               this.pvzServer.sendMessage(_loc15_);
               break;
            case EmbattleConst.MODE_PLANT_BALANCE:
               (_loc16_ = new Cmd_BalancePk_SetFormation_CS()).formation = _loc5_;
               this.pvzServer.sendMessage(_loc16_);
               break;
            case EmbattleConst.MODE_HOLE_ATK:
               (_loc17_ = new Cmd_Guard_SetFormation_CS()).formation = _loc5_;
               this.pvzServer.sendMessage(_loc17_);
               break;
            case EmbattleConst.MODE_CARDDNA_TEST:
               (_loc18_ = new Cmd_GeneTest_SetFormation_CS()).formation = _loc5_;
               this.pvzServer.sendMessage(_loc18_);
               break;
            case EmbattleConst.MODE_DUMMY_FUBEN:
               (_loc19_ = new Cmd_PuppetFuben_SetFormation_CS()).formation = _loc5_;
               this.pvzServer.sendMessage(_loc19_);
               break;
            case EmbattleConst.MODE_NOENDFUBEN:
               (_loc20_ = new Cmd_NoEndFuben_SetFormation_CS()).formation = _loc5_;
               this.pvzServer.sendMessage(_loc20_);
               break;
            case EmbattleConst.MODE_SuperArena_Attack:
               (_loc21_ = new Cmd_AllServerRankArena_SetAttackFormation_CS()).formation = _loc5_;
               this.pvzServer.sendMessage(_loc21_);
               break;
            default:
               (_loc22_ = new Cmd_Battle_SetFormation_CS()).formation = _loc5_;
               _loc22_.formation.teamId = _loc6_.teamId;
               this.pvzServer.sendMessage(_loc22_);
         }
         return 1;
      }
      
      public function setLeader(param1:Int64) : void
      {
         if(!param1)
         {
            return;
         }
         this.setLineup(null,0,param1);
      }
      
      public function getEnemyCards(param1:Dto_BattleTarget, param2:Object) : void
      {
         var _loc3_:Cmd_AllServerRankArena_GetOpponentFormation_CS = null;
         var _loc4_:Cmd_Battle_GetFightInfo_CS = null;
         switch(param1.type)
         {
            case BattleTargetType.BattleTargetType_AllServerRankArena:
            case BattleTargetType.BattleTargetType_AllServerRankArenaNpc:
               if(param2 == null)
               {
                  return;
               }
               _loc3_ = new Cmd_AllServerRankArena_GetOpponentFormation_CS();
               _loc3_.roleId = param2.roleId;
               _loc3_.rank = param2.rank;
               this.pvzServer.sendMessage(_loc3_);
               break;
            default:
               (_loc4_ = new Cmd_Battle_GetFightInfo_CS()).target = param1;
               this.pvzServer.sendMessage(_loc4_);
         }
      }
      
      public function setEnemyCardsFromList(param1:int) : void
      {
         if(this.enemyCardsList == null || param1 >= this.enemyCardsList.length)
         {
            return;
         }
         this.enemyCards = this.enemyCardsList[param1];
         var _loc2_:int = 0;
         while(_loc2_ < this.enemyCards.length)
         {
            if(Dto_EnemyCardInfo(this.enemyCards[_loc2_]).posIndex % 2 != 0)
            {
               Dto_EnemyCardInfo(this.enemyCards[_loc2_]).posIndex = Dto_EnemyCardInfo(this.enemyCards[_loc2_]).posIndex + 1;
            }
            _loc2_++;
         }
         dispatch(new Event(CommEmbattleConst.COMM_EMBATTLE_EVT_UPDATE_RIGHT));
      }
      
      public function startFight() : Boolean
      {
         switch(this.embattleType)
         {
            case EmbattleConst.MODE_ZOMBIE_ISLAND:
            case EmbattleConst.MODE_ZOMBIE_ADV_ISLAND:
            case EmbattleConst.MODE_HOLE_ATK:
               if(this.formationVo.cardNum == 0)
               {
                  QAlert.Show(FontNormal.EMBATTLE_NO_PLANT);
                  return false;
               }
               break;
         }
         if(this.backFunc != null)
         {
            if(this.backParams)
            {
               this.backFunc.apply(null,this.backParams);
            }
            else
            {
               this.backFunc.call();
            }
            return true;
         }
         return false;
      }
      
      public function checkUnionFubenFight() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:Vector.<BattleCardFormationVO> = GameGloble.actorModel.battleCardModel.getEmbattleTeam(EmbattleConst.MODE_UNION_FUBEN);
         if(_loc1_)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_.length)
            {
               if(_loc1_[_loc2_].cardNum == 0)
               {
                  return false;
               }
               _loc2_++;
            }
            return true;
         }
         return false;
      }
      
      public function getActiveDeckIds(param1:int) : Array
      {
         var _loc5_:CardDeckDetailInfo = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Dto_EnemyCardInfo = null;
         var _loc11_:BattleLineupCardTemp = null;
         var _loc2_:BattleLineupCardTemp = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateById(param1);
         var _loc3_:Array = CardTemplateFactory.instance.getAllDeckDetailInfo(param1);
         var _loc4_:Array = [];
         for each(_loc5_ in _loc3_)
         {
            _loc6_ = 0;
            for each(_loc7_ in _loc5_.componentPlants)
            {
               if(_loc7_ != _loc2_.tdId)
               {
                  _loc8_ = !!this.enemyCards ? int(this.enemyCards.length) : 0;
                  _loc9_ = 0;
                  while(_loc9_ < _loc8_)
                  {
                     if(_loc10_ = this.enemyCards[_loc9_] as Dto_EnemyCardInfo)
                     {
                        if((_loc11_ = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateById(_loc10_.cardId)).tdId == _loc7_)
                        {
                           _loc6_++;
                           break;
                        }
                     }
                     _loc9_++;
                  }
               }
            }
            if(_loc6_ == _loc5_.componentPlants.length - 1)
            {
               _loc4_.push(_loc5_.deckId);
            }
         }
         return _loc4_;
      }
   }
}
