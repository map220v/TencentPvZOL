package com.qq.modules.main.model.settings.battleCard
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.main.model.settings.battleCard.ce.BattleCardMarketSettingCE;
   import com.qq.utils.db.ClientDBTableName;
   
   public class BattleCardMarketSettings
   {
       
      
      private var settingList:Vector.<BattleCardMarketSetting>;
      
      public function BattleCardMarketSettings()
      {
         super();
         this.settingList = Vector.<BattleCardMarketSetting>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.BattleCardMarketSetting,BattleCardMarketSetting));
      }
      
      public function getSettingByType(param1:int) : BattleCardMarketSetting
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.settingList.length)
         {
            if(this.settingList[_loc2_].id == param1)
            {
               return this.settingList[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getNeedCardNumByType(param1:int) : int
      {
         var _loc3_:BattleCardMarketSettingCE = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.settingList.length)
         {
            _loc3_ = this.settingList[_loc2_];
            if(_loc3_.id == param1)
            {
               if(_loc3_.needCardNum.length > 0)
               {
                  return _loc3_.needCardNum.split(":")[1];
               }
               return 0;
            }
            _loc2_++;
         }
         return 0;
      }
      
      public function getDescByType(param1:int) : String
      {
         var _loc2_:BattleCardMarketSetting = null;
         for each(_loc2_ in this.settingList)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_.desc;
            }
         }
         return "";
      }
   }
}
