package com.qq.modules.td.data
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.td.data.game.unit.TDBulletStaticInfo;
   import com.qq.modules.td.data.game.unit.TDNormalObjectStaticInfo;
   import com.qq.modules.td.data.game.unit.TDPlantBaseStaticInfo;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.modules.td.data.game.unit.TDZombieStaticInfo;
   import com.qq.modules.td.data.game.unit.ce.TDAvatarInfoTemplateCE;
   import com.qq.modules.td.data.game.unit.ce.TDEnergyBeanBuyCE;
   import com.qq.modules.td.data.game.unit.ce.TDSunBuyCE;
   import com.qq.modules.td.model.templates.ce.DailyTDZombieTemplateCE;
   import com.qq.modules.td.model.templates.ce.TDChallengeScoreTemplateCE;
   import com.qq.utils.db.ClientDBTableName;
   
   public class TDDataFactory
   {
      
      private static var _instance:TDDataFactory;
       
      
      private var plantInfoCache:Vector.<TDPlantStaticInfo>;
      
      private var plantBaseCache:Vector.<TDPlantBaseStaticInfo>;
      
      private var plantAvatarCache:Vector.<TDAvatarInfoTemplateCE>;
      
      private var zombieInfoCache:Vector.<TDZombieStaticInfo>;
      
      private var bulletInfo:Vector.<TDBulletStaticInfo>;
      
      private var normalObjectInfo:Vector.<TDNormalObjectStaticInfo>;
      
      private var dailyTDZombieInfoCache:Vector.<DailyTDZombieTemplateCE>;
      
      private var challengeScoreCache:Vector.<TDChallengeScoreTemplateCE>;
      
      private var energyBeanBuyCache:Vector.<TDEnergyBeanBuyCE>;
      
      private var sunBuyCache:Vector.<TDSunBuyCE>;
      
      public function TDDataFactory()
      {
         super();
      }
      
      public static function get instance() : TDDataFactory
      {
         if(_instance == null)
         {
            _instance = new TDDataFactory();
         }
         return _instance;
      }
      
      public function getNormalObjectInfoByID(param1:int) : TDNormalObjectStaticInfo
      {
         var _loc2_:int = 0;
         var _loc4_:TDNormalObjectStaticInfo = null;
         if(this.normalObjectInfo == null)
         {
            this.normalObjectInfo = Vector.<TDNormalObjectStaticInfo>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_ObjectInfo,TDNormalObjectStaticInfo));
         }
         var _loc3_:int = this.normalObjectInfo.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((_loc4_ = this.normalObjectInfo[_loc2_]).id == param1)
            {
               return _loc4_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getBulletInfoByID(param1:int) : TDBulletStaticInfo
      {
         var _loc2_:int = 0;
         var _loc4_:TDBulletStaticInfo = null;
         if(this.bulletInfo == null)
         {
            this.bulletInfo = Vector.<TDBulletStaticInfo>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_BulletInfo,TDBulletStaticInfo));
         }
         var _loc3_:int = this.bulletInfo.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((_loc4_ = this.bulletInfo[_loc2_]).id == param1)
            {
               return _loc4_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getZombieInfoByID(param1:int) : TDZombieStaticInfo
      {
         var _loc2_:int = 0;
         var _loc5_:TDZombieStaticInfo = null;
         var _loc6_:TDZombieStaticInfo = null;
         if(this.zombieInfoCache == null)
         {
            this.zombieInfoCache = Vector.<TDZombieStaticInfo>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_ZombieInfo,TDZombieStaticInfo));
         }
         var _loc3_:int = this.zombieInfoCache.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((_loc5_ = this.zombieInfoCache[_loc2_]).id == param1)
            {
               return _loc5_;
            }
            _loc2_++;
         }
         var _loc4_:DailyTDZombieTemplateCE;
         if((_loc4_ = this.getDailyTDZombieInfo(param1)) != null)
         {
            param1 = _loc4_.type;
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               if((_loc6_ = this.zombieInfoCache[_loc2_]).id == param1)
               {
                  return _loc6_;
               }
               _loc2_++;
            }
         }
         return null;
      }
      
      public function getDailyTDZombieInfo(param1:int) : DailyTDZombieTemplateCE
      {
         var _loc2_:int = 0;
         var _loc4_:DailyTDZombieTemplateCE = null;
         if(this.dailyTDZombieInfoCache == null)
         {
            this.dailyTDZombieInfoCache = Vector.<DailyTDZombieTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_DailyZombieInfo,DailyTDZombieTemplateCE));
         }
         var _loc3_:int = this.dailyTDZombieInfoCache.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((_loc4_ = this.dailyTDZombieInfoCache[_loc2_]).id == param1)
            {
               return _loc4_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getPlantInfoByID(param1:int) : TDPlantStaticInfo
      {
         var _loc2_:int = 0;
         var _loc4_:TDPlantStaticInfo = null;
         if(this.plantInfoCache == null)
         {
            this.plantInfoCache = Vector.<TDPlantStaticInfo>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_PlantInfo,TDPlantStaticInfo));
         }
         var _loc3_:int = this.plantInfoCache.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((_loc4_ = this.plantInfoCache[_loc2_]).id == param1)
            {
               return _loc4_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getPlantInfoByIconID(param1:int) : TDPlantStaticInfo
      {
         var _loc2_:int = 0;
         var _loc4_:TDPlantStaticInfo = null;
         if(this.plantInfoCache == null)
         {
            this.plantInfoCache = Vector.<TDPlantStaticInfo>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_PlantInfo,TDPlantStaticInfo));
         }
         var _loc3_:int = this.plantInfoCache.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((_loc4_ = this.plantInfoCache[_loc2_]).baseInfo.iconID == param1)
            {
               return _loc4_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getPlantInfByStageID(param1:int) : Array
      {
         var _loc3_:int = 0;
         var _loc5_:TDPlantStaticInfo = null;
         if(this.plantInfoCache == null)
         {
            this.plantInfoCache = Vector.<TDPlantStaticInfo>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_PlantInfo,TDPlantStaticInfo));
         }
         var _loc2_:Array = new Array();
         var _loc4_:int = this.plantInfoCache.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if((_loc5_ = this.plantInfoCache[_loc3_]).stageId == param1)
            {
               _loc2_.push(_loc5_);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getPlantBaseInfoByID(param1:int) : TDPlantBaseStaticInfo
      {
         var _loc2_:int = 0;
         var _loc4_:TDPlantBaseStaticInfo = null;
         if(this.plantBaseCache == null)
         {
            this.plantBaseCache = Vector.<TDPlantBaseStaticInfo>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_PlantTypeInfo,TDPlantBaseStaticInfo));
         }
         var _loc3_:int = this.plantBaseCache.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((_loc4_ = this.plantBaseCache[_loc2_]).id == param1)
            {
               return _loc4_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getAvatarInfoByID(param1:int) : TDAvatarInfoTemplateCE
      {
         var _loc2_:int = 0;
         var _loc4_:TDAvatarInfoTemplateCE = null;
         if(this.plantAvatarCache == null)
         {
            this.plantAvatarCache = Vector.<TDAvatarInfoTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_TDAvaterInfo,TDAvatarInfoTemplateCE));
         }
         var _loc3_:int = this.plantAvatarCache.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((_loc4_ = this.plantAvatarCache[_loc2_]).id == param1)
            {
               return _loc4_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getAllPlantInfoCache() : Vector.<TDPlantStaticInfo>
      {
         if(this.plantInfoCache == null)
         {
            this.plantInfoCache = Vector.<TDPlantStaticInfo>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_PlantInfo,TDPlantStaticInfo));
         }
         return this.plantInfoCache;
      }
      
      public function getChallengeScoreByTypeAndCnt(param1:int, param2:int) : TDChallengeScoreTemplateCE
      {
         var _loc4_:TDChallengeScoreTemplateCE = null;
         if(this.challengeScoreCache == null)
         {
            this.challengeScoreCache = Vector.<TDChallengeScoreTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_CHALLENGE_SCORE,TDChallengeScoreTemplateCE));
         }
         var _loc3_:TDChallengeScoreTemplateCE = null;
         for each(_loc4_ in this.challengeScoreCache)
         {
            if(_loc4_.type == param1 && param2 >= _loc4_.count)
            {
               _loc3_ = _loc4_;
            }
            if(_loc3_ && _loc4_.type == param1 && param2 < _loc4_.count)
            {
               return _loc3_;
            }
         }
         return _loc3_;
      }
      
      public function getInitChallengeScoreByType(param1:int) : TDChallengeScoreTemplateCE
      {
         var _loc2_:TDChallengeScoreTemplateCE = null;
         if(this.challengeScoreCache == null)
         {
            this.challengeScoreCache = Vector.<TDChallengeScoreTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_CHALLENGE_SCORE,TDChallengeScoreTemplateCE));
         }
         for each(_loc2_ in this.challengeScoreCache)
         {
            if(_loc2_.type == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getEnergyBeanBuyPrice(param1:int) : TDEnergyBeanBuyCE
      {
         var _loc2_:TDEnergyBeanBuyCE = null;
         if(this.energyBeanBuyCache == null)
         {
            this.energyBeanBuyCache = Vector.<TDEnergyBeanBuyCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_ENERGY_BEAN_BUY,TDEnergyBeanBuyCE));
         }
         for each(_loc2_ in this.energyBeanBuyCache)
         {
            if(_loc2_.count == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getSunBuyPrice(param1:int) : TDSunBuyCE
      {
         var _loc2_:TDSunBuyCE = null;
         if(this.sunBuyCache == null)
         {
            this.sunBuyCache = Vector.<TDSunBuyCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_SUN_BUY,TDSunBuyCE));
         }
         for each(_loc2_ in this.sunBuyCache)
         {
            if(_loc2_.count == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
