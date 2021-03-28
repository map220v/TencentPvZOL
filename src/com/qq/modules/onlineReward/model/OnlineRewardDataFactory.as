package com.qq.modules.onlineReward.model
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.onlineReward.model.templates.ce.OnlineDailyRewardTemplateCE;
   import com.qq.modules.onlineReward.model.templates.ce.OnlineWeekRewardTemplateCE;
   import com.qq.utils.db.ClientDBTableName;
   
   public class OnlineRewardDataFactory
   {
      
      private static var _instance:OnlineRewardDataFactory;
       
      
      private var _dailyRewardInfoCache:Vector.<OnlineDailyRewardTemplateCE>;
      
      private var _weekRewardInfoCache:Vector.<OnlineWeekRewardTemplateCE>;
      
      public function OnlineRewardDataFactory()
      {
         super();
      }
      
      public static function get instance() : OnlineRewardDataFactory
      {
         if(_instance == null)
         {
            _instance = new OnlineRewardDataFactory();
         }
         return _instance;
      }
      
      public function getDailyRewardInfoByID(param1:int) : OnlineDailyRewardTemplateCE
      {
         var _loc2_:int = 0;
         var _loc4_:OnlineDailyRewardTemplateCE = null;
         if(this._dailyRewardInfoCache == null)
         {
            this._dailyRewardInfoCache = Vector.<OnlineDailyRewardTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_Online_Daily_Reward,OnlineDailyRewardTemplateCE));
         }
         var _loc3_:int = this._dailyRewardInfoCache.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((_loc4_ = this._dailyRewardInfoCache[_loc2_]).id == param1)
            {
               return _loc4_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function totalDailyReward() : int
      {
         if(this._dailyRewardInfoCache == null)
         {
            this._dailyRewardInfoCache = Vector.<OnlineDailyRewardTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_Online_Daily_Reward,OnlineDailyRewardTemplateCE));
         }
         return this._dailyRewardInfoCache.length;
      }
      
      public function getTotalWeeklyReward() : int
      {
         if(this._weekRewardInfoCache == null)
         {
            this._weekRewardInfoCache = Vector.<OnlineWeekRewardTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_Online_Week_Reward,OnlineWeekRewardTemplateCE));
         }
         return this._weekRewardInfoCache.length;
      }
      
      public function getWeekRewardInfoByLevel(param1:int) : OnlineWeekRewardTemplateCE
      {
         var _loc2_:int = 0;
         var _loc4_:OnlineWeekRewardTemplateCE = null;
         if(this._weekRewardInfoCache == null)
         {
            this._weekRewardInfoCache = Vector.<OnlineWeekRewardTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_Online_Week_Reward,OnlineWeekRewardTemplateCE));
         }
         var _loc3_:int = this._weekRewardInfoCache.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((_loc4_ = this._weekRewardInfoCache[_loc2_]).id == param1)
            {
               return _loc4_;
            }
            _loc2_++;
         }
         return null;
      }
   }
}
