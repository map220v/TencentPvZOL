package com.qq.modules.topKing.model
{
   import com.qq.GameGloble;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.main.constant.PrivilegeConst;
   import com.qq.modules.topKing.model.templates.ce.TopKingCoinBetInfoCE;
   import com.qq.utils.db.ClientDBTableName;
   import org.as3commons.logging.api.getLogger;
   
   public class TopKingDataFactory
   {
      
      private static var _instance:TopKingDataFactory;
       
      
      private var stageInfoList:Vector.<TopKingStageInfo>;
      
      private var betCoinList:Vector.<TopKingCoinBetInfoCE>;
      
      private var _stageIDMap:Array;
      
      public function TopKingDataFactory()
      {
         var _loc3_:TopKingStageInfo = null;
         super();
         this.stageInfoList = Vector.<TopKingStageInfo>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_TOPKING_STAGE_INFO,TopKingStageInfo));
         this._stageIDMap = new Array();
         var _loc1_:int = this.stageInfoList.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this.stageInfoList[_loc2_];
            this._stageIDMap[_loc2_] = _loc3_.id;
            _loc2_++;
         }
      }
      
      public static function getInstance() : TopKingDataFactory
      {
         if(_instance == null)
         {
            _instance = new TopKingDataFactory();
         }
         return _instance;
      }
      
      public function getStageInfoByID(param1:int) : TopKingStageInfo
      {
         var _loc4_:TopKingStageInfo = null;
         var _loc2_:int = this.stageInfoList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this.stageInfoList[_loc3_]).id == param1)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getStageInfoByIndex(param1:int) : TopKingStageInfo
      {
         var _loc2_:int = this.stageIndex2ID(param1);
         return this.getStageInfoByID(_loc2_);
      }
      
      public function stageIndex2ID(param1:int) : int
      {
         return int(this._stageIDMap[param1]);
      }
      
      public function stageID2Index(param1:int) : int
      {
         var _loc2_:int = this._stageIDMap.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this._stageIDMap[_loc3_] == param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         getLogger("topking").error("无法找到对应id的轮次");
         return -1;
      }
      
      public function getStageIDByRewardBoxIndex(param1:int) : Array
      {
         var _loc5_:TopKingStageInfo = null;
         var _loc2_:Array = new Array();
         var _loc3_:int = this.stageInfoList.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc5_ = this.stageInfoList[_loc4_]).rewardBoxIndex == param1)
            {
               _loc2_.push(_loc5_.id);
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function getBetMaxCoinByLv(param1:int) : int
      {
         var _loc5_:TopKingCoinBetInfoCE = null;
         var _loc6_:TopKingCoinBetInfoCE = null;
         var _loc2_:int = 0;
         if(this.betCoinList == null)
         {
            this.betCoinList = Vector.<TopKingCoinBetInfoCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_TOPKING_COIN_BET_INFO,TopKingCoinBetInfoCE));
         }
         var _loc3_:int = this.betCoinList.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = this.betCoinList[_loc4_];
            if(param1 < _loc5_.minLvRequired)
            {
               break;
            }
            _loc2_ = _loc5_.maxBetNum;
            _loc4_++;
         }
         if(_loc2_ <= 0 && GameGloble.privilegeProxy.hasPrivilege(PrivilegeConst.PRIVILEGE_TOPKING_BET_COIN_NOT_LIMIT))
         {
            if(this.betCoinList != null && this.betCoinList.length > 0)
            {
               if((_loc6_ = this.betCoinList[0]) != null)
               {
                  _loc2_ = _loc6_.maxBetNum;
               }
            }
         }
         return _loc2_;
      }
   }
}
