package com.qq.modules.main.model
{
   import PVZ.Cmd.Dto_CardFullInfo;
   import PVZ.Cmd.Dto_CardPosInfo;
   import PVZ.Cmd.Dto_FormationInfo;
   import PVZ.Cmd.Dto_IdNum;
   import PVZ.Cmd.E_TeamStatus;
   import com.qq.constant.BattleCardStatus;
   import com.qq.modules.balance.BalanceConst;
   import com.qq.modules.card.model.templates.CardDeckDetailInfo;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.card.model.vo.CardItemVO;
   import com.qq.modules.embattle.constant.EmbattleConst;
   import com.qq.modules.main.model.settings.battle.BattleCardSettings;
   import com.qq.modules.main.model.settings.battle.BattleLineupTemplateFactory;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.modules.main.model.vo.BattleCardFormationVO;
   import com.qq.net.PvzUtil;
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Int64Util;
   import com.tencent.protobuf.UInt64;
   import flash.utils.Dictionary;
   import org.robotlegs.mvcs.Actor;
   
   public class ActorBattleCardModel extends Actor
   {
       
      
      private var actorModel:ActorModel;
      
      public var defaultFormationVo:BattleCardFormationVO;
      
      public var leaderAddParam:uint;
      
      public var battleCardList:Vector.<CardItemVO>;
      
      private var m_aryZombieIsland:Array;
      
      private var m_adv_aryZombieIsland:Array;
      
      private var _cardPrepareList:Vector.<CardItemVO>;
      
      private var m_vecBalanceCard:Vector.<CardItemVO>;
      
      public var teamMaxNum:uint;
      
      public var emBattleTeam:Vector.<BattleCardFormationVO>;
      
      public var defenceFormationVo:BattleCardFormationVO;
      
      public var defenceCardLeaderUid:Int64;
      
      public var searchUseArr:Array;
      
      public var searchTeamUse:Array;
      
      public var snatchUseArr:Array;
      
      public var snatchTeamUse:Array;
      
      public var embattleTemams:Dictionary;
      
      public var embaltteFormations:Dictionary;
      
      public var embattleTeamIds:Dictionary;
      
      public function ActorBattleCardModel(param1:ActorModel)
      {
         this.m_aryZombieIsland = [];
         this.m_adv_aryZombieIsland = [];
         this.embattleTemams = new Dictionary();
         this.embaltteFormations = new Dictionary();
         this.embattleTeamIds = new Dictionary();
         super();
         this.actorModel = param1;
      }
      
      public function getTargetVo(param1:int) : BattleCardFormationVO
      {
         var _loc2_:BattleCardFormationVO = null;
         switch(param1)
         {
            case EmbattleConst.MODE_HOME:
            case EmbattleConst.MODE_MAP:
               _loc2_ = this.defaultFormationVo;
               break;
            default:
               _loc2_ = this.getFormationInfo(param1);
         }
         return _loc2_;
      }
      
      public function resetCardPrepareList(param1:Array) : void
      {
         var _loc2_:Int64 = null;
         var _loc3_:CardItemVO = null;
         this._cardPrepareList = new Vector.<CardItemVO>();
         if(this.battleCardList.length > 0)
         {
            for each(_loc3_ in this.battleCardList)
            {
               for each(_loc2_ in param1)
               {
                  if(_loc2_.compare(_loc3_.uid))
                  {
                     this._cardPrepareList.push(_loc3_);
                  }
               }
            }
         }
         PvzUtil.sortCardArr(this._cardPrepareList);
      }
      
      public function getCardPrepareList() : Vector.<CardItemVO>
      {
         if(this._cardPrepareList == null)
         {
            this._cardPrepareList = new Vector.<CardItemVO>();
         }
         return this._cardPrepareList;
      }
      
      public function setAdvZombieIslandPrepareList(param1:Array) : void
      {
         this.m_adv_aryZombieIsland = param1;
      }
      
      public function getAdvZombieIslandCard() : Vector.<CardItemVO>
      {
         var _loc2_:Int64 = null;
         var _loc3_:CardItemVO = null;
         var _loc1_:Vector.<CardItemVO> = new Vector.<CardItemVO>();
         if(this.m_adv_aryZombieIsland.length > 0)
         {
            for each(_loc3_ in this.battleCardList)
            {
               for each(_loc2_ in this.m_adv_aryZombieIsland)
               {
                  if(_loc2_.compare(_loc3_.uid))
                  {
                     _loc1_.push(_loc3_);
                  }
               }
            }
         }
         return _loc1_;
      }
      
      public function setZombieIslandPrepareList(param1:Array) : void
      {
         this.m_aryZombieIsland = param1;
      }
      
      public function getZombieIslandCard() : Vector.<CardItemVO>
      {
         var _loc2_:Int64 = null;
         var _loc3_:CardItemVO = null;
         var _loc1_:Vector.<CardItemVO> = new Vector.<CardItemVO>();
         if(this.m_aryZombieIsland.length > 0)
         {
            for each(_loc3_ in this.battleCardList)
            {
               for each(_loc2_ in this.m_aryZombieIsland)
               {
                  if(_loc2_.compare(_loc3_.uid))
                  {
                     _loc1_.push(_loc3_);
                  }
               }
            }
         }
         return _loc1_;
      }
      
      public function getBalanceCard() : Vector.<CardItemVO>
      {
         var _loc1_:Vector.<BattleLineupCardTemp> = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:BattleLineupCardTemp = null;
         if(this.m_vecBalanceCard == null)
         {
            this.m_vecBalanceCard = new Vector.<CardItemVO>();
            _loc1_ = BattleLineupTemplateFactory.instance.cacheBattleLineupCardTemplate;
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if((_loc4_ = _loc1_[_loc3_]).type == BattleCardSettings.BATTLE_CARD_TYPE_PLANT)
               {
                  if(BalanceConst.checkCondition(_loc4_))
                  {
                     this.m_vecBalanceCard.push(BalanceConst.createCard(_loc4_));
                  }
               }
               _loc3_++;
            }
         }
         return this.m_vecBalanceCard;
      }
      
      public function changeFormationTeamId(param1:int, param2:uint) : void
      {
         this.setFormationTeamId(param1,param2);
      }
      
      public function setBattleCardList(param1:Array) : void
      {
         var _loc2_:Dto_CardFullInfo = null;
         this.battleCardList = new Vector.<CardItemVO>();
         for each(_loc2_ in param1)
         {
            this.battleCardList.push(new CardItemVO(_loc2_));
         }
      }
      
      public function hasCardInBattleList(param1:int) : Boolean
      {
         var _loc4_:CardItemVO = null;
         var _loc2_:int = this.battleCardList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this.battleCardList[_loc3_]).cardId == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function hasCardInBattleListByTdId(param1:int) : Boolean
      {
         var _loc4_:CardItemVO = null;
         var _loc5_:BattleLineupCardTemp = null;
         var _loc2_:int = this.battleCardList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this.battleCardList[_loc3_];
            if((_loc5_ = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateById(_loc4_.cardId)) && _loc5_.tdId == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function getBattleCardFullInfo(param1:Int64) : CardItemVO
      {
         if(!param1)
         {
            return null;
         }
         if(this.checkIsRealCard(param1))
         {
            return this.getRealCardFullInfo(param1);
         }
         return this.getTemplateCardFullInfo(param1);
      }
      
      public function getRealCardFullInfo(param1:Int64) : CardItemVO
      {
         var _loc4_:CardItemVO = null;
         var _loc2_:int = this.battleCardList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this.battleCardList[_loc3_]) && Int64Util.isEqual(_loc4_.uid,param1))
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      private function checkIsRealCard(param1:Int64) : Boolean
      {
         return param1.toNumber() > 10000;
      }
      
      public function getTemplateCardFullInfo(param1:Int64) : CardItemVO
      {
         var _loc2_:Vector.<CardItemVO> = null;
         var _loc3_:CardItemVO = null;
         if(param1)
         {
            _loc2_ = this.getBalanceCard();
            for each(_loc3_ in _loc2_)
            {
               if(Int64Util.isEqual(_loc3_.uid,param1))
               {
                  return _loc3_;
               }
            }
         }
         return null;
      }
      
      public function getBattleCardPosInfo(param1:Int64) : Dto_CardPosInfo
      {
         var _loc4_:BattleCardFormationVO = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Dto_CardPosInfo = null;
         var _loc2_:uint = this.emBattleTeam.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = (_loc4_ = this.emBattleTeam[_loc3_] as BattleCardFormationVO).cardNum;
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               if(_loc7_ = _loc4_.getCardByUid(param1))
               {
                  return _loc7_;
               }
               _loc6_++;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getBattleCardPosWithMode(param1:Int64, param2:int = 0) : int
      {
         var _loc4_:uint = 0;
         var _loc5_:int = 0;
         var _loc6_:BattleCardFormationVO = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Dto_CardPosInfo = null;
         var _loc3_:Vector.<BattleCardFormationVO> = new Vector.<BattleCardFormationVO>();
         switch(param2)
         {
            case EmbattleConst.MODE_HOME:
            case EmbattleConst.MODE_MAP:
               _loc3_ = this.emBattleTeam;
               break;
            default:
               _loc3_.push(this.getFormationInfo(param2));
         }
         if(_loc3_)
         {
            _loc4_ = _loc3_.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               if(_loc6_ = _loc3_[_loc5_] as BattleCardFormationVO)
               {
                  _loc7_ = _loc6_.cardNum;
                  _loc8_ = 0;
                  while(_loc8_ < _loc7_)
                  {
                     if(_loc9_ = _loc6_.getCardByUid(param1))
                     {
                        return _loc9_.posIndex;
                     }
                     _loc8_++;
                  }
               }
               _loc5_++;
            }
         }
         return 0;
      }
      
      public function updateBattleCardFullInfo(param1:Array) : void
      {
         var _loc3_:Dto_CardFullInfo = null;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:CardItemVO = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Dto_CardFullInfo;
            _loc4_ = this.battleCardList.length;
            _loc5_ = true;
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc7_ = this.battleCardList[_loc6_];
               if(Int64Util.isEqual(_loc7_.uid,_loc3_.base.uid))
               {
                  _loc7_.loadDto(_loc3_);
                  _loc6_ = _loc4_;
                  _loc5_ = false;
               }
               _loc6_++;
            }
            if(_loc5_)
            {
               this.battleCardList.push(new CardItemVO(_loc3_));
            }
            _loc2_++;
         }
      }
      
      public function addBattleCard(param1:Array) : void
      {
         var _loc4_:Dto_CardFullInfo = null;
         var _loc2_:int = param1.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1[_loc3_];
            this.battleCardList.push(new CardItemVO(_loc4_));
            _loc3_++;
         }
      }
      
      public function delBattleCard(param1:Array) : void
      {
         var _loc4_:Boolean = false;
         var _loc6_:CardItemVO = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Int64 = null;
         var _loc2_:Vector.<CardItemVO> = new Vector.<CardItemVO>();
         var _loc3_:int = this.battleCardList.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = this.battleCardList[_loc5_];
            _loc7_ = param1.length;
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               _loc9_ = param1[_loc8_];
               if(_loc4_ = Int64Util.isEqual(_loc6_.uid,_loc9_))
               {
                  break;
               }
               _loc8_++;
            }
            if(!_loc4_)
            {
               _loc2_.push(_loc6_);
            }
            _loc5_++;
         }
         this.battleCardList = _loc2_;
      }
      
      public function get minHealth() : int
      {
         var _loc4_:CardItemVO = null;
         var _loc1_:int = this.battleCardList.length;
         var _loc2_:int = 100;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            _loc4_ = this.battleCardList[_loc3_];
            _loc2_ = Math.min(_loc4_.health,_loc2_);
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getAttackBattleTeam() : Vector.<BattleCardFormationVO>
      {
         var _loc1_:Vector.<BattleCardFormationVO> = new Vector.<BattleCardFormationVO>();
         var _loc2_:int = this.emBattleTeam.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(!this.emBattleTeam[_loc3_].isDefenceTeam)
            {
               _loc1_.push(this.emBattleTeam[_loc3_]);
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function getDefendTeamId() : uint
      {
         var _loc1_:int = this.emBattleTeam.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            if(this.emBattleTeam[_loc2_].dto.isDefend)
            {
               return this.emBattleTeam[_loc2_].teamId;
            }
            _loc2_++;
         }
         return 0;
      }
      
      public function get currentInOutState() : Boolean
      {
         var _loc1_:Vector.<BattleCardFormationVO> = new Vector.<BattleCardFormationVO>();
         var _loc2_:int = this.emBattleTeam.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.emBattleTeam[_loc3_].dto.status == E_TeamStatus.E_TeamStatus_out)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function getAttackBattleTeamAtHome() : Vector.<BattleCardFormationVO>
      {
         var _loc1_:Vector.<BattleCardFormationVO> = new Vector.<BattleCardFormationVO>();
         var _loc2_:int = this.emBattleTeam.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(!this.emBattleTeam[_loc3_].isDefenceTeam && this.emBattleTeam[_loc3_].dto.status == E_TeamStatus.E_TeamStatus_home)
            {
               _loc1_.push(this.emBattleTeam[_loc3_]);
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function getBattleTeamById(param1:int) : BattleCardFormationVO
      {
         if(!this.emBattleTeam)
         {
            return null;
         }
         var _loc2_:int = this.emBattleTeam.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.emBattleTeam[_loc3_].teamId == param1)
            {
               return this.emBattleTeam[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getBattleTeamIdBycardUid(param1:Int64, param2:uint = 2) : uint
      {
         var _loc3_:Vector.<BattleCardFormationVO> = null;
         switch(param2)
         {
            case EmbattleConst.MODE_HOME:
               _loc3_ = this.emBattleTeam;
               break;
            case EmbattleConst.MODE_TREASURE_SEARCH:
            case EmbattleConst.MODE_TREASURE_SNATCH:
            case EmbattleConst.MODE_UNION_FUBEN:
            case EmbattleConst.MODE_PLANT_TEST:
            case EmbattleConst.MODE_CARDDNA_TEST:
            case EmbattleConst.MODE_DUMMY_FUBEN:
            case EmbattleConst.MODE_UNION_COMPETITION:
            case EmbattleConst.MODE_PLANT_BALANCE:
            case EmbattleConst.MODE_SuperArena_Attack:
            case EmbattleConst.MODE_SuperArena_Defence:
               _loc3_ = this.getEmbattleTeam(param2);
               break;
            default:
               _loc3_ = this.emBattleTeam;
         }
         if(!_loc3_)
         {
            return 0;
         }
         var _loc4_:int = _loc3_.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            if(_loc3_[_loc5_].getCardByUid(param1))
            {
               return _loc3_[_loc5_].teamId;
            }
            _loc5_++;
         }
         return 0;
      }
      
      public function set defaultTeamId(param1:uint) : void
      {
         if(param1 == 0)
         {
            return;
         }
         var _loc2_:uint = this.emBattleTeam.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((this.emBattleTeam[_loc3_] as BattleCardFormationVO).teamId == param1)
            {
               this.defaultFormationVo = this.emBattleTeam[_loc3_] as BattleCardFormationVO;
            }
            _loc3_++;
         }
      }
      
      public function get defaultTeamId() : uint
      {
         return this.defaultFormationVo.teamId;
      }
      
      public function get defaultFormationLeaderUid() : Int64
      {
         if(this.defaultFormationVo && this.defaultFormationVo.dto)
         {
            return this.defaultFormationVo.dto.leaderUid;
         }
         return null;
      }
      
      public function set defaultFormationLeaderUid(param1:Int64) : void
      {
         this.defaultFormationVo.dto.leaderUid = param1;
      }
      
      public function get defenceTeamId() : uint
      {
         return this.defenceFormationVo.teamId;
      }
      
      public function get defenceFormationLeaderUid() : Int64
      {
         if(this.defenceFormationVo && this.defenceFormationVo.dto)
         {
            return this.defenceFormationVo.dto.leaderUid;
         }
         return null;
      }
      
      public function set defenceFormationLeaderUid(param1:Int64) : void
      {
         this.defenceFormationVo.dto.leaderUid = param1;
      }
      
      public function updateEmbattleCardTeam(param1:Array) : void
      {
         var _loc2_:BattleCardFormationVO = null;
         var _loc4_:Dto_FormationInfo = null;
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         if(!this.emBattleTeam)
         {
            this.emBattleTeam = new Vector.<BattleCardFormationVO>();
         }
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = param1[_loc3_] as Dto_FormationInfo;
            _loc5_ = this.emBattleTeam.length;
            _loc6_ = true;
            _loc7_ = 0;
            while(_loc7_ < _loc5_)
            {
               _loc2_ = this.emBattleTeam[_loc7_];
               if(_loc2_.teamId == _loc4_.teamId)
               {
                  _loc2_.updateFormation(_loc4_);
                  _loc7_ = _loc5_;
                  _loc6_ = false;
               }
               _loc7_++;
            }
            if(_loc6_)
            {
               _loc2_ = new BattleCardFormationVO(_loc4_);
               this.emBattleTeam.push(_loc2_);
            }
            if(_loc2_.isDefenceTeam)
            {
               this.defenceFormationVo = _loc2_;
            }
            _loc3_++;
         }
      }
      
      public function set unlockNewFormation(param1:Array) : void
      {
         var _loc5_:Dto_FormationInfo = null;
         var _loc2_:Array = [];
         var _loc3_:int = param1.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            (_loc5_ = new Dto_FormationInfo()).teamId = param1[_loc4_];
            _loc5_.cardPos = [];
            _loc5_.formationId = 0;
            _loc5_.totalPower = UInt64.fromNumber(0);
            _loc5_.status = E_TeamStatus.E_TeamStatus_home;
            _loc2_.push(_loc5_);
            _loc4_++;
         }
         this.updateEmbattleCardTeam(_loc2_);
      }
      
      public function getCardStatus(param1:Int64) : int
      {
         var _loc2_:int = this.emBattleTeam.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.emBattleTeam[_loc3_].hasCardByUid(param1))
            {
               if(this.emBattleTeam[_loc3_].dto.status == E_TeamStatus.E_TeamStatus_out)
               {
                  return BattleCardStatus.FORMATION_OUT;
               }
               if(this.emBattleTeam[_loc3_].isDefenceTeam)
               {
                  return BattleCardStatus.FORMATION_DEFENCE;
               }
               return BattleCardStatus.FORMATION_HOME;
            }
            _loc3_++;
         }
         return BattleCardStatus.FORMATION_NO;
      }
      
      public function isTeamOut(param1:int) : Boolean
      {
         var _loc2_:int = this.emBattleTeam.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.emBattleTeam[_loc3_].teamId == param1 && this.emBattleTeam[_loc3_].dto.status == E_TeamStatus.E_TeamStatus_out)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function isEmbattleCard(param1:Int64) : Boolean
      {
         var _loc2_:int = this.emBattleTeam.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.emBattleTeam[_loc3_].hasCardByUid(param1))
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function isFightingFormation(param1:uint) : Boolean
      {
         var _loc2_:int = this.emBattleTeam.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(param1 == this.emBattleTeam[_loc3_].teamId && this.emBattleTeam[_loc3_].dto.status == E_TeamStatus.E_TeamStatus_out)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function get defaultEmbattleCardNum() : uint
      {
         if(!this.defaultFormationVo || !this.defaultFormationVo.dto)
         {
            return 0;
         }
         if(this.defaultFormationVo.dto.cardPos.length == 0)
         {
            return 0;
         }
         if(this.defaultFormationVo.dto.cardPos.length == 1)
         {
            if((this.defaultFormationVo.dto.cardPos[0] as Dto_CardPosInfo).ownerRoleId != null)
            {
               return 0;
            }
         }
         return this.defaultFormationVo.dto.cardPos.length;
      }
      
      public function get defenceEmbattleCardNum() : uint
      {
         if(!this.defenceFormationVo || !this.defenceFormationVo.dto)
         {
            return 0;
         }
         return this.defenceFormationVo.dto.cardPos.length;
      }
      
      public function searchTeamIsUsed(param1:int) : Boolean
      {
         var _loc2_:Dto_IdNum = null;
         for each(_loc2_ in this.searchTeamUse)
         {
            if(_loc2_.id == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function snatchTeamIsUsed(param1:int) : Boolean
      {
         var _loc2_:Dto_IdNum = null;
         for each(_loc2_ in this.snatchTeamUse)
         {
            if(_loc2_.id == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function getEmbattleCardNum(param1:uint) : uint
      {
         var _loc2_:BattleCardFormationVO = null;
         if(this.embaltteFormations.hasOwnProperty(param1))
         {
            _loc2_ = this.embaltteFormations[param1] as BattleCardFormationVO;
            if(_loc2_ && _loc2_.dto)
            {
               return _loc2_.dto.cardPos.length;
            }
         }
         return 0;
      }
      
      public function setFormationInfo(param1:uint, param2:Dto_FormationInfo) : void
      {
         this.embaltteFormations[param1] = new BattleCardFormationVO(param2);
      }
      
      public function clearFormationInfo(param1:uint) : void
      {
         delete this.embaltteFormations[param1];
      }
      
      public function clearFormationTeam(param1:uint) : void
      {
         delete this.embattleTemams[param1];
      }
      
      public function getFormationInfo(param1:uint) : BattleCardFormationVO
      {
         if(!this.embaltteFormations.hasOwnProperty(param1))
         {
            this.embaltteFormations[param1] = new BattleCardFormationVO(new Dto_FormationInfo());
         }
         return this.embaltteFormations[param1];
      }
      
      public function updateFormationTeams(param1:uint, param2:Array) : void
      {
         var _loc3_:Dto_FormationInfo = null;
         var _loc5_:BattleCardFormationVO = null;
         var _loc7_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         if(!this.embattleTemams.hasOwnProperty(param1))
         {
            this.embattleTemams[param1] = new Vector.<BattleCardFormationVO>();
         }
         var _loc4_:Vector.<BattleCardFormationVO> = this.embattleTemams[param1];
         var _loc6_:int = 0;
         while(_loc6_ < param2.length)
         {
            _loc3_ = param2[_loc6_] as Dto_FormationInfo;
            _loc7_ = _loc4_.length;
            _loc8_ = true;
            _loc9_ = 0;
            while(_loc9_ < _loc7_)
            {
               if((_loc5_ = _loc4_[_loc9_]).teamId == _loc3_.teamId)
               {
                  _loc5_.updateFormation(_loc3_);
                  _loc9_ = _loc7_;
                  _loc8_ = false;
               }
               _loc9_++;
            }
            if(_loc8_)
            {
               _loc5_ = new BattleCardFormationVO(_loc3_);
               _loc4_.push(_loc5_);
            }
            _loc6_++;
         }
         if(this.getFormationTeamId(param1) == 0)
         {
            this.setFormationTeamId(param1,1);
         }
      }
      
      public function getEmbattleTeam(param1:uint) : Vector.<BattleCardFormationVO>
      {
         if(this.embattleTemams.hasOwnProperty(param1))
         {
            return this.embattleTemams[param1];
         }
         return null;
      }
      
      public function setFormationTeamId(param1:uint, param2:int) : void
      {
         var _loc3_:Vector.<BattleCardFormationVO> = null;
         var _loc4_:int = 0;
         var _loc5_:BattleCardFormationVO = null;
         this.embattleTeamIds[param1] = param2;
         if(this.embattleTemams.hasOwnProperty(param1))
         {
            _loc3_ = this.embattleTemams[param1] as Vector.<BattleCardFormationVO>;
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               if((_loc5_ = _loc3_[_loc4_] as BattleCardFormationVO).teamId == param2)
               {
                  this.embaltteFormations[param1] = _loc5_;
               }
               _loc4_++;
            }
         }
      }
      
      public function getFormationTeamId(param1:uint) : uint
      {
         if(this.embattleTeamIds.hasOwnProperty(param1))
         {
            return this.embattleTeamIds[param1];
         }
         return 0;
      }
      
      public function getFormationLeaderId(param1:uint) : Int64
      {
         var _loc2_:BattleCardFormationVO = null;
         if(this.embaltteFormations.hasOwnProperty(param1))
         {
            _loc2_ = this.embaltteFormations[param1];
            return _loc2_.dto.leaderUid;
         }
         return null;
      }
      
      public function getActiveDecks(param1:Int64, param2:int) : Array
      {
         var _loc11_:CardDeckDetailInfo = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:Dto_FormationInfo = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:Dto_CardPosInfo = null;
         var _loc18_:CardItemVO = null;
         var _loc19_:BattleLineupCardTemp = null;
         var _loc3_:Vector.<BattleCardFormationVO> = new Vector.<BattleCardFormationVO>();
         if(param2 == EmbattleConst.MODE_HOME || param2 == EmbattleConst.MODE_MAP)
         {
            _loc3_ = this.emBattleTeam;
         }
         else if(this.embattleTemams[param2] != null)
         {
            _loc3_ = this.embattleTemams[param2];
         }
         else
         {
            _loc3_.push(this.embaltteFormations[param2]);
         }
         var _loc4_:CardItemVO;
         if((_loc4_ = this.getBattleCardFullInfo(param1)) == null)
         {
            return [];
         }
         var _loc5_:BattleLineupCardTemp = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateById(_loc4_.cardId);
         var _loc6_:Array = CardTemplateFactory.instance.getAllDeckDetailInfo(_loc4_.cardId);
         var _loc7_:int = -1;
         if(_loc3_ == null)
         {
            return [];
         }
         var _loc8_:int = _loc3_.length;
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_)
         {
            if(_loc3_[_loc9_] && _loc3_[_loc9_].hasCardByUid(param1))
            {
               _loc7_ = _loc9_;
            }
            _loc9_++;
         }
         if(_loc7_ < 0)
         {
            return [];
         }
         var _loc10_:Array = [];
         for each(_loc11_ in _loc6_)
         {
            _loc12_ = 0;
            for each(_loc13_ in _loc11_.componentPlants)
            {
               if(_loc13_ != _loc5_.tdId)
               {
                  _loc15_ = (_loc14_ = _loc3_[_loc7_].dto).cardPos.length;
                  _loc16_ = 0;
                  while(_loc16_ < _loc15_)
                  {
                     if((_loc17_ = _loc14_.cardPos[_loc16_] as Dto_CardPosInfo) && _loc17_.uid != null)
                     {
                        if(_loc18_ = this.getBattleCardFullInfo(_loc17_.uid))
                        {
                           if((_loc19_ = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateById(_loc18_.cardId)).tdId == _loc13_)
                           {
                              _loc12_++;
                              break;
                           }
                        }
                     }
                     _loc16_++;
                  }
               }
            }
            if(_loc12_ == _loc11_.componentPlants.length - 1)
            {
               _loc10_.push(_loc11_.deckId);
            }
         }
         return _loc10_;
      }
   }
}
