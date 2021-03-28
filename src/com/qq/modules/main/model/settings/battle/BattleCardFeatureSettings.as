package com.qq.modules.main.model.settings.battle
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardFeatureTemp;
   import com.qq.utils.db.ClientDBTableName;
   import org.as3commons.logging.api.getLogger;
   
   public class BattleCardFeatureSettings
   {
       
      
      private var featureList:Vector.<BattleLineupCardFeatureTemp>;
      
      public function BattleCardFeatureSettings()
      {
         super();
         this.featureList = Vector.<BattleLineupCardFeatureTemp>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.BattleLineupCardFeatureTemp,BattleLineupCardFeatureTemp));
      }
      
      public function getCardFeatureTempById(param1:int) : BattleLineupCardFeatureTemp
      {
         if(!this.featureList)
         {
            getLogger().error("can\'t get feature temp!!!");
            return null;
         }
         var _loc2_:int = this.featureList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.featureList[_loc3_].id == param1)
            {
               return this.featureList[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
   }
}
