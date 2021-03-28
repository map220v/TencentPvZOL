package com.qq.modules.topKing.model
{
   import PVZ.Cmd.Cmd_TopFight_Info_SC;
   import PVZ.Cmd.Dto_TopFightPairBetInfo;
   import PVZ.Cmd.Dto_TopFightRoleInfo;
   import PVZ.Cmd.Dto_TopFightStageBetInfo;
   import PVZ.Cmd.Dto_TopFightStageInfo;
   import com.qq.GameGloble;
   import com.qq.constant.ItemID;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.main.constant.PrivilegeConst;
   import com.qq.modules.topKing.TopKingConst;
   import org.as3commons.logging.api.getLogger;
   
   public class TopKingModel
   {
      
      public static const State_State_not_inited:int = 0;
      
      public static const Stage_State_Fighting:int = 1;
      
      public static const Stage_State_Finished:int = 2;
      
      public static const Stage_State_Waitting:int = 3;
      
      public static const Stage_State_Seasion_Finish:int = 4;
      
      public static const Round_State_Not_Inited:int = -1;
      
      public static const Round_State_Not_Start:int = 0;
      
      public static const Round_State_Fighting:int = 1;
      
      public static const Round_State_Waitting:int = 2;
      
      public static const Round_State_Finish:int = 3;
      
      public static const Reward_State_Not_Inited:int = 0;
      
      public static const Reward_State_No_Reward:int = 1;
      
      public static const Reward_State_Has_Reward:int = 2;
      
      public static const Reward_State_Has_Taken:int = 3;
      
      public static const Reward_State_Waiting:int = 4;
       
      
      public var seasonId:int;
      
      public var stageID:int;
      
      public var roundIndex:int;
      
      public var roundFinished:Boolean;
      
      public var playerList:Array;
      
      public var stageInfoList:Array;
      
      public var championInfo:Dto_TopFightRoleInfo;
      
      public var rewardStageID:int;
      
      public var hasTakenReward:Boolean;
      
      private var _isJoin:Boolean;
      
      private var _isOpening:Boolean;
      
      private var _beginTime_second:Number;
      
      public var roleNumPerZone:int;
      
      private var _curStageBeginTime_second:Number;
      
      private var _isInited:Boolean;
      
      public var curStageInfo:TopKingStageInfo;
      
      public var disabled:Boolean;
      
      private var _bet_Info:Array;
      
      public function TopKingModel()
      {
         super();
         this._isInited = false;
      }
      
      public function reset(param1:Cmd_TopFight_Info_SC) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Dto_TopFightStageBetInfo = null;
         this.roleNumPerZone = param1.roleNumPerZone;
         this.seasonId = param1.seasonId;
         this.stageID = param1.stageId;
         this.roundIndex = param1.roundId;
         this.roundFinished = param1.roundFinished;
         this.playerList = param1.roleInfo;
         this.stageInfoList = param1.stageInfo;
         this.championInfo = param1.championInfo;
         this.disabled = param1.disabled;
         if(this.championInfo != null)
         {
            TopKingConst.championRoleID = this.championInfo.roleId;
         }
         this._isJoin = param1.joined;
         this._isOpening = param1.opening;
         this._beginTime_second = param1.beginTime;
         if(this.stageID == 0)
         {
            if(!this._isOpening)
            {
               this.stageID = 900;
            }
            else
            {
               this.stageID = 100;
            }
         }
         this.curStageInfo = TopKingDataFactory.getInstance().getStageInfoByID(this.stageID);
         if(this.curStageInfo != null)
         {
            this._curStageBeginTime_second = param1.beginTime + this.curStageInfo.startTime;
            this._isInited = true;
         }
         this.rewardStageID = param1.rewardStageId;
         this.hasTakenReward = param1.hasTakenReward;
         this._bet_Info = new Array();
         if(param1.betInfo != null)
         {
            _loc2_ = param1.betInfo.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = param1.betInfo[_loc3_];
               this._bet_Info[_loc4_.stageId] = _loc4_.pairBet;
               _loc3_++;
            }
         }
      }
      
      public function getBetTimesByStageID(param1:int) : int
      {
         var _loc2_:Array = this.getBetBattleIDListByStageID(param1);
         if(_loc2_ == null)
         {
            return 0;
         }
         return _loc2_.length;
      }
      
      public function getBetBattleIDListByStageID(param1:int) : Array
      {
         if(this._bet_Info == null)
         {
            return null;
         }
         return this._bet_Info[param1];
      }
      
      public function getBetThisBattle(param1:int) : Dto_TopFightPairBetInfo
      {
         var _loc7_:Dto_TopFightPairBetInfo = null;
         var _loc2_:int = TopKingConst.getStageIDByBattleID(param1);
         var _loc3_:Array = this.getBetBattleIDListByStageID(_loc2_);
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:int = TopKingConst.getBattleIndexByBattleID(param1);
         var _loc5_:int = _loc3_.length;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            if((_loc7_ = _loc3_[_loc6_]).pairIndex == _loc4_)
            {
               return _loc7_;
            }
            _loc6_++;
         }
         return null;
      }
      
      public function hasBetThisBattle(param1:int) : Boolean
      {
         var _loc2_:Dto_TopFightPairBetInfo = this.getBetThisBattle(param1);
         return _loc2_ != null;
      }
      
      public function isJoinBattle() : Boolean
      {
         return this._isJoin || this.rewardStageID != 0;
      }
      
      public function get isOpening() : Boolean
      {
         return this._isOpening;
      }
      
      public function getStageState() : int
      {
         if(this._isInited)
         {
            if(this.curStageInfo == null)
            {
               getLogger("topking").error("找不到轮次配置");
               return State_State_not_inited;
            }
            if(this.isOpening && this.stageID != 0)
            {
               if(this.roundFinished)
               {
                  if(this.roundIndex >= this.curStageInfo.totalBattle)
                  {
                     return Stage_State_Finished;
                  }
                  return Stage_State_Waitting;
               }
               if(this.curStageInfo.totalBattle == 0)
               {
                  return Stage_State_Finished;
               }
               return Stage_State_Fighting;
            }
            return Stage_State_Seasion_Finish;
         }
         getLogger("topking").error("数据没有初始化");
         return State_State_not_inited;
      }
      
      public function getRoundState(param1:int) : int
      {
         if(!this.isInited())
         {
            return Round_State_Not_Inited;
         }
         if(param1 == this.roundIndex)
         {
            if(this.roundFinished)
            {
               return Round_State_Finish;
            }
            return Round_State_Fighting;
         }
         if(param1 > this.roundIndex)
         {
            return Round_State_Not_Start;
         }
         return Round_State_Finish;
      }
      
      public function isInited() : Boolean
      {
         return this._isInited;
      }
      
      public function is32FighterBegin() : Boolean
      {
         return this.stageID >= 500;
      }
      
      public function isFirstStage() : Boolean
      {
         if(!this.isInited())
         {
            return true;
         }
         return this.stageID == 100;
      }
      
      public function get beginTime_second() : Number
      {
         return this._beginTime_second;
      }
      
      public function get curStageBeginTime_second() : Number
      {
         return this._curStageBeginTime_second;
      }
      
      public function getRewardState() : int
      {
         var _loc1_:int = 0;
         if(this._isInited)
         {
            if(!this.isOpening)
            {
               if(this.rewardStageID == 0)
               {
                  _loc1_ = Reward_State_No_Reward;
               }
               else if(this.hasTakenReward)
               {
                  _loc1_ = Reward_State_Has_Taken;
               }
               else
               {
                  _loc1_ = Reward_State_Has_Reward;
               }
            }
            else
            {
               _loc1_ = Reward_State_Waiting;
            }
         }
         else
         {
            _loc1_ = Reward_State_Not_Inited;
         }
         return _loc1_;
      }
      
      public function getBattleResult(param1:int) : Array
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Dto_TopFightStageInfo = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Boolean = false;
         var _loc2_:int = 0;
         if(this.stageInfoList != null)
         {
            _loc3_ = this.stageInfoList.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc6_ = (_loc5_ = this.stageInfoList[_loc4_]).result.length;
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  if(_loc2_ == _loc7_)
                  {
                     return [_loc8_ = _loc5_.result[_loc7_]];
                  }
                  _loc2_++;
                  _loc7_++;
               }
               _loc4_++;
            }
         }
         return null;
      }
      
      public function getMaxBetVal(param1:int) : int
      {
         var _loc2_:int = 0;
         if(param1 == ItemID.Coin)
         {
            _loc2_ = this.getMaxBetCoinVal();
         }
         else
         {
            _loc2_ = this.getMaxBetBlueDiamondVal();
         }
         return _loc2_;
      }
      
      private function getMaxBetCoinVal() : int
      {
         var _loc1_:int = 0;
         if(GameGloble.actorModel.actorLevel < ServerConfigTemplateFactory.instance.betCoinReqireLv && !GameGloble.privilegeProxy.hasPrivilege(PrivilegeConst.PRIVILEGE_TOPKING_BET_BLUE_DIAMOND_EXTRA,false))
         {
            return 0;
         }
         return int(TopKingDataFactory.getInstance().getBetMaxCoinByLv(GameGloble.actorModel.actorLevel));
      }
      
      private function getMaxBetBlueDiamondVal() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(GameGloble.actorModel.actorLevel >= ServerConfigTemplateFactory.instance.betBlueDiamondReqireLv)
         {
            _loc1_ = ServerConfigTemplateFactory.instance.betBlueDiamondMax;
         }
         else if(GameGloble.privilegeProxy.hasPrivilege(PrivilegeConst.PRIVILEGE_TOPKING_BET_BLUE_DIAMOND_EXTRA,false))
         {
            _loc1_ = ServerConfigTemplateFactory.instance.betBlueDiamondMax;
         }
         if(_loc1_ > 0)
         {
            _loc2_ = GameGloble.privilegeProxy.getPrivilegeParamById(PrivilegeConst.PRIVILEGE_TOPKING_BET_BLUE_DIAMOND_EXTRA,false);
            _loc1_ += _loc2_;
         }
         return _loc1_;
      }
   }
}
