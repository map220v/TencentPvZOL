package com.qq.modules.main.model.settings.battle
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardLevelTemp;
   import com.qq.utils.db.ClientDBTableName;
   
   public class BattleCardLevelSettings
   {
       
      
      private var levelSettingList:Vector.<BattleLineupCardLevelTemp>;
      
      private var _maxCardLvMap:Array;
      
      private var _maxCardLV:int;
      
      public function BattleCardLevelSettings()
      {
         super();
         this.levelSettingList = Vector.<BattleLineupCardLevelTemp>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.BattleLineupCardLevelTemplate,BattleLineupCardLevelTemp));
      }
      
      public function getCardLevelInfoTempById(param1:uint) : BattleLineupCardLevelTemp
      {
         var _loc2_:int = this.levelSettingList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.levelSettingList[_loc3_].level == param1)
            {
               return this.levelSettingList[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getMaxCardLevel(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:BattleLineupCardLevelTemp = null;
         if(this._maxCardLvMap == null)
         {
            this._maxCardLvMap = new Array();
            _loc2_ = this.levelSettingList.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = this.levelSettingList[_loc3_];
               if(this._maxCardLvMap[_loc4_.needLevel] != null)
               {
                  if(_loc4_.level > this._maxCardLvMap[_loc4_.needLevel])
                  {
                     this._maxCardLvMap[_loc4_.needLevel] = _loc4_.level;
                  }
               }
               else
               {
                  this._maxCardLvMap[_loc4_.needLevel] = _loc4_.level;
               }
               if(_loc4_.level > this._maxCardLV)
               {
                  this._maxCardLV = _loc4_.level;
               }
               _loc3_++;
            }
         }
         if(this._maxCardLvMap[param1] != null)
         {
            return this._maxCardLvMap[param1];
         }
         return this._maxCardLV;
      }
   }
}
