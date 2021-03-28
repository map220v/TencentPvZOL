package com.qq.modules.union.model
{
   import PVZ.Cmd.Dto_Guild_BaseInfo;
   import PVZ.Cmd.Dto_Guild_Info;
   import PVZ.Cmd.GuildPosition;
   import com.qq.constant.union.UnionConstant;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.utils.DateUtils;
   import com.tencent.protobuf.Int64;
   import flash.utils.Dictionary;
   
   public class UnionModel
   {
       
      
      public var playerUnionInfo:PlayerUnionInfo;
      
      public var baseInfoListCache:Array;
      
      public var count:int;
      
      public var myUnionDetailInfoCache:Dto_Guild_Info;
      
      public var unionMemberList:Array;
      
      public var otherUnionUID:Int64;
      
      public var otherUnionMemberList:Array;
      
      public var inviteList:Array;
      
      private var m_dicSkill:Dictionary;
      
      public var gardenLogData:Array;
      
      public var unionJoinListCache:Array;
      
      public var unionBonusData:UnionBonusData;
      
      public var useMuckID:int;
      
      public var searchUnionInfoCache:Dto_Guild_BaseInfo;
      
      public var otherUnionDetailInfoCache:Dto_Guild_BaseInfo;
      
      public var otherUnionOccupyCircus:int;
      
      public var otherUnionOccupyPlay:int;
      
      public var honorRankList:Array;
      
      public var eventList:Array;
      
      public var isAllowOneKey:Boolean;
      
      public var needPower:int;
      
      private var m_aryDonate:Array;
      
      private var m_donateLevel:int = -1;
      
      public var rewardItemID:int;
      
      public var rewardHistoryNum:int;
      
      public var rewardTakeNum:int;
      
      public var rewardCurrNum:int;
      
      public var rewardMaxNum:int;
      
      public function UnionModel()
      {
         super();
         this.playerUnionInfo = new PlayerUnionInfo();
         this.unionBonusData = new UnionBonusData();
         this.m_dicSkill = new Dictionary();
      }
      
      public function get donateLevelLimit() : int
      {
         if(this.m_donateLevel < 0)
         {
            this.m_donateLevel = ServerConfigTemplateFactory.instance.iGuildDonateLevelLimit;
         }
         return this.m_donateLevel;
      }
      
      public function getDonateGoldLimit(param1:int) : int
      {
         var _loc2_:String = null;
         if(this.m_aryDonate == null)
         {
            _loc2_ = ServerConfigTemplateFactory.instance.sGuildDonateGoldLimit;
            this.m_aryDonate = _loc2_.split(";");
         }
         if(param1 < this.m_donateLevel)
         {
            return this.m_aryDonate[0];
         }
         return this.m_aryDonate[1];
      }
      
      public function getBaseInfoListCacheByUID(param1:Int64) : Dto_Guild_BaseInfo
      {
         var _loc4_:Dto_Guild_BaseInfo = null;
         if(this.baseInfoListCache == null)
         {
            return null;
         }
         var _loc2_:int = this.baseInfoListCache.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this.baseInfoListCache[_loc3_]).guildId.compare(param1))
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getPlayerUnionState() : int
      {
         if(this.playerUnionInfo.isVaild())
         {
            return UnionConstant.PlayerState_In_Union;
         }
         if(this.playerUnionInfo.isApplyUnion)
         {
            return UnionConstant.PlayerState_Waiting_Approve;
         }
         if(this.getUnionJoinCDSec() > 0)
         {
            return UnionConstant.PlayerState_Waiting_CD;
         }
         return UnionConstant.PlayerState_No_Union;
      }
      
      public function getUnionJoinCDSec() : Number
      {
         return this.playerUnionInfo.lastLeaveUnionTime + 8 * 3600 - DateUtils.getInstance().getServerTime();
      }
      
      public function isIncludeApplyList(param1:Int64) : Boolean
      {
         var _loc4_:Int64 = null;
         if(!this.playerUnionInfo.isApplyUnion)
         {
            return false;
         }
         var _loc2_:int = this.playerUnionInfo.applyUnionList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this.playerUnionInfo.applyUnionList[_loc3_]).compare(param1))
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function isApplyThisUnion(param1:Int64) : int
      {
         if(this.playerUnionInfo.isVaild())
         {
            return UnionConstant.ApplyUnionState_In_Union;
         }
         var _loc2_:Boolean = this.isIncludeApplyList(param1);
         if(_loc2_)
         {
            return UnionConstant.ApplyUnionState_Waitting_Approve;
         }
         if(this.playerUnionInfo.applyUnionList != null && this.playerUnionInfo.applyUnionList.length >= ServerConfigTemplateFactory.instance.iGuildJoinListMax)
         {
            return UnionConstant.ApplyUnionState_Apply_Max;
         }
         if(this.getUnionJoinCDSec() > 0)
         {
            return UnionConstant.ApplyUnionState_Waitting_CD;
         }
         return UnionConstant.ApplyUnionState_OK;
      }
      
      public function hasAuthorizationForInvite() : Boolean
      {
         var _loc1_:int = 0;
         if(this.playerUnionInfo.isVaild())
         {
            _loc1_ = UnionConstant.getUnionPostitionLevel(this.playerUnionInfo.position);
            if(_loc1_ >= UnionConstant.PostitionLevel_3)
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasAuthorizationForFire(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.playerUnionInfo.isVaild())
         {
            _loc2_ = UnionConstant.getUnionPostitionLevel(this.playerUnionInfo.position);
            if(_loc2_ >= UnionConstant.PostitionLevel_2)
            {
               _loc3_ = UnionConstant.getUnionPostitionLevel(param1);
               if(_loc2_ > _loc3_)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function hasAuthorizationForUpgrade(param1:int) : Boolean
      {
         if(this.playerUnionInfo.isVaild() && (this.playerUnionInfo.position == GuildPosition.GuildPosition_Leader || this.playerUnionInfo.position == GuildPosition.GuildPosition_DeputyLeader))
         {
            if(UnionConstant.getUnionPostitionLevel(this.playerUnionInfo.position) > UnionConstant.getUnionPostitionLevel(param1))
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasAuthorizationForDrop(param1:int) : Boolean
      {
         if(this.playerUnionInfo.isVaild() && (this.playerUnionInfo.position == GuildPosition.GuildPosition_Leader || this.playerUnionInfo.position == GuildPosition.GuildPosition_DeputyLeader))
         {
            if(UnionConstant.getUnionPostitionLevel(this.playerUnionInfo.position) > UnionConstant.getUnionPostitionLevel(param1))
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasAuthorizationForDelater() : Boolean
      {
         if(this.playerUnionInfo.isVaild() && (this.playerUnionInfo.position == GuildPosition.GuildPosition_DeputyLeader || this.playerUnionInfo.position == GuildPosition.GuildPosition_Elite))
         {
            return true;
         }
         return false;
      }
      
      public function hasAuthorizationForDeliver(param1:int) : Boolean
      {
         if(this.playerUnionInfo.isVaild() && this.playerUnionInfo.position == GuildPosition.GuildPosition_Leader)
         {
            if(param1 == GuildPosition.GuildPosition_DeputyLeader || param1 == GuildPosition.GuildPosition_Elite)
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasAuthorizationForCancelDeliver() : Boolean
      {
         if(this.playerUnionInfo.isVaild() && this.playerUnionInfo.position == GuildPosition.GuildPosition_Leader)
         {
            return true;
         }
         return false;
      }
      
      public function hasAuthorizationForbidding() : Boolean
      {
         var _loc1_:int = 0;
         if(this.playerUnionInfo.isVaild())
         {
            _loc1_ = UnionConstant.getUnionPostitionLevel(this.playerUnionInfo.position);
            if(_loc1_ >= UnionConstant.PostitionLevel_1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasAuthorizationInvite() : Boolean
      {
         var _loc1_:int = 0;
         if(this.playerUnionInfo.isVaild())
         {
            _loc1_ = UnionConstant.getUnionPostitionLevel(this.playerUnionInfo.position);
            if(_loc1_ >= UnionConstant.PostitionLevel_3)
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasAuthorizationAnouncement() : Boolean
      {
         var _loc1_:int = 0;
         if(this.playerUnionInfo.isVaild())
         {
            _loc1_ = UnionConstant.getUnionPostitionLevel(this.playerUnionInfo.position);
            if(_loc1_ >= UnionConstant.PostitionLevel_2)
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasAuthorizationSendMail() : Boolean
      {
         var _loc1_:int = 0;
         if(this.playerUnionInfo.isVaild())
         {
            _loc1_ = UnionConstant.getUnionPostitionLevel(this.playerUnionInfo.position);
            if(_loc1_ >= UnionConstant.PostitionLevel_2)
            {
               return true;
            }
         }
         return false;
      }
      
      public function setSkillLevel(param1:int, param2:int) : void
      {
         this.m_dicSkill[param1] = param2;
      }
      
      public function getSkillLevel(param1:int) : int
      {
         if(this.m_dicSkill.hasOwnProperty(param1))
         {
            return this.m_dicSkill[param1];
         }
         return 0;
      }
      
      public function isLeader() : Boolean
      {
         if(this.playerUnionInfo.isVaild() && this.playerUnionInfo.position == GuildPosition.GuildPosition_Leader)
         {
            return true;
         }
         return false;
      }
      
      public function resetDailyReward(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.rewardItemID = param1;
         this.rewardHistoryNum = param2;
         this.rewardTakeNum = param3;
         this.rewardCurrNum = param4;
         this.rewardMaxNum = param5;
      }
      
      public function hasRward() : Boolean
      {
         var _loc1_:int = this.rewardHistoryNum + this.rewardCurrNum - this.rewardTakeNum;
         return _loc1_ > 0;
      }
   }
}
